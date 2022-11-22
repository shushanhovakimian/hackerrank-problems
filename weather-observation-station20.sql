FROM station s;WITH temp_t AS(
SELECT  LAT_N, 
        ROW_NUMBER () OVER(ORDER BY LAT_N) AS ordering,
        COUNT(*) OVER() AS n
FROM station)
        
SELECT ROUND(AVG(LAT_N),4) as median      
FROM temp_t
WHERE n BETWEEN n/2 AND n/2 + 1;