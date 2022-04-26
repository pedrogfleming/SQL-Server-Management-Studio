--PLANE TXT BULK IMPORT
BULK INSERT empleados
	FROM 'C:\Users\..\Escritorio\empleados.csv'
	WITH
	(
		FIELDTERMINATOR=',',
		ROWTERMINATOR='\n',
		FIRSTROW=2
	)
SELECT * FROM empleados
truncate table empleados
