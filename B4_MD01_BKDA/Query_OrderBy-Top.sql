/*Exercise 1: Viết truy vấn trả về TOP 9 sản phẩm hiện tại vẫn đang bán mà có ListPrice lớn nhất thỏa mãn một trong các điều kiện sau trong bảng DimProduct: 
  Reorder point > 300 và Safety Stock > 400. 
  ListPrice nằm trong khoảng từ 100 - 300.
*/

SELECT Top 9 *
from DimProduct
WHERE ListPrice != 0
--And (ReorderPoint > 300 and SafetyStockLevel > 400)    Condition 1
--and ListPrice BETWEEN 100 and 300                        Condition 2

ORDER BY ListPrice desc
