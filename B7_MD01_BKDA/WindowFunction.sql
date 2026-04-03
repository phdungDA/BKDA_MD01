--Exercise 1: Nêu sự khác nhau giữa 3 hàm: RANK(), DENSE_RANK() và ROW_NUMBER(). Giải thích sự khác biệt về cách đánh số thứ hạng khi có các giá trị trùng nhau
-- Hàm ROW_NUMBER(): đánh số thứ tự
-- Hàm RANK() và DENSE_RANK(): bậc giá trị
-- Khi có các giá trị trùng nhau, RANK() sẽ bỏ qua các dòng trước đó và gán thứ hạng tiếp theo là số thứ tự của dòng hiện tại. VD: có 5 người ở hạng 1 thì người thứ 6 sẽ ở hạng 6
-- Còn DENSE_RANK() sẽ gán thứ hạng tiếp theo là số kế tiếp của rank trước đó. VD: có 5 người ở hạng 1 thì người thứ 6 sẽ ở hạng 2

-- Exercise 2: Viết truy vấn xếp hạng giá trị EndOfDayRate theo từng CurrencyKey trong bảng FactCurrencyRate

SELECT
CurrencyKey,
EndOfDayRate,
RANK() OVER (PARTITION by CurrencyKey order by EndOfDayRate desc) as RateRank
from FactCurrencyRate

--Exercise 3: Viết truy vấn xếp hạng ServiceGrade theo từng WageType và Shift trong bảng FactCallCenter

SELECT 
WageType,
Shift,
ServiceGrade,
RANK() OVER (PARTITION by WageType, Shift ORDER by ServiceGrade DESC) AS RateGrade
FROM FactCallCenter

--Exercise 4: Viết truy vấn xếp hạng ListPrice trong bảng DimProduct theo từng EnglishProductSubcategoryName trong bảng DimProductSubcategory 

SELECT 
DPS.EnglishProductSubcategoryName,
DP.ListPrice,
RANK() OVER (PARTITION by EnglishProductSubcategoryName ORDER by ListPrice desc) as RatePrice
FROM DimProduct DP
JOIN DimProductSubcategory DPS
ON DP.ProductSubcategoryKey = DPS.ProductSubcategoryKey

--Exercise 5: Viết truy vấn trả về TOP 3 EmployeeKey có chỉ tiêu cao nhất theo từng năm trong bảng FactSalesQuota

WITH RateQuotaEachYear AS(
    SELECT 
    EmployeeKey,
    SalesAmountQuota,
    YEAR([Date]) AS YearQuota,
    RANK() OVER (PARTITION by YEAR(Date) ORDER by SalesAmountQuota desc) as TopQuota
    FROM FactSalesQuota
)
SELECT
EmployeeKey,
SalesAmountQuota,
YearQuota,
TopQuota
FROM RateQuotaEachYear
WHERE TopQuota <=3
