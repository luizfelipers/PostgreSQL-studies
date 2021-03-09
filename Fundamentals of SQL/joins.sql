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
