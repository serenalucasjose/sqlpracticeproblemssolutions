SELECT Country
FROM Customers
UNION
SELECT Country
FROM Suppliers
GROUP BY Country;
