DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    departmentID INT AUTO_INCREMENT NOT NULL,
    name CHAR(60) NOT NULL,
    PRIMARY KEY (departmentID)
)  ENGINE=INNODB;


DROP TABLE IF EXISTS Program;
CREATE TABLE Program (
    programID INT AUTO_INCREMENT NOT NULL,
    departmentID INT NOT NULL,
    name CHAR(60) NOT NULL,
    typeofprogram ENUM('Undergraduate', 'Graduate') NOT NULL,
    credits DECIMAL(3 , 0 ),
    PRIMARY KEY (programID),
    FOREIGN KEY (departmentID) REFERENCES Department (departmentID)
)  ENGINE=INNODB;


DROP TABLE IF EXISTS Course;
CREATE TABLE Course (
    courseID VARCHAR(8) NOT NULL,
    courseName VARCHAR(25) NOT NULL,
    programID INT NOT NULL,
    credits DECIMAL(4 , 2 ),
    prerequisite VARCHAR(8),
    PRIMARY KEY (courseID),
    FOREIGN KEY (programID)
        REFERENCES Program (programID)
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
    room INT NOT NULL,
    startat TIME NOT NULL ,
    endat TIME NOT NULL,
	PRIMARY  KEY (sectionID),
    FOREIGN KEY (room) REFERENCES Class (room),
    UNIQUE KEY (sectionID , courseID , startat , endat)
)  ENGINE=INNODB;



DROP TABLE IF EXISTS InstructorSection;
CREATE TABLE InstructorSection (
    instructorID INT NOT NULL,
    sectionID VARCHAR(4) NOT NULL,
    courseID VARCHAR(8) NOT NULL,
    departmentID INT NOT NULL,
	startat TIME NOT NULL ,
    endat TIME NOT NULL,
    FOREIGN KEY (instructorID) REFERENCES Instructor (instructorID),
    FOREIGN KEY (sectionID) REFERENCES Section (sectionID),
    FOREIGN KEY (departmentID) REFERENCES Department (departmentID)
--  UNIQUE KEY (instructorID , sectionID , departmentID),
-- 	UNIQUE KEY (instructorID , startat , endat)
-- 	CONSTRAINT CHK_EndTime_After_StartTime CHECK (endat > startat)
)  ENGINE=INNODB;



DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
    studentID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    phone INT,
    email VARCHAR(40),
    dateOfBirth DATE NOT NULL,
    studentType ENUM('Undergraduate', 'Graduate') NOT NULL,
    gpa DECIMAL(3 , 2 ) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (studentID)
)  ENGINE=INNODB;


DROP TABLE IF EXISTS StudentProgram;
CREATE TABLE StudentProgram (
    studentID INT NOT NULL,
    programID INT NOT NULL,
    FOREIGN KEY (studentID) REFERENCES Student (studentID),
    FOREIGN KEY (programID) REFERENCES Program (programID),
    UNIQUE KEY (studentID , programID)
)  ENGINE=INNODB;


DROP TABLE IF EXISTS StudentEnrolledCourses;
CREATE TABLE StudentEnrolledCourses (
    studentID INT NOT NULL,
    courseID VARCHAR(8) NOT NULL,
	sectionID VARCHAR(4),
    FOREIGN KEY (studentID) REFERENCES Student (studentID),
    FOREIGN KEY (courseID) REFERENCES Course (courseID)
)  ENGINE=INNODB;



DROP TABLE IF EXISTS Advisor;
CREATE TABLE Advisor (
    advisorID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    PRIMARY KEY (advisorID)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS StudentAdvisor;
CREATE TABLE StudentAdvisor (
    studentID INT NOT NULL,
    advisorID INT NOT NULL,
    programID INT NOT NULL,
    FOREIGN KEY (studentID) REFERENCES Student (studentID),
    FOREIGN KEY (advisorID) REFERENCES Advisor (advisorID),
    FOREIGN KEY (programID) REFERENCES Program (programID),
    UNIQUE KEY (studentID , programID)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS TeachingAssistant;
CREATE TABLE TeachingAssistant (
    teachingAssistantID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    dateOfBirth DATE,
    gpa DECIMAL(3 , 2 ),
    PRIMARY KEY (teachingAssistantID)
)  ENGINE=INNODB; 


DROP TABLE IF EXISTS TeachingAssistantRoles;
CREATE TABLE TeachingAssistantRoles (
    sectionID VARCHAR(4),
    teachingAssistantID INT NOT NULL,
	room INT NOT NULL,
	typeofrole ENUM ('tutorial','lab','marker'),
    hours TIME NOT NULL,
	FOREIGN KEY (teachingAssistantID) REFERENCES TeachingAssistant (teachingAssistantID),
	FOREIGN KEY (sectionID) REFERENCES Section (sectionID)
    -- add hours contraints 
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
