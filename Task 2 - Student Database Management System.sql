CREATE TABLE student_table (
    Student_id INT PRIMARY KEY,
    Stu_name VARCHAR(30),
    Department VARCHAR(15),
    email_id VARCHAR(20),
    Phone_no INT,
    Address VARCHAR(50),
    Date_of_birth DATE,
    Gender VARCHAR(8),
    Major VARCHAR(20),
    GPA REAL,
    Grade CHAR(1));

INSERT INTO student_table VALUES
(1, 'Raam', 'CS', 'raam@gamail.com', 1234567890, '789 main St', '2001-02-10', 'M', 'CS', 9.1, 'A'),
(2, 'Lakshman', 'CS', 'lak@gamail.com', 1544567890, '545 main St', '2006-02-10', 'M', 'CS', 7.8, 'B'),
(3, 'Ranga', 'ME', 'ranga@gamail.com', 1334567890, '455 main St', '2000-07-18', 'M', 'ME', 8.8, 'A'),
(4, 'Anya', 'ME', 'Anya@gamail.com', 1334777890, '6464 main St', '2002-07-12', 'F', 'ME', 7.5, 'C'),
(5, 'Ramya', 'EC', 'Ramya@gamail.com', 1334754890, '6433 main St', '2004-07-14', 'F', 'EC', 6.5, 'C'),
(6, 'Rakesh', 'Civil', 'rak@gamail.com', 1339754890, '121 main St', '2000-02-10', 'M', 'CV', 8.9, 'A'),
(7, 'Sunil', 'Civil', 'sun@gamail.com', 1369754890, '18899 main St', '2000-07-10', 'M', 'CV', 7.9, 'B'),
(8, 'Remo', 'Civil', 'Remo@gamail.com', 1336664890, '11111 main St', '2000-11-10', 'M', 'CV', 3.9, 'A'),
(9, 'Lavanya', 'EC', 'lav@gamail.com', 1369754590, '12222 main St', '2003-07-10', 'F', 'EC', 9.9, 'A'),
(10, 'Sanjay', 'EC', 'sanju@gamail.com', 1344754590, '009 main St', '2001-05-22', 'M', 'EC', 9.5, 'A');


--1.Retrieve all students' information sorted by grade

SELECT * FROM student_table ORDER BY Grade DESC;

--2.Query for male students

SELECT * FROM student_table WHERE Gender = 'M';

--3.Query for students with GPA less than 5.0

SELECT * FROM student_table WHERE GPA < 5.0;

--4.Update student email and grade

UPDATE student_table SET email_id = 'sample@example.com', Grade = 'B' WHERE Student_id = 1;
SELECT * FROM student_table WHERE Student_id = 1;

--5. Query for students with grade "B"

SELECT Stu_name, DATE_PART('year', AGE(Date_of_birth)) AS Age
FROM student_table
WHERE Grade = 'B';

--6. Grouping and calculation

SELECT Department, Gender, AVG(GPA) AS avg_gpa
FROM student_table
GROUP BY Department, Gender;

--7. Rename student_table to student_info

ALTER TABLE student_table RENAME TO student_info;


--8.Retrieve student with highest GPA

SELECT Stu_name FROM student_info ORDER BY GPA DESC LIMIT 1;
