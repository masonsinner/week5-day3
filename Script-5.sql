-- QUESTION 1

SELECT c.customer_id, c.address_id, a.district 
FROM customer c 
JOIN address a 
ON c.address_id = a.address_id 
WHERE a.district = 'Texas';

-- QUESTION 2
select c.first_name, c.last_name, p.amount 
from payment p 
join customer c 
on p.customer_id = c.customer_id 
where p.amount >= '7.00';

-- QUESTION 3
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

-- QUESTION 4
SELECT c.first_name, c.last_name, co.country 
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
join country co on ci.country_id = co.country_id 
WHERE co.country = 'Argentina';

-- QUESTION 5
select *
from film_category fc 
order by category_id desc;

-- QUESTION 6
SELECT f.film_id, f.title, f.release_year, f.language_id, f.length, f.rating
FROM film f
JOIN (
    SELECT film_id
    FROM film_actor
    GROUP BY film_id
    ORDER BY COUNT(actor_id) DESC
    LIMIT 1
) fa ON f.film_id = fa.film_id;

-- QUESTION 7 
SELECT actor_id, COUNT(film_id) AS film_count
FROM film_actor
GROUP BY actor_id
ORDER BY film_count ASC
LIMIT 1;

-- QUESTION 8
SELECT c.country_id, COUNT(*) AS city_count
FROM city c 
GROUP BY country_id
ORDER BY city_count DESC
LIMIT 1;

-- QUESTION 9
SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
HAVING COUNT(*) BETWEEN 20 AND 25;