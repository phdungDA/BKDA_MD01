--Exercise 1: Truy vấn ra bảng kết quả bao gồm những khách hàng có học vấn là Partial High School hoặc High School hoặc Graduate Degree trong bảng DimCustomer

SELECT * From DimCustomer
WHERE EnglishEducation IN ('Partial High School', 'High School', 'Graduate Degree')

/*Exercise 2: Truy vấn ra bảng kết quả bao gồm những khách hàng có học vấn là Partial High School hoặc High School hoặc Graduate Degree và đáp ứng một trong các điều kiện sau ở trong bảng DimCustomer 
  Có nghề (EnglishOccupation) là Professional và khoảng cách là 10+ Miles 
  Có nghề là Clerical và khoảng cách là 0-1 Miles*/
  
SELECT * From DimCustomer
WHERE EnglishEducation IN ('Partial High School', 'High School', 'Graduate Degree')
--and (EnglishOccupation = 'Professional' and CommuteDistance = '10+ Miles') *Condition 1
--and (EnglishOccupation = 'Clerical' and CommuteDistance = '0-1 Miles') *Condition 2
