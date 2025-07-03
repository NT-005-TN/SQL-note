WITH employees AS (
    SELECT 1 AS id, 'Alice' AS name, 'HR' AS dept, 50000 AS salary, CAST(NULL AS NUMBER) AS bonus FROM dual
    UNION ALL
    SELECT 2, 'Bob', 'IT', 70000, 5000 FROM dual
    UNION ALL
    SELECT 3, 'Charlie', 'IT', 70000, NULL FROM dual
    UNION ALL
    SELECT 4, 'Diana', 'HR', 60000, 1000 FROM dual
    UNION ALL
    SELECT 5, 'Eva', 'IT', 70000, NULL FROM dual
),
departments AS (
    SELECT 'HR' AS dept, 'Moscow' AS location FROM dual
    UNION ALL
    SELECT 'IT', 'London' FROM dual
),
avg_salary AS (
    SELECT dept, AVG(salary) AS avg_sal
    FROM employees
    GROUP BY dept
),
main_query AS (
    SELECT DISTINCT
        e.name,
        e.salary,
        e.bonus,
        d.location,
        (SELECT COUNT(*) FROM employees WHERE salary > e.salary) AS higher_paid,
        CASE 
            WHEN e.bonus IS NULL THEN 'No Bonus'
            WHEN e.bonus BETWEEN 1 AND 5000 THEN 'Small Bonus'
            ELSE 'Big Bonus'
        END AS bonus_category
    FROM employees e
    INNER JOIN departments d ON e.dept = d.dept
    LEFT JOIN avg_salary a ON e.dept = a.dept
    WHERE 
        e.salary BETWEEN 60000 AND 80000
        AND e.dept IN ('HR', 'IT')
        AND e.name NOT LIKE '%z%'
        AND NOT EXISTS (
            SELECT 1 FROM employees sub
            WHERE sub.salary > 100000 AND sub.dept = e.dept
        )
        AND e.bonus IS NOT NULL
    ORDER BY e.salary DESC
)
SELECT *
FROM main_query
OFFSET 1 ROWS FETCH NEXT 3 ROWS ONLY;
