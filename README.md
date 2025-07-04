# mysql-procedure-task9

# School SQL Database with Procedures and Functions

This project demonstrates a simple relational database for managing student enrollments, along with stored procedures and functions in MySQL.

## Database Overview

**Database:** `School`

This database includes three tables: Students, Courses, Enrollments.

## What Are Stored Procedures and Functions?
-
**Procedure:**
A saved set of SQL statements that you can execute by calling it by name. Procedures can accept parameters, perform queries, and return results. They are commonly used for encapsulating reusable logic or operations.
`GetStudentCourses` : Retrieve all courses and grades for a specific student.
-
**Function:**
A stored program that returns a single value. Functions are often used in `SELECT` statements to compute or transform data.
`GradeStatus` : Return a descriptive status label based on a numeric grade.
