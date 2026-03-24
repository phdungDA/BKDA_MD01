/*Exercise 1: Lấy thông tin các sản phẩm có mặt trong 20 đơn hàng có tổng SalesAmount lớn nhất, và phân loại sản phẩm: 
  'Expensive' nếu ListPrice > 2000 
  'Affordable' nếu từ 1000–2000 
  'Cheap' nếu dưới 1000 */

SELECT *,
case 
when ListPrice > 2000 then 'Expensive'
when ListPrice between 1000 and 2000 then 'Affordable'
else 'Cheap'
end as Category
FROM DimProduct
WHERE ProductKey IN(
    SELECT top 20 ProductKey 
    FROM FactInternetSales
    ORDER by SalesAmount DESC
)

/*Exercise 2: Lấy danh sách khách hàng có ID xuất hiện trong Top 20 đơn hàng có doanh số cao nhất, và phân loại theo năm sinh như sau: 
  'Gen Z' nếu sinh sau 1997 
  'Millennial' nếu sinh từ 1981 đến 1997 
  'Older' nếu sinh trước 1981*/

SELECT *,
case 
when YEAR(BirthDate) >'1997' then 'GenZ'
when YEAR(BirthDate) between '1989' and '1997' then 'Millennial'
else 'older'
end as Age_Category
FROM DimCustomer
WHERE CustomerKey IN (
    SELECT top 20 CustomerKey
    from FactInternetSales
    ORDER by SalesAmount DESC
)
