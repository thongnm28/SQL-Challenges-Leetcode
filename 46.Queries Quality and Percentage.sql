SELECT query_name,
       ROUND(AVG(CAST(rating AS DECIMAL) / position), 2) AS quality,
       ROUND((COUNT(CASE WHEN rating < 3 THEN 1 ELSE NULL END) / COUNT(*) * 100), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;