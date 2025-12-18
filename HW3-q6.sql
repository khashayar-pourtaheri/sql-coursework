SELECT DISTINCT C.name AS carrier
FROM CARRIERS AS C
WHERE C.cid IN (SELECT F.carrier_id
				FROM FLIGHTS AS F
				WHERE F.origin_city= 'Seattle WA'
				AND F.dest_city= 'NEW YORK NY')
ORDER BY carrier ASC;				