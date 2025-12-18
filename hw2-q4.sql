SELECT DISTINCT C.name AS name 
FROM FLIGHTS AS F, CARRIERS AS C, MONTHS AS M, WEEKDAYS AS W
WHERE F.carrier_id= C.cid
AND   F.day_of_week_id = W.did
AND   F.month_id= M.mid
GROUP BY C.name, M.mid, F.day_of_month
HAVING COUNT(F.fid) > 1000;