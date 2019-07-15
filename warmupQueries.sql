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

