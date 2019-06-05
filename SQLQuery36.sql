SELECT TOP 10
	Orders.OrderID,
	COUNT(OrderDetails.Quantity) AS TotalOrderDetails
FROM 
	Orders
JOIN OrderDetails
	ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.OrderID
ORDER BY TotalOrderDetails DESC;