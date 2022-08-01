--DECLARE @max_earnings DECIMAL(18,2)
--SELECT @max_earnings = (SELECT MAX(months * salary) FROM Employee)

--SELECT MAX(months * salary),
--(
--    SUM(
--    CASE WHEN (months * salary) >=  @max_earnings 
--       THEN 1 ELSE 0 END)
--) 
--FROM Employee


--select max(months*salary),count(months*salary) from employee where employee_id in( select employee_id from employee where months*salary in (select max(months*salary) from employee));

--select max(salary*months), count(salary*months) from employee where salary*months in (select max(salary*months) from employee)

