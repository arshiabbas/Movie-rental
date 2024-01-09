use sakila;
#Task 1 Display full names of the actors 
SELECT 
    CONCAT(first_name, ' ', last_name) AS 'Full Name'
FROM
    actor;

# Task 2 , names and occurances
# Task 2.i
SELECT 
    first_name AS 'First Name',
    COUNT(first_name) AS 'No_of_time_appears'
FROM
    actor
GROUP BY first_name
ORDER BY No_of_time_appears DESC;

# Task 2.ii
SELECT DISTINCT
    (first_name) AS First_name,
    COUNT(first_name) AS Count_actors
FROM
    actor
GROUP BY First_name
ORDER BY Count_actors DESC;

# Task 3
# Task 3.i lastname and count
SELECT 
    last_name AS 'Last Name',
    COUNT(last_name) AS Count_last_name
FROM
    actor
GROUP BY last_name
ORDER BY Count_last_name DESC;

#Task 3.ii
SELECT DISTINCT
    (last_name) AS 'Last Name'
FROM
    actor;

# Task 4.i list of records for the movies with rating 'R'
SELECT 
    *
FROM
    film
WHERE
    rating = 'R';
select count(*) from film where rating = 'R'; #195 movies

#Task 4.ii list of records for the movies not rated 'R'
SELECT 
    *
FROM
    film
WHERE
    rating != 'R';
select count(*) from film where rating !='R'; # 805 movies

#Task 4.iii suitable for under 13 years of age
#since in the data dictionary have not mentioned the age we can consider the above condition except for rating 'r' 
SELECT 
    *
FROM
    film
WHERE
    rating != 'R';

# Task 5.i Replacement cost is upto $11
SELECT 
    *
FROM
    film
WHERE
    replacement_cost <= 11; #90 movies

#Task 5.ii replacement cost between 11 and 20
SELECT 
    *
FROM
    film
WHERE
    replacement_cost >= 11
        AND replacement_cost <= 20;
#or
#select * from film where replacement_cost between 11 and 20; #424 movies

# Task 5.iii all the records in descending order of replacement_cost
SELECT 
    *
FROM
    film
ORDER BY replacement_cost DESC; #maximum 29.99


# Task 6, top 3 movies with the greathest number of actors
SELECT 
    title AS 'Movie Name', COUNT(actor_id) AS 'No_of_Actors'
FROM
    film
        JOIN
    film_actor USING (film_id)
GROUP BY title
ORDER BY No_of_Actors DESC
LIMIT 3; 

# Task 7 display the movies starting with letter K and Q
SELECT 
    title
FROM
    film
WHERE
    title LIKE 'k%' OR title LIKE 'Q%';

# Task 8 Agent Truman , name of all actors
SELECT 
    CONCAT(first_name, ' ', last_name) AS 'Actor Names'
FROM
    actor
        JOIN
    film_actor USING (actor_id)
        JOIN
    film USING (film_id)
WHERE
    title = 'Agent Truman';

# Task 9 all movies with family category
SELECT 
    f.title AS 'Movie Name', c.name AS 'Category Name'
FROM
    film AS f
        JOIN
    film_category USING (film_id)
        JOIN
    category AS c USING (category_id)
WHERE
    name = 'Family';

# Task 10.i maximum, minimum, and average rental rates based on ratings
SELECT 
    rating AS 'Rating',
    MAX(rental_rate) AS 'Max_Rental_Rate',
    MIN(rental_rate) AS 'Min_Rental_Rate',
    ROUND(AVG(rental_rate), 2) AS 'Avg_Rental_Rate'
FROM
    film
GROUP BY rating
ORDER BY Avg_Rental_Rate DESC;

# Task 10.ii movies indescending order of rental frequencies. 
SELECT 
    title, COUNT(rental_duration)
FROM
    film
GROUP BY title; #doubt

# Task 11
SELECT 
    name AS Category_Name
FROM
    category
        JOIN
    film_category USING (category_id)
        JOIN
    film USING (film_id)
GROUP BY Category_Name
HAVING (AVG(replacement_cost) - AVG(rental_rate)) > 15;

#confirming the same
SELECT 
    name AS Category_Name,
    AVG(replacement_cost) AS 'Avg_replacement',
    AVG(rental_rate) AS 'Avg_rental',
    (AVG(replacement_cost) - AVG(rental_rate)) AS 'Difference'
FROM
    category
        JOIN
    film_category USING (category_id)
        JOIN
    film USING (film_id)
GROUP BY Category_Name
HAVING (Avg_replacement - Avg_rental) > 15 order by difference asc; #minimum 15.54

# Task 12, film categories wher n0 of movies > 70. 
SELECT 
    name AS 'Category_name', COUNT(name) AS 'Count_Of_Movies'
FROM
    category
        JOIN
    film_category USING (category_id)
        JOIN
    film USING (film_id)
GROUP BY name
HAVING Count_of_movies > 70; 
# two categories Foreign with 73 and Sports with 74








