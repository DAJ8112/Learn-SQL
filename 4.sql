use college;

drop table student;

show tables;

CREATE TABLE student(
	rollno int PRIMARY KEY,
    name VARCHAR(50),
    marks int not null,
    grade varchar(1),
    city varchar(30)
);

INSERT INTO student(rollno, name, marks, grade, city)
VALUES 
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");

CREATE TABLE dept(
	id INT PRIMARY KEY,
	name VARCHAR(50)
);

INSERT INTO dept(id, name)
VALUES
(101, "English"),
(102, "IT");

CREATE TABLE teacher(
	id INT PRIMARY KEY,
	name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

DROP TABLE teacher;

INSERT INTO teacher
VALUES
(101, "Adam", 101),
(102, "Eve", 102);

SELECT * FROM teacher;
SELECT * FROM dept;

UPDATE dept
SET id=103
WHERE id=102;

select name, marks FROM student;

select DISTINCT city from student;

select * FROM student 
WHERE marks>80;

SELECT * FROM student
WHERE city = "Mumbai";

SELECT * FROM student
WHERE city = "Mumbai" AND marks>90;

SELECT * from student
WHERE city IN ("Pune", "MUMBAI", "Agra");

SELECT * from student
WHERE city NOT IN ("Mumbai", "Pune");

SELECT * FROM student
LIMIT 3;

SELECT * FROM student
ORDER BY city DESC;

SELECT * FROM student
WHERE marks > 80
ORDER BY grade ASC;


-- Get class toppers
SELECT * FROM student
ORDER BY marks DESC
LIMIT 3;


-- Aggregate functions

SELECT max(marks) FROM student;

SELECT avg(marks) FROM student;

SELECT count(rollno) FROM student;


-- understanding GROUP BY clause

SELECT DISTINCT city FROM student;

SELECT city FROM student
GROUP BY city;

SELECT city, COUNT(name) FROM student
GROUP BY city
ORDER BY count(name) DESC;

-- which city has the highest avg marks .. comparing the average scores of students for each city
SELECT city, avg(marks) FROM student
GROUP BY city
ORDER BY avg(marks) DESC;

show columns from student;

SELECT grade, count(rollno)
FROM student
GROUP BY grade
ORDER BY grade;

-- show me the no of students in the cities where max marks is greater than 90
SELECT city, COUNT(rollno)
FROM student
GROUP BY city
HAVING MAX(marks)>90;


-- update query
UPDATE student
SET grade = "O"
WHERE grade = "A";

SET SQL_SAFE_UPDATES = 0;

SELECT * FROM student;

UPDATE student
SET marks = 80, grade = "B"
WHERE rollno = 105;

SELECT * FROM student;

UPDATE student
SET marks = marks + 1;

DELETE FROM student
WHERE marks = 81;

-- alter 

-- add a new column called age
ALTER TABLE student
ADD COLUMN age int NOT NULL DEFAULT 19;

select * from student;

-- rename table name
ALTER TABLE dept
RENAME TO departments;

show tables;

-- change column
ALTER TABLE student
CHANGE COLUMN age stu_age INT;

-- MODIFY
ALTER TABLE student
MODIFY stu_age VARCHAR(2);

-- drop a column
ALTER TABlE student
DROP COLUMN stu_age;

select * from student;

-- change the name of column "name" to "full_name"
ALTER TABLE student
CHANGE COLUMN name full_name VARCHAR(50);

select * from student;

-- delete all the students who scored marks less than 80
DELETE FROM student
WHERE marks<=80;

SET SQL_SAFE_UPDATES = 0;

SELECT * FROM student;

-- delete the column for grades
ALTER TABLE student
DROP COLUMN grade;

select * from student;