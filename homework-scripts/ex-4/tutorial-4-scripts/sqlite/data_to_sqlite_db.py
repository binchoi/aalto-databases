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
from sqlalchemy import create_engine, text
import pandas as pd
from pathlib import Path

def run_sql_from_file(sql_file, sqlite_conn):
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
                print('Error at command:'+sql_command + ".")
                ret_ =  False
            # Finally, clear command string
            finally:
                sql_command = ''           
                ret_ = True
    return ret_

def main():
    DATADIR = str(Path(__file__).parent.parent) # for relative path 
    DIALECT = 'sqlite:///'
    DB_NAME = 'sqlite/tutorial4.db'        # An empty db 
    db_uri = DIALECT      # of form: sqlite:///test_1.db
    engine       = create_engine(db_uri + DB_NAME, echo=False)

    sqlite_conn  = engine.connect()
    if not sqlite_conn:
        print("DB connection is not OK!")
        exit()
    else:
        print("DB connection is OK.")
    #-------------------- Example starts ---------------------------#
    try:
        # Begin transaction
        trans = sqlite_conn.begin()

        # TEST if connection work with a random table (This is in last week tutorial)
        sqlite_conn.execute('CREATE TABLE IF NOT EXISTS "EX1" ('
                    'id INTEGER NOT NULL PRIMARY KEY,'
                    'name VARCHAR);')
        sqlite_conn.execute('INSERT INTO "EX1" (id, name) '
                    'VALUES (3, "obj3")')
        
        # select *
        res = sqlite_conn.execute('SELECT * FROM '
                                '"EX1"')
        
        print("Result of SELECT * :")
        print(res.fetchall())
        print("\n")
        # Drop table
        sqlite_conn.execute('DROP TABLE "EX1" ')
            
        #####################################################################################################
        # Create and fill table from sql file using run_sql_from_file function (Not needed if using pandas df)
        #####################################################################################################
    
        print("Creating DB...")
        sql_file1       = open(DATADIR + '/sqlite/create_and_file_db.sql')
        # run statements to create tables
        run_sql_from_file (sql_file1, sqlite_conn)
    
        # test
        result = sqlite_conn.execute('SELECT * FROM "student" LIMIT 10')
        print(f'After create and insert:\n{result.fetchall()}')
        # Drop table
        sqlite_conn.execute('DROP TABLE "student"')

        print ("\n\nUsing pandas dataframe to read sql queries and fill table")
        #####################################################################################################
        #   Fill table from csv file using pandas df
        #####################################################################################################
        # Step 0: create table using sqlite_conn
        sqlite_conn.execute('CREATE TABLE "student"('
                            'studid INT NOT NULL PRIMARY KEY,'
                            'name TEXT NOT NULL,'
                            'dob TEXT NOT NULL,'
                            'program TEXT NOT NULL,'
                            'credit INT NOT NULL'
                            ')')
        trans.commit() # !IMPORTANT: remember to commit trans before starting pd dataframe
  
        # Step 1: read csv
        df = pd.read_csv(DATADIR + '/student_data.csv', sep=',', quotechar='"',dtype='unicode')

        #if we have an excel file
        #df = pd.read_excel('ourfile.xlsx')
        
        # Some pre-processing
        df = df.loc[:,'studid':'credit'] 

        # Step 2: the dataframe df is written into an SQL table 'student'
        df.to_sql('student', con=engine, if_exists='append', index=False)
    
        #test
        sql_ =  """
                SELECT * FROM student LIMIT 10
                """
        test_df = pd.read_sql_query(sql_,sqlite_conn)
        print("Select 10 students from student table: ")
        print(test_df)
    #-------------------- Views ---------------------------#
    # Begin transaction
        trans = sqlite_conn.begin()

        # TEST if connection work with a random table (This is in last week tutorial)
        try:
            sqlite_conn.execute('DROP VIEW "DSstudent";')
        except:
            pass
        sqlite_conn.execute(
                    'CREATE VIEW "DSstudent" AS '
                        'SELECT studID, name, dob, program, credit '
                        'FROM student '
                        'WHERE program = "DS"'
                    )
        res = sqlite_conn.execute('SELECT * FROM "DSstudent";')
        print("Result of SELECT * FROM view:")
        print(res.fetchall())
        print("\n")
        trans.commit() # !IMPORTANT: remember to commit trans before starting pd dataframe

    #-------------------- Triggers ---------------------------#
    # Begin transaction
        trans = sqlite_conn.begin()

        # TEST if connection work with a random table (This is in last week tutorial)
        sqlite_conn.execute('DROP VIEW "DSstudent";')
        sqlite_conn.execute(
                     'CREATE TRIGGER MinCredits '
                         'AFTER UPDATE OF credit ON student '
                         'FOR EACH ROW '
                         'WHEN (NEW.credit <= OLD.credit) '
                         'BEGIN '
                             'UPDATE student '
                             'SET credit = OLD.credit '
                             'WHERE studID = NEW.studID; '
                         'END; '
                    )
        sqlite_conn.execute('UPDATE student SET credit = credit-1 WHERE credit = 1; ')
        sqlite_conn.execute('UPDATE student SET credit = 0 WHERE studid = 2;')
        res = sqlite_conn.execute('SELECT * FROM student WHERE credit = 1;')
        print("Result of SELECT * after trigger:")
        print(res.fetchall())
        print("\n")
        trans.commit() # !IMPORTANT: remember to commit trans before starting pd dataframe

    #-------------------- Example ends ---------------------------#
    except Exception as e:
        print(f'FAILED due to: {str(e)}')
    finally:
        # Always close connection
        sqlite_conn.close()
main()