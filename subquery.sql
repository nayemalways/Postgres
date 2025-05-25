CREATE DATABASE my_db

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
)

INSERT INTO employees (employee_name, department_name, salary, hire_date)
VALUES
    ('John Doe', 'IT', 60000, '2020-01-15'),
    ('Jane Smith', 'HR', 55000, '2019-05-20'),
    ('Michael Johnson', 'Finance', 65000, '2021-03-10'),
    ('Emily Brown', 'Marketing', 58000, '2018-11-25'),
    ('David Lee', 'IT', 62000, '2020-07-08'),
    ('Sarah Clark', 'Finance', 68000, '2017-09-14'),
    ('Kevin Adams', 'HR', 54000, '2019-02-18'),
    ('Jessica Hall', 'Marketing', 59000, '2020-04-30'),
    ('Ryan Taylor', 'IT', 63000, '2018-06-22'),
    ('Megan Martinez', 'HR', 56000, '2021-01-05'),
    ('Christopher Garcia', 'Finance', 67000, '2019-11-12'),
    ('Amanda Rodriguez', 'Marketing', 60000, '2020-09-03'),
    ('James Wilson', 'IT', 64000, '2017-04-17'),
    ('Stephanie Lopez', 'HR', 57000, '2018-08-14'),
    ('Daniel Hernandez', 'Finance', 69000, '2021-06-28'),
    ('Olivia King', 'Marketing', 61000, '2019-03-25'),
    ('William Moore', 'IT', 65000, '2020-11-09'),
    ('Rachel Young', 'HR', 58000, '2018-01-30'),
    ('Andrew Scott', 'Finance', 70000, '2017-07-22'),
    ('Lauren Green', 'Marketing', 62000, '2021-02-14');



--# Retrive all employees whose salary is greater than the highest salary of the HR department
SELECT * FROM employees 
    WHERE salary > (SELECT max(salary) FROM employees WHERE department_name = 'IT');
 
-- Usecase of subquery
SELECT *, (SELECT sum(salary) FROM employees) FROM employees; --with SELECT

-- FROM
SELECT department_name, sum(salary) FROM employees
    GROUP BY department_name;

SELECT *  FROM 
    (SELECT department_name, sum(salary) FROM employees GROUP BY department_name);


-- WHERE claues

-- Retrive employee_name, department_name, salary from employees table where departmnet_name has 'R' keyword (case-insensitive)
 SELECT employee_name, department_name, salary 
 FROM employees 
 WHERE 
 department_name IN (SELECT department_name FROM employees WHERE department_name ILIKE '%R%');

 SELECT  employee_name, department_name, salary FROM employees
 WHERE department_name ILIKE '%R%'


-- 1. Find the employees who earn the highest salary.
SELECT employee_name FROM employees
    WHERE salary = (SELECT max(salary) FROM employees);


--2. Show the employees who were hired on the most recent hire date.

 
SELECT employee_name FROM employees
 WHERE hire_date = (SELECT hire_date FROM employees ORDER BY hire_date DESC LIMIT 1);

--3. Get the employee(s) with the lowest salary.
SELECT * FROM employees
    WHERE salary < (SELECT max(salary) FROM employees)
        ORDER BY salary;
--or (because I didn't understand the rewult will be singel row or multiple that's why I did it twice below and above)
SELECT * FROM employees
    WHERE salary = (SELECT min(salary) FROM employees);
         

--4. List all employees who work in departments that have at least one employee earning more than 6000.
SELECT * FROM employees
    WHERE department_name IN (SELECT department_name FROM employees WHERE salary > 70000);

--5. Find employees whose department has the word 'Sales' and whose salary is in the top 10% of the company.
 SELECT PERCENTILE_CONT(0.9) WITHIN GROUP (ORDER BY salary) FROM employees;
 
SELECT COUNT(*) FROM employees WHERE salary >= 68100;




SELECT * FROM employees
WHERE employee_name = 'Alice';

