﻿/*
Created: 12/6/2021
Modified: 12/9/2021
Project: Computer Service
Model: Logical Model
Author: Piotr Kitłowski, Marcin Jankowski
Database: Oracle 11g Release 1
*/


-- Create sequences section -------------------------------------------------

CREATE SEQUENCE Computer_Services_Seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Owners_Seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Clients_Seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Addresses_Seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Employees_Seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Specializations_Seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Orders_Seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Salaries_Seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Devices_Seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Models_Seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Manufacturers_Seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

CREATE SEQUENCE Offices_Seq1
 INCREMENT BY 1
 START WITH 1
 NOMAXVALUE
 NOMINVALUE
 CACHE 20
/

-- Create tables section -------------------------------------------------

-- Table Computer_Services

CREATE TABLE Computer_Services(
  id_Computer_Service Integer NOT NULL,
  Name Varchar2(20 ) NOT NULL,
  Founding_date Date NOT NULL,
  Share_capital Number(10,2)
)
/

-- Add keys for table Computer_Services

ALTER TABLE Computer_Services ADD CONSTRAINT Computer_ServicePK PRIMARY KEY (id_Computer_Service)
/

-- Table Offices

CREATE TABLE Offices(
  id_Offices Integer NOT NULL,
  Name Varchar2(20 ) NOT NULL,
  Computer_Service_id Integer NOT NULL,
  id_Address Integer NOT NULL
)
/

-- Create indexes for table Offices

CREATE INDEX IX_runs ON Offices (Computer_Service_id)
/

CREATE INDEX IX_has_address ON Offices (id_Address)
/

-- Add keys for table Offices

ALTER TABLE Offices ADD CONSTRAINT OfficePK PRIMARY KEY (id_Offices)
/

-- Table Employees

CREATE TABLE Employees(
  id_Employee Integer NOT NULL,
  Name Varchar2(20 ) NOT NULL,
  Surname Varchar2(30 ) NOT NULL,
  Sex Char(1 ) NOT NULL
        CONSTRAINT CheckConstraintA1a CHECK (Sex IN ('F', 'M'))
        CHECK (Sex IN ('F', 'M')),
  Email Varchar2(30 ) NOT NULL,
  Phone_number Varchar2(12 ) NOT NULL,
  Date_of_birth Date NOT NULL,
  Date_of_employment Date NOT NULL,
  Role Varchar2(9 ) NOT NULL
        CHECK (Role IN ('Repairman', 'Manager')),
  PESEL Char(11 ),
  Account_no Char(26 ),
  id_Address Integer NOT NULL,
  id_Offices Integer NOT NULL
)
/

-- Create indexes for table Employees

CREATE INDEX IX_Employee_has_address ON Employees (id_Address)
/

CREATE INDEX IX_Employee_has_office ON Employees (id_Offices)
/

-- Add keys for table Employees

ALTER TABLE Employees ADD CONSTRAINT EmployeePK PRIMARY KEY (id_Employee)
/

-- Table Orders

CREATE TABLE Orders(
  id_Order Integer NOT NULL,
  Status Varchar2(11 ) NOT NULL
        CHECK (Status IN ('Not started', 'In progress', 'Completed')),
  Order_date Date NOT NULL,
  Price Number(8,2) NOT NULL,
  Hand_out_date Date,
  Client_id Integer NOT NULL,
  id_Employee Integer NOT NULL
)
/

-- Create indexes for table Orders

CREATE INDEX IX_makes_an_order ON Orders (Client_id)
/

CREATE INDEX IX_Relationship1 ON Orders (id_Employee)
/

-- Add keys for table Orders

ALTER TABLE Orders ADD CONSTRAINT TicketPK PRIMARY KEY (id_Order)
/

-- Table Clients

CREATE TABLE Clients(
  id_Client Integer NOT NULL,
  Name Varchar2(20 ) NOT NULL,
  Surname Varchar2(30 ) NOT NULL,
  Sex Char(1 ) NOT NULL
        CONSTRAINT CheckConstraintA1 CHECK (Sex IN ('F', 'M'))
        CHECK (Sex IN ('F', 'M')),
  Email Varchar2(30 ) NOT NULL,
  Phone_number Varchar2(12 ) NOT NULL,
  id_Address Integer,
  id_Computer_Service Integer NOT NULL
)
/

-- Create indexes for table Clients

CREATE INDEX IX_Client_has_address ON Clients (id_Address)
/

CREATE INDEX IX_Relationship2 ON Clients (id_Computer_Service)
/

-- Add keys for table Clients

ALTER TABLE Clients ADD CONSTRAINT ClientPK PRIMARY KEY (id_Client)
/

-- Table Devices

CREATE TABLE Devices(
  id_Device Integer NOT NULL,
  Type Integer NOT NULL
        CHECK (Type IN ('Mobile device', 'Computer')),
  Order_id Integer NOT NULL,
  id_Model Integer NOT NULL
)
/

-- Create indexes for table Devices

CREATE INDEX IX_consists_of ON Devices (Order_id)
/

CREATE INDEX IX_Device_has ON Devices (id_Model)
/

-- Add keys for table Devices

ALTER TABLE Devices ADD CONSTRAINT DevicePK PRIMARY KEY (id_Device)
/

-- Table Addresses

CREATE TABLE Addresses(
  id_Address Integer NOT NULL,
  City Varchar2(20 ) NOT NULL,
  Street Varchar2(30 ) NOT NULL,
  Flat_no Varchar2(5 ) NOT NULL,
  Postal code Char(6 ) NOT NULL
)
/

-- Add keys for table Addresses

ALTER TABLE Addresses ADD CONSTRAINT PK_Addresses PRIMARY KEY (id_Address)
/

-- Table and Columns comments section

COMMENT ON COLUMN Addresses.id_Address IS 'Address id number, primary key'
/

-- Table Owners

CREATE TABLE Owners(
  id_Owner Integer NOT NULL,
  Name Varchar2(20 ) NOT NULL,
  Surname Varchar2(30 ) NOT NULL,
  id_Computer_Service Integer NOT NULL
)
/

-- Create indexes for table Owners

CREATE INDEX IX_has_owner ON Owners (id_Computer_Service)
/

-- Add keys for table Owners

ALTER TABLE Owners ADD CONSTRAINT PK_Owners PRIMARY KEY (id_Owner)
/

-- Table Specializations

CREATE TABLE Specializations(
  Id_Specialization Integer NOT NULL,
  Specialization_name Integer NOT NULL
        CHECK (Specialization IN ('Mobile device', 'Computer')),
  Description Varchar2(100 )
)
/

-- Add keys for table Specializations

ALTER TABLE Specializations ADD CONSTRAINT PK_Specializations PRIMARY KEY (Id_Specialization)
/

ALTER TABLE Specializations ADD CONSTRAINT Name UNIQUE (Specialization_name)
/

-- Table Aquired_specializations

CREATE TABLE Aquired_specializations(
  Id_Specialization Integer NOT NULL,
  id_Employee Integer NOT NULL
)
/

-- Add keys for table Aquired_specializations

ALTER TABLE Aquired_specializations ADD CONSTRAINT PK_Aquired_specializations PRIMARY KEY (Id_Specialization,id_Employee)
/

-- Table Salaries

CREATE TABLE Salaries(
  id_Salary Integer NOT NULL,
  Date Date NOT NULL,
  Basic_salary Number(8,2) NOT NULL,
  Extra_salary Number(8,2) NOT NULL,
  id_Employee Integer NOT NULL
)
/

-- Create indexes for table Salaries

CREATE INDEX IX_gets_salaries ON Salaries (id_Employee)
/

-- Add keys for table Salaries

ALTER TABLE Salaries ADD CONSTRAINT PK_Salaries PRIMARY KEY (id_Salary)
/

-- Table and Columns comments section

COMMENT ON COLUMN Salaries.id_Salary IS 'Salary id number'
/
COMMENT ON COLUMN Salaries.Date IS 'Date of payroll'
/
COMMENT ON COLUMN Salaries.Basic_salary IS 'Basic salary'
/
COMMENT ON COLUMN Salaries.Extra_salary IS 'Extra salary'
/

-- Table Manufacturers

CREATE TABLE Manufacturers(
  id_Manufacturer Integer NOT NULL,
  Name Varchar2(20 ) NOT NULL,
  Description Varchar2(100 )
)
/

-- Add keys for table Manufacturers

ALTER TABLE Manufacturers ADD CONSTRAINT PK_Manufacturers PRIMARY KEY (id_Manufacturer)
/

ALTER TABLE Manufacturers ADD CONSTRAINT Manu_Name UNIQUE (Name)
/

-- Table Models

CREATE TABLE Models(
  id_Model Integer NOT NULL,
  Name Varchar2(20 ) NOT NULL,
  Description Varchar2(100 )
)
/

-- Create indexes for table Models

CREATE INDEX IX_Models_have_manufacturers ON Models (Name)
/

-- Add keys for table Models

ALTER TABLE Models ADD CONSTRAINT PK_Models PRIMARY KEY (id_Model)
/

-- Trigger for sequence Computer_Services_Seq1 for column id_Computer_Service in table Computer_Services ---------
CREATE OR REPLACE TRIGGER ts_Computer_Services_Compute_0 BEFORE INSERT
ON Computer_Services FOR EACH ROW
BEGIN
  :new.id_Computer_Service := Computer_Services_Seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Computer_Services_Comput_0 AFTER UPDATE OF id_Computer_Service
ON Computer_Services FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_Computer_Service in table Computer_Services as it uses sequence.');
END;
/

-- Trigger for sequence Offices_Seq1 for column id_Offices in table Offices ---------
CREATE OR REPLACE TRIGGER ts_Offices_Offices_Seq1 BEFORE INSERT
ON Offices FOR EACH ROW
BEGIN
  :new.id_Offices := Offices_Seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Offices_Offices_Seq1 AFTER UPDATE OF id_Offices
ON Offices FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_Offices in table Offices as it uses sequence.');
END;
/

-- Trigger for sequence Employees_Seq1 for column id_Employee in table Employees ---------
CREATE OR REPLACE TRIGGER ts_Employees_Employees_Seq1 BEFORE INSERT
ON Employees FOR EACH ROW
BEGIN
  :new.id_Employee := Employees_Seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Employees_Employees_Seq1 AFTER UPDATE OF id_Employee
ON Employees FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_Employee in table Employees as it uses sequence.');
END;
/

-- Trigger for sequence Orders_Seq1 for column id_Order in table Orders ---------
CREATE OR REPLACE TRIGGER ts_Orders_Orders_Seq1 BEFORE INSERT
ON Orders FOR EACH ROW
BEGIN
  :new.id_Order := Orders_Seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Orders_Orders_Seq1 AFTER UPDATE OF id_Order
ON Orders FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_Order in table Orders as it uses sequence.');
END;
/

-- Trigger for sequence Clients_Seq1 for column id_Client in table Clients ---------
CREATE OR REPLACE TRIGGER ts_Clients_Clients_Seq1 BEFORE INSERT
ON Clients FOR EACH ROW
BEGIN
  :new.id_Client := Clients_Seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Clients_Clients_Seq1 AFTER UPDATE OF id_Client
ON Clients FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_Client in table Clients as it uses sequence.');
END;
/

-- Trigger for sequence Devices_Seq1 for column id_Device in table Devices ---------
CREATE OR REPLACE TRIGGER ts_Devices_Devices_Seq1 BEFORE INSERT
ON Devices FOR EACH ROW
BEGIN
  :new.id_Device := Devices_Seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Devices_Devices_Seq1 AFTER UPDATE OF id_Device
ON Devices FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_Device in table Devices as it uses sequence.');
END;
/

-- Trigger for sequence Addresses_Seq1 for column id_Address in table Addresses ---------
CREATE OR REPLACE TRIGGER ts_Addresses_Addresses_Seq1 BEFORE INSERT
ON Addresses FOR EACH ROW
BEGIN
  :new.id_Address := Addresses_Seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Addresses_Addresses_Seq1 AFTER UPDATE OF id_Address
ON Addresses FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_Address in table Addresses as it uses sequence.');
END;
/

-- Trigger for sequence Owners_Seq1 for column id_Owner in table Owners ---------
CREATE OR REPLACE TRIGGER ts_Owners_Owners_Seq1 BEFORE INSERT
ON Owners FOR EACH ROW
BEGIN
  :new.id_Owner := Owners_Seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Owners_Owners_Seq1 AFTER UPDATE OF id_Owner
ON Owners FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_Owner in table Owners as it uses sequence.');
END;
/

-- Trigger for sequence Specializations_Seq1 for column Id_Specialization in table Specializations ---------
CREATE OR REPLACE TRIGGER ts_Specializations_Specializ_0 BEFORE INSERT
ON Specializations FOR EACH ROW
BEGIN
  :new.Id_Specialization := Specializations_Seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Specializations_Speciali_0 AFTER UPDATE OF Id_Specialization
ON Specializations FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column Id_Specialization in table Specializations as it uses sequence.');
END;
/

-- Trigger for sequence Salaries_Seq1 for column id_Salary in table Salaries ---------
CREATE OR REPLACE TRIGGER ts_Salaries_Salaries_Seq1 BEFORE INSERT
ON Salaries FOR EACH ROW
BEGIN
  :new.id_Salary := Salaries_Seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Salaries_Salaries_Seq1 AFTER UPDATE OF id_Salary
ON Salaries FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_Salary in table Salaries as it uses sequence.');
END;
/

-- Trigger for sequence Manufacturers_Seq1 for column id_Manufacturer in table Manufacturers ---------
CREATE OR REPLACE TRIGGER ts_Manufacturers_Manufacture_0 BEFORE INSERT
ON Manufacturers FOR EACH ROW
BEGIN
  :new.id_Manufacturer := Manufacturers_Seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Manufacturers_Manufactur_0 AFTER UPDATE OF id_Manufacturer
ON Manufacturers FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_Manufacturer in table Manufacturers as it uses sequence.');
END;
/

-- Trigger for sequence Models_Seq1 for column id_Model in table Models ---------
CREATE OR REPLACE TRIGGER ts_Models_Models_Seq1 BEFORE INSERT
ON Models FOR EACH ROW
BEGIN
  :new.id_Model := Models_Seq1.nextval;
END;
/
CREATE OR REPLACE TRIGGER tsu_Models_Models_Seq1 AFTER UPDATE OF id_Model
ON Models FOR EACH ROW
BEGIN
  RAISE_APPLICATION_ERROR(-20010,'Cannot update column id_Model in table Models as it uses sequence.');
END;
/


-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE Offices ADD CONSTRAINT runs FOREIGN KEY (Computer_Service_id) REFERENCES Computer_Services (id_Computer_Service)
/



ALTER TABLE Orders ADD CONSTRAINT makes_an_order FOREIGN KEY (Client_id) REFERENCES Clients (id_Client)
/



ALTER TABLE Devices ADD CONSTRAINT consists_of FOREIGN KEY (Order_id) REFERENCES Orders (id_Order)
/



ALTER TABLE Owners ADD CONSTRAINT has_owner FOREIGN KEY (id_Computer_Service) REFERENCES Computer_Services (id_Computer_Service)
/



ALTER TABLE Offices ADD CONSTRAINT Office_has_address FOREIGN KEY (id_Address) REFERENCES Addresses (id_Address)
/



ALTER TABLE Employees ADD CONSTRAINT Employee_has_address FOREIGN KEY (id_Address) REFERENCES Addresses (id_Address)
/



ALTER TABLE Clients ADD CONSTRAINT Client_has_address FOREIGN KEY (id_Address) REFERENCES Addresses (id_Address)
/



ALTER TABLE Aquired_specializations ADD CONSTRAINT has FOREIGN KEY (Id_Specialization) REFERENCES Specializations (Id_Specialization)
/



ALTER TABLE Aquired_specializations ADD CONSTRAINT specializes_in FOREIGN KEY (id_Employee) REFERENCES Employees (id_Employee)
/



ALTER TABLE Salaries ADD CONSTRAINT Employee_gets_salary FOREIGN KEY (id_Employee) REFERENCES Employees (id_Employee)
/



ALTER TABLE Models ADD CONSTRAINT Manufacturer_produces FOREIGN KEY (Name) REFERENCES Manufacturers (Name)
/



ALTER TABLE Devices ADD CONSTRAINT Device_has FOREIGN KEY (id_Model) REFERENCES Models (id_Model)
/



ALTER TABLE Employees ADD CONSTRAINT employs FOREIGN KEY (id_Offices) REFERENCES Offices (id_Offices)
/



ALTER TABLE Clients ADD CONSTRAINT has_client FOREIGN KEY (id_Computer_Service) REFERENCES Computer_Services (id_Computer_Service)
/



ALTER TABLE Orders ADD CONSTRAINT Relationship1 FOREIGN KEY (id_Employee) REFERENCES Employees (id_Employee)
/




