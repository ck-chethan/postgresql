SELECT * FROM cd.bookings;
SELECT * FROM cd.facilities;
SELECT * FROM cd.members;

SELECT name, membercost FROM cd.facilities;

SELECT name, membercost FROM cd.facilities
WHERE membercost > 0;

SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities
WHERE membercost > 0 AND 
membercost < (monthlymaintenance/50.0);

SELECT * FROM cd.facilities 
WHERE name LIKE '%Tennis%';

SELECT * FROM cd.facilities 
WHERE name ILIKE '%tennis%';

SELECT cd.bookings.starttime, cd.facilities.name 
FROM cd.facilities INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid
WHERE cd.facilities.name ILIKE 'Tennis Court%'
AND cd.bookings.starttime >= '2012-09-21'
AND cd.bookings.starttime < '2012-09-22'
ORDER BY cd.bookings.starttime;

SELECT cd.bookings.starttime, cd.facilities.name 
FROM cd.facilities INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid
WHERE cd.facilities.facid IN (0,1)
AND cd.bookings.starttime >= '2012-09-21'
AND cd.bookings.starttime < '2012-09-22'
ORDER BY cd.bookings.starttime;

SELECT cd.bookings.starttime 
FROM cd.bookings INNER JOIN cd.members
ON cd.bookings.memid = cd.members.memid
WHERE cd.members.firstname = 'David'
AND cd.members.surname = 'Farrell';
