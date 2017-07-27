-- PERSON
--
-- 1. Create a table called Person that records a person's Name, Age, Height, City, FavoriteColor, and Id. Id should be an auto-incrementing id/primary key.
--

CREATE TABLE Person (
  Name text,
  Age integer,
  Height text,
  City text,
  FavoriteColor text,
  ID integer primary key autoincrement
);


-- 2. Add 5 different people into the Person database. Remember to not include the Id because it should auto-increment.
--

INSERT INTO Person
  (name, age, height, city, FavoriteColor)
VALUES
  ('George', 34, "5'11", 'Denver', 'Red'),
  ('James', 23, "5'9", 'Portland', 'Yellow'),
  ('Erin', 27, "5'4", 'Tampa', 'Violet'),
  ('Francis', 32, "6'1", 'New York', 'Cerulean'),
  ('Preston', 19, "6'3", 'Savannah', 'Pale Rose'),
  ('Yvonne', 18, "4'11", 'Nashville', 'Orange'),
  ('Camron', 17, "5'10", 'New Orleans', 'Blue'),
  ('Jesse', 38, "5'7", 'New England', 'Green')
;

-- 3. List the people in the Person table by Height from tallest to shortest (descending)

SELECT *
FROM Person
ORDER BY height desc
;

--
-- (For this database to create an auto incrementing field set it's type to INTEGER PRIMARY KEY AUTOINCREMENT)

-- List the people in the Person table by Height from shortest to tallest (ascending)

SELECT *
FROM Person
ORDER BY height asc
;

-- List all the people in the Person table by oldest first

SELECT *
FROM Person
ORDER BY age desc
;

-- List all the people in the Person table older than age 20.

SELECT *
FROM Person
Where age > 20
;

-- List all the people in the Person table that are exactly 18.

SELECT *
FROM Person
Where age = 18
;

-- List all Person that are less than 20 and older than 30.

SELECT *
FROM Person
Where age < 20 OR age > 30 -- <--Use or here, and is for both. There is no way they can be under 20 and over 30 at the same time.
;

-- List all Person that are not 27 (Use not equals)

SELECT *
FROM Person
Where age != 27
;

-- List all Person where their favorite color is not red

SELECT *
FROM Person
Where FavoriteColor != 'Red'
;

-- List all Person where their favorite color is not red or blue

SELECT *
FROM Person
Where FavoriteColor != 'Red' AND FavoriteColor != 'Blue'
;
-- ---> OR
-- SELECT *
-- FROM Person
-- Where FavoriteColor not in ('Red', 'Blue')
-- ;

-- List all Person where their favorite color is orange or green

SELECT *
FROM Person
Where FavoriteColor in ('Orange', 'Green')
;

-- List all Person where their favorite color is orange, green or blue (use IN)

SELECT *
FROM Person
Where FavoriteColor in ('Orange', 'Green', 'Blue')
;

-- List all Person where their favorite color is yellow or purple

SELECT *
FROM Person
Where FavoriteColor in ('Yellow', 'Violet')
;



-- ORDER
--
-- 4. Create a table called Orders that records the productName, productPrice, Quantity, and personId

CREATE TABLE Orders (
  productName text,
  productPrice integer,
  quantity integer,
  personId integer primary key autoincrement
);
--
-- 5. Add 5 Orders to Order table
--
INSERT INTO Orders
  (productName, productPrice, quantity)
VALUES
  ('Salad Bowl', 12, 2),
  ('Fiesta Bowl', 16, 1),
  ('Taco Bowl', 13, 3),
  ('Veggie Bowl', 8, 1),
  ('Seafood Bowl', 20, 4)
  ;

-- 6. Select all the records from the Order table

SELECT *
FROM Orders
;
--
-- Calculate the total number of products Ordered

SELECT SUM(quantity)
FROM Orders
;
-- // 11 total
--
-- Calculate the total Order Price
--
SELECT SUM(productPrice)
FROM Orders
;
-- // $69 total

-- Calculate the total Order Price By personId (If you only made orders for 1 person, go add more for the other people)

SELECT personid, SUM(productprice * quantity) AS the_real_total -- <--keyword 'AS' adds a new table of sorts to the existing table as a new label
FROM neworders
GROUP BY personid;



-- Artists
--
-- 7. Add 3 new Artists to the Artist table

INSERT INTO Artist
  (name)
VALUES
  ('Michael Jackson'),
  ('Prince'),
  ('Tina Turner')
  ;
--
-- Select the top 10 artists in reverse alphabetical order

SELECT *
FROM Artist
ORDER BY name desc
LIMIT 10
;

-- Select the top 5 artists in alphabetical order

SELECT *
FROM Artist
ORDER BY name
LIMIT 5
;

-- Select all artists that start with the word Black

SELECT *
FROM Artist
WHERE name LIKE 'black%'
;

-- Select all artists that contain the word Black

SELECT *
FROM Artist
WHERE name LIKE '%black%'
;
--


-- Employee
--
-- 8. Add 2 new Employees to the Employee table

INSERT INTO Employee (
  lastname, firstname, title, ReportsTo, birthdate, hiredate, address, city, state, country, Postalcode, phone, fax, email)
VALUES
  ('Legar', 'James', 'IT Staff', 4, '1984-06-19 00:00:00', '2006-02-04 00:00:00', '16704 Winter ST', 'Lethbridge', 'AB', 'Canada', 'T2P 1Y4', "1 (780) 456-9789", "1 (403) 978-2479", 'james@chinookcorp.com'),
  ('Kane', 'Lisa', 'Sales Manager', 4, '1978-03-26 00:00:00', '2004-05-12 00:00:00', '98567 Peter ST', 'Edmonton', 'AB', 'Canada', 'T1K 1G4', "1 (403) 412-9746", "1 (780) 973-3482", 'lisa@chinookcorp.com')
;
--
-- List all Employee first and last names only that live in Calgary

SELECT firstname, lastname, city
FROM employee
WHERE city = 'Calgary'
;

-- Find the first and last name for the youngest employee

SELECT firstname, lastname, birthdate
FROM employee
ORDER BY birthdate desc
LIMIT 1
;

-- Find the first and last name for the oldest employee

SELECT firstname, lastname, birthdate
FROM employee
ORDER BY birthdate ASC
LIMIT 1
;

-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column)

SELECT *
FROM employee
WHERE reportsto = 1
;

-- Count how many people live in Lethbridge

SELECT COUNT(*)
FROM employee
WHERE city = 'Lethbridge'
;
--


-- Invoice
--
-- 9. Use the Invoice table for the following:
--
-- Count how many orders were made from the USA

SELECT COUNT(*)
FROM invoice
WHERE billingcountry = 'USA'
;

-- Find the largest order total amount

SELECT MAX(total)
FROM invoice
;

-- Find the smallest order total amount

SELECT MIN(total)
FROM invoice
;

-- Find all orders bigger than $5

SELECT *
FROM invoice
WHERE total > 5
;

-- Count how many orders were smaller than $5

SELECT COUNT(*)
FROM invoice
WHERE total < 5
;

-- Count how many orders were in CA, TX, or AZ (use IN)

SELECT COUNT(*)
FROM invoice
WHERE billingstate IN ('CA', 'TX', 'AZ')
;

-- Get the average total of the orders

SELECT AVG(total)
FROM invoice
;

-- Get the total sum of the orders

SELECT SUM(total)
FROM invoice
;
