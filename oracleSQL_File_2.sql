SELECT name FROM employees WHERE bonus IS NOT NULL
INTERSECT
SELECT name FROM employees WHERE salary > 60000;

SELECT name FROM employees WHERE dept = 'HR'
UNION ALL
SELECT name FROM employees WHERE dept = 'IT';

SELECT name FROM employees WHERE dept = 'IT'
MINUS
SELECT name FROM employees WHERE bonus IS NULL;
