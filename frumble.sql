-- Problem 4a)    
CREATE TABLE frumbleTable (name varchar(100),discount varchar(4),
                           month varchar(3),
                           price int);

-- Problem 4b)
-- name → price 
SELECT *
FROM frumbleTable T1, frumbleTable T2
WHERE T1.name = T2.name AND T1.price != T2.price

-- month → discount
SELECT *
FROM frumbleTable T1, frumbleTable T2
WHERE T1.month = T2.month AND T1.discount != T2.discount


-- month, price → discount, name 
SELECT *
FROM frumbleTable T1, frumbleTable T2
WHERE T1.month = T2.month AND T1.price = T2.price
                          AND T1.discount != T2.discount 
                          AND T1.name != T2.name

-- name, month → price, discount 
-- name, discount → price, month 
SELECT *
FROM frumbleTable T1, frumbleTable T2
WHERE T1.name = T2.name AND T1.discount = T2.discount
                        AND T1.price != T2.price 
                        AND T1.month != T2.month

-- FDs:
-- name -> price
-- month -> discount
-- name, month -> price, discount
-- name, discount -> price, month
-- month, price -> discount, name


-- Problem 4c)

--R(name,price,discount,month)
--{name}+ = {name,price} 
--{name}+ != {name}
--{name}+ != {name,price,discount,month}

--So R(name,price,discount,month) : R1(name,price) and R2(name,discount,month)

--For R2(name,discount,month)
--{month}+ = {month, discount}
--{month}+ != {month}
--{month}+ != {name,discount,month}

--So R2(name,discount,month) : R3(month,discount) and R4 (month, name)

--BCNF: R1(name,price), R3(month,discount) and R4 (month, name)


CREATE TABLE MapNameToPrice (name varchar(100) PRIMARY KEY,
                             price int
);

CREATE TABLE MapMonthToDiscount (month varchar(3) PRIMARY KEY,
                                 discount varchar(4)
);

CREATE TABLE MapNameToMonth (name varchar(100) REFERENCES MapNameToPrice(name),
                             month varchar(3) REFERENCES MapMonthToDiscount(month)
);

-- Problem 4d)

INSERT INTO MapNameToPrice
SELECT DISTINCT name, Price
FROM frumbleTable

INSERT INTO MapMonthToDiscount
SELECT DISTINCT discount, month
FROM frumbleTable

INSERT INTO MapNameToMonth
SELECT DISTINCT name, month
FROM frumbleTable

-- Size of the table: 36 rows
SELECT COUNT(*)
FROM MapNameToPrice

-- Size of the table: 12 rows
SELECT COUNT(*)
FROM MapMonthToDiscount

-- Size of the table: 426 rows
SELECT COUNT(*)
FROM MapNameToMonth