INSERT INTO AIRPLANE_TYPE (AirType_ID, Capacity, Weight, Company)
VALUES
('A225', 640, 285, 'Antonov'),
('A20N', 101, 73, 'Airbus'),
('B741', 397, 183, 'Boeing'),
('B772', 377, 285, 'Boeing'),
('A338', 575, 395, 'Airbus'),
('MD11', 273, 185, 'McDonnell Douglas'),
('B767', 187, 136, 'Boeing'),
('IL86', 208, 160, 'Ilyushin'),
('DC10', 256, 183, 'McDonnell Douglas'),
('CE23', 381, 280, 'Lockheed');

INSERT INTO COUNTRY (Country_Code, Name) 
VALUES
(101, 'India'),
(102, 'France'),
(103, 'United Kingdom'),
(104, 'United States'),
(105, 'United Arab Emirates'),
(106, 'China'),
(107, 'Russia'),
(108, 'Japan'),
(109, 'Brazil'),
(110, 'South Africa');

INSERT INTO AIRPORT (Airport_ID, Name, City, State, Country_Code)
VALUES
('CSM', 'Chhatrapati Shivaji International Airport', 'Mumbai', 'Maharashtra', 101),
('KGD', 'Kempegowda International Airport', 'Bangalore', 'Karnataka', 101),
('PAR', 'Paris Charles de Gaulle Airport', 'Paris', 'Roissy-en-France', 102),
('LHR', 'Heathrow Airport','London', 'Longford', 103),
('SAF', 'San Francisco International Airport', 'San Francisco', 'California', 104),
('DBX', 'Dubai International Airport', 'Dubai', 'Dubai', 105),
('PFX', 'Beijing Capital International Airport ', 'Beijing', 'Hebei', 106),
('SVO', 'Domodedovo Mikhail Lomonosov International Airport ','Moscow', 'Khimki', 107),
('HND', 'Tokyo International Airport','Tokyo', 'Hanedakuko', 108),
('GIG', 'Galeão – Antonio Carlos Jobim International Airport', 'Rio de Janerio', 'Galeão', 109),
('CPT', 'Cape Town International Airport', 'Cape Town', 'Matroosfontein', 110);

INSERT INTO ROUTE (Route_ID, Takeoff, Destination) 
VALUES
('SS13', 'CSM', 'SAF'),
('DI73', 'CPT', 'GIG'),
('FR89', 'PAR', 'LHR'),
('SK18', 'DBX', 'KGD'),
('RE13', 'SVO', 'PFX'),
('VT87', 'HND', 'LHR'),
('GW32', 'PFX', 'HND'),
('FY77', 'SVO', 'CSM'),
('AT67', 'SAF', 'LHR'),
('CX94', 'LHR', 'DBX');

INSERT INTO FLIGHT (Flight_ID, AirType_ID, Route_ID) 
VALUES
('45K2', 'CE23', 'AT67'),
('49L4', 'A225', 'FY77'),
('58J3', 'A20N', 'DI73'),
('78H0', 'A338', 'FR89'),
('97D4', 'MD11', 'SS13'),
('35G5', 'B741', 'SK18'),
('93F2', 'B772', 'VT87'),
('75V9', 'IL86', 'RE13'),
('2S52', 'B767', 'CX94'),
('67N4', 'DC10', 'GW32');

INSERT INTO PILOT (Pilot_ID, Name, Experience, Rating) 
VALUES
('EE321', 'Vinay', 12, 'A'),
('DR541', 'Jack', 15, 'A'),
('SD398', 'Vasili', 14, 'A'),
('FE456', 'Macron', 19, 'A'),
('VC781', 'Ali', 6, 'C'),
('NJ587', 'Neymar', 10, 'B'),
('SX556', 'Richard', 16, 'C'),
('ZS921', 'Wayne', 52, 'B'),
('CR690', 'Hui Xi Jin', 4, 'C'),
('LK365', 'Shinzo', 15, 'A');

INSERT INTO CONTROLS (Pilot_ID, Flight_ID, Payment) 
VALUES
('EE321', '45K2', 90000),
('DR541', '49L4', 150000),
('SD398', '49L4', 11000),
('FE456', '97D4', 12000),
('VC781', '97D4', 13400),
('NJ587', '97D4', 90000),
('SX556', '93F2', 80000),
('ZS921', '93F2', 70000),
('CR690', '2S52', 121000),
('LK365', '67N4', 244000);

INSERT INTO PASSENGER (Passenger_ID, Name, Age, Sex, Address, Contact_No)
VALUES
('PS32', 'Jatin', 17, 'M', 'H56/0', '7753567982'),
('PS62', 'Harsh', 20, 'M', 'H43/0', '4653870924'),
('PS87', 'Hari', 20, 'M', 'H53/0', '6656660625'),
('PS34', 'Phillip', 32, 'M','H44/0', '7853870928'),
('PS98', 'Ria', 21, 'F', 'H42/0', '4653870924'),
('PS54', 'Jayanth', 35, 'M', 'H33/0', '7895870953'),
('PS90', 'Himesh', 66, 'M', 'H69/0', '9853870783'),
('PS23', 'Agamjyot', 25, 'M', 'H11/0', '7869470920'),
('PS19', 'Sanya', 29, 'F', 'H85/0', '7253870925'),
('PS40', 'Shatakshi', 32, 'F', 'H41/0', '8653870666');

INSERT INTO EMPLOYEE (Emp_ID, Name, Email, Role, Age, Address, Contact_No, Airport_ID)
VALUES
(89, 'Akshay', 'akshay666@gmail.com', 'Logistics', 25, 'H75/1', '9845753343', 'CSM'),
(87, 'Lousiana', 'lou12@gmail.com', 'Secrity', 23, 'H75/2', '7845753765', 'PAR'),
(54, 'Charles', 'char88@gmail.com', 'Air Traffic Controller', 33, 'H75/3', '9845693755', 'LHR'),
(39, 'Reagan', 'reag72@gmail.com', 'Security', 34, 'H75/4', '8845753745', 'SAF'),
(42, 'Salman', 'salman@gmail.com', 'Engineer', 44, 'H75/5', '6845753764', 'DBX'),
(74, 'Tsai wen', 'tsai123@gmail.com', 'Avionics Technician', 21, 'H75/6', '7845753695', 'PFX'),
(90, 'Vladimir', 'vladmir69@gmail.com', 'Airport manager', 22, 'H75/7', '9845753761', 'SVO'),
(32, 'Shigeru', 'shi12geru@gmail.com', 'Engineer', 23, 'H75/8', '7845753218', 'HND'),
(44, 'Jair', 'jair19@gmail.com', 'Logistics', 34, 'H75/9', '9845753511', 'GIG'),
(56, 'Sara', 'sara555@gmail.com', 'Passenger Assistant', 39, 'H74/1', '9785753722', 'CPT');

INSERT INTO ROUTE_INTERMEDIATE (Route_ID, Intermediate)
VALUES
('SS13', 'DBX'),
('SS13', 'GIG'),
('DI73', 'SAF'),
('VT87', 'HND'),
('FY77', 'PFX'),
('AT67', 'DBX');

INSERT INTO TRXN (Trans_ID, Passenger_ID, Trans_Type, From_Acc, To_Acc, Trans_Date, Amount)
VALUES
(34, 'PS32', 'UPI', '98674643', '35366236', '3/3/2021', 15000),
(35, 'PS62', 'Debit Card', '98674645', '35366236', '3/3/2021', 19000),
(36, 'PS87', 'Net Banking', '75674643', '35366236', '3/3/2021', 16000),
(37, 'PS34', 'Credit Card', '88674642', '35366236', '3/3/2021', 17000),
(38, 'PS98', 'Net Banking', '78674640', '35366236', '3/3/2021', 18000),
(39, 'PS54', 'Debit card', '98674349', '35366236', '4/3/2021', 15000),
(40, 'PS90', 'Net Banking', '78674540', '35366236', '5/3/2021', 11000),
(41, 'PS23', 'Net Banking', '88674683', '35366236', '6/3/2021', 14000),
(42, 'PS19', 'Credit Card', '68676649', '35366236', '7/3/2021', 15900),
(43, 'PS40', 'Credit Card', '98677777', '35366236', '8/3/2021', 18500);

INSERT INTO TICKETS (Ticket_ID, Dep_Date, Dep_Time, Cost, Flight_ID, Passenger_ID)
VALUES 
(89, '4/3/2021', '16:00', 15000, '78H0', 'PS32'),
(90, '3/4/2021', '17:00', 19000, '58J3', 'PS62'),
(91, '5/2/2021', '06:00', 16000, '45K2', 'PS87'),
(92, '1/10/2021', '07:00', 17000, '58J3', 'PS34'),
(93, '4/9/2021', '08:00', 18000, '93F2',  'PS98'),
(94, '9/3/2021', '19:00', 15000, '67N4', 'PS54'),
(95, '7/8/2021', '20:00', 11000, '75V9', 'PS90'),
(96, '4/3/2021', '18:00', 14000, '35G5', 'PS23'),
(97, '6/6/2021', '15:00', 15900, '97D4', 'PS19'),
(98, '6/5/2021', '12:00', 18500, '2S52', 'PS40');
