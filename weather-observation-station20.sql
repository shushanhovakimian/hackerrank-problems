FROM station s;WITH temp_t AS(
SELECT  LAT_N, 
        ROW_NUMBER () OVER(ORDER BY LAT_N) AS n,
        COUNT(*) OVER() AS len
FROM station)
        
SELECT ROUND(AVG(LAT_N),4) as median      
FROM temp_t
WHERE n BETWEEN len/2 AND len/2 + 1;