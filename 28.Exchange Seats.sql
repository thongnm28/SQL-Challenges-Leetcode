SELECT
    CASE
        WHEN ROW_NUMBER() OVER (ORDER BY id) % 2 = 1 THEN COALESCE(LEAD(id) OVER (ORDER BY id), id)
        ELSE LAG(id) OVER (ORDER BY id)
    END AS id,
    student
FROM
    Seat
ORDER BY
    id;