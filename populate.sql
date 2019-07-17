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
( 10, 4, "Civil Engineering", "Undergraduate", 90.0 ),
( 11, 1, "Computer Science", "Graduate", 44.0 ),
( 12, 5, "Mathematics", "Graduate", 44.0 );

INSERT INTO Course VALUES
-- courseID, courseName, departmentID, programID, credits, prerequisite.
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
( "COMP352", "Datastructures and Algorithms", 1, 7, 4.00, "COMP249" ),
( "COMP353", "Databases", 1, 7, 4.00, "COMP232" ),
( "SOEN228", "System Hardware", 1, 7, 3.00, "MATH204" );

INSERT INTO Instructor VALUES
-- instructorID, firstName, lastName
( 1, "Khaleb", "Jababo" ),
( 2, "Aiman", "Hannah" ),
( 3, "Donald", "Trump" ),
( 4, "Gina", "Cody" ),
( 5, "Gosta", "Grahne" ),
( 6, "Carlos", "Santana" ),
( 7, "David", "Probst" ),
( 8, "Abbas", "JAVADTALAB" ),
( 9, "Bruno", "Grenier" ),
( 10, "Tom", "Cruise" );

INSERT INTO Class VALUES
-- room, building, capacity
( 405, "H", 70 ),
( 407, "H", 70 ),
( 409, "H", 70 ),
( 411, "H", 70 ),
( 435, "H", 120 ),
( 535, "H", 120  ),
( 903, "H", 40 ),
( 907, "H", 40 ),
( 1120, "JM", 90 ),
( 1123, "JM", 90 );

INSERT INTO Term VALUES
-- termID, termName, termYear
( 1, "FALL", 2017 ),
( 2, "WINTER", 2018 ),
( 3, "SUMMER", 2018 ),
( 4, "FALL", 2018 ),
( 5, "WINTER", 2019 ),
( 6, "SUMMER", 2019 ),
( 7, "FALL", 2019 ),
( 8, "WINTER", 2020 ),
( 9, "SUMMER", 2020 ),
( 10, "FALL", 2020 );

INSERT INTO Section VALUES
-- sectionID, courseID, termID, room, startat, endat.
( "WA", "COMP352", 1, 435, "H", "14:30:00", "15:45:00" ),
( "HC", "MATH203", 1, 405, "H", "08:45:00", "10:00:00" ),
( "CR", "MATH205", 1, 407, "H", "12:45:00", "14:00:00" ),
( "GD", "CIVI212", 1, 1120, "JM", "15:30:00", "16:45:00" ),
( "RC", "BCEE231", 1, 907, "H", "11:00:00", "12:15:00" ),
( "BB", "SOEN228", 1, 535, "H", "17:45:00", "20:15:00" ),
( "BA", "COMP352", 4, 1120, "JM", "09:00:00", "10:15:00" ),
( "DC", "COMP352", 4, 411, "H", "12:45:00", "14:00:00" ),
( "RA", "COMP352", 4, 409, "H", "17:45:00", "20:15:00" ),
( "AA", "COMP352", 3, 907, "H", "14:30:00", "15:45:00" ),
( "AA", "COMP248", 6, 405, "H", "14:00:00", "15:15:00" ),
( "CA", "COMP233", 6, 409, "H", "09:00:00", "10:15:00" ),
( "RR", "COMP232", 6, 407, "H", "14:45:00", "17:30:00" ),
( "BR", "COMP353", 6, 907, "H", "14:00:00", "15:15:00" ),
( "BB", "COMP248", 7, 407, "H", "14:00:00", "15:15:00" ),
( "TA", "COMP352", 5, 405, "H", "14:00:00", "15:15:00" ),
( "BB", "MATH204", 2, 535, "H", "09:00:00", "10:15:00" ),
( "CC", "COMP353", 2, 1123, "JM", "14:45:00", "17:30:00" );

INSERT INTO InstructorHistory VALUES
-- instructorID, termID, courseID, sectionID.
( 3, 1, "COMP352", "WA" ),
( 8, 1, "CIVI212", "GD" ),
( 6, 1, "MATH203", "HC" ),
( 10, 1, "MATH205", "CR" ),
( 2, 3, "COMP352", "AA" ),
( 3, 4, "COMP352", "BA" ),
( 1, 4, "COMP352", "DC" ),
( 1, 4, "COMP352", "RA" ),
( 8, 5, "COMP352", "TA" ),
( 1, 6, "COMP248", "AA" ),
( 2, 6, "COMP233", "CA" ),
( 2, 7, "COMP248", "BB" );

INSERT INTO Student VALUES
-- studentID, firstName, lastName, phone, email, dateOfBirth, studentType, gpa.
( 1, "John", "Wick", NULL, "john.wick@gmail.com", '1975-05-17', "Undergraduate", 4.30 ),
( 2, "John", "Smith", NULL, "john.smith@gmail.com", '1998-09-02', "Undergraduate", 3.49 ),
( 3, "Mike", "Johnson", NULL, "mike.johnson@gmail.com", '1995-03-17', "Undergraduate", 2.30 ),
( 4, "Jane", "Doe", NULL, "jane.doe@gmail.com", '1995-03-29', "Undergraduate", 2.73 ),
( 5, "Salomon", "Kane", NULL, "salomon.kane@gmail.com", '1979-09-09', "Graduate", 3.76 ),
( 6, "Stephan", "Stephanson", NULL, "stephan.stephanson@gmail.com", '1980-01-01', "Graduate", 3.25 ),
( 7, "Marcus", "Aurelius", NULL, "marcus.aurelius@gmail.com", '1956-12-27', "Graduate", 3.59 ),
( 8, "Ada", "Lovelace", NULL, "ada.lovelace@gmail.com", '1815-12-10', "Graduate", 4.30 ),
( 9, "Charles", "Babage", NULL, "charles.babage@gmail.com", '1791-12-26', "Graduate", 4.23 ),
( 10, "Alonzo", "Church", NULL, "alonzo.church@gmail.com", '1903-06-14', "Graduate", 3.90 ),
( 11, "Marcus", "Aurelius", NULL, "marcus.aurelius@gmail.com", '1956-12-27', "Graduate", 3.59 ),
( 12, "Ada", "Lovelace", NULL, "ada.lovelace@gmail.com", '1815-12-10', "Graduate", 4.30 ),
( 13, "Charles", "Babage", NULL, "charles.babage@gmail.com", '1791-12-26', "Graduate", 4.23 ),
( 14, "Alonzo", "Church", NULL, "alonzo.church@gmail.com", '1903-06-14', "Graduate", 3.90 ),
( 15, "Marcus", "Aurelius", NULL, "marcus.aurelius@gmail.com", '1956-12-27', "Graduate", 3.59 ),
( 16, "Ada", "Lovelace", NULL, "ada.lovelace@gmail.com", '1815-12-10', "Graduate", 4.30 ),
( 17, "Charles", "Babage", NULL, "charles.babage@gmail.com", '1791-12-26', "Graduate", 4.23 ),
( 18, "Alonzo", "Church", NULL, "alonzo.church@gmail.com", '1903-06-14', "Graduate", 3.90 ),
( 19, "Marcus", "Aurelius", NULL, "marcus.aurelius@gmail.com", '1956-12-27', "Graduate", 3.59 ),
( 20, "Ada", "Lovelace", NULL, "ada.lovelace@gmail.com", '1815-12-10', "Graduate", 4.30 ),
( 21, "Charles", "Babage", NULL, "charles.babage@gmail.com", '1791-12-26', "Graduate", 4.23 ),
( 22, "Alonzo", "Church", NULL, "alonzo.church@gmail.com", '1903-06-14', "Graduate", 3.90 ),
( 23, "Marcus", "Aurelius", NULL, "marcus.aurelius@gmail.com", '1956-12-27', "Graduate", 3.59 ),
( 24, "Ada", "Lovelace", NULL, "ada.lovelace@gmail.com", '1815-12-10', "Graduate", 4.30 ),
( 25, "Charles", "Babage", NULL, "charles.babage@gmail.com", '1791-12-26', "Graduate", 4.23 ),
( 26, "Alonzo", "Church", NULL, "alonzo.church@gmail.com", '1903-06-14', "Graduate", 3.90 );
1
INSERT INTO StudentProgram VALUES
-- studentID, programID.
( 1, 2 ),
( 1, 3 ),
( 2, 1 ),
( 2, 2 ),
( 2, 3 ),
( 3, 3 ),
( 4, 6 );

INSERT INTO StudentCourses VALUES
-- studentID, courseID,	grade, termID, sectionID.
( 1, "COMP353", "CC", 2, "A+" ),
( 1, "COMP248", "AA", 6, "A" ),
( 2, "COMP353", "CC", 2, "B" ),
( 2, "COMP233", "CA", 6, "C-" ),
( 3, "COMP233", "CA", 6, "F" ),
( 3, "COMP353", "CC", 2, "A+" ),
( 4, "MATH204", "BB", 2, "C" );

INSERT INTO Advisor VALUES
-- advisorID, firstName, lastName
( 1, "Katherine", "Matthews-Riel" ),
( 2, "Vicky", "Tow" ),
( 3, "Magik", "Mike" );

INSERT INTO StudentAdvisor VALUES
-- studentID, advisorID, programID
( 1, 1, 2 ),
( 5, 2, 11 ),
( 6, 3, 12 );

INSERT INTO TeachingAssistant VALUES
-- teachingAssistantID, studentID, firstName, lastName, dateOfBirth, gpa
( 1, 5, "Salomon", "Kane", '1979-09-09', 3.76 ),
( 2, 6, "Stephan", "Stephanson", '1980-01-01', 3.25 );

INSERT INTO TeachingAssistantRoles VALUES
-- courseID, sectionID, termID, teachingAssistantID, room, typeofrole, hours
( "COMP352", "WA", 1, 1, 435, "tutorial", '100:00:00'),
( "MATH203", "HC", 1, 2, 405, "tutorial", '100:00:00' ),
( "MATH205", "CR", 1, 2, 407, "tutorial", '100:00:00' ),
( "COMP353", "BR", 6, 1, 907, "lab", '100:00:00' );

INSERT INTO ResearchFunding VALUES
-- researchFundingID, amount, researchDate, researchName
( 1, 100000.0, "2019-01-01", "Science, Bitch!" );

INSERT INTO Supervisor VALUES
-- supervisorID, firstName, lastName, fundingAvailable
( 1, "Tony", "Stark", true ),
( 2, "Harald", "Hardrada", true);

INSERT INTO StudentSupervisor VALUES
-- studentID, supervisorID, programID
( 5, 1, 11 ),
( 7, 1, 11 ),
( 8, 1, 11 ),
( 9, 1, 11 ),
( 10, 1, 11 ),
( 11, 1, 11 ),
( 12, 1, 11 ),
( 13, 1, 11 ),
( 14, 1, 11 ),
( 15, 1, 11 ),
( 16, 1, 11 ),
( 17, 1, 11 ),
( 18, 1, 11 ),
( 19, 1, 11 ),
( 20, 1, 11 ),
( 21, 1, 11 ),
( 22, 1, 11 ),
( 23, 1, 11 ),
( 24, 1, 11 ),
( 25, 1, 11 ),
( 26, 1, 11 );