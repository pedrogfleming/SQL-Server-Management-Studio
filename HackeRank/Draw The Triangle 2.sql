--https://www.hackerrank.com/challenges/draw-the-triangle-2/forum

--Cte solution
with cte as
(select 1 i union all
 select i+1 i from cte where i < 20)
select REPLICATE('* ', i) from cte
order by i asc


--Easy Solution
DECLARE @num INT = 1
WHILE (@num<=20) 
BEGIN
   PRINT REPLICATE('* ', @num) 
   SET @num += 1
END

--Ineficient solution
DECLARE @r INT 
DECLARE @l INT
SET @r = 1
SET @l = 0
DECLARE @stdout VARCHAR(MAX)
select @stdout = ''
CREATE TABLE #tempDrawing([stringDots] varchar(MAX) NOT NULL )


WHILE ( @r <= 20)
BEGIN    
    IF @l <> @r
    BEGIN
        DECLARE @temp VARCHAR(MAX)
        SELECT @temp = [stringDots] FROM #tempDrawing
        IF @temp <> ''
        BEGIN
            SELECT @temp = @temp +'* '
            UPDATE #tempDrawing
            SET [stringDots] = @temp
        END
        ELSE
        BEGIN
            INSERT INTO #tempDrawing    VALUES('* ')
        END
    END
    SELECT @r  = @r  + 1
    SELECT @stdout = [stringDots] FROM #tempDrawing    
    SELECT CONCAT(@stdout,CHAR(13), CHAR(10) )
END

DROP TABLE #tempDrawing