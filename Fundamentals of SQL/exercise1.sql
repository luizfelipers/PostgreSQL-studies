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

-- CHALLENGE 1 

-- 1) INSERT DATA INTO THE owners TABLE

	
	SELECT * FROM owners;
	
	INSERT INTO owners(first_name, last_name, city, state, email)
	VALUES ('Samuel', 'Smith', 'Boston','MA', 'samsmith@gmail.com'),
	('Emma','Johnson','Seattle','WA','emjohnson@gmail.com'),
	('John', 'Oliver', 'New York', 'NY', 'johnoliver@gmail.com'),
	('Olivia', 'Brown', 'San Francisco', 'CA', 'oliviabrown@gmail.com'),
	('Simon', 'Smith','Dallas','TX', 'sismith@gmail.com');
	
	INSERT INTO owners(first_name, last_name, city, state, email) 
	VALUES (null, 'Maxwell', null , 'CA', 'lordmaxwell@gmail.com');
	

-- 2) INSERT DATA INTO THE pets TABLE
SELECT * FROM pets;
	
	INSERT INTO pets (species, full_name, age, owner_id)
	VALUES ('Dog', 'Rex', 6, 1),
	('Rabbit', 'Fluffy', 2, 5),
	('Cat', 'Tom', 8, 2),
	('Mouse', 'Jerry', 2, 2),
	('Dog', 'Biggles', 4, 1),
	('Tortoise', 'Squirtle', 42, 3)
	;
	
-- 3) Change Fluffy's age to 3 inside the Pets Table
	UPDATE pets SET age = 3 WHERE full_name = 'Fluffy';
	
	SELECT * FROM owners;
-- 4) DELETE Mr. Maxwell register in the owners table
	DELETE FROM owners WHERE last_name = 'Maxwell';
