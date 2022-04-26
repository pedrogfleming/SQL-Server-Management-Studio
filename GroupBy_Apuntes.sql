

SELECT ShipName,Quantity=SUM(UnitPrice) FROM Orders P,[Order Details] Od
where Od.OrderID = P.OrderID
and P.OrderID = 10248
GROUP BY ShipName

select * from Orders INNER JOIN [Order Details]
on ShipName = 'Vins et alcools Chevalier'

--ProductID	UnitPrice	Quantity
--11			14,00		12
--42			9,80		10
--72			34,80		5


--Ejemplo: Sumamos la columna quantity por order id
SELECT * FROM [Order Details]
WHERE OrderID =10248
select SUM(Quantity) as 'TotalSuma' FROM[Order Details]
where OrderID = 10248
--WHERE OrderID = 10248
GROUP BY OrderID,

SELECT * FROM [Order Details]
WHERE OrderID = 10248

SELECT * FROM Products
where SupplierID = 4

--Sumo unidades en stock agrupado por supplier y diferenciado por categoria
SELECT SupplierID,SUM(UnitsInStock) as 'Total Unidades en Stock',CategoryID FROM Products
GROUP BY SupplierID,CategoryID
ORDER BY SupplierID