--Exercise 1: Từ bảng Dim product, hãy trả về bảng kết quả có các cột ProductKey, EnglishProductName, ListPrice, StandardCost. 
--Lọc ra các sản phẩm có chữ d ở kí tự thứ 4 và đồng thời cũng có chữ t ở kí tự thứ 7 

SELECT 
ProductKey,
EnglishProductName,
ListPrice,
StandardCost
from DimProduct
WHERE EnglishProductName LIKE '___d__t%'

--Exercise 2: Danh sách các sản phẩm áo dài tay để bán cho mùa lạnh, biết mã thay thế các sản phẩm này (ProductAlternateKey) bắt đầu bằng chữ LJ trong bảng DimProduct 
  
SELECT 
*
from DimProduct
WHERE ProductAlternateKey LIKE 'LJ%'
and EnglishProductName LIKE 'Long-Sleeve%'

--Exercise 3: Sử dụng LIKE tìm các sản phẩm có ProductAlternateKey có kí tự đầu là chữ F, kí tự thứ 7 là chữ S và kí tự cuối cùng là số 6 trong bảng DimProduct 
  
SELECT *
from DimProduct
WHERE ProductAlternateKey LIKE 'F_____S%6'

--Exercise 4: Trong DimProduct, tìm sản phẩm có EnglishProductName bắt đầu bằng "Mountain" và có chứa "Bike". 
  
SELECT *
from DimProduct
WHERE EnglishProductName LIKE 'Mountain%Bike%'

--Exercise 5: Trong bảng DimCustomer, tìm danh sách khách hàng có EmailAddress bắt đầu bằng chữ s, ký tự thứ hai không phải là a hoặc e. 
  
SELECT * 
from DimCustomer
WHERE EmailAddress LIKE 's[^ae]%'

--Exercise 6: Trong bảng DimCustomer, tìm tất cả khách hàng có EmailAddress bắt đầu bằng chữ "a", ký tự thứ hai không phải là "b" hoặc "c", và tiếp theo có ít nhất một ký tự bất kỳ.

