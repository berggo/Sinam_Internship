SELECT 
    maker,
    MIN(type) AS type
FROM Product
GROUP BY maker
HAVING 
    COUNT(DISTINCT type) = 1    -- only one product type
    AND COUNT(*) > 1;           -- more than one model
