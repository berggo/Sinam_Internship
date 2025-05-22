WITH AllShips AS (
  SELECT s.name, c.country, c.type, c.numGuns, c.bore, c.displacement
  FROM Ships s
  JOIN Classes c ON s.class = c.class
  UNION
  SELECT o.ship AS name, c.country, c.type, c.numGuns, c.bore, c.displacement
  FROM Outcomes o
  JOIN Classes c ON o.ship = c.class
)
SELECT name
FROM AllShips
WHERE country = 'Japan'
  AND numGuns >= 9
  AND bore < 19
  AND displacement <= 65000;
-- FIRST CHECK/SECOND CHECK

