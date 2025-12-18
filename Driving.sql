CREATE TABLE InsuranceCO(
	name varchar(100) Primary key,
	phone INT,);

CREATE TABLE Person(
	ssn INT Primary key,
	name varchar(100),);

CREATE TABLE Driver(
	ssn INT Primary key references Person(ssn),
	driverID INT,);

CREATE TABLE NonProfessionalDriver (
	ssn INT Primary key references Driver(ssn),);

CREATE TABLE ProfessionalDriver(
	ssn INT Primary key references Driver(ssn),
	medicalHistory varchar(200),);

CREATE TABLE Vehicle(
	licensePlate varchar(100) Primary key,
	year INT,
	name varchar(100) FOREIGN KEY references InsuranceCO(name),
	ssn INT FOREIGN KEY references Person(ssn),
	maxLiability REAL,);

CREATE TABLE Car(
licensePlate varchar(100) Primary key references Vehicle(licensePlate),
make varchar(100),);

CREATE TABLE Truk (
licensePlate varchar(100) Primary key references Vehicle(licensePlate),
capacity varchar(100),
ssn INT FOREIGN KEY references ProfessionalDriver(ssn),);

CREATE TABLE Drives (
	licensePlate varchar(100) references Car(licensePlate),
	ssn INT references NonProfessionalDriver(ssn)
	Primary key (ssn, licensePlate);

#b. because insures is a N to 1 relationship, my vehicle table represents this relationship by using a foregin key 

#c. drives is a N to N relationship, so non professional driver can drives as many cars as wants and a car can driven by one or many non professional drivers. However, operates is a N to 1 relation, means a truck can only be operated by at most one professional driver and a professional driver can operates one or many truks. 