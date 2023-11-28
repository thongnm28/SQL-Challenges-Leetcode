SELECT request_at AS "Day",
       ROUND(SUM(IF(status = 'cancelled_by_driver' OR status = 'cancelled_by_client', 1, 0)) / COUNT(*), 2) AS "Cancellation Rate"
FROM trips AS t
JOIN users AS u1 ON t.client_id = u1.users_id
JOIN users AS u2 ON t.driver_id = u2.users_id
WHERE request_at >= '2013-10-01' AND request_at <= '2013-10-03'
      AND u1.banned = 'No'
      AND u2.banned = 'No'
GROUP BY request_at;