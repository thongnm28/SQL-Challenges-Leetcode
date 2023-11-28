WITH check_consecutive AS (
    SELECT ROW_NUMBER() OVER (ORDER BY id) AS rownumber, id, visit_date, people
    FROM Stadium
    WHERE people >= 100
)
SELECT id, visit_date, people
FROM check_consecutive
WHERE id - rownumber IN (
    SELECT id - rownumber
    FROM check_consecutive
    GROUP BY id - rownumber
    HAVING COUNT(*) >= 3
)
ORDER BY visit_date ASC;