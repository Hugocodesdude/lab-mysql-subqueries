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

-- 4 -- Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.


