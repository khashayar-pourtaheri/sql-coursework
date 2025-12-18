SELECT DISTINCT F.origin_city AS origin_city, 
       F.dest_city AS dest_city, 
       F.actual_time AS time
FROM FLIGHTS AS F, (SELECT F2.origin_city AS origin, max(F2.actual_time) AS time
					FROM FLIGHTS AS F2
					GROUP BY F2.origin_city) AS MP
WHERE F.origin_city = MP.origin
AND	  F.actual_time= MP.time
ORDER BY F.origin_city ASC, F.dest_city ASC;





