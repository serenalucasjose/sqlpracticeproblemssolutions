SELECT
	Customers.CustomerID,
	Customers.CompanyName,
	Orders.OrderID,
	TotalOrderAmmount
FROM (
	SELECT 
		SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) AS TotalOrderAmmount,
		OrderDetails.OrderID
	FROM OrderDetails
	GROUP BY OrderDetails.OrderID
) _tmp_OrderDetails
INNER JOIN Orders
	ON Orders.OrderID = _tmp_OrderDetails.OrderID
INNER JOIN Customers
	ON Customers.CustomerID = Orders.CustomerID
WHERE YEAR(Orders.OrderDate) = 2016
	  AND TotalOrderAmmount >= 10000
ORDER BY TotalOrderAmmount DESC;