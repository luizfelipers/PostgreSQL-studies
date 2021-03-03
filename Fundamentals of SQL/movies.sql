
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

