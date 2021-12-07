import sqlite3

class Database():
    def __init__(self):
        self.cursor = sqlite3.connect(":memory:").cursor()
        
    def createDatabase(self):
        sqlFile = open("airport_management_system_ddl.sql")
        script = sqlFile.read()
        self.cursor.executescript(script)

    def insertRecords(self):
        sqlFile = open("airport_management_system_dml.sql")
        script = sqlFile.read()
        self.cursor.executescript(script)
    
    def initDatabase(self):
        self.createDatabase()
        self.insertRecords()
        
    def executeQuery(self, queryNumber):
        queries = [
            '''
            SELECT TRANS_DATE, SUM(AMOUNT) FROM TRXN
            GROUP BY TRANS_DATE;
            ''',
            '''
            SELECT NAME FROM COUNTRY
            WHERE NAME LIKE 'United%';
            ''',
            '''
            SELECT COMPANY FROM FLIGHT, AIRPLANE_TYPE
            WHERE FLIGHT.AIRTYPE_ID = AIRPLANE_TYPE.AIRTYPE_ID;
            ''',
            '''
            SELECT AVG(CAPACITY) FROM AIRPLANE_TYPE;
            ''',
            '''
            SELECT NAME FROM PILOT
            WHERE RATING IN ('A', 'B');
            ''',
            '''
            SELECT NAME FROM AIRPORT
            WHERE AIRPORT_ID IN (
                SELECT INTERMEDIATE FROM ROUTE_INTERMEDIATE
                WHERE ROUTE_ID = (
                    SELECT ROUTE_ID FROM ROUTE
                    WHERE TAKEOFF = 'CSM' AND DESTINATION = 'SAF'
                )
            );
            ''',
            '''
            SELECT NAME FROM PILOT, CONTROLS
            WHERE PILOT.PILOT_ID = CONTROLS.PILOT_ID AND PAYMENT > (
                SELECT AVG(PAYMENT) FROM CONTROLS
            );
            ''',
            '''
            SELECT COUNTRY_NAME, COUNT(AIRPORT_ID) AS N_AIRPORTS FROM (
                SELECT AIRPORT_ID, COUNTRY.NAME AS COUNTRY_NAME FROM AIRPORT, COUNTRY
                WHERE COUNTRY.COUNTRY_CODE = AIRPORT.COUNTRY_CODE
            ) AS ALL_AIRPORT
            GROUP BY COUNTRY_NAME;
            ''',
            '''
            SELECT PID AS PASSENGER_ID, NAME, COUNT(TID) AS N_TICKETS FROM (
                SELECT PASSENGER.PASSENGER_ID AS PID, PASSENGER.NAME AS NAME, TICKET_ID AS TID 
                FROM PASSENGER, TICKETS
                WHERE TICKETS.PASSENGER_ID = PASSENGER.PASSENGER_ID
            ) AS PASS_TICK
            GROUP BY PID, NAME;
            ''',
            '''
            SELECT NAME, AVG(AGE) FROM (
                SELECT AIRPORT.NAME AS NAME, AGE FROM EMPLOYEE, AIRPORT
                WHERE EMPLOYEE.AIRPORT_ID = AIRPORT.AIRPORT_ID
            ) AS AIRPORTS
            GROUP BY NAME;
            '''
        ]
        
        responseList = []
        for row in self.cursor.execute(queries[queryNumber - 1]):
            responseList.append(row)

        return responseList