SELECT ROUND(AVG(c.numGuns), 2) AS avgGuns
FROM (
  SELECT s.class AS className
  FROM Ships s
  UNION ALL
  SELECT o.ship AS className
  FROM Outcomes o
) AS AllBattleships
JOIN Classes c ON c.class = AllBattleships.className
WHERE c.type = 'bb';
-- Nine

