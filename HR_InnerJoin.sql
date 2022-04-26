--Population Census
--Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
--Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

The CITY and COUNTRY tables are described as follows:
SELECT SUM(CI.POPULATION) ALL_POPULATION FROM CITY CI
INNER JOIN COUNTRY CNT ON CI.COUNTRYCODE = CNT.CODE
WHERE CNT.CONTINENT = 'Asia'


--African Cities
--Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
--Note: CITY.CountryCode and COUNTRY.Code are matching key columns.


SELECT CI.NAME FROM CITY CI
INNER JOIN COUNTRY CNT ON CI.COUNTRYCODE = CNT.CODE
WHERE CNT.CONTINENT = 'Africa'

--Average Population of Each Continent
--Given the CITY and COUNTRY tables,
--query the names of all the continents (COUNTRY.Continent)
--and their respective average city populations (CITY.Population)
--rounded down to the nearest integer.
--Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
SELECT CNT.CONTINENT,AVG(ROUND(C.POPULATION,0,0)) AVERAGE_POP FROM CITY C
INNER JOIN COUNTRY CNT ON C.COUNTRYCODE = CNT.CODE
GROUP BY CNT.CONTINENT