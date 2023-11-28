SELECT ROUND(COUNT(B.event_date) / COUNT(1), 2) AS fraction
FROM (
    SELECT player_id, MIN(event_date) AS day1
    FROM Activity
    GROUP BY player_id
) AS A
LEFT JOIN Activity AS B ON B.player_id = A.player_id
    AND DATEDIFF(B.event_date, A.day1) = 1
    AND B.games_played > 0;