--Exercise 1: Viết truy vấn liệt kê thông tin các nhân viên đã nghỉ việc, kèm theo một cột tính số tháng họ đã làm việc tại công ty. 
--(Nâng cao) Viết truy vấn trả về trung bình số tháng gắn bó của các nhân viên trên với công ty. 

SELECT *,
DATEDIFF(MONTH, StartDate, EndDate) as RetiredTime
from DimEmployee
WHERE Status is NULL

SELECT 
AVG(DATEDIFF(MONTH, StartDate, EndDate) *1.0)
from DimEmployee
WHERE Status is NULL

--Exercise 2: Viết truy vấn lấy thông tin các đơn hàng (bảng FactResellerSales) được đặt trong tháng 11 năm 2013, từ các khách hàng doanh nghiệp. 
--Thêm một cột mới có tên PlanShipDate, là ngày giao hàng dự kiến, được tính bằng OrderDate cộng thêm 15 ngày. 

SELECT 
*,
DATEADD(DAY, 15, OrderDate) as PlanShipDate
from FactResellerSales
WHERE MONTH(OrderDate) = '11'
and YEAR(OrderDate) = '2013'
