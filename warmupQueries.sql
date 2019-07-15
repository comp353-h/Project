-- Q1 

SELECT 
    s.firstName, s.lastName, c.courseName, sc.grade
FROM
    Student s
        JOIN
    StudentCourses sc ON s.studentID = sc.studentID
        JOIN
    Course c ON c.courseID = sc.courseID
WHERE
    c.courseID = 'COMP353'
        AND (sc.grade = 'A+' OR sc.grade = 'A');



-- Q2

SELECT 
    s.firstName,
    s.lastName,
    COUNT(sp.studentID) AS NumberOfProgarms
FROM
    StudentProgram sp
        JOIN
    Student s ON (s.studentID = sp.studentID)
        JOIN
    Program p ON (sp.programID = p.programID)
        JOIN
    Department d ON (p.departmentID = d.departmentID)
WHERE
    d.departmentID = 1;

-- Q3

SELECT 
    *
FROM
    InstructorHistory ih
        JOIN
    Instructor i ON (ih.instructorID = i.instructorID)
        JOIN
    Term t ON (t.termID = ih.termID)
        JOIN
    Section s ON (s.sectionID = ih.sectionID)
        JOIN
    Course c ON (c.courseID =  s.courseID)
	WHERE i.firstName = (SELECT * FROM table1 WHERE ...))

    
    -- c.courseID = 'COMP352' AND  
;

-- Q4 
SELECT p.name, p.credits FROM Program p where departmentID = 1;

-- Q5 
SELECT 
    studentID, firstName, lastName
FROM
    Student
WHERE
    studentID NOT IN (SELECT 
            studentID
        FROM
            StudentAdvisor);
			     
			     
-- Q6 			     
-- Find the ID, name and assignment mandate of all the graduate students
-- who are assigned as teaching assistants to Comp 353 for the summer term
-- of 2019

SELECT 
    *
FROM
    TeachingAssistantRoles tar
        JOIN
    Section s ON s.sectionID = tar.sectionID 
    JOIN
    Term t ON t.termID = s.termID
        JOIN
    Course c ON c.courseID = s.courseID
WHERE
    c.courseID = 'COMP353' AND t.termName = 'SUMMER' AND t.termYear = 2019
;
			     
-- Q7			     
-- Find the name of all the supervisors in the Computer Science department
-- who have supervised at least 20 students.

SELECT 
    *
FROM
    StudentSupervisor ss
        JOIN
    Supervisor s ON (s.supervisorID = ss.supervisorID)
        JOIN
    Program p ON (p.programID = ss.programID)
    group by s.supervisorID
    HAVING COUNT(s.supervisorID > 19)
;
			     
			  
-- Q9
-- For each department, find the total number of courses offered by the
-- department.

SELECT 
    d.name, COUNT(c.courseID) AS NumberOfCourseOffered
FROM
    Course c
        JOIN
    Department d ON (d.departmentID = c.departmentID)
GROUP BY d.departmentID;

