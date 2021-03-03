
-- postgreSQL default Database creation code template 
CREATE DATABASE test
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
  -- creating an examples table with some values to modify
CREATE TABLE examples(
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30)

);
-- testing the values
SELECT * FROM examples;

-- modifying the examples table by adding an email column w/ the UNIQUE constraint
ALTER TABLE examples ADD COLUMN email VARCHAR(50) UNIQUE;

-- modifying the examples table by adding 2 columns in a single command
ALTER TABLE examples ADD COLUMN nationality VARCHAR(30),
ADD COLUMN age INT NOT NULL;

-- modifying the examples table by changing the 'nationality' column's datatype, from VARCHAR(30) to CHAR(3)
ALTER TABLE examples ALTER COLUMN nationality TYPE CHAR(3);

-- modifying the examples table by changing 2 columns datatype
ALTER TABLE examples ALTER COLUMN email TYPE VARCHAR(60),
					ALTER COLUMN last_name TYPE VARCHAR(20);
					
-- comandos de INSERT

SELECT * FROM examples;

-- inserting data into examples table from test database

INSERT INTO examples(first_name, last_name, email, nationality, age)
VALUES ('David', 'Mitchell','dmitch@gmfake.com', 'GBR',44);

-- inserting multiple rows of data into examples table from test database
INSERT INTO examples(first_name, last_name, email, nationality, age)
VALUES ('Emily', 'Watson','ewatson@gfake.com','USA', 29),
		('Theo','Scott','theozinho@fakemail.com', 'AUS', 34),
		('Emily','Smith', 'esmith@jmail.com', 'GBR', 29),
		('Jim', 'Bareer', 'jbareer@gmail.com','USA', 54);

-- comandos de UPDATE

-- REALIZANDO O UPDATE DO EMAIL DO REGISTRO A PARTIR DA CHAVE PRIMÁRIA
UPDATE examples SET email = 'davidmitchell@gmfake.com' WHERE examples.id = 1;
-- REALIZANDO O UPDATE DO EMAIL DO REGISTRO A PARTIR DO VALOR ATUAL DO EMAIL DO REGISTRO.
UPDATE examples SET email = 'davidmitchell@gmfakinho.com' WHERE examples.email = 'davidmitchell@gmfake.com';

-- mudando o valor da nacionalidade de todos os registros para 'CAN', onde o valor atual de nationality seja 'USA'
UPDATE examples SET nationality ='CAN' WHERE examples.nationality ='USA';

SELECT * FROM examples;

-- atualizando o valor de duas colunas(first_name e age), do registro de id 5
UPDATE examples SET first_name = 'Jimbo', age = 55 WHERE examples.id = 5;


