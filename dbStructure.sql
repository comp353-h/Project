DROP TABLE IF EXISTS TeachingAssistant;
CREATE TABLE TeachingAssistant(
	teachingAssistantID INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY(teachingAssistantID),
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    dateOfBirth DATE,
    gpa DECIMAL(3,2)
	-- FOREIGN KEY(studentID) REFERENCES Student(studentID)
)	ENGINE=INNODB; 

DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
    studentID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    dateOfBirth DATE,
    gpa DECIMAL(3,2),
    PRIMARY KEY(studentID),
    studentType ENUM('Undergraduate','Graduate')
)  ENGINE=INNODB;



insert into Student(firstName, lastName, dateOfBirth, gpa) 
values("Omar", "Al-Farajat", '1987-04-18', 1.92);
insert into TeachingAssistant(firstName, lastName, dateOfBirth, gpa) 
values("Omar", "Al-Farajat", '1987-04-18', 1.92);

insert into Student(firstName, lastName, dateOfBirth, gpa) 
values("Raghav", "Sharda", '1990-03-03', 4.17);
insert into TeachingAssistant(firstName, lastName, dateOfBirth, gpa) 
values("Raghav", "Sharda", '1990-03-03', 4.17);

insert into Student(firstName, lastName, dateOfBirth, gpa, studentType) 
values("Chris", "Ogal", '1991-05-05', 4.18, 'Graduate');

insert into Student(firstName, lastName, dateOfBirth, gpa, studentType) 
values("Spehner", "Hugo", '1987-06-06', 4.19, 'Graduate');

insert into Student(firstName, lastName, dateOfBirth, gpa, studentType) 
values("Maxim", "Sinelnikov", '1994-07-07', 4.15, 'Undergraduate');

insert into Student(firstName, lastName, dateOfBirth, gpa, studentType) 
values("Sean", "Nakagawa", '1988-01-01', 4.16, 'Undergraduate');

/*
DROP TABLE IF EXISTS Undergraduate;
CREATE TABLE Undergraduate(
	undergraduateID INT AUTO_INCREMENT NOT NULL PRIMARY KEY REFERENCES Student (studentID)
) ENGINE=INNODB;

DROP TABLE IF EXISTS Graduate;
CREATE TABLE Graduate(
	graduateID INT REFERENCES Student (studentID),
	isThesis BOOLEAN
) ENGINE=INNODB;
*/




DROP TABLE IF EXISTS ResearchFunding; 
CREATE TABLE ResearchFunding(
researchFundingID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
amount DECIMAL(9,2),
researchDate DATE,
researchName VARCHAR(50) NOT NULL
) ENGINE=INNODB;

DROP TABLE IF EXISTS Supervisor;
CREATE TABLE Supervisor(
	supervisorID INT AUTO_INCREMENT NOT NULL, 
	PRIMARY KEY(supervisorID),
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL
) ENGINE=INNODB; 


DROP TABLE IF EXISTS Advisor;
CREATE TABLE Advisor (
	employeeID INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY(employeeID),
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL
    -- Either we use ENUM or Inject AdviosorOfProgram through Code, This we decide later
    -- AdviosorOfProgram ENUM('Graduate','Undergraduate')
)  ENGINE=INNODB;

-- Between Student and Advisor , We either create a new table which will be a weak relation
-- or create a field 'AssignedAdvisor' in Student Table which will link student to Advisor/SuperVisor
-- CREATE TABLE IF NOT EXISTS AssignedAdvisor ();

DROP TABLE IF EXISTS Instructor;
CREATE TABLE Instructor(
	instructorID INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY(instructorID),
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL
    ) ENGINE=INNODB;
    
DROP TABLE IF EXISTS Department;
CREATE TABLE  Department (
	name CHAR(60) NOT NULL,
    departmentID INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY(departmentID)
    -- ChairPerson CHAR(60),  -- ChairPerson can be null if no one is assigned yet
	-- Building VARCHAR(30) NOT NULL
)  ENGINE=INNODB;


DROP TABLE IF EXISTS Program;
CREATE TABLE Program (
	programID INT AUTO_INCREMENT NOT NULL,
    PRIMARY KEY(programID),
	name CHAR(60) NOT NULL,
	Credits DECIMAL(2,1)
    -- TypeOfProgram VARCHAR(30) NOT NULL
    -- add more
)  ENGINE=INNODB;


DROP TABLE IF EXISTS Course;
CREATE TABLE Course (
	courseID VARCHAR(8) NOT NULL, -- eg, COMP249, NO spaces
    PRIMARY KEY(courseID),
	courseName VARCHAR(25) NOT NULL,
    programID INT NOT NULL,  -- ProgramId links course to program, set Foeign key here , will Set keys and shit later
	credits DECIMAL(4,2)
    -- FOREIGN KEY(programID) REFERENCES Program(programID)
    -- Level VARCHAR(25),  -- i dont know may be we can remove this one
    -- Description TEXT  -- I am keeping this NOT NULL, we dont wanna add Description and waste time

)  ENGINE=INNODB;

DROP TABLE IF EXISTS Class;
CREATE TABLE Class(
	building VARCHAR(2),
    room INT NOT NULL,
    PRIMARY KEY(building, room)
)	ENGINE=INNODB;

DROP TABLE IF EXISTS Section;
CREATE TABLE Section(
	sectionID	VARCHAR(2)
    
) ENGINE=INNODB;

SHOW TABLES;
SELECT * FROM Student;


