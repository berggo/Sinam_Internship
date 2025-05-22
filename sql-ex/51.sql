WITH AllShips AS (
  SELECT s.name, c.numGuns, c.displacement
  FROM Ships s
  JOIN Classes c ON s.class = c.class
  UNION
  SELECT o.ship AS name, c.numGuns, c.displacement
  FROM Outcomes o
  JOIN Classes c ON o.ship = c.class
),
MaxGunsPerDisp AS (
  SELECT displacement, MAX(numGuns) AS maxGuns
  FROM AllShips
  GROUP BY displacement
)
SELECT a.name
FROM AllShips a
JOIN MaxGunsPerDisp m ON a.displacement = m.displacement AND a.numGuns = m.maxGuns;

