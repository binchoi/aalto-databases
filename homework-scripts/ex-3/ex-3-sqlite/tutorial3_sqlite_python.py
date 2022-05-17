from sqlalchemy import create_engine
# from sqlalchemy_utils import database_exists,create_database
""" 
Plan for SQLite demo: 
- How to create engine and connect to sqlite db file 
"""
# Source: https://www.pythonsheets.com/notes/python-sqlalchemy.html
# Global data: 
def main():
    DIALECT = 'sqlite:///'
    DB_NAME = 'tutorial3.db'        # An empty db 
    db_uri = DIALECT + DB_NAME      # of form: sqlite:///test_1.db
      
    #####################################################
    # Use create_engine method --> closest to SQL syntax
    #####################################################
    engine = create_engine(db_uri, echo=False)
    print("Example 1: \n")
    # create table: Note the use of ''
    engine.execute('CREATE TABLE IF NOT EXISTS "EX1" ('
                'id INTEGER NOT NULL PRIMARY KEY,'
                'name VARCHAR);')

    # insert 2 objects:
    # Method 1: engine.execute: 
    engine.execute('INSERT INTO "EX1" '
                '(id, name) '
                'VALUES (1,"obj1")')

    engine.execute('INSERT INTO "EX1" '
                '(id, name) '
                'VALUES (2,"obj2")')

    # select *
    result = engine.execute('SELECT * FROM '
                            '"EX1"')
    print("Result of SELECT * :")
    for _r in result:
        print(_r)
    print("\n")

    # delete 
    engine.execute('DELETE from "EX1" where id=1;')
    result = engine.execute('SELECT * FROM "EX1"')
    print("Result of SELECT *  after deleting:")
    print(result.fetchall())

    # drop table
    engine.execute('DROP TABLE "EX1" ')

    # Method 2: create connection: 

    # Create connection
    print("\n", "=^.^="*10)
    print("Example 2: \n")
    # DB_NAME2 = 'testdatabase.db'     # Carefull 
    db_uri = DIALECT + DB_NAME      # of form: sqlite:///test_1.db
    engine = create_engine(db_uri, echo=False)

    conn = engine.connect()
    if not conn:
        print("DB connection is not OK!")
    else:
        print("DB connection is OK.")

    # Begin transaction
    trans = conn.begin()
    conn.execute('CREATE TABLE IF NOT EXISTS "EX1" ('
                'id INTEGER NOT NULL PRIMARY KEY,'
                'name VARCHAR);')
    conn.execute('INSERT INTO "EX1" (id, name) '
                'VALUES (3, "obj3")')
    
    # select *
    res = conn.execute('SELECT * FROM '
                            '"EX1"')
    
    print("Result of SELECT * :")
    print(res.fetchall())
    print("\n")
    # Drop table
    conn.execute('DROP TABLE "EX1" ')
    trans.commit()
    # Close connection
    conn.close()

main()
