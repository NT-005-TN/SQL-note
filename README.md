# Полезные сайты:
## https://www.sqlstyle.guide/ru/ - здесь можно отформатировать запрос в наиболее удобном виде
##  https://codebeautify.org/sqlformatter - здесь реководство по стилю SQL

# Основы SQL

## Какие рассматриваются диалекты SQL: 
  SQLite 
  
  OracleSQL
  
  PostgrseSQL

## Общее для всех

### Операторы SELECT
  SELECT ... FROM ...

  DISTINCT

  WHERE

  ORDER BY

  LIMIT (в Oracle используется FETCH FIRST n ROWS ONLY)

  OFFSET (в Oracle — с OFFSET ... FETCH)

### Логические операторы
  AND, OR, NOT
  
  IS NULL, IS NOT NULL
  
  IN, NOT IN
  
  BETWEEN, NOT BETWEEN
  
  LIKE, NOT LIKE

### Агрегатные функции
  COUNT()
  
  SUM()
  
  AVG()
  
  MIN()
  
  MAX()

### Группировка
  GROUP BY
  
  HAVING

### Объединения
  INNER JOIN

  LEFT JOIN
  
  RIGHT JOIN (в SQLite не поддерживается напрямую, но можно обойти)
  
  FULL JOIN (в SQLite — нет поддержки)

### Подзапросы
  Внутри SELECT, FROM, WHERE, EXISTS, IN

### Операции с множествами
  UNION
  
  UNION ALL

  INTERSECT
  
  EXCEPT (в Oracle — MINUS вместо EXCEPT)

### Отличия и особенности в общем
  SQLite — минималистичная: не поддерживает типизацию, RIGHT JOIN, FULL JOIN, индексы на выражениях, оконные функции в ранних версиях.
  
  PostgreSQL — почти полная реализация SQL: поддержка оконных функций, CTE, JSON, RETURNING.
  
  Oracle SQL — имеет нестандартные элементы (DUAL, ROWNUM, MINUS, PL/SQL), но всё базовое поддерживается.


# 
