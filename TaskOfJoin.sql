-- Case Study: University Database

-- Table 1: Students

-- | StudentID | Name   | DepartmentID | Age |
-- | --------- | ------ | ------------ | --- |
-- | 1         | Ali    | 101          | 20  |
-- | 2         | Sara   | 102          | 21  |
-- | 3         | John   | 103          | 22  |
-- | 4         | Fatima | 101          | 19  |
-- | 5         | David  | 104          | 23  |

-- Table 2: Departments

-- | DepartmentID | DepartmentName   |
-- | ------------ | ---------------- |
-- | 101          | Computer Science |
-- | 102          | Business         |
-- | 103          | Mathematics      |
-- | 105          | Physics          |

use joint;
-- Create Students table
 CREATE TABLE Students (
     StudentID INT PRIMARY KEY,
     Name VARCHAR(50),
     DepartmentID INT,
     Age INT
 );

-- -- Insert data into Students table
 INSERT INTO Students (StudentID, Name, DepartmentID, Age) VALUES
 (1, 'Ali', 101, 20),
 (2, 'Sara', 102, 21),
 (3, 'John', 103, 22),
 (4, 'Fatima', 101, 19),
 (5, 'David', 104, 23);


-- -- Create Departments table
 CREATE TABLE Departments (
     DepartmentID INT PRIMARY KEY,
     DepartmentName VARCHAR(100)
 );

-- -- Insert data into Departments table
 INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
 (101, 'Computer Science'),
 (102, 'Business'),
 (103, 'Mathematics'),
 (105, 'Physics');


select * from Departments ;


-- ---
-- Tasks on Different Joins

-- 1. INNER JOIN
--    Show student names along with their department names.

select * from Departments inner join Students;

SELECT s.Name, d.DepartmentName
FROM Students s INNER JOIN Departments d
ON s.DepartmentID = d.DepartmentID;

-- 2. LEFT JOIN
--    List all students and their departments, even if the department does not exist in the Departments table.
SELECT s.Name, d.DepartmentName
FROM Students s
LEFT JOIN Departments d
    ON s.DepartmentID = d.DepartmentID;

-- 3. RIGHT JOIN
--    Show all departments and the students enrolled in them (including departments without students).
SELECT s.Name, d.DepartmentName
FROM Students s
right join Departments d
    ON s.DepartmentID = d.DepartmentID;

-- 4. FULL OUTER JOIN
--    Display all students and all departments, even if they don’t match.
SELECT s.Name, d.DepartmentName
FROM Students s
LEFT JOIN Departments d
    ON s.DepartmentID = d.DepartmentID
UNION
SELECT s.Name, d.DepartmentName
FROM Students s
RIGHT JOIN Departments d
    ON s.DepartmentID = d.DepartmentID;


-- 5. CROSS JOIN
--    Show every possible pair of students and departments. (Hint: This will multiply the rows).
SELECT s.Name, d.DepartmentName
FROM Students s
CROSS JOIN Departments d;

-- 6. SELF JOIN
--    Find pairs of students who belong to the same department (exclude matching with themselves).
SELECT s1.Name AS Student1, s2.Name AS Student2, s1.DepartmentID
FROM Students s1
INNER JOIN Students s2
    ON s1.DepartmentID = s2.DepartmentID
   AND s1.StudentID < s2.StudentID;

-- 7. NATURAL JOIN
--    Join the Students and Departments tables automatically on the common column (DepartmentID) and display Name with DepartmentName.
SELECT Name, DepartmentName
FROM Students
NATURAL JOIN Departments;

-- 8. LEFT JOIN with condition
--    Find students whose department is not listed in the Departments table.
SELECT s.Name, s.DepartmentID
FROM Students s
LEFT JOIN Departments d
    ON s.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;










