--Truy vấn trả về bảng kết quả danh sách nhân viên có giới tính Nam và thuộc phòng ban Engineering được hưởng base rate từ 30 đến 40
SELECT * FROM DimEmployee
WHERE DepartmentName = 'Engineering'
and Gender = 'M'
and BaseRate > 30
and BaseRate < 40
