SELECT f2.origin_city AS origin_city,
       COALESCE(CAST(
           (SELECT COUNT(*) 
            FROM FLIGHTS AS f1
            WHERE f1.actual_time < 180
              AND f1.origin_city = f2.origin_city
              AND f1.canceled = 0  
           ) AS FLOAT) * 100 / 
           COUNT(CASE WHEN f2.canceled = 0 THEN 1 END), 0) AS percentage
FROM FLIGHTS AS f2
WHERE f2.canceled = 0  
GROUP BY f2.origin_city
ORDER BY percentage ASC, origin_city ASC;

