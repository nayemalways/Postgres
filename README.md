# SQL Homework – JOINs, Constraints & Query Practice

## 📅 Date
May 25, 2025

## 📚 Overview
This project showcases my hands-on SQL practice involving table creation, data insertion, and multiple types of joins and constraints. The goal was to strengthen my understanding of database relationships and advanced SQL queries.

---

## ✅ What I Did Today

### 🔧 Table Creation
- `departments`: Stores department names.
- `students`: Stores student info along with `department_id` as a foreign key.
- `courses`: Stores a list of available course titles.

### 📥 Data Insertion
- Inserted sample data into all three tables (`departments`, `students`, `courses`).

### 🔑 Constraints
- Created a foreign key constraint on `students.department_id` referencing `departments.id`.
- Practiced:
  - `ON DELETE CASCADE`: Automatically deletes students when the department is deleted.
  - `ON DELETE SET NULL`: Sets student’s `department_id` to NULL when the department is deleted.

### 📊 SQL Queries Practiced
1. **Filtering recent activity**  
   → Students who logged in within the last 30 days.
2. **Grouping by login month**  
   → Used `EXTRACT(MONTH FROM last_login)` and `GROUP BY`.
3. **Aggregate filtering**  
   → Counted students per month with logins.
4. **INNER JOIN**  
   → Fetched student names with department names.
5. **LEFT JOIN**  
   → Showed all students, even those with no department.
6. **RIGHT JOIN**  
   → Showed all departments, even those with no students.
7. **FULL JOIN**  
   → Combined all records from both students and departments.
8. **CROSS JOIN**  
   → Created a Cartesian product of students and courses.
9. **NATURAL JOIN**  
   → Performed a natural join using a common column (`department_id`).

---

## 🧠 Topics Covered
- Table creation
- Foreign key constraints
- JOINs:
  - INNER JOIN
  - LEFT JOIN
  - RIGHT JOIN
  - FULL JOIN
  - NATURAL JOIN
  - CROSS JOIN
- Data filtering with `BETWEEN`, `EXTRACT`, and `GROUP BY`
- Aggregate functions (`COUNT`)
- Column renaming using `ALTER TABLE`
- Practice subqueries- how subquery works, how retrive data combining two condigion by subquery.

---

## 📝 Notes
- Learned why `NATURAL JOIN` may return no results if multiple columns don’t match by name **and** values.
- Practiced modifying column names to align for natural joins.

---

## 🚀 Next Steps
- Practice subqueries
- Learn and apply window functions
- Explore indexing and performance optimization
- Create ER diagrams to visualize relationships

---

## 🙋‍♂️ Author
**Nayem** – Junior Full-Stack MERN Developer and passionate learner of SQL
