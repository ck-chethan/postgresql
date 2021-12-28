select * from film;

SELECT * FROM customer;

SELECT DISTINCT(rental_rate) from film;

SELECT COUNT(*) FROM payment;
SELECT COUNT(DISTINCT amount) FROM payment;

SELECT * FROM customer ORDER BY first_name ASC;
SELECT * FROM customer ORDER BY first_name DESC;

SELECT store_id, first_name, last_name FROM customer ORDER BY store_id, first_name;
SELECT store_id, first_name, last_name FROM customer ORDER BY store_id DESC, first_name ASC;

SELECT * FROM payment ORDER BY payment_date DESC LIMIT 15000;

SELECT COUNT(*) FROM payment WHERE amount BETWEEN 8 AND 9;

SELECT * FROM payment WHERE amount IN (.99, 1.98, 1.99);

SELECT COUNT(*) FROM customer WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';
SELECT COUNT(*) FROM customer WHERE first_name ILIKE 'j%' AND last_name ILIKE 's_%';


SELECT MIN(replacement_cost) FROM film;
SELECT MIN(replacement_cost), MAX(replacement_cost) FROM film;
SELECT AVG(replacement_cost) FROM film;
SELECT ROUND(AVG(replacement_cost), 2) FROM film;
SELECT SUM(replacement_cost) FROM film;
SELECT ROUND(SUM(replacement_cost), 3) FROM film;


SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY customer_id;
SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC;
SELECT customer_id, COUNT(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC;

SELECT customer_id, staff_id, amount FROM payment ORDER BY customer_id;

SELECT customer_id, staff_id, SUM(amount) FROM payment 
GROUP BY staff_id, customer_id 
ORDER BY customer_id, staff_id;

SELECT DATE(payment_date), SUM(amount) FROM payment 
GROUP BY DATE(payment_date) 
ORDER BY SUM(amount) DESC;

select COUNT(*) FROM payment;

SELECT staff_id, COUNT(payment_id) FROM payment 
GROUP BY staff_id 
ORDER BY COUNT(payment_id) DESC 
LIMIT 1;

SELECT rating, ROUND(AVG(replacement_cost),2) FROM film GROUP BY rating;

SELECT customer_id, SUM(amount) FROM payment 
GROUP BY customer_id 
ORDER BY SUM(amount) DESC LIMIT 5;

SELECT customer_id, SUM(amount) FROM payment
WHERE customer_id NOT IN (184, 87)
GROUP BY customer_id 
HAVING SUM(amount) < 50 
ORDER BY SUM(amount) DESC;

SELECT store_id, COUNT(*) FROM customer
GROUP BY store_id
HAVING COUNT(*) > 300;

SELECT customer_id, COUNT(payment_id) FROM payment 
GROUP BY customer_id
HAVING COUNT(payment_id) >= 40;
-- or Both are same--
SELECT customer_id, COUNT(*) FROM payment 
GROUP BY customer_id
HAVING COUNT(*) >= 40;

SELECT customer_id, SUM(amount) FROM payment 
WHERE staff_id = 2 
GROUP BY customer_id
HAVING SUM(amount) >= 100;

SELECT customer_id FROM payment 
WHERE staff_id = 2 
GROUP BY customer_id
HAVING SUM(amount) >= 110;

SELECT COUNT(*) FROM film 
WHERE title LIKE 'J%';

SELECT MAX(customer_id) FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500;

SELECT * FROM customer 
WHERE customer_id = 434;

-- AS WILL ALWAYS ASSIGN AT END SO WE NEED TO USE ORIGINAL COLUMN NAME--
SELECT customer_id, SUM(amount) AS total_spent FROM payment
GROUP BY customer_id
HAVING SUM(amount) < 100;

SELECT Distinct(Customer.customer_id), email 
FROM customer INNER JOIN payment 
ON Customer.customer_id = Payment.customer_id
ORDER BY Customer.customer_id;

SELECT * 
FROM customer FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.payment_id IS null;

-- LEFT OUTER JOIN --
SELECT Distinct(Customer.customer_id), email
FROM customer LEFT OUTER JOIN payment
ON customer.customer_id = payment.customer_id;

-- UNIQUE TO TABLE A --
SELECT Distinct(Customer.customer_id), email
FROM customer LEFT OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.customer_id IS null;


SELECT * FROM film;
SELECT * FROM inventory;
-- LEFT OUTER JOIN is same as LEFT JOIN --
SELECT film.film_id, title, inventory_id, store_id
FROM film
LEFT JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS null;


-- RIGHT OUTER JOIN --
SELECT Distinct(Customer.customer_id), email
FROM customer RIGHT OUTER JOIN payment
ON customer.customer_id = payment.customer_id;

-- UNIQUE TO TABLE A --
SELECT Distinct(payment.customer_id), email
FROM customer RIGHT OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null;

-- RIGHT OUTER JOIN is same as RIGHT JOIN --
SELECT film.film_id, title, inventory_id, store_id
FROM inventory
RIGHT JOIN film
ON film.film_id = inventory.film_id
WHERE inventory.film_id IS null;

SELECT * FROM address;
SELECT * FROM customer;

SELECT district, email 
FROM customer INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'California';

SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM actor;

SELECT film_id, title
FROM film 
WHERE film_id 
IN (
SELECT film_id 
FROM actor LEFT OUTER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg')
ORDER BY film_id;

SELECT film.film_id, title 
FROM film INNER JOIN film_actor
ON film.film_id = film_actor.film_id
WHERE film_actor.actor_id 
IN (
	SELECT actor_id from actor WHERE first_name = 'Nick' AND last_name = 'Wahlberg'
);


SELECT title, first_name, last_name 
FROM actor LEFT OUTER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg';

SHOW ALL;
SHOW TIMEZONE;
SELECT NOW();
SELECT TIMEOFDAY();
SELECT CURRENT_TIME;
SELECT CURRENT_DATE;

SELECT EXTRACT(YEAR FROM payment_date) AS my_year 
FROM payment;
SELECT EXTRACT(MONTH FROM payment_date) AS my_month 
FROM payment;
SELECT EXTRACT(DAY FROM payment_date) AS my_day
FROM payment;
SELECT EXTRACT(WEEK FROM payment_date) AS my_week
FROM payment;
SELECT EXTRACT(QUARTER FROM payment_date) AS my_quarter
FROM payment;

SELECT * FROM payment WHERE customer_id = 341;

SELECT AGE(payment_date) FROM payment ORDER BY AGE(payment_date) DESC;
SELECT TO_CHAR(payment_date, 'DD-MM-YYYY') FROM payment;

SELECT DISTINCT(TO_CHAR(payment_date, 'Month')) FROM payment;

SELECT COUNT(*) FROM payment WHERE EXTRACT(dow FROM payment_date) = 1;
SELECT COUNT(*) FROM payment WHERE TO_CHAR(payment_date, 'DAY') = 'MONDAY   ';


SELECT ROUND(rental_rate/replacement_cost,2)*100+100-100 AS some_cost FROM film;

SELECT UPPER(first_name) || ' ' || UPPER(last_name) AS full_name
FROM customer;

SELECT LOWER(LEFT(first_name,1)) || LOWER(last_name) || '@gmail.com' AS new_email
FROM customer;


SELECT title, rental_rate
FROM film
WHERE rental_rate > 
(SELECT AVG(rental_rate) from film);

SELECT film_id, title 
FROM film
WHERE film_id IN (
SELECT inventory.film_id
FROM rental
INNER JOIN inventory 
ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30');

SELECT first_name, last_name
FROM customer AS c
WHERE EXISTS
(SELECT * FROM payment as p
WHERE p.customer_id = c.customer_id AND amount > 11);


SELECT f1.title, f2.title, f1.length 
FROM film as f1 INNER JOIN film as f2
ON f1.film_id != f2.film_id
AND f1.length = f2.length;

SELECT customer_id,
CASE 
	WHEN (customer_id <= 100) THEN 'Premium'
	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
	ELSE 'Others'
END AS Customer_class
FROM customer;

SELECT customer_id,
CASE customer_id
	WHEN 1 THEN 'Winner'
	WHEN 2 THEN 'Runner'
	WHEN 3 THEN 'Runner2'
	ELSE 'Others'
END AS Customer_class
FROM customer;

SELECT rental_rate,
CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END
FROM film;

SELECT 
SUM(CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS bargains,
SUM(CASE rental_rate
	WHEN 2.99 THEN 1
	ELSE 0
END) AS regular,
SUM(CASE rental_rate
	WHEN 4.99 THEN 1
	ELSE 0
END) AS premium
FROM film;

SELECT 
CASE rating
	WHEN 'R' THEN 1
	ELSE 0
END AS R
FROM film;

SELECT 
SUM(CASE rating
	WHEN 'R' THEN 1
	ELSE 0
END) AS r,
SUM(CASE rating
	WHEN 'PG' THEN 1
	ELSE 0
END) AS pg,
SUM(CASE rating
	WHEN 'PG-13' THEN 1
	ELSE 0
END) AS pg13
FROM film;
