

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
    -- ChairPerson can be null if no one is assigned yet
    ChairPerson CHAR(60),
	Building VARCHAR(30) NOT NULL
)  ENGINE=INNODB;


DROP TABLE IF EXISTS program;
CREATE TABLE program (
	Name CHAR(60) NOT NULL,
	TypeOfProgram VARCHAR(30) NOT NULL
    -- add more
)  ENGINE=INNODB;
