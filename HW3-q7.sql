SELECT DISTINCT C.name AS carrier
FROM CARRIERS AS C, FLIGHTS AS F
WHERE C.cid = F.carrier_id
AND	F.origin_city= 'Seattle WA'
AND	F.dest_city= 'NEW YORK NY'  
ORDER BY carrier ASC;	