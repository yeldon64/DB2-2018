#1)
INSERT INTO customer(store_id,first_name,last_name,address_id)
SELECT 1 ,"Julian","Luna", address_id 
FROM address 
INNER JOIN city USING (city_id) 
INNER JOIN country USING (country_id)
WHERE country = "UNITED STATES"
ORDER BY address_id DESC
LIMIT 1;

INSERT INTO customer(store_id,first_name,last_name,address_id)
VALUES (1,"Julian","Luna",(SELECT address_id FROM address 
INNER JOIN city USING (city_id) 
INNER JOIN country USING (country_id)
WHERE country = "UNITED STATES"
ORDER BY address_id DESC
LIMIT 1));


#2)
INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id)
VALUES (CURRENT_DATE(),
(SELECT inventory_id FROM inventory INNER JOIN film USING (film_id) WHERE title = "ZORRO ARK" ORDER BY inventory_id LIMIT 1),
 601, 
 (SELECT staff_id FROM staff INNER JOIN store ON staff.staff_id = store.manager_staff_id WHERE store.store_id = 2));

#3)
UPDATE film
SET release_year = CASE
WHEN rating = "G" THEN 2018
WHEN rating = "PG" THEN 2017
WHEN rating = "PG-13" THEN 2016
WHEN rating = "R" THEN 2015
WHEN rating = "NC-17" THEN 2014
END;


#4) 
SELECT * FROM rental WHERE return_date IS NULL ORDER BY rental_date DESC LIMIT 1;


UPDATE rental
SET return_date = CURRENT_DATE()
WHERE rental_id = 16050;

#UPDATE payment 
#SET amount = amount + 4.99, payment_date = CURRENT_DATE()
#WHERE rental_id = 14098;


#5)
DELETE FROM film WHERE film_id= 1;

--Cannot delete or update a parent row: a foreign key constraint fails (`sakila`.`film_actor`, CONSTRAINT `fk_film_actor_film` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON UPDATE CASCADE)
-- no se puede eliminar porque la pelicula contiene una foreign key a la tabla film_actor

DELETE payment FROM rental 	INNER JOIN payment USING (rental_id) INNER JOIN inventory USING (inventory_id) WHERE film_id = 1;
DELETE rental FROM inventory INNER JOIN rental USING (inventory_id)	WHERE film_id = 1;
DELETE FROM inventory WHERE film_id = 1;
DELETE film_actor FROM film_actor WHERE film_id = 1;
DELETE film_category FROM film_category WHERE film_id = 1;
DELETE film FROM film WHERE film_id = 1;

#6)





