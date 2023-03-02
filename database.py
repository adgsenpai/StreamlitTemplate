import sqlserver
import datetime as dt
import os 

# GET DBCONNECTIONSTRING FROM ENVIRONMENT VARIABLES
dbConnectionString = os.environ.get('DBCONNECTIONSTRING')

try:
    db = sqlserver.adgsqlserver(
        dbConnectionString)
except Exception as e:
    print('error failed to do task ... more info on error:', e)

def ExecuteQuery(query):
    return db.ExecuteQuery(query)

def ReturnRecordsAsDict(query):
    return db.ReturnRecordsAsDict(query)

if __name__ == "__main__":
    # DEBUGGING HERE
    print('debugging here')