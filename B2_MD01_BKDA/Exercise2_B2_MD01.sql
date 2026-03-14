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
