DELIMITER $$

DROP PROCEDURE IF EXISTS searchBookmark $$
CREATE PROCEDURE searchBookmark(IN searchTerm VARCHAR(100))
BEGIN
    SELECT *
    FROM webbookmarks
    WHERE sitename LIKE CONCAT('%', searchTerm, '%')
       OR link LIKE CONCAT('%', searchTerm, '%');
END $$

DELIMITER ;
