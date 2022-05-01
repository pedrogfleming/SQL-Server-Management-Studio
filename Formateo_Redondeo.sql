--Query the following two values from the STATION table:
--The sum of all values in LAT_N rounded to a scale of  decimal places.
--The sum of all values in LONG_W rounded to a scale of  decimal places.
Select Format(Round(Sum(LAT_N),2),'F2'),
Format(Round(Sum(long_w),2),'#.00')
from station

SELECT FORMAT(123456789, '## ## # #');

--Option 2
select cast(sum(lat_n) as decimal(15,2)),cast(sum(long_w) as decimal(15,2)) from station

--Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to  decimal places.
select cast(sum(lat_n) as decimal(18,4)) from station where lat_n > 38.7880 and lat_n<137.2345

--Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than . Truncate your answer to  decimal places.
select FORMAT(ROUND(max(LAT_N),4,1),'F4') from station
where LAT_N < 137.2345

--Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than . Round your answer to  decimal places.
Select CAST(LONG_W AS DECIMAL(10,4)) from STATION 
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N<137.2345);

--Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than . Round your answer to  decimal places.
Select CAST(LONG_W AS DECIMAL(10,4)) from STATION 
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N>38.7780);

select TOP 1 cast(LONG_W as DECIMAL(10,4)) from station where LAT_N > 38.7780 order by LAT_N;

--Consider  and  to be two points on a 2D plane.

--a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
--b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
--c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
--d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
--Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.
/*it is |x1 - x2| + |y1 - y2|.*/
SELECT FORMAT(ROUND(ABS((MIN(LAT_N)-MAX(LAT_N)+MIN(LONG_W)-MAX(LONG_W))),4,0),'F4') FROM 
--Option 2
SELECT 
 (MAX(CAST(LAT_N as decimal(10,4)))  - Min(CAST(LAT_N as decimal(10,4))) ) +
 (MAX(CAST(LONG_W as decimal(10,4))) -  MIN(CAST(LONG_W as decimal(10,4))))
FROM STATION


--Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
--Query the Euclidean Distance between points  and  and format your answer to display  decimal digits.
-- d(p,q) = √(q1-p1)²+(q2-p2)²
-- d(p,q) = √(c-a)²+(d-b)²
--a = MIN(LAT_N)
--c = MAX(LAT_N)
--b = MIN(LONG_W)
--d = MAX(LONG_W)
SELECT FORMAT(
    ROUND(
        SQRT(
            SQUARE(
                MAX(LAT_N)-MIN(LAT_N)    
            )
            +
            SQUARE(
            MAX(LONG_W)-MIN(LONG_W)    
            )
        )
        ,4,0
    )
,'F4')
FROM STATION

--OPTION 2
DECLARE @a FLOAT;
DECLARE @b FLOAT;
DECLARE @c FLOAT;
DECLARE @d FLOAT;
DECLARE @distance FLOAT;

SET @a = (SELECT MIN(lat_n) FROM station);
SET @b = (SELECT MAX(lat_n) FROM station);
SET @c = (SELECT MIN(long_w) FROM station);
SET @d = (SELECT MAX(long_w) FROM station);
SET @distance = SQRT(SQUARE(@a - @b) + SQUARE(@c - @d));

SELECT FORMAT(@distance, 'F4');