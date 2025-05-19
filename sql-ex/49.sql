SELECT DISTINCT name AS ship
FROM Ships s
JOIN Classes c ON s.class = c.class
WHERE c.bore = 16

UNION

SELECT DISTINCT o.ship
FROM Outcomes o
JOIN Classes c ON o.ship = c.class
WHERE c.bore = 16;

