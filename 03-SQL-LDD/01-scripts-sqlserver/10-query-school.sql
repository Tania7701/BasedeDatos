CREATE DATABASE School;
USE School;

CREATE TABLE Instructor (
    SSN INT NOT NULL PRIMARY KEY,
    LName VARCHAR(50),
    FName VARCHAR(50)
);

CREATE TABLE Class (
    CourseNum INT,
    Year INT,
    Term INT,
    Section INT,
    PRIMARY KEY (CourseNum, Year, Term, Section)
);

CREATE TABLE Teaches (
    SSN INT,
    CourseNum INT,
    Year INT,
    Term INT,
    Section INT,
    PRIMARY KEY (SSN, CourseNum, Year, Term, Section),
    FOREIGN KEY (SSN) REFERENCES Instructor(SSN),
    FOREIGN KEY (CourseNum, Year, Term, Section) REFERENCES Class(CourseNum, Year, Term, Section)
);