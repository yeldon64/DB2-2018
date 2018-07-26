#1)Genere un reporte mostrando el nombre y apellido de cada customer con la cantidad
de películas que alquilo y la cantidad de dinero que ha gastado.
La cantidad de películas debe ser el total (incluyendo las que no ha devuelto todavía)
mostrar solo los clientes que hayan gastado entre 100 y 150 dolares.

SELECT CONCAT(customer.first_name,' ',customer.last_name) as Name, SUM(amount) as Amount, count(1) as 'Films rented'
FROM payment
INNER JOIN `customer` using (customer_id) 
GROUP BY customer.last_name, customer.first_name
HAVING amount BETWEEN 100 AND 150;


#2)Muestre un reporte de la cantidad de películas rentadas por país y por categoría de películas
Columnas a mostrar nombre del país, nombre la categoría y cantidad de películas alquiladas
Ejemplo:
Pais Categoria Cantidad
Argentina Action 25
Argentina Animation 26
Argentina Children 13
Argentina Classics 18

SELECT country, category.name, count(*) as cantidad
FROM country
INNER JOIN `city` USING (country_id)
INNER JOIN `address` USING (city_id)
INNER JOIN `customer` USING (address_id)
INNER JOIN `rental` USING (customer_id)
INNER JOIN `inventory` USING (inventory_id)
INNER JOIN `film` USING (film_id)
INNER JOIN `film_category` USING (film_id)
INNER JOIN `category` USING (category_id),
GROUP BY country,name;


#3)Muestre la cantidad películas que tienen los clientes alquiladas (es decir que todavía no se han devuelto)
agrupadas por rating (G, PG, etc...)

SELECT rating, count(1) as 'Films not returned' 
FROM inventory
INNER JOIN `film` using (film_id)
INNER JOIN `rental` using (inventory_id)
WHERE return_date IS NULL
GROUP BY rating;


#4)
SELECT actor_id, actor.first_name, actor.last_name, count(film_actor.actor_id), customer_id, customer.first_name, customer.last_name
FROM actor
inner join `film_actor` using (actor_id)
inner join `film` using (film_id)
RIGHT JOIN `customer` using (last_name)
GROUP BY actor_id,customer_id;




