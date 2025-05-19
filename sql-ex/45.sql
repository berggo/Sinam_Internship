SELECT name
FROM Ships
WHERE LENGTH(name) - LENGTH(REPLACE(name, ' ', '')) >= 2;
-- no such manes in the table
