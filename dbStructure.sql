DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    departmentID INT AUTO_INCREMENT NOT NULL,
    name CHAR(60) NOT NULL,
    PRIMARY KEY (departmentID)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS Program;
CREATE TABLE Program (
    programID INT AUTO_INCREMENT NOT NULL,
    name CHAR(60) NOT NULL,
    Credits DECIMAL(2 , 1 ),
    PRIMARY KEY (programID)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS Course;
CREATE TABLE Course (
    courseID VARCHAR(8) NOT NULL,
    courseName VARCHAR(25) NOT NULL,
    programID INT NOT NULL,
    credits DECIMAL(4 , 2 ),
    PRIMARY KEY (courseID)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS Instructor;
CREATE TABLE Instructor (
    instructorID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    PRIMARY KEY (instructorID)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS Class;
CREATE TABLE Class (
    room INT NOT NULL,
    building VARCHAR(2),
    PRIMARY KEY (room , building)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS Section;
CREATE TABLE Section (
    sectionID VARCHAR(4),
    courseID VARCHAR(8) NOT NULL,
    room INT NOT NULL
)  ENGINE=INNODB;

DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
    studentID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    dateOfBirth DATE NOT NULL,
    studentType ENUM('Undergraduate', 'Graduate') NOT NULL,
    gpa DECIMAL(3 , 2 ) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (studentID)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS Advisor;
CREATE TABLE Advisor (
    employeeID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    PRIMARY KEY (employeeID)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS ResearchFunding;
CREATE TABLE ResearchFunding (
    researchFundingID INT AUTO_INCREMENT NOT NULL,
    amount DECIMAL(9 , 2 ),
    researchDate DATE,
    researchName VARCHAR(50) NOT NULL,
    PRIMARY KEY (researchFundingID)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS Supervisor;
CREATE TABLE Supervisor (
    supervisorID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    PRIMARY KEY (supervisorID)
)  ENGINE=INNODB; 
