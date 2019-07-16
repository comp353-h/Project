-- SQL script used to populate all Relations specified in the script dbStructure.sql.

-- Insert the following tuples into the relation called "Department".
INSERT INTO Department VALUES 
-- departmentID, name.
( 1, "Computer Science" ),
( 2, "Software Engineering" ),
( 3, "Building Engineering" ),
( 4, "Civil Engineering" ),
( 5, "Mathematics" ),
( 6, "Mechanical Engineering" ),
( 7, "Computer Engineering" ),
( 8, "Engineering" ),
( 9, "Electrical Engineering" ),
( 10, "Aerospace Engineering" );

-- Insert the following tuples into the relation named "Program".
INSERT INTO Program VALUES
-- programID, departmentID, name, typeofprogram, credits.
( 1, 1, "Computer Application", "Undergraduate", 90.0 ),
( 2, 1, "Computer Games", "Undergraduate", 90.0 ),
( 3, 1, "Information Systems", "Undergraduate", 90.0 ),
( 4, 1, "Computer Systems", "Undergraduate", 90.0 ),
( 5, 1, "Web services & Applications", "Undergraduate", 90.0 ),
( 6, 5, "Mathematics", "Undergraduate", 90.0 ),
( 7, 1, "General Computer Science", "Undergraduate", 90.0 ),
( 9, 3, "Building Engineering", "Undergraduate", 90.0),
( 10, 4, "Civil Engineering", "Undergraduate", 90.0 );

INSERT INTO Course VALUES
-- courseID, courseName, programID, departmentID, credits, prerequisite.
( "MATH201", "Elementary Functions", 5, 6,	3.00, NULL ),
( "MATH202", "College Algebra", 5, 6, 3.00, "MATH201" ),
( "MATH203", "Differential & Integral Calculus I", 5, 6, 3.00, NULL ),
( "MATH204", "Vectors and Matrices", 5, 6, 3.00, NULL ),
( "MATH205", "Differential & Integral Calculus II", 5, 6, 3.00, "MATH203" ),
( "BCEE231", "Structured Programming and Applications for Building and Civil Engineers", 3, 9, 3.00, "MATH204" ),
( "BLDG212", "Building Engineering Drawing and Introduction to Design", 3, 9, 3.00, NULL ),
( "BCEE371", "Surveying", 3, 9, 3.00, "BCEE231" ),
( "CIVI212", "Civil Engineering Drawing and Introduction to Design", 4, 10, 3.00, NULL ),
( "CIVI231", "Geology for Civil Engineers", 4, 10, 3.00, NULL ),
( "COMP232", "Mathematics for Computer", 1, 7, 3.00, "MATH204" ),
( "COMP233", "Probability and Statistics for Computer Science", 1, 7, 3.00, "MATH205" ),
( "COMP248", "Object-Oriented Programming", 1, 7, 3.50, "MATH204" ),
( "COMP249", "Object-Oriented Programming", 1, 7, 3.50, "MATH205" ),
( "COMP353", "Databases", 1, 7, 4.00, "COMP232" ),
( "SOEN228", "System Hardware", 1, 7, 3.00, "MATH204" );

INSERT INTO Instructor VALUES
-- instructorID, firstName, lastName
( 1, "Khaleb", "Jababo" ),
( 2, "Aiman", "Hannah" );

INSERT INTO Class VALUES
-- room, building
( 405, "H" ),
( 535, "H" );

INSERT INTO Term VALUES
-- termID, termName, termYear
( 1, "SUMMER", 2019 ),
( 2, "FALL", 2019 );

INSERT INTO Section VALUES
-- sectionID, courseID, termID, room, startat, endat.
( "AA", "COMP248", 1, 405, "14:00:00", "15:15:00" ),
( "BB", "COMP248", 2, 405, "14:00:00", "15:15:00" ),
( "CC", "COMP353", 2, 535, "14:45:00", "17:30:00" );

INSERT INTO InstructorHistory VALUES
-- instructorID, termID, courseID, sectionID.
( 1, 1, "COMP248", "AA" ),
( 2, 2, "COMP248", "BB" ); 

INSERT INTO Student VALUES
-- studentID, firstName, lastName, phone, email, dateOfBirth, studentType, gpa.
( 1, "John", "Wick", NULL, "john.wick@gmail.com", '1975-05-17', "Undergraduate", 4.30 ),
( 2, "John", "Smith", NULL, "john.smith@gmail.com", '1998-09-02', "Undergraduate", 3.49 ),
( 3, "Mike", "Johnson", NULL, "mike.johnson@gmail.com", '1995-03-17', "Undergraduate", 2.30 ),
( 4, "Jane", "Doe", NULL, "jane.doe@gmail.com", '1995-03-29', "Undergraduate", 2.73 );

INSERT INTO StudentProgram VALUES
-- studentID, programID.
( 1, 3 ),
( 2, 1 ),
( 3, 3 ),
( 4, 5 );

INSERT INTO StudentCourses VALUES
-- studentID, courseID,	grade, termID, sectionID.
( 1, "COMP353", "CC", 2, "A+" ),
( 1, "COMP248", "AA", 1, "A" ),
( 2, "COMP353", "CC", 2, "B" ),
( 3, "COMP353", "CC", 2, "C+" );
