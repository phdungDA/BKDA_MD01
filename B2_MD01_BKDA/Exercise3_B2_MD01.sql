CREATE DATABASE COMPANY
Use COMPANY

CREATE table CUSTOMERS(
    ID int,
    Name NVARCHAR(50) NOT NULL,
    Age SMALLINT,
    Address NVARCHAR(MAX),
    Salary DECIMAL(18,0)
    Constraint pk_ID PRIMARY KEY(ID)
)

Insert INTO CUSTOMERS(ID, Name, Age, Address, Salary) VALUES (1, 'Ha Anh', 32, 'Da Nang', 2000),
                                                             (2, 'Van Ha', 25, 'Ha Noi', 1500),
                                                             (3, 'Vu Bang', 23, 'Vinh', 2000),
                                                             (4, 'Thu Minh', 25,'Ha Noi', 6500)

--Test input data
SELECT * FROM CUSTOMERS
