SELECT
	Customers.CustomerID,
	Customers.CompanyName,
	TotalWithoutDiscount = SUM(OrderDetails.Quantity * OrderDetails.UnitPrice),
	TotalWithDiscount = SUM(OrderDetails.Quantity * OrderDetails.UnitPrice * (1 - OrderDetails.Discount) )
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
ORDER BY TotalWithDiscount DESC;