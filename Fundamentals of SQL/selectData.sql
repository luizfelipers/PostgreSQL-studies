-- for this repo, use the database and tables populated in https://github.com/luizfelipers19/PostgreSQL-studies/blob/main/Fundamentals%20of%20SQL/populatetables.sql
-- MOVIE_DATA



-- SELECT COMMANDS
	
	-- selects all data (retrieve all data) from the DIRECTORS table
	SELECT * FROM directors
	
	-- selects the FIRST_NAME column from the DIRECTORS table
	SELECT first_name FROM directors;
	-- select the FIRST_NAME and the LAST_NAME columns from the DIRECTORS table
	SELECT first_name, last_name FROM directors;
	
	
	-- WHERE clause
	-- syntax:
	-- SELECT columnname FROM tablename WHERE columnname = 'value';
	
	SELECT columnname FROM tablename WHERE columnname='value';
	
	-- selects every data from the MOVIES table
	SELECT * FROM movies;
	
	-- selects every data from the MOVIES table that match the conditional WHERE clause
	SELECT * FROM movies WHERE age_certificate='15';
	
	SELECT * FROM movies WHERE age_certificate='PG';
	
	-- selects data from the MOVIES table that matches both (AND) conditional clauses
	SELECT * FROM movies WHERE age_certificate='15' AND movie_lang='Chinese';
	
	-- select data from the MOVIES table that matches at least one(OR) conditional clauses
	SELECT * FROM movies WHERE age_certificate='15' OR movie_lang='Chinese';
	-- selecting data from the Movies table that
	SELECT * FROM movies WHERE age_certificate='15' AND movie_lang = 'English' AND director_id=27;
	
	-- LOGICAL OPERATORS
	-- < LESS THAN / MENOR QUE
	-- <= LESS OR EQUAL THAN / MENOR OU IGUAL A
	-- > GREATER THAN / MAIOR QUE
	-- >= GREATER OR EQUAL THAN / MAIOR OU IGUAL A
	
	-- SYNTAX:
	-- SELECT columns FROM table WHERE columnname > value      (substituir o operador lógico por qualquer um)
	
	-- selecting data from the movies table, in relation to their lengths
	SELECT movie_name, movie_length FROM movies WHERE movie_length > 120;
	SELECT movie_name, movie_length FROM movies WHERE movie_length < 120;
	SELECT movie_name, movie_length FROM movies WHERE movie_length >= 120;
	SELECT movie_name, movie_length FROM movies WHERE movie_length <= 120;
	SELECT movie_name, movie_length FROM movies WHERE movie_length = 120;
	
	-- selecting data from the movies table, regarding it's release date
	SELECT movie_name, release_date FROM movies WHERE release_date > '1990-01-01';
	SELECT movie_name, release_date FROM movies WHERE release_date < '1990-01-01';
	
	-- selecting data from movies table regarding it's movie language. Comparison happens through strings alphabetical order
	SELECT movie_name, movie_lang FROM movies WHERE movie_lang < 'English';
	SELECT movie_name, movie_lang FROM movies WHERE movie_lang > 'English';
	SELECT movie_name, movie_lang FROM movies WHERE movie_lang >= 'English';
	SELECT movie_name, movie_lang FROM movies WHERE movie_lang <= 'English';
	
	SELECT first_name, last_name FROM actors WHERE first_name = 'Bruce';

-- LIKE statement
-- LIKE regards patterns in data
-- syntax:
-- SELECT columns FROM table WHERE column LIKE '_%something%_'
-- %: any pattern in this position
-- _: a character in this position

-- retorna todos os dados que o primeiro nome começa com P
SELECT * FROM actors WHERE first_name LIKE 'P%';
-- retorna todos os dados que contenham a letra r no meio do primeiro nome
SELECT * FROM actors WHERE first_name LIKE '%r%'
-- retorna todos os dados que comecem por 'Pe' e tenham mais um caractere
SELECT * FROM actors WHERE first_name LIKE 'Pe_';

-- retorna todos os dados que o primeiro nome seja composto por 5 letras, e a 3a e a 4a letra sejam respectivamente 'r' e 'l'
SELECT * FROM actors WHERE first_name LIKE '__rl_';

-- BETWEEN
-- retorna os dados em que a condição pesquisada esteja entre os dados passados por parâmetro
-- syntax:
-- SELECT columns FROM table WHERE column BETWEEN value1 AND value2;

SELECT * FROM movies;

-- retorna os dados onde o id do filme está entre 1 e 8
SELECT * FROM movies WHERE movie_id BETWEEN 1 AND 8;

-- retorna dados em que a data está entre os valores passados
SELECT movie_name, movie_lang, release_date FROM movies WHERE release_date BETWEEN '1980-01-01' AND '2003-01-01';
-- retorna dados em que durem de 90 até 140 mins
SELECT movie_name, movie_length, release_date FROM movies WHERE movie_length BETWEEN 90 AND 140;

-- seleciona dados onde os valores da linguagem estejam entre English e Portuguese. É medido de forma alfabética
SELECT * FROM movies WHERE movie_lang BETWEEN 'English' and 'Portuguese';



-- ORDER BY
-- orders the result returned by a specific column
-- syntax:
-- SELECT columns FROM table ORDER BY column;
-- ASC - ascending 
-- DESC - descending

-- select data from actor's table, ordering by gender (Females come first alphabetically)
SELECT * FROM actors ORDER BY gender;
-- orders selected data by actor's first_name alphabetically (ascending)
SELECT first_name, last_name, date_of_birth FROM actors ORDER BY first_name;

SELECT * FROM movies;
-- selects data from the movies table, ordering by release-date (ascending)
SELECT * FROM movies ORDER BY release_date;

SELECT first_name, last_name, date_of_birth FROM actors ORDER BY date_of_birth DESC;

-- FETCH FIRST
-- retorna os primeiros dados do resultado de uma query
-- syntax:
-- SELECT column FROM table FETCH FIRST N ROW ONLY;
-- RETURN THE FIRST N ROWS OF A QUERY
-- parecido com comando LIMIT

-- Seleciona os primeiros 5 valores de uma query
SELECT movie_id, movie_name FROM movies FETCH FIRST 5 ROW ONLY;
-- Seleciona os primeiros 10 valores da query
SELECT movie_id, movie_name FROM movies FETCH FIRST 10 ROW ONLY;
-- seleciona os 5 primeiros valores da query, depois de um deslocamento de 5 registros
SELECT movie_id, movie_name FROM movies OFFSET 5 ROWS FETCH FIRST 5 ROW ONLY;

-- DISTINCT
-- seleciona uma coleção dos valores distintos da coluna pesquisada pela query
SELECT DISTINCT movie_lang FROM movies ORDER BY movie_lang;

-- NULL values
 --NULL values means missing data from a certain column of a table
 SELECT * FROM actors WHERE date_of_birth IS NULL;
 -- NOT NULL
 -- não retorna valores nulos
 SELECT * FROM movie_revenues ORDER BY domestic_takings DESC;
 SELECT * FROM movie_revenues WHERE domestic_takings IS NOT NULL ORDER BY domestic_takings DESC;
 
 -- ALIAS
-- renomeia uma coluna dentro da query
--syntax:
-- SELECT column AS newname FROM table;
	
-- renomeia na query, a coluna last_name para surname
SELECT last_name AS surname FROM directors;

-- renomeia as colunas retornadas pela query, como: nome, sobrenome e nascimento
SELECT first_name AS nome, last_name AS sobrenome, date_of_birth AS nascimento FROM directors;

-- renomeia as colunas para: nome, sobrenome e nascimento, e ordena pela coluna com nome atualizado
SELECT first_name AS nome, last_name AS sobrenome, date_of_birth AS nascimento 
FROM directors ORDER BY sobrenome;

-- renomeia as colunas para: nome, sobrenome e nascimento, e ordena pela coluna com nome atualizado,
-- mas procura resultados que sigam um padrão numa coluna com nome antigo
SELECT first_name AS nome, last_name AS sobrenome, date_of_birth AS nascimento 
FROM directors WHERE last_name LIKE 'A%' ORDER BY sobrenome;

-- CONCATENATION
-- unites 2 strings
-- syntax:
-- SELECT CONCAT(column1, column2) FROM tablename;

-- concatenating the first name to the last name, with a blank space in the middle as separator
SELECT first_name, last_name, CONCAT(first_name,' ', last_name) AS nomao FROM directors;
-- concatenating the first name to the last name, with a blank space in the middle as separator
SELECT first_name, last_name, CONCAT(first_name,' ', last_name) AS nomao FROM actors;


-- AGGREGATE FUNCTIONS

-- count 
-- conta os valores de cada coluna (data entries of a column)
-- syntax
-- SELECT COUNT(coluna) FROM table;

SELECT COUNT(*) FROM movie_revenues;

SELECT COUNT (international_takings) FROM movie_revenues;

SELECT COUNT(*) FROM movies;

SELECT COUNT(*) FROM movies WHERE movie_lang = 'Spanish';

SELECT COUNT(*) FROM movies WHERE movie_lang = 'English';

-- sum
--soma os valores de uma determinada coluna
-- syntax:
-- SELECT SUM(column) FROM table;

-- soma os valores da tabela movie_revenues
SELECT SUM(domestic_takings) FROM movie_revenues;

-- soma os valores de arrecadação domestica da tabela movie_revenues, apenas dos filmes tiveram um ganho domestico maior que 200
SELECT SUM(domestic_takings) FROM movie_revenues WHERE domestic_takings > 200.0;


-- MIN and MAX
-- retorna o menor/ maior valor de uma determinada coluna

-- SELECT MAX(coluna) FROM tabela;
-- SELECT MIN(coluna) FROM tabela;

SELECT MAX(movie_length) FROM movies;
SELECT MAX(movie_length) FROM movies WHERE movie_lang = 'Japanese';
SELECT MAX(domestic_takings) FROM movie_revenues;

-- max aggregate function when applied to a varchar, returns the last alphabetical character
SELECT MAX(movie_name) FROM movies;
