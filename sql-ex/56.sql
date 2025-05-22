WITH AllShips AS (
  SELECT name, class
  FROM Ships
  UNION
  SELECT o.ship AS name, o.ship AS class
  FROM Outcomes o
  WHERE o.ship NOT IN (SELECT name FROM Ships)
),
SunkShips AS (
  SELECT DISTINCT a.name, a.class
  FROM AllShips a
  JOIN Outcomes o ON a.name = o.ship
  WHERE o.result = 'sunk'
)
SELECT c.class,
       COUNT(s.name) AS num_sunk
FROM Classes c
LEFT JOIN SunkShips s ON c.class = s.class
GROUP BY c.class;

