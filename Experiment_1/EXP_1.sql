CREATE TABLE TBL_AUTHOR
(
	AUTHOR_ID INT PRIMARY KEY,
	AUTHOR_NAME VARCHAR(MAX),
	COUNTRY VARCHAR(MAX)
)

CREATE TABLE TBL_BOOKS
(	
	BOOK_ID INT PRIMARY KEY,
	BOOK_TITLE VARCHAR(MAX),
	AUTHORID INT
	FOREIGN KEY (AUTHORID) REFERENCES TBL_AUTHOR(AUTHOR_ID)
)

-- Insert data into TBL_AUTHOR
INSERT INTO TBL_AUTHOR VALUES
(1, 'J.K. Rowling', 'United Kingdom'),
(2, 'George R.R. Martin', 'United States'),
(3, 'Haruki Murakami', 'Japan'),
(4, 'Paulo Coelho', 'Brazil'),
(5, 'Chimamanda Ngozi Adichie', 'Nigeria');

-- Insert data into TBL_BOOKS
INSERT INTO TBL_BOOKS VALUES
(101, 'Harry Potter and the Sorcerer''s Stone', 1),
(102, 'A Game of Thrones', 2),
(103, 'Norwegian Wood', 3),
(104, 'The Alchemist', 4),
(105, 'Half of a Yellow Sun', 5);

SELECT B.BOOK_TITLE AS [BOOK NAME], A.AUTHOR_NAME, A.COUNTRY
FROM TBL_BOOKS AS B
INNER JOIN
TBL_AUTHOR AS A
ON
B.AUTHORID = A.AUTHOR_ID

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

-- Create Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Insert Departments
INSERT INTO Department VALUES
(1, 'Computer Science'), 
(2, 'Physics'),
(3, 'Mathematics'),
(4, 'Chemistry'),
(5, 'Biology');

-- Insert Courses
INSERT INTO Course VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Quantum Mechanics', 2),
(104, 'Electromagnetism', 2),
(105, 'Linear Algebra', 3),
(106, 'Calculus', 3),
(107, 'Organic Chemistry', 4),
(108, 'Physical Chemistry', 4),
(109, 'Genetics', 5),
(110, 'Molecular Biology', 5);

SELECT DeptName FROM Department WHERE DeptID in (
SELECT DeptID FROM COURSE GROUP BY DeptID HAVING COUNT(*) >1 )

--IN ORDER TO CREATE USER
-- 1. TO CREATE THE LOGIN - ADMIN
-- 2. TO CREATE THE USER

-- 1. TO CREATE THE LOGIN - ADMIN

CREATE LOGIN TEST_LOGIN
WITH PASSWORD = 'TESTLOGIN@123';

CREATE USER TEST_USER
FOR LOGIN TEST_LOGIN

EXECUTE AS USER = 'TEST_USER'

GRANT SELECT, UPDATE ON COURSE TO TEST_USER
