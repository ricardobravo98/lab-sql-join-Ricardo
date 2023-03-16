use sakila;

select c.category_id, c.name, count(f.film_id) from category c
join film_category f
on c.category_id = f.category_id
group by c.category_id;

select count(film_id), category_id from film_category
group by category_id;

-- 2. Display the first and last names, as well as the address, of each staff member.
select s.staff_id, s.first_name, s.last_name, s.address_id, a.address from staff s
join address a
on s.address_id = a.address_id;

-- 3. Display the total amount rung up by each staff member in August of 2005.
select s.staff_id, s.first_name, s.last_name, sum(p.amount) as "august_total", p.payment_date from staff s
join payment p
on s.staff_id = p.staff_id
where monthname(p.payment_date) = 'August'
group by s.staff_id;

-- select * from payment where monthname(payment_date) = 'August';

-- 4. List each film and the number of actors who are listed for that film.
select f.film_id, f.title, count(fa.actor_id) from film f
join film_actor fa
on f.film_id = fa.film_id
group by f.film_id;

-- 5. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select c.customer_id, c.first_name, c.last_name, sum(p.amount) from customer c
join payment p
on c.customer_id = p. customer_id
group by customer_id
order by c.last_name;