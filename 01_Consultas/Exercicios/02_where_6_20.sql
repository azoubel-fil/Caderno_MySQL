-- 6. Encontre todos os filmes lançados no ano 2006
SELECT * FROM film WHERE release_year = 2006;

-- 7. Liste os clientes que estão active (valor 1)
SELECT * FROM customer WHERE active = 1;

-- 8. Selecione os filmes com rental_duration igual a 7
SELECT * FROM film WHERE rental_duration = 7;

-- 9.Encontre pagamentos com amount maior que 5.00.
SELECT * FROM payment WHERE amount > 5.00;

-- 10. Liste todos os filmes com rating igual a 'PG-13'
SELECT title, rating
FROM film
WHERE rating = 'PG-13';

-- 11. Selecione os atores cujo first_name é 'PENELOPE'.
SELECT first_name, last_name
FROM actor
WHERE first_name = 'PENELOPE';

-- 12. Encontre pagamentos com amount entre 2.99 e 4.99 (inclusive)
SELECT payment_id, amount
FROM payment
WHERE amount BETWEEN 2.99 AND 4.99;

-- 13. Liste filmes com length menor que 60 ou maior que 180 minutos.
SELECT film_id, title, length
FROM film
WHERE length < 60 OR length > 180;

-- 14. Selecione filmes cujo rating é 'G' ou 'R'
SELECT film_id, title, rating
FROM film
WHERE rating = 'G' or rating = 'R';

-- 15. Encontre todos os filmes que não são classificados como 'PG'.
SELECT
	title,
    rating
FROM
	film
WHERE
	rating != 'PG';

-- 16. Liste clientes cujos first_name começam com a letra 'A'.
SELECT
	first_name
FROM
	customer
WHERE first_name LIKE 'A%';

-- 17. Selecione filmes cujo title contém a palavra LOVE em qualquer posição.
SELECT
	title
FROM
	film
WHERE
	title LIKE '%LOVE%';
    
-- 18. Encontre endereços que não possuem address2 (ou seja, address2 é NULL).
SELECT
	address,
    address2
FROM address
WHERE
	address2 IS NULL;

-- 19 Liste todos os filmes com special_features que incluem 'Trailers' E 'Deleted Scenes'.
SELECT
	title,
    special_features
FROM 
	film
WHERE
	special_features LIKE '%Trailers%' 
AND 
	special_features LIKE '%Deleted Scenes%';

-- 20. Selecione filmes com rental_rate diferente de 0.99.
SELECT
	title,
    rental_rate
FROM
	film
WHERE
	rental_rate != 0.99;

