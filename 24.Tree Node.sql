WITH tmp AS(
SELECT t1.id, COUNT(t2.id) cid , COUNT(t1.p_id) pid
FROM Tree t1
LEFT JOIN Tree t2
ON t1.id = t2.p_id
GROUP BY t1.id)

SELECT id,
CASE WHEN pid = 0 THEN 'Root'
WHEN pid>0 AND cid>0 THEN 'Inner'
ELSE 'Leaf' END AS type
FROM tmp