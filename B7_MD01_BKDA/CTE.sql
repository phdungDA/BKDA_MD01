/*Exercise 1: Viết truy vấn trả về bảng kết quả trả lời các câu hỏi sau: 
 Trung bình một Reseller chi tiêu bao nhiêu tiền?
 Trung bình một Reseller mua bao nhiêu đơn hàng? 
 Trung bình một khách hàng online chi tiêu bao nhiêu tiền? 
 Trung bình một khách hàng online mua bao nhiêu đơn? 

(Nâng cao) Thể hiện các kết quả trên thành một bảng duy nhất với cấu trúc như dưới đây (tham khảo UNION và UNION ALL) */

WITH ResellerSales AS (
    select 
    'Reseller' as Category,
    sum(SalesAmount) as TotalSales,
    cast(count(distinct SalesOrderNumber)AS FLOAT) as TotalOrders,
    COUNT(distinct ResellerKey) as NumReseller
    FROM FactResellerSales
),
CustomerSales AS (
    select 
    'CustomerOnline' AS Category,
    sum(SalesAmount) as TotalSales,
    cast(count(distinct SalesOrderNumber)AS FLOAT) as TotalOrders,
    COUNT(distinct CustomerKey) as NumCustomer
    FROM FactInternetSales
)

SELECT 
Category,
TotalSales/NumReseller as AverageSales,
TotalOrders/NumReseller as AverageOrders
from ResellerSales
UNION all
SELECT
Category,
TotalSales/NumCustomer as AverageSales,
TotalOrders/NumCustomer as AverageOrders
from CustomerSales

--Exercise 2:  Viết truy vấn trả về bảng kết quả như dưới đây: 
--    Year       ---------------           Total SalesAmount (Internet)      ---------------     Total SalesAmount (Reseller)
--                 ---------------                                                           ---------------
--                 ---------------                                                           ---------------
--                 ---------------                                                           ---------------

WITH InternetSales AS (
    SELECT 
    YEAR(OrderDate) as YEAR,
    SUM(SalesAmount) as TotalInternetSales
    FROM FactInternetSales 
    GROUP BY YEAR(OrderDate)
),
ResellerSales as (
    SELECT
    YEAR(OrderDate) as YEAR,
    SUM(SalesAmount) as TotalResellerSales
    from FactResellerSales
    GROUP BY YEAR(OrderDate)
)

SELECT 
I.[YEAR],
I.TotalInternetSales,
R.TotalResellerSales
From InternetSales I
FULL OUTER JOIN ResellerSales R ON I.[YEAR] = R.[YEAR]
ORDER BY [I].[YEAR] ASC;

--Exercise 3: Viết truy vấn trả về TOP 3 Reseller có tổng doanh số (SalesAmount) cao nhất với từng SalesTerritoryRegion (trong bảng DimSalesTerritory)
