USE master;
GO
DROP DATABASE StaffAccounting;
GO
CREATE DATABASE StaffAccounting;
GO
USE StaffAccounting;
GO

CREATE TABLE Adresses (
	geo_index INT IDENTITY (10000,1) PRIMARY KEY  NOT NULL,
	country VARCHAR (50) NOT NULL, 
	region VARCHAR (50), 
	city VARCHAR (50)NOT NULL,
	street VARCHAR (50)NOT NULL,
	building INT NOT NULL,
	apt INT,
	CONSTRAINT cBuilding CHECK ( building > 0 ),
	CONSTRAINT cApt CHECK ( apt > 0 ),
);

CREATE TABLE Passport_data (
	passport_id INT IDENTITY (100000,1) PRIMARY KEY NOT NULL,
	first_name VARCHAR (40) NOT NULL ,
	last_name VARCHAR (40) NOT NULL ,
	middle_name VARCHAR (40) NOT NULL ,
	birth_date DATE NOT NULL,
	birth_place INT FOREIGN KEY REFERENCES Adresses(geo_index) ON UPDATE CASCADE NOT NULL,
	living_place INT FOREIGN KEY REFERENCES Adresses(geo_index),
	
);

CREATE TABLE Employee (	
	id_employee INT PRIMARY KEY FOREIGN KEY REFERENCES Passport_data(passport_id) NOT NULL,
	experience FLOAT(3) NOT NULL DEFAULT 0,
	CONSTRAINT cExp CHECK ( experience < 1.0 AND experience >= 0.0),
	);

CREATE TABLE Vacation_journal (
	id_notation INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	employee INT FOREIGN KEY REFERENCES Employee(id_employee) ON UPDATE CASCADE,	
	begin_date DATE NOT NULL,
	end_date DATE,
	CONSTRAINT uNotation UNIQUE (employee, begin_date),
	CONSTRAINT cDateVac CHECK ( begin_date < end_date),
);

CREATE TABLE Department (
	department_id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name VARCHAR (60) NOT NULL,
	abbreviation VARCHAR (10) NOT NULL,
	staff_amount INT NOT NULL,
	CONSTRAINT cStaff_amount CHECK ( staff_amount > 1 AND staff_amount < 21 ),
);

CREATE TABLE Post (
	post_id INT IDENTITY(100,1) PRIMARY KEY NOT NULL,
	name VARCHAR (60) NOT NULL,
	salary MONEY NOT NULL,
	CONSTRAINT cSalary CHECK ( salary > 1279),
);

CREATE TABLE Post_journal (
	id_notation INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	employee_id INT FOREIGN KEY REFERENCES Employee(id_employee) ON UPDATE CASCADE,
	post_id INT FOREIGN KEY REFERENCES Post(post_id) ON UPDATE CASCADE,
	department_id INT FOREIGN KEY REFERENCES Department(department_id) ON UPDATE CASCADE,
	begin_date DATE NOT NULL,
	end_date DATE,
	CONSTRAINT uEPD UNIQUE ( employee_id, post_id, department_id, begin_date), 
	CONSTRAINT cDate CHECK ( begin_date < end_date),
);
	

