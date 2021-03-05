  
-- for this repo, use the database and tables populated in https://github.com/luizfelipers19/PostgreSQL-studies/blob/main/Fundamentals%20of%20SQL/populatetables.sql
-- MOVIE_DATA

 -- CHALLENGE3
 
 -- Questions
 
 -- 1)SELECT THE MOVIE NAMES AND MOVIE LANGUAGE OF ALL MOVIES WITH A MOVIE LANGUAGE OF 
 ENGLISH SPANISH OR KOREAN
 
 -- 2)SELECT THE FIRST AND LAST NAMES OF THE ACTORS WHOSE LAST NAME BEGINS WITH M AND WERE BORN
 BETWEEN 01/01/1940 AND 31/12/1969
 
 -- 3)SELECT THE FIRST AND LAST NAMES OF THE DIRECTORS WITH NATIONALITY OF BRITISH, FRENCH OR GERMAN, BORN
 BETWEEN 01/01/1950 AND 31/12/1980
 
 -- SOLVED ANSWERS
 
-- 1)
 SELECT movie_id, movie_name, movie_lang FROM movies WHERE movie_lang IN ('English','Spanish','Korean');
 
-- 2)
 SELECT first_name, last_name FROM actors WHERE last_name LIKE 'M%' AND date_of_birth BETWEEN '1940-01-01' AND '1969-12-31';
 
-- 3)
 SELECT first_name, last_name FROM directors WHERE nationality IN ('British','French','German') AND date_of_birth BETWEEN '1950-01-01' AND '1980-12-31';
