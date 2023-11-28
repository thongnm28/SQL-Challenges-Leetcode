SELECT s.product_id, MIN(s.year) AS first_year, s.quantity, s.price
FROM Sales s
INNER JOIN (
    SELECT product_id, MIN(year) AS min_year
    FROM Sales
    GROUP BY product_id
) t ON s.product_id = t.product_id AND s.year = t.min_year
GROUP BY s.product_id, s.quantity, s.price;