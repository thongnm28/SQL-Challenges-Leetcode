SELECT
    r.contest_id,
    ROUND((COUNT(r.user_id) * 100.0) / total_users.total, 2) AS percentage
FROM
    Register r
JOIN
    (
        SELECT COUNT(DISTINCT user_id) AS total
        FROM Users
    ) AS total_users
GROUP BY
    r.contest_id, total_users.total
ORDER BY
    percentage DESC, r.contest_id ASC;