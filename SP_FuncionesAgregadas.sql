select * from Products
WHERE SupplierID = 1

--Restando 
select (SUM(UnitPrice) - 100) from Products
WHERE SupplierID = 1

--Elegir la 1er y ultima fila s/cantidad de caracteres
(select CITY,LENGTH(CITY) LENGTH_NAME from STATION GROUP BY CITY,LENGTH_NAME
 order by LENGTH_NAME ASC,CITY ASC LIMIT 1)
UNION
(select CITY,LENGTH(CITY) LENGTH_NAME from STATION GROUP BY CITY,LENGTH_NAME
 order by LENGTH_NAME DESC ,CITY DESC LIMIT 1); 


