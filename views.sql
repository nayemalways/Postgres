-- Active: 1747742347551@@127.0.0.1@5432@my_db@public

CREATE VIEW avg_salary_employees
AS
SELECT department_name, avg(salary) FROM employees
GROUP BY department_name;


CREATE View sum_of_employees_salary AS
SELECT sum(salary) FROM employees;


SELECT * FROM avg_salary_employees;

SELECT * FROM sum_of_employees_salary;



SELECT * FROM employees;