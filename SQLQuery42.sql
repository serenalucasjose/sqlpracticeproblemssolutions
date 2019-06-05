SELECT
	Employees.EmployeeID,
	Employees.LastName,
	COUNT(Employees.EmployeeID) AS TotalLateOrders
FROM Orders
JOIN Employees
	ON Employees.EmployeeID = Orders.EmployeeID
WHERE ShippedDate >= RequiredDate
GROUP BY 
	Employees.EmployeeID, 
	Employees.LastName
ORDER BY TotalLateOrders DESC;
