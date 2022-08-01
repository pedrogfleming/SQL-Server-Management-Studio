;WITH PADS_CTE (Name_Concat,Occupation)
AS
(
    SELECT 
        CONCAT(
            Name,
            '(',
            CAST(Occupation AS CHAR(1)),
            ')'   
        ),
    Occupation
    FROM OCCUPATIONS
)

SELECT Name_Concat FROM PADS_CTE
ORDER BY Name_Concat

SELECT
    CONCAT(
    'There are a total of ',    
    COUNT(Occupation),
    ' ',
    LOWER(Occupation),
    's.'
    ) AS ocurrence
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY ocurrence ASC