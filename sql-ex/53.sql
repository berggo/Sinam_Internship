WITH AllShipsClasses AS (
  SELECT s.class AS className
  FROM Ships s
  UNION ALL
  SELECT o.ship AS className
  FROM Outcomes o
)
SELECT ROUND(AVG(c.numGuns), 2) AS avgGuns
FROM Classes c
JOIN AllShipsClasses a ON c.class = a.className
WHERE c.type = 'bb';
-- Nine
