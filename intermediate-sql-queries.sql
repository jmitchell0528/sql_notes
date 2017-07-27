-- Practice joins
--
-- Use at least one join for all of the following
--
-- Examples
--
-- Select [Column names] from [Table] [abbv] join [Table2] [abbv2] on abbv.prop=abbv2.prop where [Conditions]
--
-- Select a.Name, b.Name from someTable a join anotherTable b on a.someid=b.someid
-- Select a.Name, b.Name from someTable a join anotherTable b on a.someid=b.someid where b.email='e@mail.com'


-- Get all invoices where the unit price on the invoice line is greater than $0.99

SELECT invoice.invoiceid, invoice.customerid, invoiceline.unitprice
FROM invoice
JOIN invoiceline
ON invoice.invoiceid = invoiceline.invoiceid
WHERE unitprice > 0.99;
--
-- Get all invoices and show me their invoice date, customer first and last names, and total
--
SELECT invoice.invoicedate, customer.firstname, customer.lastname, invoice.total
FROM invoice
JOIN customer
ON invoice.customerid = customer.customerid;

-- Get all customers and show me their first name, last name, and support rep first name and last name (support reps are on the Employees table)
--
SELECT c.firstname, c.lastname, e.firstname, e.lastname, c.supportrepid
FROM customer as c
JOIN employee as e
ON c.supportrepid = e.employeeid;

-- Get all Albums and show me the album title and the artist name

SELECT a.title, ar.name
FROM album as a
JOIN artist as ar
ON a.artistid = ar.artistid;
--
-- Get all Playlist Tracks where the playlist name is Music

SELECT p.playlistid, p.name, pt.trackid, t.name
FROM playlist as p
JOIN playlisttrack as pt
ON pt.playlistid = p.playlistid
JOIN track t   -- <----join where there is a shared middleground
on pt.trackid = t.trackid --- <---playlisttrack is the table in the middle.
WHERE p.name LIKE 'Music';
-- > shortcut
select p.playlistid, p.trackid, t.name from playlisttrack p
join track t
on p.trackid = t.trackid
where playlistid in (1, 8);

-- Get all Tracknames for playlistId 5

SELECT t.name, p.playlistid
FROM playlisttrack as p
JOIN track as t
ON p.trackid = t.trackid
WHERE p.playlistid = 5;
--
-- Now we want all tracknames and the playlist name that they're on (You'll have to use 2 joins)
--
SELECT p.playlistid, p.name, t.name
FROM playlist as p
JOIN playlisttrack as pt
ON p.playlistid = pt.playlistid
JOIN track as t
ON pt.trackid = t.trackid;

-- Get all Tracks that are alternative and show me the track name and the album name (2 joins)
--
SELECT t.name, a.title, g.name
FROM album as a
JOIN track as t
ON a.albumid = t.albumid
JOIN genre as g
ON g.genreid = t.genreid
WHERE g.name = 'Alternative';

-- Black Diamond :
--
-- Get all tracks on the playlist(s) called Music and show their name, genre name, album name, and artist name (at least 5 joins)

SELECT ar.name as Artist, a.title as Album, t.name as Song, g.name as Genre, p.name as Playlist
FROM album as a
JOIN artist as ar
ON a.artistid = ar.artistid
JOIN track as t
ON t.albumid = a.albumid
JOIN genre as g
ON g.genreid = t.genreid
JOIN playlisttrack as pt
ON pt.trackid = t.trackid
JOIN playlist as p
ON p.playlistid = pt.playlistid
WHERE p.name = 'Music'




-- Practice nested queries
--
-- Use no joins for the following queries. Use only nested queries.
--
-- Examples
--
-- Select [Column names] from [Table] where columnId in (select columnId from [Table2] where [Condition])
--
-- Select Name, email from athlete where athleteId in (select personId from pieEaters where flavor='Apple')
-- Get all invoices where the unit price on the invoice line is greater than $0.99

SELECT *
FROM invoice
where invoiceid in
  (
  	SELECT invoiceid
  	FROM invoiceline as iv
  	WHERE unitprice > 0.99
  );

-- Get all Playlist Tracks where the playlist name is Music

SELECT *
FROM playlisttrack as pt
WHERE playlistid in
	(
      SELECT playlistid
      FROM playlist
      WHERE name = 'Music'
    )
;

-- Get all Tracknames for playlistId 5

SELECT t.name
FROM track as t
WHERE trackid in
  (
  SELECT trackid
  FROM playlisttrack as pt
  WHERE playlistid in
      (
        SELECT playlistid
        FROM playlist
        WHERE playlistid = 5
      )
  )

-- Get all tracks where the genre is comedy

SELECT t.name
FROM track as t
WHERE genreid in
  (
  SELECT genreid
  FROM genre as g
  WHERE name = 'Comedy'
  )
  ;

-- Get all tracks where the album is Fireball

SELECT t.name
FROM track as t
WHERE albumid in
  (
  SELECT albumid
  FROM album as g
  WHERE title = 'Fireball'
  )
  ;

-- Get all tracks for the artist queen Queen (2 nested subqueries)

--Not doing this one -_-



-- Practice updating Rows
--
-- Examples
--
-- Update [Table] set [column1]=[value1], [column2]=[value2] where [Condition]
--
-- Update Athletes set sport='Picklball' where sport='pockleball'

-- Find all customers with fax numbers and set those numbers to null

UPDATE customer
SET fax = 'Null'
;
--
-- Find all customers with no company (null) and set their company to self
--
UPDATE customer
SET company = 'self'
WHERE company IS null
;
--
-- Find the customer Julia Barnett and change her last name to Thompson

UPDATE customer
SET lastname = 'Thompson'
WHERE lastname = 'Barnett'
;

-- Find the customer with this email luisrojas@yahoo.cl and change his support rep to rep 4
--

-- Find all tracks that are of the genre Metal and that have no composer and set the composer to be 'The darkness around us'



Group by

Find a count of how many tracks there are per genre
Find a count of all Tracks where the Genre is pop
Find a list of all artist and how many albums they have
