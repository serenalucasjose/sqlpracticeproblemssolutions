SELECT
	InitialOrders.CustomerID,
	InitialOrders.OrderID AS InitialOrderID,
	InitialOrders.OrderDate AS InitialOrderDate,
	NextOrders.OrderID AS NextOrderID,
	NextOrders.OrderDate AS NextOrdersDate,
	DaysBetween = DATEDIFF(day, InitialOrders.OrderDate, NextOrders.OrderDate)
FROM Orders AS InitialOrders
INNER JOIN Orders AS NextOrders
	ON InitialOrders.CustomerID = NextOrders.CustomerID
WHERE 
	InitialOrders.OrderID < NextOrders.OrderID 
	AND DATEDIFF(day, InitialOrders.OrderDate, NextOrders.OrderDate) < 5
ORDER BY 
	InitialOrders.CustomerID, 
	InitialOrderID;