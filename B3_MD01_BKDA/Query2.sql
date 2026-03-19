--Danh sách khách hàng là doanh nghiệp được thành lập vào thế kỉ 21, và có doanh số hàng năm lớn hơn hoặc bằng 3000000
SELECT * FROM DimReseller
WHERE YearOpened > '1999'
and AnnualRevenue >= 3000000

--Danh sách khách hàng là doanh nghiệp được thành lập trước thế kỉ 21, và có doanh số hàng năm nhỏ hơn hoặc bằng 800000
SELECT * FROM DimReseller
WHERE YearOpened < '2000'
and AnnualRevenue <= 800000
