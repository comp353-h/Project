

DROP TABLE IF EXISTS student;
CREATE TABLE student (
    StudentId INT AUTO_INCREMENT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfJoin DATE,
    CurrentStatus ENUM('Enrolled','Not Enrolled'),
    PRIMARY KEY (StudentId)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS advisor;
CREATE TABLE advisor (
	EmployeeId INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    -- Either we use ENUM or Inject AdviosorOfProgram through Code, This we decide later
    AdviosorOfProgram ENUM('Graduate','Undergraduate')
)  ENGINE=INNODB;


-- Between Student and Advisor , We either create a new table which will be a weak relation
-- or create a field 'AssignedAdvisor' in Student Table which will link student to Advisor/SuperVisor
-- CREATE TABLE IF NOT EXISTS AssignedAdvisor ();

DROP TABLE IF EXISTS department;
CREATE TABLE  department (
	Name CHAR(60) NOT NULL,
    ChairPerson CHAR(60),  -- ChairPerson can be null if no one is assigned yet
	Building VARCHAR(30) NOT NULL
)  ENGINE=INNODB;


DROP TABLE IF EXISTS program;
CREATE TABLE program (
	ProgramId INT NOT NULL,
	Name CHAR(60) NOT NULL,
	TypeOfProgram VARCHAR(30) NOT NULL
    -- add more
)  ENGINE=INNODB;


DROP TABLE IF EXISTS Course;
CREATE TABLE Course (
	CourseNumber VARCHAR(8) NOT NULL, -- eg, COMP249, NO spaces
	Name VARCHAR(25) NOT NULL,
    ProgramId INT NOT NULL,  -- ProgramId links course to program, set Foeign key here , will Set keys and shit later
	Credits DECIMAL(4,2),
    Level VARCHAR(25),  -- i dont know may be we can remove this one
    Description TEXT  -- I am keeping this NOT NULL, we dont wanna add Description and waste time
)  ENGINE=INNODB;
