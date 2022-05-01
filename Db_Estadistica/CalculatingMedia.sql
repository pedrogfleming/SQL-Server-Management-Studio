--A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.
DECLARE @Median FLOAT;
SELECT @Median = (
   (SELECT MAX(LAT_N) FROM
     (SELECT TOP 50 PERCENT LAT_N 
      FROM STATION ORDER BY LAT_N, ID) AS t)
 + (SELECT MIN(LAT_N) FROM
     (SELECT TOP 50 PERCENT LAT_N 
      FROM STATION ORDER BY LAT_N DESC, ID DESC) AS b)
) / 2.0;
select FORMAT(ROUND((@Median),4,0),'F4')

--option 2 https://www.hackerrank.com/challenges/weather-observation-station-20/forum/comments/687725
--Make a subquery to count the lower half of the entries.
--Make another subquery to count the upper half of the entries.
--Equate these queries together under a WHERE clause (so you want an entry that has the same number of entries before and after).
--Round your entry (that has same number of entries before and after) to 4 decimal places.
Select FORMAT(round(S.LAT_N,4),'F4') mediam from station S 
where (
	select count(Lat_N) from station where Lat_N < S.LAT_N 
	) = (select count(Lat_N) from station where Lat_N > S.LAT_N)

--SOURCE: https://sqlperformance.com/2012/08/t-sql-queries/median

SELECT * FROM EvenRows
ORDER BY val
SELECT * FROM OddRows
ORDER BY val

--2000_A – max of one half, min of the other
--This approach takes the highest value from the first 50 percent, the lowest value from the last 50 percent,
--then divides them by two. This works for even or odd rows because,
--in the even case, the two values are the two middle rows, and in the odd case, the two values are actually from the same row.


DECLARE @Median BIGINT;
SELECT @Median = (
   (SELECT MAX(val) FROM
     (SELECT TOP 50 PERCENT val 
      FROM dbo.EvenRows ORDER BY val, id) AS t)
 + (SELECT MIN(val) FROM
     (SELECT TOP 50 PERCENT val 
      FROM dbo.EvenRows ORDER BY val DESC, id DESC) AS b)
) / 2.0;
select (@Median)

--2000_B – #temp table
--This example first creates a #temp table, and using the same type of math as above,
--determines the two "middle" rows with assistance from a contiguous IDENTITY column ordered by the val column.
--(The order of assignment of IDENTITY values can only be relied upon because of the MAXDOP setting.)
DECLARE @Median BIGINT;
CREATE TABLE #x
(
  i    INT IDENTITY(1,1),
  val  DECIMAL(12, 2)
);
 
CREATE CLUSTERED INDEX v ON #x(val);
 
INSERT #x(val)
  SELECT val 
  FROM dbo.EvenRows
  ORDER BY val OPTION (MAXDOP 1);
 
SELECT @Median = AVG(val) 
  FROM #x AS x 
  WHERE EXISTS
  (
    SELECT 1 
      FROM #x 
      WHERE x.i - (SELECT  MAX(i) / 2.0 FROM #x) IN (0, 0.5, 1)
  );

DROP TABLE #x

--2005_A – dueling row numbers
--This example uses ROW_NUMBER() to walk up and down the values once in each direction,
--then finds the "middle" one or two rows based on that calculation.
--This is quite similar to the first example above, with easier syntax:
DECLARE @Median BIGINT;
SELECT @Median = AVG(1.0 * val)
FROM
(
   SELECT val, 
      ra = ROW_NUMBER() OVER (ORDER BY val, id),
      rd = ROW_NUMBER() OVER (ORDER BY val DESC, id DESC)
   FROM dbo.EvenRows
) AS x
WHERE ra BETWEEN rd - 1 AND rd + 1;
SELECT (@Median)