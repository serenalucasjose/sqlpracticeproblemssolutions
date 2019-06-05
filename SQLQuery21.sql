SELECT Country, City, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country, City;
