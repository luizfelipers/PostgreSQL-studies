-- Aprendendo as particularidades do SQL usado no SGBD PostgreSQL
-- criação da trabela customers
CREATE TABLE customers(
id INT,
        last_name VARCHAR,
        first_name VARCHAR,
        age INT,
        email_id VARCHAR
);

-- inserção de valores na tabela customers de forma direta
insert into customers values (1, ‘bee’, ‘cee’, 32, ‘bc@xyz.com’);

-- inserção de valores na tabela customers, com ausência dos valores da coluna 'last_name'
insert into customers (id, first_name, age, email_id) values (2, ‘dee’, 44, ‘emaildoido@email.com’);

-- inserção de valores na tabela customers, desconsiderando os valores da coluna 'first_name'
insert into customers (id, last_name, age, email_id) values (3, ‘dedede’, 12, ‘fakemail@phub.com’);

-- inserção de múltiplas linhas de valores na tabela customers
insert into customers (id, last_name, age, email_id) values (3, ‘dedede’, 12, ‘fakemail@phub.com’),(4, ‘deddsdssdede’, 22, ‘fakemail2@phasdasub.com’);
