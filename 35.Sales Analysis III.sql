SELECT product_id, product_name
FROM Product
WHERE product_id IN (
    SELECT product_id
    FROM Sales
    GROUP BY product_id
    HAVING MAX(sale_date) <= CAST('2019-03-31' AS DATE)
    AND MIN(sale_date) >= CAST('2019-01-01' AS DATE)
)