INSERT INTO Department VALUES 
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

INSERT INTO Program VALUES
( 1, 1, "Computer Application", "Undergraduate", 90.0 ),
( 2, 1, "Computer Games", "Undergraduate", 90.0 ),
( 3, 1, "Information Systems", "Undergraduate", 90.0 ),
( 4, 1, "Computer Systems", "Undergraduate", 90.0 ),
( 5, 1, "Web services & Applications", "Undergraduate", 90.0 );

INSERT INTO Course VALUES
( "MATH201", "ELementary Functions", 5, 3.00 ), 
( "MATH202", "College Algebra", 5, 3.00, "MATH201" ),
( "MATH203", "Differential & Integral Calculus I", 5, 3.00 ),
( "MATH204", "Vectors and Matrices", 5, 3.00 ),
( "MATH205", "Differential & Integral Calculus II", 5, 3.00 ),
( "BCEE231", "Structured Programming and Applications for Building and Civil Engineers", 3, 3.00, "MATH204" ),
( "BLDG212", "Building Engineering Drawing and Introduction to Design", 3, 3.00 ),
( "BCEE371", "Surveying", 3, 3.00, "BCEE231" ),
( "CIVI212", "Civil Engineering Drawing and Introduction to Design", 4, 3.00 ),
( "CIVI231", "Geology for Civil Engineers", 4, 3.00 ),
( "COMP232", "Mathematics for Computer", 1, 3.00, "MATH204" ),
( "COMP233", "Probability and Statistics for Computer Science", 1, 3.00, "MATH205" ),
( "COMP248", "Object-Oriented Programming", 1, 3.50, "MATH204" ),
( "COMP249", "Object-Oriented Programming", 1, 3.50, "MATH205" ),
( "COMP353", "Databases", 1, 4.00, "COMP232" ),
( "SOEN228", "System Hardware", 1, 3.00, "MATH204" );

INSERT INTO Instructor VALUES
( 1, "Khaleb", "Jababo" );

INSERT INTO class VALUES
( 535, "H" );

INSERT INTO Section VALUES
( "CC", "COMP353", 535, "14:45:00", "17:30:00" );

INSERT INTO Student VALUES
( 1, "John", "Wick", NULL, "john.wick@gmail.com", 1975-05-17, "Undergraduate", 4.30 ),
( 2, "John", "Smith", NULL, "john.smith@gmail.com", 1998-09-02, "Undergraduate", 3.49 ),
( 3, "Jane", "Doe", NULL, "jane.doe@gmail.com", 1995-03-29, "Undergraduate", 2.73 );

INSERT INTO StudentProgram VALUES
( 1, 3 ),
( 2, 1 ),
( 3, 5 );

INSERT INTO StudentEnrolledCourses VALUES
( 1, "COMP353", "CC" ),
( 1, "COMP249" ),
( 2, "COMP353", "CC" ),
( 3, "COMP353", "CC" );