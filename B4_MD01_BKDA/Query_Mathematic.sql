/*Exercise 1: Viết truy vấn trả về bảng kết quả có mẫu như dưới đây. Biết rằng, Gap Price được tính theo công thức: Gap Price = (ListPrice – DealerPrice) *1.1. Bảng kết quả thỏa mãn các yêu cầu sau: 
 Chỉ tính GapPrice cho những sản phẩm có thông tin màu sắc trong bảng DimProduct. 
 Sắp xếp kết quả theo GapPrice từ cao đến thấp. */

SELECT ProductKey,
(ListPrice - DealerPrice)*1.1 as GapPrice
from DimProduct
WHERE ListPrice is not null 
and Color is not null
ORDER BY GapPrice DESC

/*Exercise 2: Đối với các đơn hàng giao đúng hạn được đặt vào năm 2012, 2013 của khách hàng doanh nghiệp, thực hiện tính toán các chỉ số sau: 
  Chi phí vận chuyển trên một đơn vị sản phẩm, biết chi phí vận chuyển là Freight 
  Tổng số tiền khách phải trả (SalesAmount + TaxAmt + Freight) 
  % thuế trên tổng số tiền khách phải trả, biết tiền thuế là TaxAmt 
  Lợi nhuận (SalesAmount - TotalProductCost) */

SELECT 
ProductKey, 
Freight,
(SalesAmount + TaxAmt + Freight) AS TotalSales,
(TaxAmt/(SalesAmount + TaxAmt + Freight))*100 as TaxPercent,
(SalesAmount - TotalProductCost) AS SaleProfits
from FactInternetSales
WHERE DueDate > ShipDate 
and YEAR(OrderDate) BETWEEN 2012 and 2013
