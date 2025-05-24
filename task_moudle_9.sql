 
-- TASK LINK: https://docs.google.com/document/d/1VOqXm0SM95hiY80o7c6mkHxOJoO1_wmKX7Iuf5jZ8BY/edit?tab=t.0


 CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL
 );

 INSERT INTO departments(name) 
    VALUES('CSE'),
    ('EEE'),
    ('BSC'),
    ('ZOOLOGY'),
    ('BOTANY'),
    ('ECONOMICS'),
    ('HISTORY')


 CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT ,
    last_login DATE
 );

 

 INSERT INTO students(name, department_id, last_login)
    VALUES('Nayem', 2, '2025-04-02'),
            ('Rana', 5, '2025-01-05'),
            ('Mahin', 7, '2025-01-12'),
            ('Parvej', 3, '2024-06-22'),
            ('Fahim', 4, '2023-02-14'),
            ('Siam', 6, '2025-09-30'),
            ('Hasnain', 2, '2025-04-02'),
            ('Sohag', 1, '2025-05-23'),
            ('Tanjil', 4, '2025-01-20'),
            ('Momin', 7, '2025-11-02')

 
 CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    title VARCHAR(250) NOT NULL
 );

 INSERT INTO courses (title) VALUES 
('Introduction to Computer Science'),
('Advanced Mathematics'),
('Database Systems'),
('Web Development'),
('Machine Learning'),
('Digital Marketing'),
('Data Structures and Algorithms'),
('Cloud Computing'),
('Cybersecurity Fundamentals'),
('Mobile App Development');



--1. Retrieve students who have logged in within the last 30 days.
SELECT * FROM students
 WHERE last_login BETWEEN (CURRENT_DATE - INTERVAL '1 Month') AND CURRENT_DATE;


--2. Extract the login month from the last_login and group students by month.
SELECT  extract(month from last_login) as login_month, name FROM students
    GROUP BY login_month, name;


--3. Count how many students logged in per month and show only those months where login count is more than 3.
SELECT extract(month from last_login) as login_month, count(name) as total_login FROM students
GROUP BY login_month
HAVING count(name) > name; -- It's might not works right now because we changed the name of students table by student_name below (নিচে).


--4. Create a foreign key constraint on department_id in the students table referencing departments(id).
ALTER Table students
   ADD Foreign Key (department_id) REFERENCES departments(id)

--5. Try inserting a student with a department_id that doesn’t exist and observe the behavior.
INSERT INTO students(name, department_id, last_login) VALUES('Rohibul', 9, '2025-03-27');
--(The behaviour observed that the value of department id 9 is not in the department table, thats why he can't connect together with foreign key. That's why the error says, it's borke the foreign key constraint rules)


--6. Delete a department and see how students are affected using ON DELETE CASCADE and ON DELETE SET NULL.

 ALTER Table students
   ADD Foreign Key (department_id) REFERENCES departments(id) ON DELETE CASCADE;

DELETE FROM departments
    WHERE name = 'BOTANY'; -- IT DELETED DEPARTMENT NAME WITH HIS REFERENCIAL FOREIGN KEY FIELD BY MATCHING department_id
 
SELECT CONSTRAINT_NAME FROM information_schema.key_column_usage
WHERE TABLE_NAME = 'students' and column_name = 'department_id';


ALTER TABLE students
    DROP constraint students_department_id_fkey;

ALTER TABLE students
     ADD Foreign Key (department_id) REFERENCES departments(id) ON DELETE SET NULL;


DELETE FROM departments
    WHERE name = 'BSC'; -- It set's null when delete department



--7. Join students and departments using INNER JOIN to display each student's department name.
SELECT  students.name, departments.name FROM students
    JOIN departments ON departments.id = students.department_id;
         


--8. Use a LEFT JOIN to show all students including those without a department.
SELECT * FROM students as s
 LEFT JOIN departments as d ON s.department_id = d.id;


--9. Use a RIGHT JOIN to show all departments including those without students.
SELECT * FROM students s
    RIGHT JOIN departments as d ON s.department_id = d.id


--10.Perform a FULL JOIN to get all records from both students and departments.
SELECT * FROM students s
FULL JOIN departments d ON s.department_id = d.id ;


--11. Create a cross-product of all students and courses using CROSS JOIN.
SELECT * FROM students
CROSS JOIN courses;


--12. Use NATURAL JOIN between tables that have a shared column like department_id.
ALTER TABLE departments
    RENAME COLUMN id to department_id;

ALTER Table students
    RENAME COLUMN name to student_name

SELECT * FROM students
    NATURAL JOIN departments;

 



