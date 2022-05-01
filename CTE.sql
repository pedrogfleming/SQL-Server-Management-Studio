--COMMON TABLE EXPRESIONS
--Source: https://www.sqlshack.com/sql-server-common-table-expressions-cte/
declare @startDate datetime,  
        @endDate datetime;  
  
select  @startDate = getdate(),  
        @endDate = getdate()+16;  
-- select @sDate StartDate,@eDate EndDate  
;with myCTE as  
   (  
      select 1 as ROWNO,@startDate StartDate,'W - '+convert(varchar(2),  
            DATEPART( wk, @startDate))+' / D ('+convert(varchar(2),@startDate,106)+')' as 'WeekNumber'  
    )  
select ROWNO,Convert(varchar(10),StartDate,105)  as StartDate ,WeekNumber from myCTE ;


--Factorial
--Source: https://www.c-sharpcorner.com/UploadFile/rohatash/calculating-factorial-of-a-number-in-sql-server-2012/
set nocount on  
Declare @Number int,@Fact int  
set @Fact=1  
set @Number =3; -- To Find Factorial of number  
WITH Factorial AS -- Defined Common Table Expression  
(  
SELECT  
CASE WHEN @Number<0 THEN NULL ELSE 1  -- To check if number is 0 it will return 1  
END N  
UNION all  
SELECT (N+1)    
FROM Factorial  
WHERE N < @Number  -- To check factorial number with increment number  
)  
SELECT @Fact = @Fact*N from Factorial             -- To repeat the process  
select @Number as 'Number', @Fact as 'Factorial' -- To show result  
Print  'The factorial of' +SPACE(1) + cast(@Number as varchar(100))  + SPACE(1) + 'is:' + cast(@Fact as varchar(100))  -- To print a message  

