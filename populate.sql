INSERT INTO Department VALUES 
( 1, "Computer Science" ),
( 2, "Software Engineering" ),
( 3, "Building Engineering" ),
( 4, "Civil Engineering" ),
( 5, "Mathematics" )
( 6, "Mechanical Engineering" ),
( 7, "Computer Engineering" ),
( 8, "Engineering" ),
( 9, "Electrical Engineering" ),
( 10, "Aerospace Engineering" );

INSERT INTO Program VALUES
( 1, 2, `Building Engineering`, `Undergraduate`, 90.0 ),
( 2, 2, `Building Engineering`, `Graduate`, 44.0 ),
( 3, 2, `Civil Engineering`, `Undergraduate`, 90.0 ),
( 4, 2, `Civil Engineering`, `Graduate`, 44.0 ),
( 5, 2, `Environmental Engineering`, `Graduate`, 44.0 ),
( 6, 1, `Computer Science`, `Undergraduate`, 90.0 ),
( 7, 1, `Computer Science`, `Graduate`, 44.0 ),
( 8, 1, `Software Engineering`, `Undergraduate`, 90.0 ),
( 9, 3, `Chemical Engineering`, `Graduate`, 44.0 ),
( 10, 4, `Computer Engineering`, `Undergraduate`, 90.0 ),
( 11, 4, `Electrical Engineering`, `Undergraduate`, 90.0 ),
( 12, 4, `Electrical & Computer Engineering`, `Graduate`, 44.0 ),
( 13, 5, `Aerospace Engineering`, `Undergraduate`, 90.0 ),
( 14, 5, `Aerospace Engineering`, `Graduate`, 44.0 ),
( 15, 5, `Industrial Engineering`, `Undergraduate`, 90.0 ),
( 16, 5, `Industrial Engineering`, `Graduate`, 44.0 ),
( 17, 5, `Mechanical Engineering`, `Undergraduate`, 90.0 ),
( 18, 5, `Mechanical Engineering`, `Graduate`, 44.0 );

INSERT INTO Course VALUES
( `MATH201`, `ELementary Functions`, `6`, `3.00` ), 
( `MATH202`, `College Algebra`, `6`, `3.00`, `MATH201` ),
( `MATH203`, `Differential & Integral Calculus I`, `6`, `3.00` ),
( `MATH204`, `Vectors and Matrices`, `6`, `3.00` ),
( `MATH205`, `Differential & Integral Calculus II`, `6`, `3.00` ),
( `BCEE231`, `Structured Programming and Applications for Building and Civil Engineers`, `2`, `3.00`, `MATH204` ),
( `BLDG212`, `Building Engineering Drawing and Introduction to Design`, `2`, `3.00` ),
( `BCEE371`, `Surveying`, `2`, `3.00`, `BCEE231` ),
( `CIVI212`, `Civil Engineering Drawing and Introduction to Design`, `2`, `3.00` ),
( `CIVI231`, `Geology for Civil Engineers`, `2`, `3.00` ),
( `COMP232`, `Mathematics for Computer`, `1`, `3.00`, `MATH204` ),
( `COMP233`, `Probability and Statistics for Computer Science`, `1`, `3.00`, `MATH205` ),
( `COMP248`, `Object-Oriented Programming`, `1`, `3.50`, `MATH204` ),
( `COMP249`, `Object-Oriented Programming`, `1`, `3.50`, `MATH205` ),
( `COMP353`, `Databases`, `1`, `4.00`, `COMP232` ),
( `SOEN228`, `System Hardware`, `1`, `3.00`, `MATH204` );

INSERT INTO `Student` VALUES
( 
