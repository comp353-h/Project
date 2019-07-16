-- SELECT concat(DROP TABLE IF EXISTS `, table_name, `;)
-- FROM information_schema.tables
-- WHERE table_schema = hrc353_1;

-- Order of deletion depends
DROP TABLE IF EXISTS `TeachingAssistantRoles`;
DROP TABLE IF EXISTS `StudentEnrolledCourses`; 
DROP TABLE IF EXISTS `InstructorSection`;
DROP TABLE IF EXISTS `StudentAdvisor`;
DROP TABLE IF EXISTS `Advisor`;
DROP TABLE IF EXISTS `StudentCourses`;
DROP TABLE IF EXISTS `StudentProgram`;
DROP TABLE IF EXISTS `StudentSupervisor`;
DROP TABLE IF EXISTS `InstructorHistory`;
DROP TABLE IF EXISTS `Section`;
DROP TABLE IF EXISTS `Course`;
DROP TABLE IF EXISTS `Program`;
DROP TABLE IF EXISTS `Department`;
DROP TABLE IF EXISTS `Instructor`;
DROP TABLE IF EXISTS `Term`;
DROP TABLE IF EXISTS `ResearchFunding`;
DROP TABLE IF EXISTS `Supervisor`;
DROP TABLE IF EXISTS `TeachingAssistant`;
DROP TABLE IF EXISTS `Student`;
DROP TABLE IF EXISTS `Class`;