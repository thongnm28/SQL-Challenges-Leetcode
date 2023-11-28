SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM
    Department d
    JOIN Employee e ON d.id = e.departmentId
WHERE
    (
        SELECT COUNT(DISTINCT salary)
        FROM Employee
        WHERE departmentId = d.id AND salary > e.salary
    ) < 3
ORDER BY
    d.name,
    e.salary DESC;