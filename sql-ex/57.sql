WITH AllShips AS (
  SELECT name, class
  FROM Ships
  UNION
  SELECT o.ship AS name, o.ship AS class
  FROM Outcomes o
),
Sunk AS (
  SELECT DISTINCT ship
  FROM Outcomes
  WHERE result = 'sunk'
),
ShipCounts AS (
  SELECT a.class,
         COUNT(*) AS total_ships,
         COUNT(CASE WHEN s.ship IS NOT NULL THEN 1 END) AS sunk_ships
  FROM AllShips a
  LEFT JOIN Sunk s ON a.name = s.ship
  GROUP BY a.class
)
SELECT class,
       sunk_ships AS num_sunk
FROM ShipCounts
WHERE total_ships >= 3
  AND sunk_ships > 0;
