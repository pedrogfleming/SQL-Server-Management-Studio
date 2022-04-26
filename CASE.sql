SELECT * FROM Products ORDER BY UnitPrice
--Mostrar los precios de los productos con sus nombres y categorizados por:
--Carisimo: mayor a 100
--Baratisimo: menor a 20
--Justo: Entre 20 y 100
SELECT P.ProductName,P.UnitPrice , OPINIONES =
		CASE 
			WHEN P.UnitPrice > 100 THEN 'Carisimo'
			WHEN P.UnitPrice < 20  THEN  'Baratisimo'
			ELSE 'Justo'
		END
FROM Products P
ORDER BY P.UnitPrice



--Categorizar los valores de la tabla TRIANGLES
SELECT A,B,C,
TYPE_OF_TRIANGLE=
        CASE 
			WHEN (T.A+T.B)>T.C THEN
				CASE
					WHEN T.A=T.B AND T.A=T.C THEN 'Equilateral'
					WHEN T.A=T.B OR T.A=T.C OR T.B=T.C THEN  'Isosceles'
					ELSE 'Scalene'
				END
            ELSE 'Not A Triangle'
        END
FROM
TRIANGLES T






--INSERT INTO TRIANGLES
--VALUES 
--(10, 10, 10),
--(11, 11, 11),
--(30, 32, 30),
--(40, 40, 40),
--(20, 20, 21),
--(21, 21, 21),
--(20, 22, 21),
--(20, 20, 40),
--(20, 22, 21),
--(30, 32, 41),
--(50, 22, 51),
--(20, 12, 61),
--(20, 22, 50),
--(50, 52, 51),
--(80, 80, 80)






