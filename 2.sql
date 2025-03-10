CREATE DATABASE IF NOT EXISTS college;

USE college; 

CREATE TABLE student(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);

INSERT INTO student VALUES(1, "Vishal", 26);
INSERT INTO student VALUES(2, "Sangita", 30);

SELECT * FROM student;

SHOW DATABASES;

SHOW TABLES;

INSERT INTO student(id, name, age)
VALUES 
(3, "Kishor", 42),
(4, "Mark", 19),
(5, "Henry", 22);

SELECT * FROM student;