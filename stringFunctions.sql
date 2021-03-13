-- for this file, a copy/clone of the movie_data database was created.

-- UPPER and LOWER functions


-- UPPER
 /* 
 SELECT UPPER('string'); -- recebe uma string como parâmetro, e retorna a mesma string em letras maiúsculas
 
 SELECT UPPER(column_name) FROM table; -- recebe coluna onde o valor do registro é uma string. e retorna a mesma string em letras maiúsculas
 */
 
-- LOWER

/*
SELECT LOWER('STRING'); -- recebe uma string como parâmetro e retorna a string inteirmanete em letras minúsculas
SELECT LOWER(column_name) FROM table;

*/
 SELECT * FROM actors;
SELECT UPPER('fala mais alto!');
SELECT UPPER(first_name), UPPER(last_name) FROM actors;

SELECT LOWER('PÁRA DE GRITAR MLK!');

SELECT LOWER(movie_name) FROM movies;

