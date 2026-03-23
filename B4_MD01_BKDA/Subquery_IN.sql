--Exercise 1: Lấy danh sách khách hàng (CustomerKey) từ bảng DimCustomer có City nằm trong nhóm các thành phố đã từng có đơn hàng với SalesAmount > 2000 trong bảng FactInternetSales.
SELECT CustomerKey
from DimCustomer
WHERE GeographyKey in (
    SELECT GeographyKey 
    from DimGeography
    WHERE City IN (
        SELECT City 
        from DimGeography
        WHERE GeographyKey IN(
            SELECT GeographyKey 
            from DimCustomer
            WHERE CustomerKey in(
                SELECT CustomerKey 
                from FactInternetSales
                WHERE SalesAmount > 2000
            )
        )
    )
)

--Exercise 2: Trả về thông tin của top 5 sản phẩm bán chạy nhất màu đỏ có ListPrice > 500

SELECT top 5 * 
from DimProduct as d
WHERE
Color = 'Red'
and ListPrice > 500
and ProductKey IN(
    SELECT ProductKey
    from FactInternetSales
)
ORDER BY (
    select SUM(OrderQuantity)
    from FactInternetSales as f
    WHERE f.ProductKey = d.ProductKey
) DESC
