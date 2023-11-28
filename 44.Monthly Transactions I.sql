WITH temp AS (
    SELECT *,
           DATE_FORMAT(trans_date, '%Y-%m') AS month
    FROM Transactions
)
SELECT temp.month,
       temp.country,
       COUNT(*) AS trans_count,
       SUM(CASE WHEN temp.state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
       SUM(temp.amount) AS trans_total_amount,
       SUM(CASE WHEN temp.state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM temp
GROUP BY temp.month, temp.country;