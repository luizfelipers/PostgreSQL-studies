  
-- for this repo, use the database and tables populated in https://github.com/luizfelipers19/PostgreSQL-studies/blob/main/Fundamentals%20of%20SQL/populatetables.sql
-- MOVIE_DATA


-- SUBQUERIES
-- subqueries are nested queries, where the inner query is executed first and the results of the inner query are passed to the outer query.

-- subqueries can be nested inside a SELECT, INSERT, UPDATE or DELETE query, and can be used after FROM and WHERE clauses
-- sintaxe da subquery: Uma query sql normal, e a inner query fica dentro de parenteses.

-- SELECT column1 FROM table1 WHERE (SELECT blabalbalablabal from tableX);
-- exemplo de subquery
-- SELECT movie_name, movie_length FROM movies WHERE movie_length > (SELECT AVG(movie_length) FROM movies);

-- UNCORRELATED SUBQUERIES
-- the inner query could be executed independently from the outer query

/*
SELECT movie_name, movie_length FROM movies
WHERE movie_length >
(SELECT AVG(movie_length) FROM movies);

*/
 -- CORRELATED SUBQUERIES
 -- the Inner query references a table from the outer query, so the inner query can'be executed independently from the outer query
 
 /*
 SELECT d1.first_name, d1.last_name, d1.date_of_birth 
 FROM directors d1
 WHERE date_of_birth = (SELECT MIN(date_of_birth) FROM directors d2 WHERE d2.nationality = d1.nationality);
 
 a inner query referencia uma tabela vinda da outer query, por isso é considerada Correlated
 */
 
 
