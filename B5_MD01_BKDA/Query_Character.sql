--Exercise 1: Lấy ra tên miền email của từng nhân viên phòng marketing trong bảng DimEmployee

SELECT 
    SUBSTRING(EmailAddress, CHARINDEX('@', EmailAddress) + 1, LEN(EmailAddress)) AS EmailDomain,
    *
FROM DimEmployee
WHERE DepartmentName = 'Marketing'

--Exercise 2: Thay thế tên miền email của từng nhân viên phòng production thành production.com trong bảng DimEmployee 

select EmailAddress,
REPLACE(EmailAddress, 'adventure-work.com', 'production.com')
FROM DimEmployee
WHERE DepartmentName = 'Production'

/*Exercise 3: Thêm một cột trong bảng Product theo logic: 
  Nếu có Color thì lấy phần trước dấu – của ProductAlternateKey 
  Nếu không có Color thì lấy phần sau dấu – của ProductAlternateKey*/

SELECT ProductKey, ProductAlternateKey, color,
case
    when Color is null or Color != 'NA'
    then LEFT(ProductAlternateKey, CHARINDEX('-', ProductAlternateKey) - 1)
else SUBSTRING(ProductAlternateKey, CHARINDEX('-', ProductAlternateKey) + 1, LEN(ProductAlternateKey))
END AS DerivedColumn
from DimProduct

--
