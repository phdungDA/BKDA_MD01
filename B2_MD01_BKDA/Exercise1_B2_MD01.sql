CREATE DATABASE university
USE university

CREATE TABLE dbo.Student (
    Student_ID int,
    StudentName NVARCHAR(50) NOT NULL,
    StudentBirth DATE,
    IsMale BIT,
    CONSTRAINT pkStudent PRIMARY KEY(Student_ID)
)

CREATE TABLE dbo.Professor(
    Employee_ID int,
    ProfessorName NVARCHAR(50) NOT NULL,
    CONSTRAINT pkProfessor PRIMARY KEY(Employee_ID)
)

CREATE TABLE dbo.Course(
    Course_ID int,
    CourseName NVARCHAR(50) NOT NULL,
    Professor_ID INT NOT NULL,
    PRIMARY KEY (Course_ID),
    Constraint fkProfessor FOREIGN KEY (Professor_ID) REFERENCES dbo.Professor(Employee_ID)
)

CREATE TABLE dbo.Assigned(
    Student_ID INT NOT NULL,
    Course_ID INT NOT NULL,
    Note NVARCHAR(MAX),
    PRIMARY KEY (Student_ID, Course_ID),
    CONSTRAINT fkStudent FOREIGN KEY (Student_ID) REFERENCES dbo.Student(Student_ID),
    CONSTRAINT fkCourse FOREIGN KEY (Course_ID) REFERENCES dbo.Course(Course_ID)
)

--Drop table dbo.Student
--DROP TABLE dbo.Professor
--Drop table dbo.Course
--Drop table dbo.Assigned

INSERT INTO dbo.Student(Student_ID, StudentName, StudentBirth, IsMale) VALUES (1, 'A', '2000-10-01', null),
                                                                              (2, 'B', '2000-12-01', NULL),
                                                                              (3, 'C', '2000-10-10', 0),
                                                                              (4, 'D', '2000-08-20', 1),
                                                                              (5, 'E', '2000-05-15', NULL),
                                                                              (6, 'F', '2000-05-12', NULL);
INSERT INTO dbo.Professor(Employee_ID, ProfessorName) VALUES (1, 'A'),
                                                             (2, 'B'),
                                                             (3, 'C'),
                                                             (4, 'D');
INSERT INTO dbo.Course(Course_ID, CourseName, Professor_ID) VALUES (1, 'thuật toán', 1),
                                                                   (2, 'toán', 2),
                                                                   (3, 'vật lý', 4);
INSERT Into dbo.Assigned(Student_ID, Course_ID, Note) VALUES (1, 1, null),
                                                             (1,2, 'Test'),
                                                             (2,1, null),
                                                             (2,3, null);

--Test input data
SELECT * FROM dbo.Student
SELECT * FROM dbo.Professor
SELECT * FROM dbo.Course
SELECT * FROM dbo.Assigned
