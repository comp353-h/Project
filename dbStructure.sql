

CREATE TABLE IF NOT EXISTS student (
    StudentId INT AUTO_INCREMENT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfJoin DATE,
    CurrentStatus ENUM('Enrolled','Not Enrolled'),
    PRIMARY KEY (StudentId)
)  ENGINE=INNODB;


CREATE TABLE IF NOT EXISTS Advisor (
	EmployeeId INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    -- Either we use ENUM or Inject AdviosorOfProgram through Code, This we decide later
    AdviosorOfProgram ENUM('Graduate','Undergraduate')
)  ENGINE=INNODB;



-- Between Student and Advisor , We either create a new table which will be a weak relation
-- or create a field 'AssignedAdvisor' in Student Table which will link student to Advisor/SuperVisor
 
 
-- CREATE TABLE IF NOT EXISTS AssignedAdvisor ();