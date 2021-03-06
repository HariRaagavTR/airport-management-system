CREATE TABLE AIRPLANE_TYPE (
	AirType_ID VARCHAR(10) NOT NULL,
	Capacity INT NOT NULL,
	Weight NUMERIC,
	Company VARCHAR(30) NOT NULL,
	PRIMARY KEY (AirType_ID)
);

CREATE TABLE COUNTRY (
	Country_Code INT NOT NULL,
	Name VARCHAR(30),
	PRIMARY KEY (Country_Code)
);

CREATE TABLE AIRPORT (
	Airport_ID VARCHAR(5) NOT NULL,
	Name VARCHAR(100) NOT NULL,
	City VARCHAR(30),
	State VARCHAR(30),
	Country_Code INT,
	PRIMARY KEY (Airport_ID),
	FOREIGN KEY (Country_Code) REFERENCES COUNTRY (Country_Code)	
);

CREATE TABLE ROUTE (
	Route_ID VARCHAR(10) NOT NULL,
	Takeoff VARCHAR(5),
	Destination VARCHAR(5),
	PRIMARY KEY (Route_ID),
	FOREIGN KEY (Takeoff) REFERENCES AIRPORT (Airport_ID),
	FOREIGN KEY (Destination) REFERENCES AIRPORT (Airport_ID)
);

CREATE TABLE FLIGHT (
	Flight_ID VARCHAR(5) NOT NULL,
	AirType_ID VARCHAR(10),
	Route_ID VARCHAR(10),
	PRIMARY KEY (Flight_ID),
	FOREIGN KEY (AirType_ID) REFERENCES AIRPLANE_TYPE (AirType_ID),
	FOREIGN KEY (Route_ID) REFERENCES ROUTE (Route_ID)
);

CREATE TABLE PILOT (
	Pilot_ID VARCHAR(10) NOT NULL,
	Name VARCHAR(30) NOT NULL,
	Experience NUMERIC,
	Rating CHAR,
	PRIMARY KEY (Pilot_ID)
);

CREATE TABLE CONTROLS (
	Pilot_ID VARCHAR(10) NOT NULL,
	Flight_ID VARCHAR(5) NOT NULL,
	Payment NUMERIC NOT NULL,
	PRIMARY KEY (Pilot_ID, Flight_ID),
	FOREIGN KEY (Pilot_ID) REFERENCES PILOT (Pilot_ID),
	FOREIGN KEY (Flight_ID) REFERENCES FLIGHT (Flight_ID)
);

CREATE TABLE PASSENGER (
	Passenger_ID VARCHAR(5) NOT NULL,
	Name VARCHAR(30) NOT NULL,
	Age INT,
	Sex CHAR,
	Address VARCHAR(50),
	Contact_No VARCHAR(11),
	PRIMARY KEY (Passenger_ID)
);

CREATE TABLE EMPLOYEE (
	Emp_ID INT NOT NULL,
	Name VARCHAR(30) NOT NULL,
	Email VARCHAR(30),
	Role VARCHAR(30),
	Age INT,
	Address VARCHAR(50),
	Contact_No VARCHAR(11),
	Airport_ID VARCHAR(5),
	PRIMARY KEY (Emp_ID),
	FOREIGN KEY (Airport_ID) REFERENCES AIRPORT (Airport_ID)
);

CREATE TABLE ROUTE_INTERMEDIATE (
	Route_ID VARCHAR(10),
	Intermediate VARCHAR(5),
	PRIMARY KEY (Route_ID, Intermediate),
	FOREIGN KEY (Route_ID) REFERENCES ROUTE (Route_ID),
	FOREIGN KEY (Intermediate) REFERENCES AIRPORT (Airport_ID)
);

CREATE TABLE TRXN (
	Trans_ID INT NOT NULL,
	Passenger_ID VARCHAR(5),
	Trans_Type VARCHAR(30),
	From_Acc VARCHAR(30) NOT NULL,
	To_Acc VARCHAR(30) NOT NULL,
	Trans_Date DATE NOT NULL,
	Amount NUMERIC NOT NULL,
	PRIMARY KEY (Trans_ID),
	FOREIGN KEY (Passenger_ID) REFERENCES PASSENGER (Passenger_ID)
);

CREATE TABLE TICKETS (
	Ticket_ID INT NOT NULL,
	Dep_Date DATE NOT NULL,
	Dep_Time TIME NOT NULL,
	Cost NUMERIC NOT NULL,
	Flight_ID VARCHAR(5),
	Passenger_ID VARCHAR(5),
	PRIMARY KEY (Ticket_ID),
	FOREIGN KEY (Flight_ID) REFERENCES FLIGHT (Flight_ID),
	FOREIGN KEY (Passenger_ID) REFERENCES PASSENGER (Passenger_ID)
);
