DROP TABLE IF EXISTS `TeachingAssistantRoles`;
DROP TABLE IF EXISTS `StudentEnrolledCourses`; 
DROP TABLE IF EXISTS `InstructorSection`;
DROP TABLE IF EXISTS `StudentAdvisor`;
DROP TABLE IF EXISTS `Advisor`;
DROP TABLE IF EXISTS `StudentCourses`;
DROP TABLE IF EXISTS `StudentProgram`;
DROP TABLE IF EXISTS `StudentSupervisor`;
DROP TABLE IF EXISTS `InstructorHistory`;
DROP TABLE IF EXISTS `Section`;
DROP TABLE IF EXISTS `Course`;
DROP TABLE IF EXISTS `Program`;
DROP TABLE IF EXISTS `Department`;
DROP TABLE IF EXISTS `Instructor`;
DROP TABLE IF EXISTS `Term`;
DROP TABLE IF EXISTS `ResearchFunding`;
DROP TABLE IF EXISTS `Supervisor`;
DROP TABLE IF EXISTS `TeachingAssistant`;
DROP TABLE IF EXISTS `Student`;
DROP TABLE IF EXISTS `Class`;

CREATE TABLE Department (
    departmentID INT AUTO_INCREMENT NOT NULL,
    name CHAR(60) NOT NULL,
    PRIMARY KEY (departmentID)
)  ENGINE=INNODB;

CREATE TABLE Program (
    programID INT AUTO_INCREMENT NOT NULL,
    departmentID INT NOT NULL,
    name CHAR(60) NOT NULL,
    typeofprogram ENUM('Undergraduate', 'Graduate', 'Graduate Thesis') NOT NULL,
    credits DECIMAL(4 , 1),
    PRIMARY KEY (programID),
    FOREIGN KEY (departmentID) REFERENCES Department (departmentID)
)  ENGINE=INNODB;

CREATE TABLE Course (
    courseID VARCHAR(8) NOT NULL,
    courseName VARCHAR(100) NOT NULL,
    departmentID INT NOT NULL,
    programID INT NOT NULL,
    credits DECIMAL(4 , 1),
    prerequisite VARCHAR(8),
    PRIMARY KEY (courseID),
    FOREIGN KEY (programID) REFERENCES Program (programID)
    -- FOREIGN KEY (departmentID) REFERENCES Program (departmentID)
)  ENGINE=INNODB;

CREATE TABLE Instructor (
    instructorID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    PRIMARY KEY (instructorID)
)  ENGINE=INNODB;

CREATE TABLE Class (
    room INT NOT NULL,
    building VARCHAR(2),
    PRIMARY KEY (room , building)
)  ENGINE=INNODB;

CREATE TABLE Term (
    termID INT NOT NULL ,
    termName ENUM ('FALL','WINTER','SUMMER') NOT NULL,
    termYear YEAR NOT NULL,
    PRIMARY KEY (termID)
)  ENGINE=INNODB;

CREATE TABLE Section (
    sectionID VARCHAR(4),
    courseID VARCHAR(8) NOT NULL,
    termID INT NOT NULL,
    room INT NOT NULL,
    startat TIME NOT NULL ,
    endat TIME NOT NULL,
	PRIMARY  KEY (courseID, sectionID),
	FOREIGN KEY (courseID) REFERENCES Course (courseID),
	FOREIGN KEY (termID) REFERENCES Term (termID),
    FOREIGN KEY (room) REFERENCES Class (room),
    UNIQUE KEY (sectionID , courseID , startat , endat)
)  ENGINE=INNODB;

CREATE TABLE InstructorHistory (
    instructorID INT NOT NULL,
    termID INT NOT NULL,
    courseID VARCHAR(8) NOT NULL,
    sectionID VARCHAR(4) NOT NULL,
    FOREIGN KEY (instructorID) REFERENCES Instructor (instructorID),
	FOREIGN KEY (termID) REFERENCES Term (termID),
	FOREIGN KEY (courseID, sectionID) REFERENCES Section (courseID, sectionID)
-- 	FOREIGN KEY (courseID) REFERENCES Course (courseID)
)  ENGINE=INNODB;

CREATE TABLE InstructorSection (
    instructorID INT NOT NULL,
    courseID VARCHAR(8) NOT NULL,
    sectionID VARCHAR(4) NOT NULL,
    departmentID INT NOT NULL,
	startat TIME NOT NULL,
    endat TIME NOT NULL,
    FOREIGN KEY (instructorID) REFERENCES Instructor (instructorID),
    FOREIGN KEY (courseID, sectionID) REFERENCES Section (courseID, sectionID),
    FOREIGN KEY (departmentID) REFERENCES Department (departmentID)
--  UNIQUE KEY (instructorID , sectionID , departmentID),
-- 	UNIQUE KEY (instructorID , startat , endat)
-- 	CONSTRAINT CHK_EndTime_After_StartTime CHECK (endat > startat)
)  ENGINE=INNODB;

CREATE TABLE Student (
    studentID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    phone INT,
    email VARCHAR(40),
    dateOfBirth DATE NOT NULL,
    studentType ENUM('Undergraduate', 'Graduate', 'Graduate Thesis') NOT NULL,
    gpa DECIMAL(3 , 2 ) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (studentID)
)  ENGINE=INNODB;

CREATE TABLE StudentProgram (
    studentID INT NOT NULL,
    programID INT NOT NULL,
    FOREIGN KEY (studentID) REFERENCES Student (studentID),
    FOREIGN KEY (programID) REFERENCES Program (programID),
    UNIQUE KEY (studentID , programID)
)  ENGINE=INNODB;

CREATE TABLE StudentCourses (
    studentID INT NOT NULL,
    courseID VARCHAR(8) NOT NULL,
    sectionID VARCHAR(4),
    termID INT NOT NULL,
	grade VARCHAR(3) ,
    FOREIGN KEY (studentID) REFERENCES Student (studentID),
    FOREIGN KEY (courseID, sectionID) REFERENCES Section (courseID, sectionID)
)  ENGINE=INNODB;

CREATE TABLE Advisor (
    advisorID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    PRIMARY KEY (advisorID)
)  ENGINE=INNODB;

CREATE TABLE StudentAdvisor (
    studentID INT NOT NULL,
    advisorID INT NOT NULL,
    programID INT NOT NULL,
    FOREIGN KEY (studentID) REFERENCES Student (studentID),
    FOREIGN KEY (advisorID) REFERENCES Advisor (advisorID),
    FOREIGN KEY (programID) REFERENCES Program (programID),
    UNIQUE KEY (studentID , programID)
)  ENGINE=INNODB;

CREATE TABLE TeachingAssistant (
    teachingAssistantID INT AUTO_INCREMENT NOT NULL,
    studentID INT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    dateOfBirth DATE,
    gpa DECIMAL(3 , 2 ),
    PRIMARY KEY (teachingAssistantID),
    FOREIGN KEY (studentID) REFERENCES Student(studentID)
)  ENGINE=INNODB; 

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

CREATE TABLE ResearchFunding (
    researchFundingID INT AUTO_INCREMENT NOT NULL,
    amount DECIMAL(9 , 2 ),
    researchDate DATE,
    researchName VARCHAR(50) NOT NULL,
    PRIMARY KEY (researchFundingID)
)  ENGINE=INNODB;

CREATE TABLE Supervisor (
    supervisorID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    fundingAvailable BOOLEAN NOT NULL DEFAULT false,
    PRIMARY KEY (supervisorID)
)  ENGINE=INNODB; 

CREATE TABLE StudentSupervisor (
    studentID INT NOT NULL,
    supervisorID INT NOT NULL,
    programID INT NOT NULL,
    FOREIGN KEY (studentID) REFERENCES Student (studentID),
    FOREIGN KEY (supervisorID) REFERENCES Supervisor (supervisorID),
    FOREIGN KEY (programID) REFERENCES Program (programID),
    UNIQUE KEY (studentID , programID)
)  ENGINE=INNODB;
