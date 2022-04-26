
 SELECT * FROM Products
 SELECT P.ProductName prod_name from Products P
 WHERE LEFT(P.ProductName , 1) IN ('a','e','i','o','u')
	AND RIGHT(P.ProductName,1) IN  ('a','e','i','o','u')
 ORDER BY P.ProductName

 --Mostrar todos los productos que contenga por lo menos una vocal en su nombre
  SELECT P.ProductName prod_name from Products P
 WHERE CHARINDEX('a',P.ProductName) > 0 OR
	 CHARINDEX('e',P.ProductName) > 0 OR
	 CHARINDEX('i',P.ProductName) > 0 OR
	 CHARINDEX('o',P.ProductName) > 0 OR
	 CHARINDEX('u',P.ProductName) > 0 


--	Regular Expression - Description
--. Match any one character
--* Match any character
--+ Match at least one instance of the expression before
--^ Start at beginning of line
--$ Search at end of line
--< Match only if word starts at this point
--> Match only if word stops at this point
--\n Match a line break
--[] Match any character within the brackets
--[^...] Matches any character not listed after the ^
--[ABQ]% The string must begin with either the letters A, B, or Q and can be of any length
--[AB][CD]% The string must have a length of two or more and which must begin with A or B and have C or D as the second character
--[A-Z]% The string can be of any length and must begin with any letter from A to Z
--[A-Z0-9]% The string can be of any length and must start with any letter from A to Z or numeral from 0 to 9
--[^A-C]% The string can be of any length but cannot begin with the letters A to C
--%[A-Z] The string can be of any length and must end with any of the letters from A to Z
--%[%$#@]% The string can be of any length and must contain at least one of the special characters enclosed in the bracket

--Mostrar todos los productos que contengan por lo menos una vocal en su nombre
SELECT DISTINCT P.ProductName FROM  Products P
WHERE P.ProductName  LIKE '%[aeiou]%'

--Mostrar todos los productos que empiecen con una vocal en su nombre
SELECT DISTINCT P.ProductName FROM  Products P
WHERE P.ProductName LIKE '[aeiou]'

--Mostrar todos los productos que terminen con una vocal en su nombre
SELECT DISTINCT P.ProductName FROM  Products P
WHERE P.ProductName  LIKE '%[aeiou]'


--Mostrar los productos que empiecen y terminen con vocales
SELECT DISTINCT P.ProductName FROM  Products P
WHERE P.ProductName LIKE '[aeiou]%[aeiou]'

--Mostrar los productos que NO empiecen  con vocales
SELECT DISTINCT P.ProductName FROM  Products P
WHERE P.ProductName LIKE '[^aeiou]%'

--Mostrar los productos que NO empiecen ni terminen con vocales
SELECT DISTINCT P.ProductName FROM  Products P
WHERE P.ProductName LIKE '[^aeiou]%[^aeiou]'

--Mostrar productos que no empiecen con vocal o que no termine con vocal
SELECT DISTINCT P.ProductName FROM  Products P
WHERE P.ProductName LIKE '[^aeiou]%' OR P.ProductName LIKE '%[^aeiou]'

--Mostrar los productos que superen su precio en 75 y ordernarlos por sus ultimas 3 letras.
--Si los nombres terminan igual, ordernarlos por id de manera ascendente
SELECT P.ProductName FROM  Products P
WHERE P.UnitPrice > 75
ORDER BY RIGHT(P.ProductName,3), P.ProductID ASC;


 
  

