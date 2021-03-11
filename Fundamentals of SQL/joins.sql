-- for this repo, use the database and tables populated in https://github.com/luizfelipers19/PostgreSQL-studies/blob/main/Fundamentals%20of%20SQL/populatetables.sql
-- MOVIE_DATA

-- JOINS

-- consiste em juntar duas tabelas, de modo que possa fazer uma query ou operação com dados de mais de uma tabela ao mesmo tempo.

-- inner Joins, Left Joins, Right Joins, Full Joins

-- Inner Joins: will only return rows of data with matching values in both tables. (Where foreign key is equal to other's table primary key or vice-versa)

-- Left Joins: Will return all the rows of data in the left table (Table1) and only matching rows of data in the right table (Table2)

-- Right Joins: Will return all the rows of data in the right table (Table2) and only matching rows of data in the left table (Table1).

-- Full Joins: Will only return all rows of data in both tables.

------------------------------------------------

-- Inner Joins

/* 
  SELECT table1.column1, table1.column2, table2.column1 FROM table1
  INNER JOIN table2 ON table1.column3 = table2.column3;

-- retorna dados da tabela 1 e da tabela 2, juntando a tabela 1 com a tabela 2, na coluna que faz a ligação entre ambas as tabelas (primary key = foreign key)
*/

-- retorna colunas da tabela directors, e o nome do filme da tabela movies, juntando directors e movies, onde a chave primária de directors é igual á chave estrangeira de movies referente aos diretores
SELECT directors.id, directors.first_name, directors.last_name, movies.movie_name FROM directors INNER JOIN movies ON directors.id = movies.director_id;

-- jeito abreviado 
-- escrever o nome da tabela1 como t1, na primeira declaração explícita da tabela, e assim vai

SELECT d.id, d.first_name, d.last_name, m.movie_name FROM directors d INNER JOIN movies m ON d.id = m.director_id;

-- pesquisando dados de filmes e rendimento de cada filme, criando uma coluna que soma os ganhos domesticos e internacionais, e ordenando crescentemente pelos ganhos
SELECT mo.movie_name, mr.domestic_takings, mr.international_takings,(mr.domestic_takings + mr.international_takings) as total_revenue 
	FROM movies mo JOIN movie_revenues mr ON mo.movie_id = mr.movie_id ORDER BY total_revenue ;
	
 
	SELECT mo.movie_name, mr.domestic_takings, mr.international_takings
	FROM movies mo JOIN movie_revenues mr ON mo.movie_id = mr.movie_id;
	
-- SELECT the directors first and last names, the movie names and release dates for all chinese, korean and japanese movies
	SELECT * FROM directors;
	SELECT * FROM movies;
	SELECT d.first_name, d.last_name, m.movie_name, m.release_date FROM directors d JOIN movies m ON d.id = m.director_id  WHERE m.movie_lang IN('Chinese','Korean','Japanese')  ;
	
	
	-- select the movie names, release dates and international takings of all english language movies
	SELECT * FROM movie_revenues;
	SELECT m.movie_name, m.release_date, mr.international_takings FROM movies m INNER JOIN movie_revenues mr ON m.movie_id = mr.movie_id WHERE m.movie_lang = 'English';
	
	-- select the movie names, domestic takings and international takings for all movies with either missing domestic takings or missing international values and order the results by movie name
	SELECT m.movie_name, mr.domestic_takings, mr.international_takings FROM movies m INNER JOIN movie_revenues mr ON m.movie_id = mr.movie_id WHERE mr.domestic_takings IS NULL OR mr.international_takings IS NULL ORDER BY m.movie_name;

-- LEFT JOIN
	--retorna todos os dados da primeira tabela, e retorna apenas os dados correspondentes 
	-- (referenciados pela chave estrangeira de uma tabela para primaria de outra)
	-- da segunda tabela 
	
	--left join da tabela directors (1a tabela) com a tabela movies (2a tabela)
	SELECT * FROM directors;
	SELECT d.id, d.first_name, d.last_name, m.movie_name FROM directors d
	LEFT JOIN movies m ON d.id = m.director_id;
	
	-- left join da tabela movies (1a tabela) com a tabela directors (2a tabela)
	SELECT d.id, d.first_name, d.last_name, m.movie_name FROM movies m
	LEFT JOIN directors d ON d.id = m.director_id;
	
	SELECT d.id, d.first_name, d.last_name, m.movie_name FROM directors d
	JOIN movies m ON d.id = m.director_id;
	
	-- right join 
	-- retorna todos os dados da tabela 2 e apenas os dados correspondentes da tabela 1
	SELECT d.id, d.first_name, d.last_name, m.movie_name FROM directors d 
	RIGHT JOIN movies m ON d.id = m.director_id;
	
	-- retorna todos os dados da tabela 2 e apenas os dados da tabela 1 que são correspondentes,
	-- e filtra apenas os que são para 18+ (pornow ou nem)
	SELECT d.id, d.first_name, d.last_name, m.movie_name FROM movies m 
	RIGHT JOIN directors d ON d.id = m.director_id 
	WHERE m.age_certificate = '18';
	
	-- FULL JOIN
	-- retorna todos os dados de ambas as tabelas, mesmo se existirem valores nulos
	SELECT d.id, d.first_name, d.last_name, m.movie_name FROM directors d 
	FULL JOIN movies m ON d.id = m.director_id;
	
-- challenges

--1 use a left join to select the first and last names of all british directors
-- and the names and age certificates of the movies that they directed

SELECT * FROM movies;
SELECT d.first_name, d.last_name, m.movie_name, m.age_certificate FROM directors d 
LEFT JOIN movies m ON m.director_id = d.id WHERE d.nationality = 'British';

-- 2 count the number of movies that each director has directed
SELECT CONCAT(  d.first_name, d.last_name) AS diretor, COUNT(mo.movie_id) FROM directors d
LEFT JOIN movies mo ON d.id = mo.director_id GROUP BY diretor;

-- select the first name and last name from directors table,
-- movie name, and then the movie revenues domestic and international takings
SELECT * FROM directors;
SELECT * FROM movies;
SELECT * FROM movie_revenues;
SELECT d.first_name, d.last_name, m.movie_name, mr.domestic_takings,
mr.international_takings FROM directors d INNER JOIN movies m ON d.id = m.director_id
INNER JOIN movie_revenues mr ON m.movie_id = mr.movie_id;

-- select the actors first and last name and the movie name in 1 sql query
SELECT * FROM actors;
SELECT * FROM movies;
SELECT * FROM movies_actors;
-- usar a tabela de junção para poder realizar essa query
--usar a tabela "movies_actors" para realizar uma query que une os atores aos seus filmes
SELECT a.first_name, a.last_name, m.movie_name FROM actors a 
JOIN movies_actors ma ON a.actor_id = ma.actor_id
JOIN movies m ON m.movie_id = ma.movie_id
ORDER BY m.movie_name;

SELECT d.first_name, d.last_name, m.movie_name, a.first_name, a.last_name,
mr.international_takings, mr.domestic_takings FROM directors d INNER JOIN
movies m ON m.director_id = d.id INNER JOIN movies_actors mo ON 
m.movie_id = mo.movie_id INNER JOIN actors a ON mo.actor_id = a.actor_id
INNER JOIN movie_revenues mr ON mr.movie_id = m.movie_id;

SELECT d.first_name, d.last_name, m.movie_name, a.first_name, a.last_name,
mr.international_takings, mr.domestic_takings FROM directors d INNER JOIN
movies m ON m.director_id = d.id INNER JOIN movies_actors mo ON 
m.movie_id = mo.movie_id INNER JOIN actors a ON mo.actor_id = a.actor_id
INNER JOIN movie_revenues mr ON mr.movie_id = m.movie_id ORDER BY m.movie_name;

SELECT a.first_name, a.last_name, m.movie_name FROM actors a 
INNER JOIN movies_actors ma ON ma.actor_id = a.actor_id 
INNER JOIN movies m ON ma.movie_id = m.movie_id
INNER JOIN directors d ON m.director_id = d.id;

SELECT a.first_name, a.last_name, m.movie_name FROM actors a 
INNER JOIN movies_actors ma ON ma.actor_id = a.actor_id 
INNER JOIN movies m ON ma.movie_id = m.movie_id
INNER JOIN directors d ON m.director_id = d.id
WHERE d.first_name='Wes';
	
-- UNION
-- combina duas tabelas em uma só, excluindo valores repetidos de cada coluna
SELECT first_name, last_name FROM directors
UNION
SELECT first_name, last_name FROM actors;

-- realizando Union com WHERE em ambas as queries que serão juntadas
SELECT first_name, last_name FROM directors
WHERE nationality='American'
UNION
SELECT first_name, last_name FROM actors
WHERE gender = 'F';

-- Union All
-- semelhante ao UNION, mas retorna registros repetidos
SELECT first_name FROM directors
UNION ALL 
SELECT first_name FROM actors
ORDER BY first_name; -- retornará múltiplos valores iguais (ex: James).
