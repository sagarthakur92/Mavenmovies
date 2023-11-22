-- 1)write a sql query to count the number of charecters except the spaces for each actor.
-- return first 10 actors name length along with their name.
select first_name,last_name,length(first_name)+length(last_name) 'number of character'from actor
 limit 10;
 
 -- 2)list all oscar awardees(actors who received oscar award) with their full names 
 -- and length of their names. 
 select concat(first_name,' ',last_name)as 'full name',awards,length(first_name)+length(last_name)as 'full name character' from actor_award
where awards='oscar';

-- 3) find the actors who have acted in the film 'frost Head'.

select title,first_name,last_name from actor
inner join film_actor using(actor_id)
inner join film using(film_id)
where title like 'frost head';

-- 4)pull all the films acted by the actor 'will Wilson'.

select title,first_name,last_name from actor
inner join film_actor using(actor_id)
inner join film using(film_id)
where first_name='will' and last_name='wilson';

-- 5)pull all the films which were rented and return in the month of may.

select f.title,r.rental_id,monthname(return_date) as returning_month from film f
inner join inventory i using(film_id)
inner join rental r using(inventory_id)
where monthname(return_date) = 'may';

-- 6) pull all the films with 'comedy' category.

select title from film
inner join film_category using(film_id)
inner join category using(category_id)
where name='comedy' order by title;
