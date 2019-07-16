DROP TRIGGER IF EXISTS check_hours_insert_trigger;
DELIMITER $$
CREATE TRIGGER check_hours_insert_trigger BEFORE INSERT ON TeachingAssistantRoles
FOR EACH ROW
BEGIN
DECLARE totalhours INT;
SET totalhours = (SELECT SUM(hours) FROM TeachingAssistantRoles WHERE teachingAssistantID=NEW.teachingAssistantID);
IF ( totalhours ) > 260 THEN
	SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'Insert will make the TA work for more 260 hours';
    END IF;
END;$$


DROP TRIGGER IF EXISTS check_hours_update_trigger;
DELIMITER $$
CREATE TRIGGER check_hours_update_trigger BEFORE UPDATE ON TeachingAssistantRoles
FOR EACH ROW
BEGIN
DECLARE totalhours INT;
SET totalhours = (SELECT SUM(hours) FROM TeachingAssistantRoles WHERE teachingAssistantID=NEW.teachingAssistantID);
IF ( totalhours ) > 260 THEN
	SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'Update will make the TA work for more 260 hours';
    END IF;
END;$$
