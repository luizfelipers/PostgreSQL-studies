  
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
 
 
-- realiza primeiro o cálculo da inner query e passa o resultado para realizar a outer query
SELECT movie_name, movie_length FROM movies
WHERE movie_length <
(SELECT AVG(movie_length) FROM movies);

-- inner query contida na query acima
SELECT AVG(movie_length) FROM movies; -- 126.13

-- retorna a mesma coisa que a primeira query com subquery, mas para isso,
-- é preciso saber o valor de antemão
SELECT movie_name, movie_length FROM movies
WHERE movie_length < 126.13

-- outra subquery
 -- retornar uma lista com o primeiro e ultimo nome de todos os diretores que são 
 -- mais novos que James Cameron
 
 SELECT first_name, last_name FROM directors
 WHERE date_of_birth >
 (SELECT date_of_birth FROM directors WHERE first_name ='James' AND last_name='Cameron');
 
 SELECT date_of_birth FROM directors WHERE first_name ='James' AND last_name='Cameron';
 
 -- retornar uma lista com o primeiro e ultimo nome de todos os diretores que são
 -- mais novos que Tom Cruise (ator)
 SELECT first_name, last_name FROM directors
 WHERE date_of_birth > -- usando dados de uma tabela diferente (actors)
 (SELECT date_of_birth FROM actors WHERE first_name='Tom' AND last_name='Cruise');
 
 -- usar a keyword IN para passar múltiplos valores da Inner Query para a Outer Query
 -- retornar movie name da tabela movies onde os international takings sao maiores que domestic takings
 SELECT * FROM movies;
 
 SELECT movie_name FROM movies WHERE movie_id IN 
 (SELECT movie_id from movie_revenues WHERE international_takings > domestic_takings);
 
 
 -- possível usar joins tb
 -- retornar nome do filme e o diretor onde os filmes tiveram international_taking > domestic taking
 
 SELECT * FROM directors;
 SELECT * FROM movies;
 SELECT m.movie_name, d.first_name, d.last_name FROM movies m 
 JOIN directors d ON m.director_id = d.id
 WHERE movie_id IN 
 (SELECT movie_id FROM movie_revenues WHERE international_takings > domestic_takings);
 
 
-- challenges
 -- select first and last names of all actors older than Marlon Brando
 
 SELECT first_name, last_name FROM actors WHERE date_of_birth < 
 (SELECT date_of_birth FROM actors WHERE first_name='Marlon' AND last_name='Brando');
 
 SELECT date_of_birth FROM actors WHERE first_name='Marlon' AND last_name='Brando';
 
 -- select the movie names of all movies that have domestic takings above 300 million
 
 SELECT * FROM movie_revenues WHERE domestic_takings IS NOT NULL ORDER BY domestic_takings;
 
 SELECT movie_name FROM movies WHERE movie_id IN 
(SELECT movie_id FROM movie_revenues WHERE domestic_takings > 300 );
 
 -- return the shortest and longest movie length for movies with
 -- an above average domestic takings
 
 SELECT MIN(movie_length) AS Shortest, MAX(movie_length) AS Longest
 FROM movies JOIN movie_revenues ON movies.movie_id = movie_revenues.movie_id
 WHERE domestic_takings >
 (SELECT AVG(domestic_takings) FROM movie_revenues);
 
