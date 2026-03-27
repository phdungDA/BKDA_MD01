--Exercise 1: Lấy ra tên miền email của từng nhân viên phòng marketing trong bảng DimEmployee

SELECT 
    SUBSTRING(EmailAddress, CHARINDEX('@', EmailAddress) + 1, LEN(EmailAddress)) AS EmailDomain,
    *
FROM DimEmployee
WHERE DepartmentName = 'Marketing'

--Exercise 2: Thay thế tên miền email của từng nhân viên phòng production thành production.com trong bảng DimEmployee 

UPDATE DimEmployee
SET EmailAddress = LEFT(EmailAddress, CHARINDEX('@', EmailAddress)) + 'production.com'
WHERE DepartmentName = 'Production'

select EmailAddress FROM DimEmployee
WHERE DepartmentName = 'Production'

/*Exercise 3: Thêm một cột trong bảng Product theo logic: 
  Nếu có Color thì lấy phần trước dấu – của ProductAlternateKey 
  Nếu không có Color thì lấy phần sau dấu – của ProductAlternateKey*/
