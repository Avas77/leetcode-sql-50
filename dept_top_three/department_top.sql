WITH emp_rank_salary AS (SELECT
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary,
    DENSE_RANK() OVER (
        PARTITION BY d.id
        ORDER BY e.salary DESC
    ) AS emp_rank
FROM Employee AS e
INNER JOIN Department AS d ON e.departmentId = d.id)

SELECT
    Department,
    Employee,
    Salary
FROM emp_rank_salary
WHERE emp_rank <= 3;