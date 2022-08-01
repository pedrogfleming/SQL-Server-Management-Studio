--Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT ROUND(AVG(POPULATION),0,0) FROM CITY
SELECT FLOOR(AVG(POPULATION)) FROM CITY


--we define an employee's total earnings to be their monthly salary*months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

SELECT MAX(SALARY * MONTHS) AS 't',
(SELECT COUNT(NAME) FROM EMPLOYEE having MAX(SALARY * MONTHS) = SALARY * MONTHS)
FROM Employee
