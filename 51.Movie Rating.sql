WITH temp AS (
    (SELECT name, COUNT(rating) AS t
    FROM MovieRating
    JOIN Users USING(user_id)
    GROUP BY user_id
    ORDER BY t DESC, name ASC
    LIMIT 1)
    UNION ALL
    (SELECT m1.title AS name, ROUND(AVG(rating), 2) AS t
    FROM MovieRating m
    JOIN Movies m1 ON m.movie_id = m1.movie_id
    AND created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m1.title
    ORDER BY t DESC, m1.title
    LIMIT 1)
)
SELECT name AS results
FROM temp;