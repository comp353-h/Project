-- SELECT concat(DROP TABLE IF EXISTS `, table_name, `;)
-- FROM information_schema.tables
-- WHERE table_schema = hrc353_1;



-- adjusted order of dropping for foreign key constraints
DROP TABLE IF EXISTS `StudentEnrolledCourses`;
DROP TABLE IF EXISTS `InstructorSection`;
DROP TABLE IF EXISTS `StudentAdvisor`;
DROP TABLE IF EXISTS `Advisor`;
DROP TABLE IF EXISTS `Section`;
DROP TABLE IF EXISTS `Class`;
DROP TABLE IF EXISTS `StudentProgram`;
DROP TABLE IF EXISTS `Course`;
DROP TABLE IF EXISTS `Program`;
DROP TABLE IF EXISTS `Department`;
DROP TABLE IF EXISTS `Instructor`;
DROP TABLE IF EXISTS `ResearchFunding`;
DROP TABLE IF EXISTS `Student`;
DROP TABLE IF EXISTS `Supervisor`;
DROP TABLE IF EXISTS `TeachingAssistant`;
