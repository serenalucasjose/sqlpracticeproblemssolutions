;WITH 
TotalOrders_CTE AS (
SELECT
	Orders.CustomerID,
	Customers.CompanyName,
	SUM(OrderDetails.Quantity * OrderDetails.UnitPrice) AS TotalOrdersAmmount
FROM Customers
JOIN Orders
	ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails
	ON OrderDetails.OrderID = Orders.OrderID
WHERE YEAR(Orders.OrderDate) = 2016
GROUP BY 
	Orders.CustomerID,
	Customers.CompanyName
),
CustomerGroups_CTE AS (
SELECT
	TotalOrders_CTE.CustomerID,
	CustomerGroup = 
	CASE
		WHEN TotalOrders_CTE.TotalOrdersAmmount < 1000 THEN 'Low'
		WHEN (TotalOrders_CTE.TotalOrdersAmmount > 1000 AND TotalOrders_CTE.TotalOrdersAmmount < 5000) THEN 'Medium'
		WHEN (TotalOrders_CTE.TotalOrdersAmmount > 5000 AND TotalOrders_CTE.TotalOrdersAmmount < 10000) THEN 'High'
		ELSE 'Very High'
	END
FROM TotalOrders_CTE
)
SELECT
	CustomerGroups_CTE.CustomerGroup,
	COUNT(*) AS TotalInGroup,
	COUNT(*)*1.0/(SELECT COUNT(*) FROM CustomerGroups_CTE) AS PercentageInGroup
FROM CustomerGroups_CTE
JOIN TotalOrders_CTE
	ON TotalOrders_CTE.CustomerID = CustomerGroups_CTE.CustomerID
GROUP BY CustomerGroups_CTE.CustomerGroup
ORDER BY TotalInGroup DESC;
