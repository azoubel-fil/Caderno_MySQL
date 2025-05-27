USE sakila;

-- OPERADORES DE COMPARAÇÃO
-- Encontra filmes lançados exatamente em 2006
SELECT title, release_year
FROM film
WHERE release_year = 2006;

-- Lista todos os pagamentos que foram maiores que 10.00
SELECT payment_id, amount
FROM payment
WHERE amount > 10.00;

-- OPERADORES LÓGICOS
-- Lista filmes com duração maior que 100 minutos E classificação PG-13
SELECT title, length, rating
FROM film
WHERE length > 100 AND rating = 'PG-13';

-- Lista filmes com classificação PG OU PG-13
SELECT title, rating
FROM film
WHERE rating = 'PG' OR rating = 'PG-13';

-- Seleciona filmes que NÃO são classificados como NC-17
SELECT title, rating
FROM film
WHERE NOT rating = 'NC-17';

-- BETWEEN
-- Seleciona filmes com duração entre 90 e 120 minutos
SELECT title, length
FROM film
WHERE length BETWEEN 90 AND 120;

-- Encontra pagamentos feitos entre duas datas específicas
SELECT payment_id, amount, payment_date
FROM payment
WHERE payment_date BETWEEN '2005-05-26' AND '2005-06-26';

-- IN
-- Seleciona filmes que tem a classificação G, PG ou NC-17
SELECT title, rating
FROM film
WHERE rating NOT IN ('G', 'PG', 'NC-17');

-- Lista filmes que NÃO tem a classificação R nem PG-13
SELECT title, rating
FROM film
WHERE rating NOT IN ('R', 'PG-13');

-- LIKE
-- Lista atores cujos primeiros nomes começam com a letra A
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'A%';

-- Lista atores cujos primeiros nomes NÃO começam com a letra A
SELECT first_name, last_name
FROM actor
WHERE first_name NOT LIKE 'A%';

-- Encontra filmes cujo título contém 'DRAMA' em qualquer posição.
SELECT title, description
FROM film
WHERE description LIKE '%DRAMA%';

-- Seleciona títulos de filmes que têm 'A' como segundo caractere.
SELECT title FROM film WHERE title LIKE '_A%';

-- NULL
-- Encontra filmes que não têm uma descrição definida.
SELECT title, description
FROM film
WHERE description IS NULL;

-- Encontra funcionários que não tem foto
SELECT first_name, last_name
FROM staff
WHERE picture IS NULL;

-- Lista clientes que possuem um endereço de e-mail (ou seja, não é NULL).
SELECT first_name, last_name, email
FROM customer
WHERE email IS NOT NULL;