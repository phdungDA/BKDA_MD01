--Danh sách tất cả các sản phẩm có tên bắt đầu bằng chữ HL
SELECT * FROM DimProduct
WHERE EnglishProductName LIKE 'HL%'
OR SpanishProductName LIKE 'HL%'
OR FrenchProductName LIKE 'HL%'
