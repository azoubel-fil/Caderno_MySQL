-- Encontra Filmes cuja duração é maior que a duração média de TODOS os filmes
SELECT
	title,
    length
FROM film
WHERE
	length > (SELECT AVG(length) FROM film);
    
-- Lista atores que atuaram em filmes com classificação NC-17
SELECT
	first_name,
    last_name
FROM actor
WHERE actor_id IN (
	SELECT actor_id
    FROM film_actor AS fa
    INNER JOIN film AS f ON fa.film_id = f.film_id
    WHERE f.rating = 'NC-17'
);

-- Lista clientes que fizeram pelo menos um pagamento
SELECT
	first_name,
    last_name
FROM customer AS c
WHERE EXISTS (
	SELECT 1
    FROM payment AS p
    WHERE p.customer_id = c.customer_id
);

-- Encontra a média de aluguel por classificação (rating) 
-- e depois seleciona apenas as médias maiores que 3.00
SELECT
	dt.rating,
    dt.media_aluguel
FROM(
	SELECT rating, AVG(rental_rate) AS media_aluguel
    FROM film
    GROUP BY rating) AS dt
WHERE
	dt.media_aluguel > 2.00;

-- Lista o título do filme e a contagem de atores para cada filme
SELECT
	f.title,
    (SELECT COUNT(*) FROM film_actor WHERE film_id = f.film_id) AS TotalAtores
FROM film AS f
LIMIT 5;

-- Lista filmes cuja taxa de aluguel é maior que a taxa de alguel Média de Filmes
-- na MESMA CATEGORIA
SELECT
	f.title,
	f.rental_rate,
	c.name AS category_name
FROM
	film AS f
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS c ON fc.category_id = c.category_id
WHERE f.rental_rate > (
	SELECT AVG(f2.rental_rate) -- Subconsulta correlacionada, depende de 'c.name' da consulta externa
	FROM film AS f2
	INNER JOIN film_category AS fc2 ON f2.film_id = fc2.film_id
	INNER JOIN category AS c2 ON fc2.category_id = c2.category_id
	WHERE c2.name = c.name -- A condição 'c.name' é da consulta EXTERNA
)
LIMIT 10;