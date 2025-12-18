SELECT DISTINCT F.dest_city as city
    FROM FLIGHTS F
    WHERE 
    F.dest_city not in (
        SELECT DISTINCT F3.dest_city
        FROM FLIGHTS F2, FLIGHTS F3
        WHERE F2.dest_city=F3.origin_city and
        F2.origin_city='Seattle WA'
    ) and 
    F.dest_city not in (
        SELECT F1.dest_city
        FROM FLIGHTS F1
        WHERE F1.origin_city='Seattle WA'
    )
    ORDER BY city;