
-- creating a movies database, containing 5 tables

CREATE DATABASE movies_db;

-- creating a table to hold the movies directors data
CREATE TABLE directors(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30) NOT NULL,
  date_of_birth DATE,
  nationality VARCHAR(20)
);

-- table for actors data
CREATE TABLE actors(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  gender CHAR(1),
  date_of_birth DATE

);
-- creating the main table (Movies)
CREATE TABLE movies(
  id SERIAL PRIMARY KEY,
  movie_name VARCHAR(50),
  movie_length INT, 
  movie_lang VARCHAR(20),
  release_date DATE,
  age_certificate CHAR(5),
  director_id INT REFERENCES directors(id)
  

);

-- table for data about revenues $$ of movies
CREATE TABLE movie_revenues(
  id SERIAL PRIMARY KEY,
  movie_id REFERENCES movies(id),
  domestic_takings NUMERIC(6,2),
  international_takings NUMERIC(6,2)
);

-- creating table for the movie actors that is basically a junction of two tables
CREATE TABLE movie_actors(
  movie_id REFERENCES movies(id);
  actor_id REFERENCES actors(id);
  PRIMARY KEY (movie_id, actor_id) -- chave primária composta da junção dos valores das duas chaves estrangeiras
