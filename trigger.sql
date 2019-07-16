
DROP TRIGGER IF EXISTS check_hours_insert_trigger;

DELIMITER $$
CREATE TRIGGER check_hours_insert_trigger BEFORE INSERT ON TeachingAssistantRoles
FOR EACH ROW
BEGIN
DECLARE totalhours INT;
SET totalhours = (SELECT SUM(hours) FROM hrc353_1.TeachingAssistantRoles WHERE teachingAssistantID=NEW.teachingAssistantID);
if ( totalhours ) > 260 THEN
	SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on hours failed';
    END IF;
END;$$
