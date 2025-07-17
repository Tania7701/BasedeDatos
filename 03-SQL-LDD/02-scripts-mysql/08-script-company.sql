CREATE DATABASE COMPANY;
USE COMPANY;


CREATE TABLE Department (
    DeptNumber INT NOT NULL,
    Name VARCHAR(50),
    Location VARCHAR(100),
    PRIMARY KEY (DeptNumber)
);


CREATE TABLE Employee (
    SSN INT NOT NULL,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Name VARCHAR(100),
    Address VARCHAR(100),
    Salary DECIMAL(10,2),
    Sex CHAR(1),
    SupervisorSSN INT,
    DeptNumber INT,
    PRIMARY KEY (SSN),
    CHECK (Sex IN ('M', 'F')),
    FOREIGN KEY (SupervisorSSN) REFERENCES Employee(SSN),
    FOREIGN KEY (DeptNumber) REFERENCES Department(DeptNumber)
);


CREATE TABLE Project (
    ProjNumber INT NOT NULL,
    Name VARCHAR(50),
    Location VARCHAR(100),
    DeptNumber INT,
    PRIMARY KEY (ProjNumber),
    FOREIGN KEY (DeptNumber) REFERENCES Department(DeptNumber)
);


CREATE TABLE Dependent (
    SSN INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Sex CHAR(1),
    BirthDay DATE,
    Relationship VARCHAR(20),
    PRIMARY KEY (SSN, Name),
    CHECK (Sex IN ('M', 'F')),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN)
);


CREATE TABLE Manages (
    SSN INT NOT NULL,
    DeptNumber INT NOT NULL,
    StartDay DATE,
    PRIMARY KEY (SSN, DeptNumber),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (DeptNumber) REFERENCES Department(DeptNumber)
);


CREATE TABLE WorksOn (
    SSN INT NOT NULL,
    ProjNumber INT NOT NULL,
    Hours DECIMAL(5,2),
    PRIMARY KEY (SSN, ProjNumber),
    FOREIGN KEY (SSN) REFERENCES Employee(SSN),
    FOREIGN KEY (ProjNumber) REFERENCES Project(ProjNumber)
);