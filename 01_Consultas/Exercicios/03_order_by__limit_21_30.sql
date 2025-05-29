-- 21. Liste todos os atores ordenados pelo last_name em ordem alfabética
SELECT
	first_name,
    last_name
FROM
	actor
ORDER BY last_name;

-- 22. Selecione os 10 filmes mais longos, ordenados pela length de 
--     forma decrescente.
SELECT
	title,
    length
FROM
	film
ORDER BY
	length DESC
LIMIT 10;

-- 23. Obtenha os 5 pagamentos mais recentes, ordenados por payment_date 
--     de forma decrescente.
SELECT
	payment_id,
    amount,
    payment_date
FROM
	payment
ORDER BY
	payment_date DESC
LIMIT 5;

-- 24. Liste os filmes mais antigos, mostrando apenas os 3 primeiros, 
--     ordenados por release_year ascendente.
SELECT
    title,
    release_year
FROM
    film
ORDER BY
    release_year ASC  -- ASC (Ascendente) para os mais antigos primeiro
LIMIT 3;

-- 25. Encontre os 5 clientes com os maiores customer_id, ordenados por 
--     customer_id decrescente.
SELECT
	customer_id,
    first_name,
    last_name
FROM
	customer
ORDER BY
	customer_id DESC
LIMIT 5;

-- 26. Liste filmes ordenados primeiro por rental_rate (crescente) e 
--     depois por title (alfabético).
SELECT
	film_id,
    title,
    rental_rate
FROM
	film
ORDER BY
	rental_rate,
    title;
    
-- 27. Selecione a 2ª página de 10 filmes mais caros (do 11º ao 20º), 
--     ordenados por replacement_cost decrescente.
SELECT
	film_id,
    title,
    replacement_cost
FROM
	film
ORDER BY
	replacement_cost DESC
LIMIT 10 OFFSET 10;

-- 28. Mostre os 3 filmes com menor rental_duration.
SELECT
	film_id,
    title,
    rental_duration
FROM
	film
ORDER BY
	rental_duration DESC
LIMIT 3;

-- 29. Liste os 7 clientes mais recentes que estão ativos, ordenados por 
--     create_date decrescente.
SELECT
	customer_id,
    first_name,
    last_name,
    active,
    create_date
FROM
	customer
WHERE 
	active = 1
ORDER BY
	create_date DESC
LIMIT 7;

-- 30. Selecione filmes com length entre 100 e 150, ordenados pelo 
--     title e limitados aos primeiros 5.
SELECT
	film_id,
    title,
    length
FROM
	film
WHERE
	length BETWEEN 100 AND 150
ORDER BY
	title
LIMIT 5;
