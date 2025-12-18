SELECT C.name AS name,
       (COUNT(CASE WHEN F.canceled = 1 THEN 1 END) * 100.0 / COUNT(*)) AS percentage
FROM FLIGHTS AS F, CARRIERS AS C
WHERE  F.carrier_id = C.cid
AND    F.origin_city = 'Seattle WA'
GROUP BY C.name
HAVING (COUNT(CASE WHEN F.canceled = 1 THEN 1 END) * 1.0 / COUNT(*)) > 0.005
ORDER BY percentage ASC;