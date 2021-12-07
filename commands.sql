\c airport_management_database;

/* --------------- SIMPLE QUERIES --------------- */

/* Total income from tickets per day */

SELECT TRANS_DATE, SUM(AMOUNT) FROM TRXN
GROUP BY TRANS_DATE;

/* Names of all serviceable countries that start with United */

SELECT NAME FROM COUNTRY
WHERE NAME LIKE 'United%';

/* All companies that are currently running the flights */

SELECT COMPANY FROM FLIGHT, AIRPLANE_TYPE
WHERE FLIGHT.AIRTYPE_ID = AIRPLANE_TYPE.AIRTYPE_ID;

/* Average capacity of all flights. */

SELECT AVG(CAPACITY) FROM AIRPLANE_TYPE;

/* Names of all pilots with ratings 'A' or 'B' */

SELECT NAME FROM PILOT
WHERE RATING IN ('A', 'B');



/* --------------- COMPLEX QUERIES --------------- */

/* Names of all intermediate airports between two specific airports. */

SELECT NAME FROM AIRPORT
WHERE AIRPORT_ID IN (
    SELECT INTERMEDIATE FROM ROUTE_INTERMEDIATE
    WHERE ROUTE_ID = (
        SELECT ROUTE_ID FROM ROUTE
        WHERE TAKEOFF = 'CSM' AND DESTINATION = 'SAF'
    )
);

/* Names of all pilots with a salary greater than the average salary. */

SELECT NAME FROM PILOT, CONTROLS
WHERE PILOT.PILOT_ID = CONTROLS.PILOT_ID AND PAYMENT > (
    SELECT AVG(PAYMENT) FROM CONTROLS
);

/* Number of airports in each country. */

SELECT COUNTRY_NAME, COUNT(AIRPORT_ID) AS N_AIRPORTS FROM (
    SELECT AIRPORT_ID, COUNTRY.NAME AS COUNTRY_NAME FROM AIRPORT, COUNTRY
    WHERE COUNTRY.COUNTRY_CODE = AIRPORT.COUNTRY_CODE
) AS ALL_AIRPORT
GROUP BY COUNTRY_NAME;

/* Number of tickets bought by each passenger. */

SELECT PID AS PASSENGER_ID, NAME, COUNT(TID) AS N_TICKETS FROM (
    SELECT PASSENGER.PASSENGER_ID AS PID, PASSENGER.NAME AS NAME, TICKET_ID AS TID 
    FROM PASSENGER, TICKETS
    WHERE TICKETS.PASSENGER_ID = PASSENGER.PASSENGER_ID
) AS PASS_TICK
GROUP BY PID, NAME;

/* Average age of employees working at each airport. */

SELECT NAME, AVG(AGE) FROM (
    SELECT AIRPORT.NAME AS NAME, AGE FROM EMPLOYEE, AIRPORT
    WHERE EMPLOYEE.AIRPORT_ID = AIRPORT.AIRPORT_ID
) AS AIRPORTS
GROUP BY NAME;
