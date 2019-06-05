SELECT Employees.EmployeeID, LastName, Orders.OrderID, ProductName, Quantity
FROM Orders
JOIN OrderDetails
	ON OrderDetails.OrderID = Orders.OrderID 
JOIN Employees
	ON Employees.EmployeeID = Orders.EmployeeID
JOIN Products
	ON Products.ProductID = OrderDetails.ProductID
ORDER BY Orders.OrderID, Products.ProductID DESC;