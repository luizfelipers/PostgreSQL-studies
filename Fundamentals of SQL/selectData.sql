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
	
	
