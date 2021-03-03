-- Database: owner_pets

-- DROP DATABASE owner_pets;

CREATE DATABASE owner_pets
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
  -- create a table for the owners data
  
CREATE TABLE owners(
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	city VARCHAR(30),
	state CHAR(2)

);

-- create a table for the pets data, with a column (FOREIGN KEY) referencing the owners table 

CREATE TABLE pets(
	id SERIAL PRIMARY KEY,
	species VARCHAR(30),
	full_name VARCHAR(30),
	age INT,
	owner_id INT REFERENCES owners(id)

);
-- modify the owners table an add an email column to it
ALTER TABLE owners ADD COLUMN email VARCHAR(50);
-- modify the owners table by changing the last_name column to a VARCHAR of max-length of 50
ALTER TABLE owners ALTER COLUMN last_name TYPE VARCHAR(50);

SELECT * FROM owners;
SELECT * FROM pets;
