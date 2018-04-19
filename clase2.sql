CREATE DATABASE imdb;
USE imdb;
CREATE TABLE IF not exists film (film_id INT(11) NOT NULL PRIMARY KEY auto_increment, title VARCHAR(25) NOT NULL, description tinytext, release_date DATE);
CREATE TABLE IF not exists actor (actor_id INT(11) NOT NULL PRIMARY KEY auto_increment, first_name VARCHAR(25) NOT NULL, last_name VARCHAR(25));
CREATE TABLE IF not exists film_actor (actor_id INT(11) NOT NULL, film_id INT(11) NOT NULL);
ALTER TABLE film_actor add CONSTRAINT fk_filmactor_actor FOREIGN KEY (actor_id) REFERENCES actor (actor_id);
ALTER TABLE film_actor add CONSTRAINT fk_filmactor_film FOREIGN KEY (film_id) REFERENCES film (film_id);
ALTER TABLE film add last_update TIMESTAMP;
ALTER TABLE actor add last_update TIMESTAMP;

insert into actor(first_name, last_name) values ('ricardo','darin');
insert into actor(first_name, last_name) values ('brad','pitt');
insert into film(title,description,release_date) values ('titanic','un barco que se hunde','1997-04-20')
insert into film(title,description,release_date) values ('nueve reinas','robo sale mal','1999-05-25');
insert into actor(first_name, last_name) values ('leo','dicaprio');
insert into actor(first_name, last_name) values ('leo','dicaprio');
insert into film_actor(actor_id,film_id) values ('1','2');

