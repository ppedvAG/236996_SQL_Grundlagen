/*
	-- WHILE -- leitet eine Schleifenanweisung ein
*/

DECLARE @Counter int = 0

WHILE @Counter < 5
BEGIN
SELECT 'Hallo!'
SET @Counter += 1
END