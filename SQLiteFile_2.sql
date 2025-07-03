-- UNION и UNION ALL
SELECT name FROM employees WHERE dept = 'HR'
UNION ALL
SELECT name FROM employees WHERE dept = 'IT';

-- INTERSECT
SELECT name FROM employees WHERE bonus IS NOT NULL
INTERSECT
SELECT name FROM employees WHERE salary > 60000;

-- EXCEPT (SQLite поддерживает)
SELECT name FROM employees WHERE dept = 'IT'
EXCEPT
SELECT name FROM employees WHERE bonus IS NULL;
