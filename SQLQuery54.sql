;WITH 
Customers_CTA AS (SELECT Country, COUNT(*) AS TotalCustomers FROM Customers GROUP BY Country),
Suppliers_CTA AS (SELECT Country, COUNT(*) AS TotalSuppliers FROM Suppliers GROUP BY Country)
SELECT
	ISNULL(Customers_CTA.Country, Suppliers_CTA.Country) AS Country,
	ISNULL(Suppliers_CTA.TotalSuppliers, 0) AS TotalSupplier,
	ISNULL(Customers_CTA.TotalCustomers, 0) AS TotalCustomers
FROM Customers_CTA
FULL OUTER JOIN Suppliers_CTA
	ON Customers_CTA.Country = Suppliers_CTA.Country
ORDER BY Country ASC;
