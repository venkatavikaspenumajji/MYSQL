CREATE DATABASE normalization_demo;
USE normalization_demo;

CREATE TABLE student_data_unnormalized (
    StudentID INT,
    StudentName VARCHAR(50),
    Course1 VARCHAR(30),
    Course2 VARCHAR(30),
    Course3 VARCHAR(30),
    Department VARCHAR(20),
    Advisor VARCHAR(30)
);

INSERT INTO student_data_unnormalized VALUES
(101, 'Rahul Sharma', 'DBMS', 'OS', 'Java', 'CSE', 'Dr. Meena'),
(102, 'Priya Verma', 'DBMS', NULL, NULL, 'CSE', 'Dr. Meena'),
(103, 'Arjun Reddy', 'OS', 'Java', 'Python', 'IT', 'Dr. Raj'),
(104, 'Nisha Patel', 'DBMS', 'Java', NULL, 'CSE', 'Dr. Meena'),
(105, 'Suresh Kumar', 'Python', NULL, NULL, 'IT', 'Dr. Raj'),
(106, 'Divya Singh', 'DBMS', 'OS', 'Java', 'CSE', 'Dr. Meena'),
(107, 'Ankit Rao', 'Java', 'Python', 'DBMS', 'IT', 'Dr. Raj'),
(108, 'Meena Iyer', 'OS', NULL, NULL, 'CSE', 'Dr. Meena');

-- View Unnormalized Data
SELECT * FROM student_data_unnormalized;


-- Convert to 1NF (Split multi-valued columns into separate rows)


CREATE TABLE student_data_1NF (
    StudentID INT,
    StudentName VARCHAR(50),
    Course VARCHAR(30),
    Department VARCHAR(20),
    Advisor VARCHAR(30)
);

INSERT INTO student_data_1NF (StudentID, StudentName, Course, Department, Advisor)
VALUES
(101, 'Rahul Sharma', 'DBMS', 'CSE', 'Dr. Meena'),
(101, 'Rahul Sharma', 'OS', 'CSE', 'Dr. Meena'),
(101, 'Rahul Sharma', 'Java', 'CSE', 'Dr. Meena'),
(102, 'Priya Verma', 'DBMS', 'CSE', 'Dr. Meena'),
(103, 'Arjun Reddy', 'OS', 'IT', 'Dr. Raj'),
(103, 'Arjun Reddy', 'Java', 'IT', 'Dr. Raj'),
(103, 'Arjun Reddy', 'Python', 'IT', 'Dr. Raj'),
(104, 'Nisha Patel', 'DBMS', 'CSE', 'Dr. Meena'),
(104, 'Nisha Patel', 'Java', 'CSE', 'Dr. Meena'),
(105, 'Suresh Kumar', 'Python', 'IT', 'Dr. Raj'),
(106, 'Divya Singh', 'DBMS', 'CSE', 'Dr. Meena'),
(106, 'Divya Singh', 'OS', 'CSE', 'Dr. Meena'),
(106, 'Divya Singh', 'Java', 'CSE', 'Dr. Meena'),
(107, 'Ankit Rao', 'Java', 'IT', 'Dr. Raj'),
(107, 'Ankit Rao', 'Python', 'IT', 'Dr. Raj'),
(107, 'Ankit Rao', 'DBMS', 'IT', 'Dr. Raj'),
(108, 'Meena Iyer', 'OS', 'CSE', 'Dr. Meena');

SELECT * FROM student_data_1NF;

---------------------------------------------------------------------------------
-- Convert to 2NF (Remove partial dependency)
-- Split into STUDENT table and ENROLLMENT table
---------------------------------------------------------------------------------

CREATE TABLE student_data_2NF_students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Department VARCHAR(20),
    Advisor VARCHAR(30)
);

INSERT INTO student_data_2NF_students
SELECT DISTINCT StudentID, StudentName, Department, Advisor
FROM student_data_1NF;

CREATE TABLE student_data_2NF_enrollment (
    StudentID INT,
    Course VARCHAR(30),
    FOREIGN KEY (StudentID) REFERENCES student_data_2NF_students(StudentID)
);

INSERT INTO student_data_2NF_enrollment (StudentID, Course)
SELECT StudentID, Course FROM student_data_1NF;

-- View Both Tables
SELECT * FROM student_data_2NF_students;
SELECT * FROM student_data_2NF_enrollment;

---------------------------------------------------------------------------------
-- Convert to 3NF (Remove transitive dependency)
-- Department and Advisor relationship stored separately
---------------------------------------------------------------------------------

CREATE TABLE department_3NF (
    Department VARCHAR(20) PRIMARY KEY,
    Advisor VARCHAR(30)
);

INSERT INTO department_3NF VALUES
('CSE', 'Dr. Meena'),
('IT', 'Dr. Raj');

CREATE TABLE students_3NF (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Department VARCHAR(20),
    FOREIGN KEY (Department) REFERENCES department_3NF(Department)
);

INSERT INTO students_3NF
SELECT DISTINCT StudentID, StudentName, Department FROM student_data_2NF_students;

CREATE TABLE enrollment_3NF (
    StudentID INT,
    Course VARCHAR(30),
    FOREIGN KEY (StudentID) REFERENCES students_3NF(StudentID)
);

INSERT INTO enrollment_3NF
SELECT * FROM student_data_2NF_enrollment;