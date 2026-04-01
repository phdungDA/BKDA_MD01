--Exericse 1: Viết truy vấn trả về bảng kết quả chứa số đơn hàng của Reseller, mã Reseller, tên chương trình khuyến mãi mà Reseller được hưởng. Lưu ý: dữ liệu tại bảng kết quả không được trùng nhau (tham khảo SELECT DISTINCT)

SELECT distinct
FR.ResellerKey,
FR.SalesOrderNumber,
DP.EnglishPromotionName
from FactResellerSales FR
JOIN DimPromotion DP
ON FR.PromotionKey = DP.PromotionKey

--Exercise 2: Viết truy vấn trả về bảng kết quả bao gồm số đơn hàng, SalesOrderLineNumber, mã sản phẩm, số lượng mua, màu sắc, size, đơn giá, tên khách hàng, địa chỉ, giới tính

SELECT 
FI.SalesOrderNumber,
FI.SalesOrderLineNumber,
FI.ProductKey,
FI.OrderQuantity,
DP.Color,
DP.[Size],
DP.ListPrice,
CONCAT(DC.FirstName, '', DC.LastName) as CustomerName,
DC.AddressLine1,
DC.Gender
from DimCustomer DC
join FactInternetSales FI
ON DC.CustomerKey = FI.CustomerKey
JOIN DimProduct DP
ON FI.ProductKey = DP.ProductKey

--Exercise 3: Viết truy vấn trả về bảng kết quả theo mẫu dưới đây. Biết rằng bảng kết quả bao gồm số lượng đơn hàng online tương ứng với từng màu sắc của sản phẩm

SELECT 
DP.Color,
SUM(FI.OrderQuantity) as OnlineQuantity
from FactInternetSales FI
JOIN DimProduct DP
ON FI.ProductKey = DP.ProductKey
GROUP BY DP.Color

--Exercise 4: Viết truy vấn tính trung bình số lượng mua theo từng Size sản phẩm của các khách hàng sinh sau 1980
  
SELECT 
DP.[Size],
AVG(OrderQuantity * 1.0) AS AvgOnlineQuantity
from FactInternetSales FI join DimProduct DP ON FI.ProductKey = DP.ProductKey
JOIN DimCustomer DC ON FI.CustomerKey = DC.CustomerKey
WHERE YEAR(DC.BirthDate) > 1980
GROUP BY DP.[Size]

--Exercise 5: Hãy viết truy vấn để trả về bảng kết quả thể hiện doanh số từ năm 2012 – 2014 theo từng năm và theo từng quốc gia, đồng thời, tạo thêm một cột Bonus vùng tương đương 10% doanh số

SELECT 
ST.SalesTerritoryCountry,
YEAR(FI.OrderDate) as OrderYear,
SUM(FI.SalesAmount) as TotalSales,
SUM(FI.SalesAmount)*0.1 as Bonus
FROM FactInternetSales FI
join DimSalesTerritory ST ON FI.SalesTerritoryKey = ST.SalesTerritoryKey
GROUP BY ST.SalesTerritoryCountry, YEAR(FI.OrderDate)
HAVING YEAR(FI.OrderDate) BETWEEN 2012 and 2014;

/*Exercise 6: Viết truy vấn trả về mã đơn hàng online trong năm 2011 được mua bởi khách hàng nữ sinh sau 1980, số orderline, mã khách hàng, mã sản phẩm, số lượng mua, và cột phân loại theo logic sau: 

- Màu Black, Blue, Grey, Red được phân loại là DarkColor 

- Silver, Silver/Black, White, Yellow được phân loại là BrightColor - Các màu khác giữ nguyên */

SELECT 
FI.SalesOrderNumber,
FI.SalesOrderLineNumber,
FI.CustomerKey,
FI.ProductKey,
Fi.OrderQuantity,
case 
    when DP.color in ('Black', 'Blue', 'Grey', 'Red') then 'DarkColor'
    when DP.Color in ('Silver', 'Silver/Black', 'White', 'Yellow') then 'BrightColor'
    else DP.Color
end as CategoryColor
from DimCustomer DC
JOIN FactInternetSales FI ON DC.CustomerKey = FI.CustomerKey
JOIN DimProduct DP on Fi.ProductKey = DP.ProductKey 
WHERE YEAR(OrderDate) = 2011
AND DC.Gender = 'F'
AND YEAR(BirthDate) > 1980

/*Exercise 7: Viết truy vấn tính tổng số lượng mua các đơn hàng online theo từng phân loại màu sắc: 

- Màu Black, Blue, Grey, Red được phân loại là DarkColor 

- Silver, Silver/Black, White, Yellow được phân loại là BrightColor - Các màu khác giữ nguyên 

Biết rằng các đơn hàng này được mua năm 2011 được mua bởi khách hàng nữ sinh sau 1980*/
  
with TotalQuantity AS
(SELECT 
FI.OrderQuantity,
case 
    when DP.color in ('Black', 'Blue', 'Grey', 'Red') then 'DarkColor'
    when DP.Color in ('Silver', 'Silver/Black', 'White', 'Yellow') then 'BrightColor'
    else DP.Color
end as CategoryColor
from DimCustomer DC
JOIN FactInternetSales FI ON DC.CustomerKey = FI.CustomerKey
JOIN DimProduct DP on Fi.ProductKey = DP.ProductKey 
WHERE YEAR(OrderDate) = 2011
AND DC.Gender = 'F'
AND YEAR(BirthDate) > 1980)

SELECT 
CategoryColor,
SUM(OrderQuantity) as TotalOrder
FROM TotalQuantity
GROUP BY CategoryColor
