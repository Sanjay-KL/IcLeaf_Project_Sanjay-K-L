
--1) Tables Creation
--1) Creating Student Info Table
 CREATE TABLE StudentInfo (
    STU_ID INT PRIMARY KEY,
    STU_NAME VARCHAR(100),
    DOB DATE,
    PHONE_NO VARCHAR(15),
    EMAIL_ID VARCHAR(100),
    ADDRESS VARCHAR(100)
);

--2) Creating Course info Table

CREATE TABLE CoursesInfo (
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(100),
    COURSE_INSTRUCTOR_NAME VARCHAR(100)
);

--3) Creating Enrollment Info Table

CREATE TABLE EnrollmentInfo (
    ENROLLMENT_ID INT PRIMARY KEY,
    STU_ID INT,
    COURSE_ID INT,
    ENROLL_STATUS VARCHAR(20),
    FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);


-- Inserting Data into Student Table
INSERT INTO StudentInfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS) VALUES
(1, 'Sanjay', '2000-01-11', '1234567890', 'sanj@gmail.com', '123 Main St'),
(2, 'Ram', '1999-05-25', '0987654321', 'ram@yahoo.com', '444 main St'),
(3, 'Arjun', '2020-02-02', '2323232323', 'arj@sample.com', '222 san st');

--2) Inserting Data into Tables
-- Insertint Data into Courseinfo Table
INSERT INTO CoursesInfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME) VALUES
(1, 'Science', 'Rajeev'),
(2, 'Political Science', 'Prof. Ramesh');


-- Inserting Data into Enrollment info Table
INSERT INTO EnrollmentInfo (ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLL_STATUS) VALUES
(1, 1, 1, 'Enrolled'),
(2, 2, 1, 'Enrolled'),
(3, 2, 2, 'Enrolled'),
(4, 3, 2, 'Enrolled');


--OUTPUT Queries
--3) Retreiving Students Info

--1) To Retrieve Student Details
SELECT STU_NAME, PHONE_NO, EMAIL_ID, ENROLL_STATUS
FROM StudentInfo
JOIN EnrollmentInfo ON StudentInfo.STU_ID = EnrollmentInfo.STU_ID;


--2) To Retrieve List of Courses for a specific student
SELECT COURSE_NAME
FROM CoursesInfo
JOIN EnrollmentInfo ON CoursesInfo.COURSE_ID = EnrollmentInfo.COURSE_ID
WHERE ENROLLMENT_ID IN (
    SELECT ENROLLMENT_ID
    FROM EnrollmentInfo
    WHERE STU_ID = 2
);


--3) To retrieve course info with Instructor
SELECT COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo;


--4) To Retrieve course info for specific course
SELECT * FROM CoursesInfo WHERE COURSE_ID = 1;


--5) Retrieving Course info for multiple courses
SELECT * FROM CoursesInfo WHERE COURSE_ID IN (1, 2);



---4) Reporting and Analytics using Joins

--1) Number of Students Enrolled in each course

SELECT COURSE_NAME, COUNT(STU_ID) AS student_count
FROM CoursesInfo
JOIN EnrollmentInfo ON CoursesInfo.COURSE_ID = EnrollmentInfo.COURSE_ID
GROUP BY COURSE_NAME;


--2) List of Students enrolled in specific course

SELECT STU_NAME
FROM StudentInfo
JOIN EnrollmentInfo ON StudentInfo.STU_ID = EnrollmentInfo.STU_ID
WHERE COURSE_ID = 1;


--3) Count of students enrolled for each instructor

SELECT COURSE_INSTRUCTOR_NAME, COUNT(STU_ID) AS student_count
FROM CoursesInfo
JOIN EnrollmentInfo ON CoursesInfo.COURSE_ID = EnrollmentInfo.COURSE_ID
GROUP BY COURSE_INSTRUCTOR_NAME;


--4) List of students enrolled in multiple courses

SELECT STU_NAME
FROM StudentInfo
JOIN EnrollmentInfo ON StudentInfo.STU_ID = EnrollmentInfo.STU_ID
GROUP BY STU_NAME
HAVING COUNT(COURSE_ID) > 1;


--5) Courses with the highest number of enrolled students
SELECT COURSE_NAME, COUNT(STU_ID) AS student_count
FROM CoursesInfo
JOIN EnrollmentInfo ON CoursesInfo.COURSE_ID = EnrollmentInfo.COURSE_ID
GROUP BY COURSE_NAME
ORDER BY student_count DESC;




