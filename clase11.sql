#1)
SELECT country, count(*) 
FROM city 
inner join `country` using (country_id) 
group by country;

#2)
SELECT country, count(*) 
FROM city 
inner join `country` using (country_id)
group by country 
having count(*)>10 
order by count(*) desc;

#3) 
#w/subqueries

SELECT payment.customer_id,customer.last_name, customer.first_name, address.address, SUM(amount) as amount, count(1) as films_rented
from payment,customer,address
where payment.customer_id = customer.customer_id and customer.address_id = address.address_id
GROUP by payment.customer_id, customer.last_name, customer.first_name, address.address
ORDER BY SUM(amount) DESC;

#w/inner join (on)

SELECT payment.customer_id,customer.last_name, customer.first_name, address.address, SUM(amount) as amount, count(1) as films_rented
from payment
inner join `customer` on payment.customer_id = customer.customer_id 
inner join `address` on customer.address_id = address.address_id
GROUP by payment.customer_id, customer.last_name, customer.first_name, address.address
ORDER BY SUM(amount) DESC;

#w/inner join (using)

SELECT payment.customer_id,customer.last_name, customer.first_name, address.address, SUM(amount) as amount, count(1) as films_rented
from payment
inner join `customer` using (customer_id) 
inner join `address` using (address_id)
GROUP by payment.customer_id, customer.last_name, customer.first_name, address.address
ORDER BY SUM(amount) DESC;

#4)
SELECT title from film where title not in (SELECT title
from film inner join `inventory` using (film_id));

#or

SELECT DISTINCT film.title
FROM film LEFT JOIN inventory USING (film_id) 
where inventory.inventory_id IS NULL;


#5)
SELECT film.title, inventory_id
FROM film 
	INNER JOIN inventory USING (film_id)
	LEFT JOIN rental USING (inventory_id)
WHERE rental_id IS NULL;


#6)
SELECT c.first_name, c.last_name, i.store_id, f.title, r.rental_date, r.return_date
FROM customer c 
	INNER JOIN rental r USING(customer_id)
	INNER JOIN inventory i USING(inventory_id)
	INNER JOIN film f USING(film_id)
	WHERE r.return_date IS NOT NULL
ORDER BY i.store_id, c.last_name;

#7)
SELECT st.store_id, ci.city, co.country, CONCAT(s.first_name,' ',s.last_name) AS Manager, SUM(p.amount) AS total_sales
FROM store st
	INNER JOIN address a USING(address_id)
	INNER JOIN city ci USING(city_id)
	INNER JOIN country co USING(country_id)
	INNER JOIN staff s
		ON st.manager_staff_id = s.staff_id
	INNER JOIN payment p USING(staff_id)
	INNER JOIN rental r USING(rental_id)
GROUP BY 1,2,3;

#8)
SELECT f.rating, SUM(p.amount)
FROM film f
	INNER JOIN inventory i USING(film_id)
	INNER JOIN rental r USING(inventory_id)
	INNER JOIN payment p USING(rental_id)
GROUP BY f.rating;

#9)
SELECT a.actor_id, a.first_name, a.last_name, COUNT(*) AS count
FROM actor a
	INNER JOIN film_actor USING(actor_id)
GROUP BY 1,2,3
ORDER BY count DESC
LIMIT 1;

#10)
# DESC list w/ category highest films average
SELECT c.name, AVG(f.length) as average
FROM category c
	INNER JOIN film_category fc USING(category_id)
	INNER JOIN film f USING(film_id)
GROUP BY c.name
HAVING avg(length) > (SELECT avg(length) from film)
ORDER BY average DESC;

#IDEM but with categories average greater than the total average
SELECT c.name, AVG(f.length) as average
FROM category c
	INNER JOIN film_category fc USING(category_id)
	INNER JOIN film f USING(film_id)
GROUP BY c.name
HAVING avg(length) > (SELECT avg(length) from film)
ORDER BY average DESC;

