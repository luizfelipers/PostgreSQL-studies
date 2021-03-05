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