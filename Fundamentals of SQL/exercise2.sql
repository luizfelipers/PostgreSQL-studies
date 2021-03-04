-- for this repo, use the database and tables populated in https://github.com/luizfelipers19/PostgreSQL-studies/blob/main/Fundamentals%20of%20SQL/populatetables.sql
-- MOVIE_DATA

 -- CHALLENGE2
 
 -- 1) Select the movie_name and release_data of every movie.
 -- 2) Select the first and last name of all American directors.
 -- 3) Select all male actors born after the 1st of January 1970
 -- 4) Select the names of all movies which are over 90 minutes long and movie language is English
 
 -- Respostas do malandro
 
-- 1)
 SELECT * FROM movies -- only to check columns names
 SELECT movie_name, release_date FROM movies; -- answer query
  
-- 2)
SELECT * FROM directors; -- only to check columns names
SELECT first_name, last_name FROM directors WHERE nationality='American'; -- answer query

-- 3)
SELECT * FROM actors; -- checking columns names
SELECT * FROM actors WHERE gender='M' AND date_of_birth > '1970-01-01'; -- answer query

-- 4)
SELECT * FROM movies; -- checking columns names
SELECT movie_name FROM movies WHERE movie_length > 90 AND movie_lang='English'; -- answer query
