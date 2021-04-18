import os
import cx_Oracle


USERNAME = os.environ.get('ORACLE_USERNAME')
PASSWORD = os.environ.get('ORACLE_PASSWORD')
SERVER = os.environ.get('ORACLE_SERVER')
DATABASE = os.environ.get('ORACLE_DATABASE')

connection = cx_Oracle.connect(USERNAME, PASSWORD, f"{SERVER}/{DATABASE}", encoding="UTF-8")

print(connection.version)
connection.close()