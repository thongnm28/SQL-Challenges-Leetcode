WITH CTE AS(
SELECT Employee_id, count(department_id) as cnt
FROM Employee
GROUP BY employee_id
)

SELECT employee_id, department_id
FROM Employee
WHERE employee_id IN (SELECT Employee_id FROM CTE WHERE cnt = 1)
UNION
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = "Y"