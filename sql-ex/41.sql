SELECT
  maker,
  CASE
    WHEN COUNT(price) < COUNT(*) THEN NULL        -- some prices are NULL
    ELSE MAX(price)                               -- all prices are non-NULL
  END AS m_price
FROM (
  -- pull every (maker, price) pair from all three product tables
  SELECT p.maker, pc.price
  FROM   Product p
  JOIN   PC       pc ON p.model = pc.model

  UNION ALL

  SELECT p.maker, l.price
  FROM   Product p
  JOIN   Laptop   l  ON p.model = l.model

  UNION ALL

  SELECT p.maker, pr.price
  FROM   Product p
  JOIN   Printer  pr ON p.model = pr.model
) AS all_products
GROUP BY maker;
