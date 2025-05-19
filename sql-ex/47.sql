SELECT c.country
FROM Classes c
JOIN Ships s ON s.class = c.class
LEFT JOIN Outcomes o ON o.ship = s.name AND o.result = 'sunk'
GROUP BY c.country
HAVING COUNT(*) = COUNT(o.ship);
