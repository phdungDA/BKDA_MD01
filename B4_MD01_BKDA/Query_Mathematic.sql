/*Viết truy vấn trả về bảng kết quả có mẫu như dưới đây. Biết rằng, Gap Price được tính theo công thức: Gap Price = (ListPrice – DealerPrice) *1.1. Bảng kết quả thỏa mãn các yêu cầu sau: 
Chỉ tính GapPrice cho những sản phẩm có thông tin màu sắc trong bảng DimProduct. 
 Sắp xếp kết quả theo GapPrice từ cao đến thấp. */

SELECT ProductKey,
(ListPrice - DealerPrice)*1.1 as GapPrice
from DimProduct
WHERE ListPrice is not null 
and Color is not null
ORDER BY GapPrice DESC
