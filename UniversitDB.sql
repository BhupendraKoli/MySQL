create  database univercity;
use univercity;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- Departments

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(101, 'Computer Science'),
(102, 'Mathematics'),
(103, 'Physics');

-- Students

INSERT INTO Students ( StudentID ,
    Name ,
    Age ,
    DepartmentID ) VALUES
(1, 'Ali', 20, 101),
(2, 'Sara', 21, 102),
(3, 'John', 22, 103),
(4, 'Fatima', 19, 101),
(5, 'David', 23, 102);

-- Courses

INSERT INTO Courses ( CourseID ,
    CourseName ,
    DepartmentID )VALUES
(201, 'Data Structures', 101),
(202, 'Algorithms', 101),
(203, 'Calculus', 102),
(204, 'Linear Algebra', 102),
(205, 'Quantum Mechanics', 103);

-- Enrollments

INSERT INTO Enrollments (  EnrollmentID ,
    StudentID ,
    CourseID ,
    Grade ) vALUES
(301, 1, 201, 'A'),
(302, 1, 202, 'B'),
(303, 2, 203, 'A'),
(304, 3, 205, 'B'),
(305, 4, 201, 'A'),
(306, 5, 204, 'C'),
(307, 2, 204, 'B');

# 1. Find students who are enrolled in at least one course offered by the Computer Science department.
SELECT Name 
FROM Students 
WHERE StudentID IN (
    SELECT StudentID 
    FROM Enrollments 
    WHERE CourseID IN (
        SELECT CourseID 
        FROM Courses 
        WHERE DepartmentID = (
            SELECT DepartmentID 
            FROM Departments 
            WHERE DepartmentName = 'Computer Science'
        )
    )
);

#2. List the names of students who got grade A in any course.
SELECT Name 
FROM Students 
WHERE StudentID IN (
    SELECT StudentID 
    FROM Enrollments 
    WHERE Grade = 'A'
);

#3. Find all courses that have students older than 21 enrolled.
SELECT CourseName 
FROM Courses 
WHERE CourseID IN (
    SELECT CourseID 
    FROM Enrollments 
    WHERE StudentID IN (
        SELECT StudentID 
        FROM Students 
        WHERE Age > 21
    )
);

#4. Get names of students who are not enrolled in any course.
SELECT Name 
FROM Students 
WHERE StudentID NOT IN (
    SELECT StudentID 
    FROM Enrollments
);

#5. Find departments that have no students enrolled in any of their courses.
SELECT DepartmentName 
FROM Departments 
WHERE DepartmentID NOT IN (
    SELECT DISTINCT DepartmentID 
    FROM Courses 
    WHERE CourseID IN (
        SELECT CourseID 
        FROM Enrollments
    )
);

#6. Find the student(s) with the highest age in the Mathematics department.
SELECT Name 
FROM Students 
WHERE DepartmentID = (
    SELECT DepartmentID 
    FROM Departments 
    WHERE DepartmentName = 'Mathematics'
)
AND Age = (
    SELECT MAX(Age) 
    FROM Students 
    WHERE DepartmentID = (
        SELECT DepartmentID 
        FROM Departments 
        WHERE DepartmentName = 'Mathematics'
    )
);

#7. Get the names of students who are enrolled in all the courses of their department.
SELECT Name 
FROM Students S
WHERE NOT EXISTS (
    SELECT CourseID 
    FROM Courses C
    WHERE C.DepartmentID = S.DepartmentID
    AND C.CourseID NOT IN (
        SELECT E.CourseID 
        FROM Enrollments E 
        WHERE E.StudentID = S.StudentID
    )
);


