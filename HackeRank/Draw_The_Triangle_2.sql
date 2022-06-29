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