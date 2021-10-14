-- Week 4 - Wednesday Questions

-- 1. List all customers who live in Texas (useJOINs)
SELECT first_name, last_name, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';
-- Answer = Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still

-- 2. Get all payments above $6.99 with the Customer's FullName
SELECT first_name, last_name, amount
FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;
-- Answer = 1406 payments made above $6.99

-- 3. Show all customers names who have made at least 4 payments (use subqueries)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	group by customer_id
	having count(customer_id) > 4
	order by customer_id
);
-- Answer = All? I do not think this is right but it is the best I could figure out

-- 4. List all customers that live in Nepal (use the city table)
SELECT first_name, last_name, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';
-- Answer: Kevin Schuler

-- 5. Which staff member (first/last name) had the most transactions?
SELECT first_name, last_name, SUM(rental.staff_id)
FROM staff
JOIN rental
ON staff.staff_id = rental.staff_id
GROUP BY staff.staff_id
ORDER BY SUM(rental.staff_id);
-- Answer = Jon Stephens, 16008

-- 6. Which movie title(s) has been rented the most?
Select title, count(title)
from rental
Join inventory 
ON rental.inventory_id = inventory.inventory_id 
JOIN film
ON inventory.film_id = film.film_id
group by title
order by count(title) desc
-- Answer = Bucket Brotherhood, 34 times

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
);
-- Answer = 539 customers made a payment above $6.99

-- 8. Which employee gave out the most free rentals?
SELECT first_name, last_name, count(amount)
FROM payment
JOIN staff
ON payment.staff_id = staff.staff_id
WHERE amount = 0
GROUP BY first_name, last_name
ORDER BY count(amount) desc;
-- Answer = Mike Hillyer
