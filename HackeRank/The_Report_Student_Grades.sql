--https://www.hackerrank.com/challenges/the-report/forum
SELECT 
CASE 
    WHEN Marks >= 70 THEN Name
END
,Grade,Marks
FROM Students INNER JOIN Grades
ON Marks >= Min_Mark AND Marks <= Max_Mark
ORDER BY Grade DESC,Name ASC,Marks ASC