-- Lista todos os filmes ordenados pela duração
SELECT title, length
FROM film
ORDER BY length ASC; -- O ASC aqui é opcional

-- Lista os clientes ordernados pelo sobrenome de Z a A
SELECT first_name, last_name
FROM customer
ORDER BY last_name DESC;

-- Seleciona filmes, ordenando primeiro pela de aluguel 
-- Do maior p/ o menor, e depois pelo title, de A a Z para desempate
SELECT title, rental_rate, release_year
FROM film
ORDER BY rental_rate DESC, title ASC;