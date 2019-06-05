SELECT c.CustomerID, o.CustomerID
FROM Customers AS c
LEFT JOIN Orders AS o ON o.CustomerID = c.CustomerID AND o.EmployeeID = 4
WHERE o.CustomerID IS NULL;