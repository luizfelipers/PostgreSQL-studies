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

-- INITCAP
-- Initial capitalization
-- recebe uma string, aplica a função LOWER nela toda 
-- e transforma a primeira letra de cada palavra em maiúscula

/* 
1 - a query abaixo:
SELECT INITCAP('example string');
retornaria:
'Example String'

2 - a query abaixo:
SELECT INITCAP('aaAAAhh eU tO MaLuco!');
retornaria:
'Aaaaahh Eu To Maluco!'
*/

SELECT INITCAP('eXamPle sTriNG');
SELECT INITCAP('aaAAAhh eU tO MaLuco!');

SELECT movie_name FROM movies; -- alguns resultados possuem palavras em minúsculo
SELECT LOWER(movie_name) FROM movies; -- transformando todas as palavras em minúsculo (DESNECESSÁRIO)
SELECT INITCAP(LOWER(movie_name)) FROM movies; -- Aplicando Initial Capitalization

SELECT INITCAP(movie_name) FROM movies;

-- left and right
-- retorna os caracteres especificados pelo número passado na função,
-- contados a partir da esquerda ou direita

SELECT LEFT('string',4);
SELECT LEFT('STRING',-4);

SELECT RIGHT('string',4);
SELECT RIGHT('string',-4);

SELECT LEFT(movie_name, 5) FROM movies;
SELECT RIGHT(movie_name, 5) FROM movies;

-- Reverse Function
-- retorna a string parâmetro, de trás pra frente
-- as letras maiúsculas são mantidas

SELECT REVERSE('string');
SELECT REVERSE('socorrammesubinumonibusemmarrocos'), 'socorrammesubinumonibusemmarrocos';

SELECT REVERSE(movie_name) AS reverseName, movie_name FROM movies;

-- exercises 1
-- select the directors first and last names and movie names in upper case

SELECT * FROM directors;
SELECT * FROM movies;

SELECT UPPER(d.first_name), UPPER(d.last_name), UPPER(m.movie_name) FROM directors d
JOIN movies m ON  m.director_id = d.id 
ORDER BY m.movie_name
;

-- exercises 2
-- select the first and last names in initcap format of all the actors of
-- Chinese and Korean movies

SELECT * FROM actors;
SELECT * FROM movies_actors;

SELECT INITCAP(a.first_name), INITCAP(a.last_name) FROM actors a
JOIN movies_actors ma ON a.actor_id = ma.actor_id 
JOIN movies m ON ma.movie_id = m.movie_id
WHERE m.movie_lang IN ('Chinese', 'Korean')
;

-- 3
-- retrieve the reversed first and last names of each directors
-- and the first three chars of their nationality
SELECT INITCAP(REVERSE(first_name)), INITCAP(REVERSE(last_name)), 
LEFT(nationality, 3)
FROM directors; 

-- 4 
-- return all directors initials into one single column called 'initials'
SELECT INITCAP(CONCAT(LEFT(first_name, 1), LEFT(last_name, 1))) AS initials FROM directors;
 
