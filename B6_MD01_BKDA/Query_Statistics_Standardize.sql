--Exercise 1: Chuẩn hóa cột YearlyIncome (DimCustomer) theo phương pháp Min-Max về [0,1]. Liệt kê Top 10 khách hàng có thu nhập cao nhất sau khi chuẩn hóa
--Tạo CTE
WITH Stats AS(
    SELECT
    CustomerKey,
    YearlyIncome,
    MIN(YearlyIncome) OVER () AS MinIncome,
    MAX(YearlyIncome) OVER () AS MaxIncome
    from DimCustomer
),
Standardize AS(
    SELECT 
    CustomerKey,
    YearlyIncome,
    case
        when MinIncome = MaxIncome then 0
        else (YearlyIncome - MinIncome)*1.0/(MaxIncome-MinIncome) --Chuẩn hóa (*1.0 để lấy phần thập phân)
    end as StandardizeIncome
    from Stats
)
--Lấy top 10 StandardizeIncome cao nhất
SELECT top 10
CustomerKey,
YearlyIncome,
StandardizeIncome
from Standardize
ORDER BY StandardizeIncome DESC;
