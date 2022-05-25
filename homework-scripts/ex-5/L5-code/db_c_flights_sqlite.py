from sqlalchemy import create_engine, text
import pandas as pd
from pathlib import Path

# Must install package matplotlib
import matplotlib.pyplot as plt

#from sqlalchemy_utils import database_exists,create_database
'''
--------------------------------------------------------
Reading & Querying Data sets using dataframes
Revised JAN '21
Sami El-Mahgary /Aalto University
Copyright (c) <2021> <Sami El-Mahgary>
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

'''     

        
def run_sql_from_file(sql_file):
    '''
	read a SQL file with multiple stmts and process it
	adapted from an idea by JF Santos
	Note: not really needed when using dataframes.
    '''
    sql_command = ''
    for line in sql_file:
        #if line.startswith('VALUES'):        
     # Ignore commented lines
        if not line.startswith('--') and line.strip('\n'):        
        # Append line to the command string, prefix with space
           sql_command +=  ' ' + line.strip('\n')
           #sql_command = ' ' + sql_command + line.strip('\n')
        # If the command string ends with ';', it is a full statement
        if sql_command.endswith(';'):
            # Try to execute statement and commit it
            try:
                #print("running " + sql_command+".") 
                sqlite_conn.execute(text(sql_command))
                #sqlite_conn.commit()
            # Assert in case of error
            except:
                print('Error:'+sql_command + "." + sqlite_conn.error())
                ret_ =  False
            # Finally, clear command string
            finally:
                sql_command = ''           
                ret_ = True
    return ret_

#************************************
# PC reading and re-formatting      *
# 0. Wrappers around read_csv       *
# ***********************************    
def read_given_file(f,use_sem_col):
    # reads CSV file into a pandas dataframe
    #return pd.read_csv(f,  sep=';',comment='#',skiprows=[1])    
    if use_sem_col:
      return pd.read_csv(f,  sep=';',comment='#',dtype='unicode')
    else:
      return pd.read_csv(f,  sep=',',comment='#',dtype='unicode')

try:
    '''**********************************************************************
    Main unit for Data sets 
    '''
    # *********************************** 
    # . Define some constants           *
    # ***********************************
    TXT_ = '.txt'; CSV_ = '.csv'; QTS_ = '"'; SLASH_ = '\\'
    #------------------------------------------
    # below Flights data
    #------------------------------------------      
    FLIGHTS_  =  'flight_short'; #FLIGHTS_2    =  '2008_TRANS_'
    AIRLINES_       = 'carriers';AIRPORTS_    = 'airports'
    SUPPRESS_QTS    = True; SUM_FDATA ='SummaryFlight'
    my_path         = str(Path(__file__).parent)+'/'
    common_path     = str(Path(__file__).parent)+'/'
    SQLITE_SRV      = 'sqlite:///'; DB_NAME_ = 'Flights.db3'
 
    print("reading " + common_path + FLIGHTS_ + CSV_)
    #------------------------------------
    # R E A D I N G  C S V   F I L E S
    #------------------------------------
    df_            = read_given_file(common_path + FLIGHTS_ + CSV_,False)
    df_carriers    = read_given_file(common_path + AIRLINES_ + CSV_,False)
    df_airports    = read_given_file(common_path + AIRPORTS_ + CSV_,False)
    #print("file read" + df_.info())
    # ** Analyzing  the  Dataset **
    print(list(df_.columns))
    print(list(df_.dtypes))
    print("Analyzed, found " +  str(df_.shape[0]) + " rows; " + str(df_.shape[1]) + " cols.")
    #exit()
    #------------------------------------
    # R E N A M I N G  C O L U M N S
    #------------------------------------
    df_.rename(columns={'Year':'FlightYear','Month':'FlightMonth'},inplace = True)    
    # Have made sure that following columns nulls can be considered as 0
    # fill the NaN values with zeroes and then convert the column:
    #------------------------------------
    # D E A L I N G  W I T H   N U L L S
    #------------------------------------
    df_['DepDelay']            = df_['DepDelay'].fillna(0).astype(int)
    df_['ArrDelay']            = df_['ArrDelay'].fillna(0).astype(int)
    df_['Distance']            = df_['Distance'].fillna(0).astype(float)
    df_['AirTime']             = df_['AirTime'].fillna(0).astype(float)
    df_['NASDelay']            = df_['NASDelay'].fillna(0).astype(int)
    df_['CarrierDelay']        = df_['CarrierDelay'].fillna(0).astype(int)
    df_['LateAircraftDelay']   = df_['LateAircraftDelay'].fillna(0).astype(int)
    df_['WeatherDelay']        = df_['WeatherDelay'].fillna(0).astype(int)
    df_['SecurityDelay']       = df_['SecurityDelay'].fillna(0).astype(int)
    #----------------------------------------
    # C O N N E C T I N G  T O   S Q L I T E
    #---------------------------------------
    print(SQLITE_SRV + my_path + DB_NAME_)
    #exit()
    engine       = create_engine(SQLITE_SRV + my_path + DB_NAME_, echo=False)
    sqlite_conn  = engine.connect()
    if not sqlite_conn:
        print("DB connection is not OK!")
        exit()
    else:
        print("DB connection is OK.")
    #-----------------------------------------------    
    # I N D E X I N G
    #-----------------------------------------------    
    # A dataframe does have an implicit internal index,
    # but since we want a separate column to act as an index,
    # in the SQL-table, we create one in the 1st posit. and call it `PK'.
    # artificial key, PK: add a new column, a primary index
    df_.insert (loc = 0,column = 'PK',value = range(len(df_)))    
    #print(df_)
    #exit()      
    #-----------------------------------------------    
    # P E R S I S T E N C E
    #-----------------------------------------------       
    # a dataframe  stores its data in memory --> generate SQL tables
    # using the to_sql() command.
    flights_sqltbl  = "Flights"; airports_sqltbl = "Airports"    
    df_.to_sql(flights_sqltbl, sqlite_conn, if_exists = 'replace')
    df_airports.to_sql(airports_sqltbl, sqlite_conn, if_exists='replace')
    #-----------------------------------------------    
    # S Q L  Q U E R Y I N G  V I A  P A N D A S
    #-----------------------------------------------
    pd.set_option('display.max_columns', 11) # Force pandas to display up to 11 columns. When max_cols is exceeded, switch to truncate view

    # ------> Querry: Display PK, Carrier, Origin code, destination code, 
    # name of origin airport, name of destination airport of flights
    # whose destination code is 'LIT'

    sql_ = """
          SELECT PK,UniqueCarrier,Origin,Dest,A1.airport NameOrg,A2.airport NameDest  FROM Flights F,Airports A1,Airports A2
          WHERE A1.iata=F.Origin AND A2.iata=F.Dest AND Dest='LIT'
         """
    tt_ = pd.read_sql_query(sql_,sqlite_conn)
    print(tt_)
    #exit()

    # ------> Querry: Display PK, FlightMonth, Carrier and Name of destination airports
    sql_ = """
          SELECT PK,FlightMonth,UniqueCarrier AS Carrier,
          (SELECT airport FROM Airports WHERE iata = Dest) AS NameDest FROM Flights
         """
    tx_ = pd.read_sql_query(sql_,sqlite_conn)
    print(tx_)
    #exit()
    
    # We've got lots of fligts (2 months for 2008), try summarizing them
    #-----------------------------------------------    
    # G R O U P I N G
    #-----------------------------------------------    
    # * Grouping and aggregating data *
    # make sure we get a dataframe, so return as_index = false (otherwise get a series!)
    grp_1 = tx_.groupby(['FlightMonth','Carrier'],as_index=False).agg({'PK':"count"})
    print(grp_1)
    #exit()
    #--------------------------------------
    # B A S I C   S T A T I S T I C S
    #--------------------------------------
    # Use rank to rank the airlines so that the one with
    # the most flights is no 1.
    print(grp_1['PK'].rank(ascending = False))
    grp_1['ranked_flight_num'] = grp_1['PK'].rank(ascending = False)
    print(grp_1)

    #exit()

    # To compute correlation, separate into 2 columns (month 1 and month 2) 
    # generate a boolean series mask for month 1 and 2
    mask1 = grp_1['FlightMonth'] == '1';mask2 = grp_1['FlightMonth'] == '2'    
    # now get 2 dataframes, one for each month
    grp_1A = grp_1[mask1]; grp_1B = grp_1[mask2]
    # one extra row in dataframe grp 1A, drop it (-1 is last)
    grp_1A = grp_1A.head(-1)
    print(grp_1A)
    
    # rename the columns
    grp_1A  = grp_1A.rename({'PK': 'PK1'}, axis=1)  
    grp_1B  = grp_1B.rename({'PK': 'PK2'}, axis=1)  
    #print(grp_1A); print(grp_1B)
    # extract last column from each df, (first column is 0)
    col_1A =  grp_1A[grp_1A.columns[2]]; col_1B =  grp_1B[grp_1B.columns[2]]
    print(col_1A); print(col_1B)
    # concatenate the the two columns into a new dataframe (widedata)
    # also get rid of the built-index: reset_index(drop=True)
    widedata = pd.concat([col_1A.reset_index(drop=True), col_1B.reset_index(drop=True)], axis= 1)
    print(widedata)
    #exit()
    #---------------------------------------------
    # C O R R E L A T I O N  I N D E X
    #---------------------------------------------
    correlation = widedata['PK1'].corr(widedata['PK2'])
    print(f'Correlation = {correlation}')
    #exit()
    
    #-----------------------------------------------------------
    # P I V O T I N G
    #-----------------------------------------------------------
    # tx_ : before group-by --> need to add aggfunc='count'
    mypivot = pd.pivot_table(tx_, values='PK',index=['FlightMonth'],
                             columns=tx_.Carrier.values, aggfunc='count').fillna(0).astype(int)
    print(mypivot)
    
    # grp_1 : after group-by
    mypivot = pd.pivot_table(grp_1, values='PK',index=['FlightMonth'],
                             columns=grp_1.Carrier.values).fillna(0).astype(int)
    
    print(mypivot)
    #exit()
    #-----------------------------------------------------------
    # P L O T T I N G
    #-----------------------------------------------------------
    myplot = mypivot.plot.bar(title ='Airlines 2008',legend=True, fontsize=11)
    myplot.set_ylabel("No flights",fontsize=11)
    
    # Still another option is to unstack a level into a column level.  By default, last level is used.
    mypivot3 = df_.groupby(['FlightYear','FlightMonth','UniqueCarrier']).size().unstack().fillna(0)    
    print(mypivot)
    
    plt.show()
    exit()


except Exception as e:
        print ("FAILED due to:" + str(e))              
# END     