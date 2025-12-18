SELECT DISTINCT F.origin_city AS city
FROM FLIGHTS AS F 
WHERE 240 > ALL (SELECT F1.actual_time 
			 FROM FLIGHTS AS F1
			 WHERE F.origin_city=F1.origin_city
			 AND F1.canceled = 0)
ORDER BY F.origin_city ASC;

