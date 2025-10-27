DELIMITER $$

DROP PROCEDURE IF EXISTS getAllWebbookmarks $$
CREATE PROCEDURE getAllWebbookmarks()
BEGIN
    SELECT * FROM webbookmarks;
END $$

DELIMITER ;
