--Exercise 1: Truy vấn tất cả các nhân viên đã nghỉ việc trong bảng DimEmployee 

SELECT * FROM DimEmployee
WHERE [Status] is null

--Exercise 2: Truy vấn tất cả các nhân viên không có MiddleName và được tuyển vào trong năm 2008 trong bảng DimEmployee 

SELECT * 
FROM DimEmployee
WHERE YEAR(HireDate) = '2008'
and MiddleName IS NULL

--Exercise 3: Liệt kê các sản phẩm (ProductKey, EnglishProductName) trong DimProduct không có Size, và ListPrice cao hơn giá trung bình của tất cả sản phẩm có Color giống nhau
--1. Using subquery
SELECT 
ProductKey,
EnglishProductName
FROM DimProduct as d1
WHERE [Size] is NULL
and ListPrice > (
    SELECT AVG(ListPrice) 
    FROM DimProduct as d2
    WHERE d1.Color = d2. Color OR (d1.Color is null and d2.Color is null)
)

--2. Using Window Function
SELECT 
ProductKey,
EnglishProductName
from (
    select 
    ProductKey,
    EnglishProductName,
    Size,
    ListPrice,
    AVG(ListPrice) OVER (partition by Color) as Avg_Price_Color
    from DimProduct
) AS DimProduct2
WHERE [Size] IS NULL 
and ListPrice > Avg_Price_Color
ORDER BY ProductKey
