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
	
