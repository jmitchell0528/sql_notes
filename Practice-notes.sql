-- Create data <--- the -- is the start of a comment
/* multi line comment
*/

-- Create data
CREATE thing_we_want_to _create <-- SQL hates spaces

-- Read data
SELECT stuff_we_want_to_read

-- update data
UPDATE

-- delete data
DELETE

-- Create a table <-- tables have rows and columns, must tell it the column name and then the data type.
-- Text, number(can incl. fractions and decimals), integer(whole numbers, easier for SQL)
-- Statements must end with a semicolon
CREATE TABLE cars (
  id integer,
  nationality text,
  make text,
  model text,
  year integer
);

DROP TABLE if exists cars; --drops the previous table
CREATE TABLE cars (
  id integer primary key autoincrement, --Adding numbers for you
  nationality text,
  make text,
  model text,
  year integer
);

CREATE TABLE food (
	id integer primary key autoincrement,
	type text,
	ingredients integer
)

-- Create data for table, data lives in rows
/* INSERT INTO table_name (col_name, col_name...) VALUES (val1, val2, ...) must be entered in order. */
INSERT INTO cars
  (nationality, make, model, year)
VALUES
  ('USA', 'DeLorean', 'DeLorean', 1985),
	('Japan', 'Mitsubishi', 'Lancer Evolution V', 2002), -- <---- Add rows with commas
  ();

  -- Read operation: SELECT

SELECT col_name, ...
FROM table_name
-- Extra stuff...

-- Ex.
SELECT * -- <----selects all items in the table
FROM cars;

SELECT *
FROM cars
ORDER BY year;

SELECT *
FROM cars
ORDER BY year desc;

SELECT year, make, model
FROM cars
WHERE model != 'Chevette'
ORDER BY year desc;

SELECT year, make, model
FROM cars
WHERE model != 'Chevette' AND model != 'Pinto' AND year = 1988
ORDER BY year desc; -- <---make sure all of this is in this ORDER

-- Limit sets how many pieces of data you can view.

SELECT year, make, model
FROM cars
WHERE model != 'Chevette' AND model != 'Pinto' AND year = 1988
ORDER BY year desc
LIMIT 2 OFFSET 2; -- <---- offset asks where you want to start, ex, from 2 then start

SELECT *
FROM city
WHERE countrycode = 'ARG'
ORDER BY population desc
;

SELECT *
FROM city
WHERE countrycode = 'ARG'
ORDER BY name asc
LIMIT 5
;

SELECT COUNT(*) -- <----counts all your rows

-- COUNT()
-- MAX()
-- MIN()
-- SUM()

SELECT SUM(population) as world_population
FROM city
;

SELECT COUNT(*)
FROM city
WHERE population < 1000000;
;

-- ROUND()
-- LIKE '%'
-- UPPER()
-- LOWER()

SELECT *
FROM city
WHERE name LIKE '%town%'; ---- <----checking for town in the beginning and end of the word in a city name.

-- DISTINCT
SELECT COUNT(DISTINCT countrycode) -- <---stops repeats
FROM city
;

SELECT region, COUNT(*)
FROM country
GROUP BY region
ORDER BY COUNT(*) DESC;







--Review

--CRUD (Create, Read, Update, Delete)

--Ex.

-- CREATE TABLE bad_instructors (
--   id integer primary key autoincrement,
--   name text default 'Some Instructor',
--   score integer default 0
-- );

--Read
    --Select col_name
    --FROM table_name
    --WHERE
    --LIMIT # OFFSET

--OPERATORS
  -- <, >, =, !=, LIKE '%', IN, NOT IN, BETWEEN

--FUNCTIONS
    --SUM()
    --COUNTAVG()
    --MAXMIN()
    --TRIM()
    --LOWER()
    --UPPER()
    --ROUND()
    --CAST(num as text)

--Calculations
  --select score *2 as double_score

--Grouping/Aggregating
  --GROUP BY col_name
  --HAVING condition

  -- DELETE

  --update a row
  --UPDATE table_name
  --SET col=value, col2 = value2
  --WHERE id = someValue

  --update users
  --set name = 'Daan'
  --WHERE id = 3;

-- SELECT city.name, country.name
-- FROM city
-- JOIN country
-- ON city.countrycode = country.code;

--Joining multiple tables

-- SELECT city.name, countrylanguage.language
-- FROM city
-- JOIN countrylanguage
-- ON city.countrycode = countrylanguage.countrycode;

-- Breakout your data in a logical operations and tables

-- --Foreign key - referncual integritiy, links one table explicity to another table.
-- Keys are searched faster (best used in the WHERE)

--EX.

drop table if exists users;
create table users (
  user_id integer primary key autoincrement,
  username text,
  email text
);

create table photos (
  photo_id integer primary key autoincrement,
  user_id integer,
  photo_url text,
  foreign key (user_id) references users (user_id)
);

insert into users
    (username, email)
values
    ('Frasier Crane', 'imlistening@seattle.com'),
    ('Toby Farmer', 'ionceranforsenate@arizona.com');
select * from users;

insert into photos
    (user_id, photo_url)
values
    (1, 'http://someurl.com'),
    (2, 'http://pushingmykidintothepool.com'),
    (1, 'http://freud.com'),
    (2, 'http://arizonasucks.com');

 select *
 -- or SELECT user.username, photo.photo_url (to show only the user names and photo url)
 from users
 join photos
 on users.user_id = photos.user_id;

 --Short hand

-- select u.username, p.photo_url
-- from users u
-- join photos p
-- on u.user_id = p.user_id
 -- Breaking out/up data is called "Normalizing" the data


PostgreSQL console commands

Type psql in search to open console
\h (for help)
\l (show all the databases you have created) don't mess with the templates
\c "database name" (connect to one of the data bases)
Create database somename
\dt (describe table, show table content)
\o (to go back a line)
\q (quit)

PGAdmin
to view information from PostgreSQL

How to upload a .csv file





-- Review
--
-- Client side:
--   -HTML
--   -CSS
--   -Javascript
--     ----Connects to server with:
--         HTTP and .JSON
--
-- Server side:
--   -Node
--   -Express Server
--     ----Connects to database with:
--         SQL and PostgreSQL
--
-- Database Server:
--   -SQL
--   -PostgreSQL
--   -PGAdmin
--   -Postico
--     -Need: Username, Password, Host, and Port

PostgreSQL for git bash:
psql (name of database) username(postgres)

To create:
create database (name of database);

To delete:
drop database (name of database);
