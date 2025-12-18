SELECT DISTINCT F.flight_num AS flight_num
FROM FLIGHTS F
JOIN CARRIERS C ON F.carrier_id= C.cid
JOIN WEEKDAYS W ON F.day_of_week_id = W.did
JOIN MONTHS M   ON F.month_id= M.mid
WHERE W.day_of_week = 'Monday'
  AND C.name = 'Alaska Airlines Inc.'
  AND F.origin_city = 'Seattle WA'
  AND F.dest_city = 'Boston MA';