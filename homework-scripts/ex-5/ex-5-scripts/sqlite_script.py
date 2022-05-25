from datetime import date, datetime
from numpy import datetime64, place
from sqlalchemy import create_engine, text
import pandas as pd
from pathlib import Path

# Must install package matplotlib
import matplotlib.pyplot as plt

def getEngine(db_name): 
    DIALECT = 'sqlite:///'
    DB_NAME = db_name        # An empty db 
    db_uri = DIALECT + DB_NAME        # of form: sqlite:///test_1.db

    #####################################################
    # Use create_engine method --> closest to SQL syntax
    #####################################################
    engine = create_engine(db_uri, echo=False)

    return engine

def initialize_tables(engine): 
    conn = engine.connect()
    if not conn:
        print("DB connection is not OK!")
    else:
        print("DB connection is OK.")

    # Begin transaction
    trans = conn.begin()
    conn.execute('CREATE TABLE IF NOT EXISTS "Place" ('
                'code INTEGER NOT NULL,'
                'name VARCHAR,'
                'latitude FLOAT,'
                'longitude FLOAT,'
                'PRIMARY KEY (code));')
    conn.execute('CREATE TABLE IF NOT EXISTS "Observation" ('
                'place INTEGER NOT NULL,'
                'date DATE,'
                'rain FLOAT,'
                'snow FLOAT,'
                'air_temperature FLOAT,'
                'ground_temperature FLOAT,'
                'PRIMARY KEY (place, date));')
    conn.execute('CREATE TABLE IF NOT EXISTS "Temperature" ('
                'place INTEGER NOT NULL,'
                'date DATE,'
                'lowest FLOAT,'
                'highest FLOAT,'
                'PRIMARY KEY (place, date));')

    trans.commit()
    # Close connection
    conn.close()

def read_csv_file(csv_path): 
    return pd.read_csv(csv_path, sep=',',comment='#', dtype='unicode', parse_dates= {'date' : ['year','month','day']})

def get_place_df(df): 
    placeDf = df[['place_code', 'place', 'latitude', 'longitude']].copy()
    placeDf.rename(columns={'place_code':'code', 'place':'name'}, inplace=True)

    placeDf['code'] = placeDf['code'].fillna(0).astype(int)
    placeDf['name'] = placeDf['name'].fillna('').astype(str)
    placeDf['latitude'] = placeDf['latitude'].astype(float)
    placeDf['longitude'] = placeDf['longitude'].astype(float)

    placeDf = placeDf.groupby(by=["code"]).agg({'name': 'first', 'latitude': 'first', 'longitude': 'first'})

    return placeDf

def get_observation_df(df):
    observationDf = df[['place_code', 'date', 'rain', 'snow', 'air_temperature', 'ground_temperature']].copy()
    observationDf.rename(columns={'place_code':'place'}, inplace=True)

    observationDf['place'] = observationDf['place'].fillna(0).astype(int)
    observationDf['date'] = observationDf['date'].dt.date
    observationDf['rain'] = observationDf['rain'].astype(float)
    observationDf['snow'] = observationDf['snow'].astype(float)
    observationDf['air_temperature'] = observationDf['air_temperature'].astype(float)
    observationDf['ground_temperature'] = observationDf['ground_temperature'].astype(float)

    observationDf.loc[observationDf['rain'] <= -1, 'rain'] = 0
    observationDf.loc[observationDf['snow'] <= -1, 'snow'] = 0

    observationDf = observationDf.groupby(by=["place", "date"]).agg({'rain': 'first', 'snow': 'first', 'air_temperature': 'first', 'ground_temperature': 'first'})

    return observationDf

def get_temperature_df(df):
    temperatureDf = df[['place_code', 'date', 'lowest_temperature', 'highest_temperature']].copy()
    temperatureDf.rename(columns={'place_code':'place', 'lowest_temperature':'lowest', 'highest_temperature':'highest'}, inplace=True)

    temperatureDf['place'] = temperatureDf['place'].fillna(0).astype(int)
    temperatureDf['date'] = temperatureDf['date'].dt.date
    temperatureDf['lowest'] = temperatureDf['lowest'].astype(float)
    temperatureDf['highest'] = temperatureDf['highest'].astype(float)

    temperatureDf = temperatureDf.groupby(by=["place", "date"]).agg({'lowest': 'first', 'highest': 'first'})

    return temperatureDf

    
def insert_to_table(Df, engine, table): 
    sqlite_conn  = engine.connect()
    # Begin transaction
    trans = sqlite_conn.begin()
    if not sqlite_conn:
        print("DB connection is not OK!")
        exit()
    else:
        print("DB connection is OK.")
    #-----------------------------------------------    
    # P E R S I S T E N C E
    #-----------------------------------------------       
    # a dataframe  stores its data in memory --> generate SQL tables
    # using the to_sql() command.
    Df.to_sql(table, sqlite_conn, if_exists = 'replace', index=True)

    # # Select to view
    # res = sqlite_conn.execute('SELECT * FROM ' + '\"' + table + '\"')
    # print("Result of SELECT * :")
    # print(res.fetchall()[:10])
    # print("\n")
    
    trans.commit()
    # Close connection
    sqlite_conn.close()
    

def main():
    print("Please consider the comments in the python file as they are more descriptive than the stdout messages")
    # question 1
    engine = getEngine('weatherdata.db')
    initialize_tables(engine)

    # question 2
    main_df = read_csv_file("weather_data_2020.csv")

    placeDf = get_place_df(main_df)
    observationDf = get_observation_df(main_df)
    temperatureDf = get_temperature_df(main_df)

    insert_to_table(placeDf, engine, "Place")
    insert_to_table(observationDf, engine, "Observation")
    insert_to_table(temperatureDf, engine, "Temperature")

    # # visualize
    # print("\nPLACE DF:")
    # print(placeDf.head)
    # print("\nObservation DF:")
    # print(observationDf.head)
    # print("\nTemperature DF:")
    # print(temperatureDf.head)

    print("\n**************\n")
    # question 3 a
    # Find the number of snowy days on each location.
    snowCountDf = observationDf.groupby(by="place")["snow"].apply(lambda x: x[x > 0].count()) 
    print("\nSnow Day Count by Place (code):")
    print(snowCountDf)

    date_unparsed_df = pd.read_csv("weather_data_2020.csv", sep=',',comment='#', dtype='unicode')
    date_unparsed_df['place_code'] = date_unparsed_df['place_code'].fillna(0).astype(int)
    date_unparsed_df['month'] = date_unparsed_df['month'].astype(int)
    date_unparsed_df['snow'] = date_unparsed_df['snow'].astype(float)
    date_unparsed_df.loc[date_unparsed_df['snow'] <= -1, 'snow'] = 0
    date_unparsed_df['rain'] = date_unparsed_df['rain'].astype(float)
    date_unparsed_df.loc[date_unparsed_df['rain'] <= -1, 'rain'] = 0

    # Which location (name) has had most snowy days?
    # SOLUTION: 102035 - Utsjoki
    # For this location, find the month with most snow (sum).
    # SOLUTION: 3 - March
    only_most_snowy_df = date_unparsed_df.loc[date_unparsed_df['place_code'] == snowCountDf.idxmax()]
    print("\nAmount of Snow per Month in Utsjoki:")
    print(only_most_snowy_df.groupby('month').agg({'snow':'sum'}))
    print("\nMax Snow Month in Utsjoki:")
    print(only_most_snowy_df.groupby('month').agg({'snow':'sum'}).idxmax())

    # For the location with least snowy days, find the month with most snowy days.
    # SOLUTION: 101464 - Mustasaari
    # For this location, find the month with most snow (sum).
    # SOLUTION: any/every month as it received 0 RECORDED snow days
    only_least_snowy_df = date_unparsed_df.loc[date_unparsed_df['place_code'] == snowCountDf.idxmin()]
    print("\nAmount of recorded Snow per Month in Mustasaari:")
    print(only_least_snowy_df.groupby('month').agg({'snow':'sum'}))
    print("\nMax Snow Month in Mustasaari:")
    print(only_least_snowy_df.groupby('month').agg({'snow':'sum'}).idxmax())

    print("\n**************\n")
    # question 3 b
    # Inspect the rows in Temperature where both ”highest” and ”lowest” are not NULL. Calculate the sample correlation coefficient between these two attributes. What can you interpret from this value? Find the correlations when grouping by location.

    # temperatureDfClean = temperatureDf[['lowest']].copy()
    temperatureDfClean = temperatureDf.reset_index(drop=True).dropna()
    print("\nCorrelation coefficient between lowest and highest attribute: 0.902845")
    print(temperatureDfClean['lowest'].corr(temperatureDfClean['highest']))

    print(temperatureDfClean.corr())

    # What can you interpret from this value? 
    # The lowest and highest temperature experienced is highly correlated -- meaning that if a data point's lowest increases, we can expect the highest to also increase. This makes sense as a cold place/location experiences lower lowest and highest temperatures and the opposite for warmer places. 

    # Find the correlations when grouping by location
    print("\nCorrelation coefficient between lowest and highest attribute GROUPED BY location:")
    # print(temperatureDf.groupby('place')[['lowest','highest']].corr())
    print(temperatureDf.groupby('place')[['lowest','highest']].corr().unstack().iloc[:,1])

    print("\n**************\n")
    # question 3 c
    # Find out the correlation between average temperature and latitude of the location
    sample = observationDf.reset_index()[['air_temperature', 'place']].copy()
    sample.rename(columns={'place':'latitude'}, inplace=True)
    sample['latitude'] = sample['latitude'].astype(float) 
    sample['latitude'] = sample['latitude'].map(lambda x: placeDf.loc[int(x)]['latitude'])

    print("\nCorrelation coefficient between latitude and average temperature (e.g. air_temperature, easily replaceable by other temperature data): ~ -0.363419")

    print(sample['latitude'].corr(sample['air_temperature']))
    print(sample.corr())

    print("Open your GUI to see the plots for 3d and 3e")
    
    # question 3d
    # For each location, use myplotlib to plot the number of rainy days for each month as a bar plot.
    df_groups = date_unparsed_df.groupby(by=['place_code', 'month'])['rain'].count()
    pd.pivot_table(df_groups.reset_index(), 
                index='month', columns='place_code', values='rain').plot(kind='bar',subplots=True,ylabel='Total Rain Days')
    plt.show()    

    # question 3e
    # For each location, plot the average temperature throughout the year. You may plot all the graphs into the same Figure.
    # => like 3c, I interpreted 'average temperature' as 'air_temperature' -- it is easy to replace it with ground-temperature or any other temperature data provided. (simply by replacing a few words!)

    pd.pivot_table(observationDf.reset_index(),
               index='date', columns='place', values='air_temperature'
              ).plot(subplots=True)
    plt.show()
    exit()


main()
