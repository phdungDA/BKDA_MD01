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
