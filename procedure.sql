CREATE DATABASE School;
USE School;

CREATE TABLE Students(StudentID INT PRIMARY KEY AUTO_INCREMENT, FullName VARCHAR(100), Age INT);
CREATE TABLE Courses(CourseID INT PRIMARY KEY AUTO_INCREMENT, CourseName VARCHAR(100), Credits INT);
CREATE TABLE Enrollments(EnrollmentID INT PRIMARY KEY AUTO_INCREMENT, StudentID INT, CourseID INT, Grade DECIMAL(3,1), FOREIGN KEY (StudentID) REFERENCES Students(StudentID), FOREIGN KEY (CourseID) REFERENCES Courses(CourseID));

INSERT INTO Students(FullName, Age) VALUES
('Alice', 20),
('Bob', 22),
('Clara', 21);
INSERT INTO Courses(CourseName, Credits) VALUES
('Mathematics', 4),
('History', 3),
('Biology', 4);
INSERT INTO Enrollments(StudentID, CourseID, Grade) VALUES
(1, 1, 85.0),
(1, 2, 90.5),
(2, 1, 70.0),
(3, 3, 88.0);

DELIMITER //
CREATE PROCEDURE GetStudentCourses(IN studId INT)
BEGIN
SELECT E.EnrollmentID, C.CourseName, E.Grade
FROM Enrollments E
JOIN Courses C ON E.CourseID = C.CourseID
WHERE E.StudentID = studId;
END;
//
DELIMITER ;

DELIMITER //
CREATE FUNCTION GradeStatus(grade DECIMAL(3,1)) RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
DECLARE status VARCHAR(20);
IF grade >= 85 THEN
  SET status = 'Excellent';
ELSEIF grade >= 70 THEN
  SET status = 'Good';
ELSE
  SET status = 'Needs Improvement';
END IF;
RETURN status;
END;
//
DELIMITER ;

CALL GetStudentCourses(1);
SELECT GradeStatus(90);
