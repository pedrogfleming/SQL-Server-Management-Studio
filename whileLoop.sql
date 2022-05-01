--Source : https://www.hackerrank.com/challenges/print-prime-numbers/forum/comments/113380

DECLARE @I INT=2
DECLARE @PRIME INT=0
DECLARE @OUTPUT TABLE (NUM INT)
WHILE @I<=1000
BEGIN
    DECLARE @J INT = @I-1
    SET @PRIME=1
    WHILE @J>1
    BEGIN
        IF @I % @J=0
        BEGIN
            SET @PRIME=0
        END
        SET @J=@J-1
    END
    IF @PRIME =1
    BEGIN
        INSERT @OUTPUT VALUES (@I)
    END
    SET @I=@I+1
END


DECLARE @I INT=2
DECLARE @PRIME INT=0
DECLARE @OUTPUT TABLE (NUM INT)
DECLARE @prime_numbers VARCHAR(1000) = ''
WHILE @I<=1000
BEGIN
    DECLARE @J INT = @I-1
    SET @PRIME=1
    WHILE @J>1
    BEGIN
        IF @I % @J=0
        BEGIN
            SET @PRIME=0
        END
        SET @J=@J-1
    END
    IF @PRIME =1
    BEGIN
        --INSERT @OUTPUT VALUES (@I)
		IF(LEN(@prime_numbers) <> 0)
		BEGIN
			SET @prime_numbers += '&'+cast(@I as varchar(1000)) 
		END
		ELSE
			SET @prime_numbers = cast(@I as varchar(1000)) 
    END
    SET @I=@I+1
END
SELECT(@prime_numbers) 


--OPTION 2
--MSSQL
SET QUOTED_IDENTIFIER ON
GO
With NumberSequence( Number ) as
(
    Select 2 as Number
        union all
    Select Number + 1
        from NumberSequence
        where Number < 1000     
) 

, primelist as (
--list of prime numbers
SELECT 1 as category, myvalue.number as value
FROM numberSequence myvalue
LEFT JOIN
(
--find the nonprime first
SELECT DISTINCT myvalue.number

   FROM numbersequence as myvalue

   INNER JOIN numbersequence as compareto
   ON  myvalue.number > compareto.number
   AND ((myvalue.number * 1.0)/compareto.number) = (CEILING(((myvalue.number * 1.0)/compareto.number))  * 1.0)
) nonprimelist ON nonprimelist.number = myvalue.number
WHERE nonprimelist.number IS NULL 
)

SELECT
     CAST(STUFF(
     (select CAST('&' AS varchar(1)) + cast(primelist.value as varchar(100))
     from primelist
     order by value
     for xml path(''), type).value('.[1]','nvarchar(max)')
     , 1, 1, '' ) AS VARCHAR(8000)) AS namelist
option (maxrecursion 0);
GO

--OPTION 3
Declare @table table (primeno int) 
Declare @test as varchar(1000) 
set @test='' 
Declare @counter int 
set @counter = 2 
while @counter <= 1000 
begin 
	if not exists(select top 1 primeno from @table where @counter % primeno = 0 ) 
	Begin 
		insert into @table
			select @counter 
			set @test=@test+CAST(@counter as varchar(20))+'&' 
	end 
	set @counter = @counter + 1 
end 
select SubString(@test,0,len(@test))












--DECLARE @n INT = 2
--DECLARE @i INT = 2
--Declare @Number int,@Fact int  
--WHILE @i <= 10
--BEGIN
--	BEGIN				
--		set @Fact=1  
--		set @Number = @i; -- To Find Factorial of number  

--		SELECT @Fact = @Fact*N from Factorial             -- To repeat the process  
--		--select @Number as 'Number', @Fact as 'Factorial' -- To show result  
--	END
--    IF(@Fact % @Number = @Number - 1)
--    BEGIN
--		Print  cast(@Number as varchar(100))  + SPACE(1) + 'is PRIME:' + cast(@Number as varchar(100))  -- To print a message  
--    END
--	ELSE	
--		Print  cast(@Number as varchar(100))  + SPACE(1) + 'not PRIME:' + cast(@Number as varchar(100))  -- To print a message  
	
--    SET @i = @i + 1

--END

--set nocount on  
--Declare @Number int,@Fact int  
--set @Fact=1  
--set @Number =3; -- To Find Factorial of number  
--WITH Factorial AS -- Defined Common Table Expression  
--(  
--SELECT  
--CASE WHEN @Number<0 THEN NULL ELSE 1  -- To check if number is 0 it will return 1  
--END N  
--UNION all  
--SELECT (N+1)    
--FROM Factorial  
--WHERE N < @Number  -- To check factorial number with increment number  
--)  
--SELECT @Fact = @Fact*N from Factorial             -- To repeat the process  
--select @Number as 'Number', @Fact as 'Factorial' -- To show result  
--Print  'The factorial of' +SPACE(1) + cast(@Number as varchar(100))  + SPACE(1) + 'is:' + cast(@Fact as varchar(100))  -- To print a message  