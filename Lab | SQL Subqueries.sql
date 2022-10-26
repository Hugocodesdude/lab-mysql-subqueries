use sakila;

-- 1 -- 
SELECT count(inventory.film_id) , film.title
FROM inventory
JOIN film
	ON inventory.film_id = film.film_id
WHERE film.title = 'Hunchback Impossible';


-- 2 -- 
SELECT film.rental_duration, film.title
FROM inventory
WHERE film.rental_duration > (SELECT AVG (rental_duration) FROM film);


-- 3 -- 
SELECT first_name, last_name FROM actor
	WHERE actor_id IN (SELECT actor_id FROM film_actor 
		WHERE film_id IN (SELECT film_id FROM film
			WHERE title = 'Alone Trip'))

-- 4 -- 

SELECT category_id, name FROM inventory
	WHERE category_id IN (SELECT category_id FROM film_category 
		WHERE name IN (SELECT name FROM category
			WHERE title = 'family films'))


-- 5 --

select customer.address_id,city.city_id,city.country_id,country,last_name,email
	from customer
	join address
	on customer.address_id=address.address_id
    join city
    on address.city_id=city.city_id
    join country
    on city.country_id=country.country_id
    where country='Canada'
;

-- 6 --

SELECT actor.first_name, actor.last_name, COUNT(actor.actor_id) as `Total Films`
	FROM actor
	JOIN film_actor
		ON actor.actor_id = film_actor.actor_id
    JOIN film
		ON film_actor.film_id = film.film_id
	GROUP BY actor.actor_id
    ORDER BY `Total Films` DESc
    limit 1;
    
    -- 7 --
    
    select sum(amount), customer.customer_id,last_name
from payment
join customer
on payment.customer_id=customer.customer_id
group by customer_id
order by sum(amount) desc
limit 1;