--Exercise 1: Viết truy vấn để trả về bảng kết quả bao gồm các cột sau từ bảng DimAccount: AccountKey, AccountDescription, AccountType. 

select AccountKey, AccountDescription, AccountType
from DimAccount

/*Exercise 2: Viết truy vấn trả về bảng kết quả bao gồm các cột sau từ bảng DimCustomer: CustomerKey, FirstName, MiddleName, LastName, BirthDate, MaritalStatus, Gender, EmailAddress. 
(Nâng cao) Thêm một cột FullName, là kết hợp của các cột First Name, Middle Name và Last Name.*/

SELECT CustomerKey, FirstName, MiddleName, LastName,
        BirthDate, MaritalStatus, Gender, EmailAddress
from DimCustomer

--Exercise 3: Truy vấn bảng FactInternetSales trả về các cột OrderDate, ProductKey, CustomerKey, SalesAmount, OrderQuantity, UnitPrice. Sắp xếp cột OrderDate theo thứ tự tăng dần 

SELECT OrderDate, ProductKey, CustomerKey, SalesAmount, OrderQuantity, UnitPrice
from FactInternetSales
ORDER BY OrderDate

/* Exercise 4: Truy vấn bảng FactResellerSales trả về các cột OrderDate, ProductKey, CustomerPOnumber, SalesAmount, OrderQuantity, UnitPrice.
Sắp xếp cột OrderDate theo thứ tự tăng dần và cột ProductKey theo thứ tự tăng dần và SalesAmount theo thứ tự giảm dần. */

SELECT OrderDate, ProductKey, CustomerPONumber,
        SalesAmount, OrderQuantity, UnitPrice
from FactResellerSales
ORDER by OrderDate ASC, ProductKey ASC, SalesAmount DESC
