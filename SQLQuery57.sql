;WITH Orders_CTE AS
(SELECT 
	CustomerID, 
	OrderDate = CONVERT(date, OrderDate),
	NextOrderDate = CONVERT(date, LEAD(OrderDate, 1) OVER (PARTITION BY CustomerID ORDER BY CustomerID, OrderDate))
FROM Orders)
SELECT 
	*,
	DaysBetween = DATEDIFF(day, OrderDate, NextOrderDate)
FROM Orders_CTE
WHERE DATEDIFF(day, OrderDate, NextOrderDate) < 5;