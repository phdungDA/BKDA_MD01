--Exercise 1: Tính tổng doanh thu hàng năm (AnnualRevenue) theo từng loại hình kinh doanh (BusinessType) và dòng sản phẩm (ProductLine) trong bảng DimReseller. 
--Viết truy vấn để kết quả chỉ hiện thị những nhóm có tổng doanh thu lớn hơn 10 triệu. 

SELECT 
BusinessType,
ProductLine,
SUM(AnnualRevenue) as TotalRevenue
from DimReseller
GROUP BY BusinessType, ProductLine
HAVING SUM(AnnualRevenue) > 10000000

/*Exercise 2: Dựa vào bảng FactInternetSales, hãy viết truy vấn trả về bảng gồm 3 cột: 
  Mã khách hàng 
  Ngày gần nhất mà khách hàng thực hiện mua hàng 
  Số lượng đơn khách hàng đã mua (lưu ý phân biệt giữa COUNT và COUNT DISTINCT) 
Chỉ hiển thị những khách hàng có ngày mua hàng gần nhất nằm trong khoảng từ năm 2012 trở về sau. */

SELECT
CustomerKey,
MAX(OrderDate) as ClosestDay,
 COUNT( distinct OrderQuantity) as Quantity
FROM FactInternetSales
GROUP BY CustomerKey
HAVING MAX(OrderDate) > '2011'

--Exercise 3: Viết truy vấn tính tổng doanh số bán hàng online theo từng năm. 

SELECT 
YEAR(OrderDate) as Year,
SUM(SalesAmount) as TotalRevenueEachYear 
FROM FactInternetSales
GROUP BY YEAR(OrderDate)
order BY Year
