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


