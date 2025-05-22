SELECT c.class,
       CASE
         WHEN MIN(CASE WHEN s.name = c.class THEN s.launched END) IS NOT NULL
         THEN MIN(CASE WHEN s.name = c.class THEN s.launched END)
         ELSE MIN(s.launched)
       END AS year
FROM Classes c
LEFT JOIN Ships s ON c.class = s.class
GROUP BY c.class;
