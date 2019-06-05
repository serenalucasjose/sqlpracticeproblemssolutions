SELECT
	Customers.CustomerID,
	Customers.CompanyName,
	TotalOrderAmount = SUM(OrderDetails.Quantity * OrderDetails.UnitPrice)
FROM Customers
JOIN Orders
	ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails
	ON OrderDetails.OrderID = Orders.OrderID
WHERE YEAR(Orders.OrderDate) = 2016
GROUP BY 
	Customers.CustomerID,
	Customers.CompanyName
HAVING SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) > 15000
ORDER BY TotalOrderAmount DESC;