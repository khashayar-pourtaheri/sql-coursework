

sqlite3 hw2.db

PRAGMA foreign_keys=ON;

CREATE TABLE FLIGHTS (fid int primary key, 
         month_id int,        -- 1-12
         day_of_month int,    -- 1-31 
         day_of_week_id int,  -- 1-7, 1 = Monday, 2 = Tuesday, etc
         carrier_id varchar(7), 
         flight_num int,
         origin_city varchar(34), 
         origin_state varchar(47), 
         dest_city varchar(34), 
         dest_state varchar(46), 
         departure_delay int, -- in mins
         taxi_out int,        -- in mins
         arrival_delay int,   -- in mins
         canceled int,        -- 1 means canceled
         actual_time int,     -- in mins
         distance int,        -- in miles
         capacity int, 
         price int            -- in $             
         );

.mode csv
.import 'flights-small.csv' FLIGHTS

CREATE TABLE CARRIERS (cid varchar(7) primary key, name varchar(83));

.import carriers.csv CARRIERS


CREATE TABLE MONTHS (mid int primary key, month varchar(9));
.import months.csv MONTHS


CREATE TABLE WEEKDAYS (did int primary key, day_of_week varchar(9)); 
.import weekdays.csv WEEKDAYS


SELECT DISTINCT F.flight_num AS flight_num
FROM FLIGHTS F
JOIN CARRIERS C ON F.carrier_id= C.cid
JOIN WEEKDAYS W ON F.day_of_week_id = W.did
JOIN MONTHS M   ON F.month_id= M.mid
WHERE W.day_of_week = 'Monday'
  AND C.name = 'Alaska Airlines Inc.'
  AND F.origin_city = 'Seattle WA'
  AND F.dest_city = 'Boston MA';

SELECT F1.flight_num, F1.origin_city, F1.dest_city, F1.actual_time, F2.flight_num,F2.origin_city, F2.dest_city, F2.actual_time
FROM FLIGHTS AS F1, FLIGHTS AS F2, MONTHS AS M
WHERE F1.fid= F2.fid 
    AND F1.month_id= M.mid
    AND M.mid= F2.month_id
    AND F1.origin_city='Seattle WA'
    AND F2.dest_city= 'Boston MA'
    AND F1.carrier_id= F2.carrier_id
    AND F1.day_of_week_id= F2.day_of_week_id =15
    AND M.month='July'



    
    