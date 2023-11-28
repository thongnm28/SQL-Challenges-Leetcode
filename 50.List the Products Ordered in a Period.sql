SELECT
    product_name,
    unit
FROM
    Products
    JOIN (
        SELECT
            product_id,
            SUM(unit) AS unit
        FROM
            Orders
        WHERE
            MONTH(order_date) = 2 AND YEAR(order_date) = 2020
        GROUP BY
            product_id
        HAVING
            SUM(unit) >= 100
    ) T ON Products.product_id = T.product_id;