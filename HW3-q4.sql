SELECT DISTINCT F2.dest_city AS city
FROM FLIGHTS AS F1, FLIGHTS AS F2
WHERE F1.dest_city=F2.origin_city
AND   F1.origin_city= 'Seattle WA'
AND	  F2.dest_city != 'Seattle WA'
AND   F2.dest_city	NOT IN (SELECT DISTINCT F3.dest_city
								FROM FLIGHTS AS F3
								WHERE F3.origin_city='Seattle WA'
								AND   F3.dest_city=F2.dest_city)
ORDER BY city								


