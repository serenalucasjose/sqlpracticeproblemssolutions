;WITH LateOrders AS
(
	SELECT 
		EmployeeID,
		COUNT(*) AS LateOrders
	FROM Orders
	WHERE ShippedDate > RequiredDate
	GROUP BY EmployeeID
), AllOrders AS
(
	SELECT 
		EmployeeID,
		COUNT(*) AS TotalOrders
	FROM Orders
	GROUP BY EmployeeID
)
SELECT
	Employees.EmployeeID,
	Employees.LastName,
	AllOrders.TotalOrders,
	ISNULL(CONVERT(DECIMAL(10,2), (CAST(LateOrders.LateOrders AS DECIMAL)/AllOrders.TotalOrders)  ), 0) AS LateOrders
FROM Employees
JOIN AllOrders
	ON AllOrders.EmployeeID = Employees.EmployeeID
LEFT JOIN LateOrders
	ON LateOrders.EmployeeID = Employees.EmployeeID
ORDER BY Employees.EmployeeID ASC;