#1)
SELECT country, count(*) FROM city inner join 'country' using (country_id) group by country;

#2)
SELECT country, count(*) FROM city inner join `country` using (country_id) group by country having count(*)>10 order by count(*) desc;

#3)