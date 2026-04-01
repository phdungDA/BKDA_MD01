--Exercise 1: Nêu sự khác nhau giữa 3 hàm: RANK(), DENSE_RANK() và ROW_NUMBER(). Giải thích sự khác biệt về cách đánh số thứ hạng khi có các giá trị trùng nhau
-- Hàm ROW_NUMBER(): đánh số thứ tự
-- Hàm RANK() và DENSE_RANK(): bậc giá trị
-- Khi có các giá trị trùng nhau, RANK() sẽ bỏ qua các dòng trước đó và gán thứ hạng tiếp theo là số thứ tự của dòng hiện tại. VD: có 5 người ở hạng 1 thì người thứ 6 sẽ ở hạng 6
-- Còn DENSE_RANK() sẽ gán thứ hạng tiếp theo là số kế tiếp của rank trước đó. VD: có 5 người ở hạng 1 thì người thứ 6 sẽ ở hạng 2

-- Exercise 2: Viết truy vấn xếp hạng giá trị EndOfDayRate theo từng CurrencyKey trong bảng FactCurrencyRate


--Exercise 3: Viết truy vấn xếp hạng ServiceGrade theo từng WageType và Shift trong bảng FactCallCenter


--Exercise 4: Viết truy vấn xếp hạng ListPrice trong bảng DimProduct theo từng EnglishProductSubcategoryName trong bảng DimProductSubcategory 


--Exercise 5: Viết truy vấn trả về TOP 3 EmployeeKey có chỉ tiêu cao nhất theo từng năm trong bảng FactSalesQuota

