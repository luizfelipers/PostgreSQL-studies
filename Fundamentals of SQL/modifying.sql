
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
