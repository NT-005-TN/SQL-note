-- Создаём временные таблицы
WITH employees AS (
    SELECT 1 AS id, 'Alice' AS name, 'HR' AS dept, 50000 AS salary, NULL AS bonus UNION ALL
    SELECT 2, 'Bob', 'IT', 70000, 5000 UNION ALL
    SELECT 3, 'Charlie', 'IT', 70000, NULL UNION ALL
    SELECT 4, 'Diana', 'HR', 60000, 1000 UNION ALL
    SELECT 5, 'Eva', 'IT', 70000, NULL
),
departments AS (
    SELECT 'HR' AS dept, 'Moscow' AS location UNION ALL
    SELECT 'IT', 'London'
),

-- Подзапрос в FROM
avg_salary AS (
    SELECT dept, AVG(salary) AS avg_sal
    FROM employees
    GROUP BY dept
)

-- Основной запрос
SELECT DISTINCT
    e.name,
    e.salary,
    e.bonus,
    d.location,
    (SELECT COUNT(*) FROM employees WHERE salary > e.salary) AS higher_paid,  -- подзапрос в SELECT
    CASE 
        WHEN e.bonus IS NULL THEN 'No Bonus'
        WHEN e.bonus BETWEEN 1 AND 5000 THEN 'Small Bonus'
        ELSE 'Big Bonus'
    END AS bonus_category
FROM employees e
INNER JOIN departments d ON e.dept = d.dept         -- INNER JOIN
LEFT JOIN avg_salary a ON e.dept = a.dept           -- LEFT JOIN
WHERE 
    (e.salary BETWEEN 60000 AND 80000)              -- BETWEEN
    AND e.dept IN ('HR', 'IT')                      -- IN
    AND e.name NOT LIKE '%z%'                       -- NOT LIKE
    AND NOT EXISTS (                                 -- EXISTS + подзапрос
        SELECT 1 FROM employees sub
        WHERE sub.salary > 100000 AND sub.dept = e.dept
    )
    AND e.bonus IS NOT NULL                         -- IS NOT NULL
ORDER BY e.salary DESC
LIMIT 3 OFFSET 1                                     -- LIMIT + OFFSET
;
