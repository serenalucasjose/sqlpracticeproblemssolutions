;WITH TotalOrders_CTE
AS
(
SELECT
	Orders.CustomerID,
	Customers.CompanyName,
	SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) AS TotalOrderAmmount
FROM Customers
JOIN Orders
	ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails
	ON OrderDetails.OrderID = Orders.OrderID
WHERE YEAR(Orders.OrderDate) = 2016
GROUP BY 
	Orders.CustomerID,
	Customers.CompanyName
)
SELECT 
	TotalOrders_CTE.CustomerID,
	TotalOrders_CTE.CompanyName,
	TotalOrders_CTE.TotalOrderAmmount,
	CustomerGroup = 
	CASE
		WHEN TotalOrders_CTE.TotalOrderAmmount < 1000 THEN 'Low'
		WHEN (TotalOrders_CTE.TotalOrderAmmount > 1000 AND TotalOrders_CTE.TotalOrderAmmount < 5000) THEN 'Medium'
		WHEN (TotalOrders_CTE.TotalOrderAmmount > 5000 AND TotalOrders_CTE.TotalOrderAmmount < 10000) THEN 'High'
		ELSE 'Very High'
	END
FROM TotalOrders_CTE
ORDER BY TotalOrders_CTE.CustomerID;