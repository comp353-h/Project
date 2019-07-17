-- Q1 
/*Find ID, first name and last name of all the students who have taken
Database course and received an A or A+ grade for the course.*/
SELECT
   s.firstName,
   s.lastName,
   c.courseName,
   sc.grade 
FROM
   Student s 
   JOIN
      StudentCourses sc 
      ON s.studentID = sc.studentID 
   JOIN
      Course c 
      ON c.courseID = sc.courseID 
WHERE
   c.courseID = 'COMP353' 
   AND 
   (
      sc.grade = 'A+' 
      OR sc.grade = 'A'
   )
;

-- Q2
/*Find ID, first name, last name and number of programs of students who
are enrolled in at least two different programs in the Computer Science
department.*/
SELECT
   studentID,
   firstName,
   lastName,
   NumberOfPrograms 
FROM
   (
      SELECT
         s.studentID,
         s.firstName,
         s.lastName,
         COUNT(sp.studentID) AS NumberOfPrograms 
      FROM
         StudentProgram sp 
         JOIN
            Student s 
            ON (s.studentID = sp.studentID) 
         JOIN
            Program p 
            ON (sp.programID = p.programID) 
         JOIN
            Department d 
            ON (p.departmentID = d.departmentID) 
      WHERE
         d.departmentID = 1 
      GROUP BY
         studentID
   )
   AS T 
WHERE
   NumberOfPrograms > 1;
   
-- Q3
/*Find the name of all the instructors who taught Comp 352 in the fall term
of 2018 but have never taught the same course before.*/
SELECT
   firstName,
   lastName 
FROM
   Instructor 
WHERE
   instructorID IN 
   (
      SELECT
         instructorID 
      FROM
         InstructorHistory 
      WHERE
         courseID = 'comp352' 
         AND termID = 4 
         AND instructorID NOT IN 
         (
            SELECT
               instructorID 
            FROM
               InstructorHistory 
            WHERE
               courseID = 'comp352' 
               AND termID < 4
         )
      GROUP BY
         instructorID
   );
   
-- Q4 
SELECT
   p.name,
   p.credits 
FROM
   Program p 
WHERE
   departmentID = 1;
   
   
-- Q5 
/*Find the name and IDs of all the undergraduate students who do not have
an advisor.*/
SELECT
   studentID,
   firstName,
   lastName 
FROM
   Student 
WHERE
   (
      studentType = 'Undergraduate'
   )
   AND studentID NOT IN 
   (
      SELECT
         studentID 
      FROM
         StudentAdvisor
   )
;

-- Q6 			     
/*Find the ID, name and assignment mandate of all the graduate students
who are assigned as teaching assistants to Comp 353 for the summer term
of 2019.*/
SELECT
   ta.teachingAssistantID,
   firstName,
   lastName,
   typeofrole 
FROM
   TeachingAssistant ta,
   TeachingAssistantRoles tar 
   JOIN
      Section s 
      ON s.sectionID = tar.sectionID 
   JOIN
      Term t 
      ON t.termID = s.termID 
   JOIN
      Course c 
      ON c.courseID = s.courseID 
WHERE
   c.courseID = 'COMP353' 
   AND t.termName = 'SUMMER' 
   AND t.termYear = 2019 
   AND ta.teachingAssistantID = tar.teachingAssistantID ;
   
   
-- Q7			     
/*Find the name of all the supervisors in the Computer Science department
who have supervised at least 20 students.*/
SELECT
   * 
FROM
   StudentSupervisor ss 
   JOIN
      Supervisor s 
      ON (s.supervisorID = ss.supervisorID) 
   JOIN
      Program p 
      ON (p.programID = ss.programID) 
GROUP BY
   s.supervisorID 
HAVING
   COUNT(s.supervisorID > 19) ;
   
-- Q8
/*Find the details of all the courses offered by the Computer Science
department for the summer term of 2019. Details include Course name,
section, room location, start and end time, professor teaching the course,
max class capacity and number of enrolled students.*/
SELECT 
    courseName,
    s.sectionID,
    s.room,
    s.building,
    s.startat,
    s.endat,
    capacity,
    i.firstName,
    i.lastName
FROM
    Course c
        JOIN
    Section s ON (s.courseID = c.courseID)
        JOIN
    InstructorSection ins ON (s.courseID = ins.courseID)
        JOIN
    Instructor i ON (i.instructorID = ins.instructorID)
        JOIN
    Department d ON (d.departmentID = c.departmentID)
        JOIN
    Class cl ON (cl.room = s.room
        AND cl.building = s.building)
WHERE
    (d.departmentID = 1) AND (s.termID = 6)
GROUP BY c.coursename;
   
   
-- Q9
/*For each department, find the total number of courses offered by the
department.*/
SELECT
   d.name,
   COUNT(c.courseID) AS NumberOfCourseOffered 
FROM
   Course c 
   JOIN
      Department d 
      ON (d.departmentID = c.departmentID) 
GROUP BY
   d.departmentID;
   
   
-- Q10
/*For each program, find the total number of students enrolled into the
program.*/
SELECT
   p.name AS 'Program Name',
   COUNT(sp.studentID) AS 'Students Enrolled' 
FROM
   StudentProgram sp 
   JOIN
      Program p 
      ON (sp.programID = p.programID) 
GROUP BY
   p.name;
