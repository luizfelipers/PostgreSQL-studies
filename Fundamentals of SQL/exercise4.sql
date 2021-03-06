-- for this repo, use the database and tables populated in https://github.com/luizfelipers19/PostgreSQL-studies/blob/main/Fundamentals%20of%20SQL/populatetables.sql
-- MOVIE_DATA

 -- CHALLENGE4
 
 -- 1) select the american directors ordered from oldest to youngest.
 -- 2) return the distinct nationalities from the directors table.
 -- 3) return the first names, last names and date of births of the 10 youngest female actors.
 
 -- answers
 
  -- 1) select the american directors ordered from oldest to youngest
 
 SELECT * FROM actors;
 SELECT * FROM directors WHERE nationality = 'American' ORDER BY date_of_birth;
 
 -- 2) return the distinct nationalities from the directors table
 SELECT DISTINCT nationality FROM directors;
 
 -- 3) return the first names, last names and date of births of the 10 youngest female actors
SELECT first_name, last_name, date_of_birth FROM actors WHERE gender = 'F' ORDER BY date_of_birth DESC LIMIT 10;
 
