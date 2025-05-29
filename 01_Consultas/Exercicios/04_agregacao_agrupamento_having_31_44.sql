-- 31. Conte o número total de filmes na tabela film.
SELECT COUNT(*) AS TotalFilmes from film;

-- 32. Calcule o valor total de todos os pagamentos.
SELECT SUM(amount) AS ValorTotal FROM payment;

-- 33. Encontre a duração média de todos os filmes.
SELECT AVG(length) AS DuracaoMedia FROM film;

-- 34. Qual o menor e o maior rental_rate entre todos os filmes?
SELECT
	MAX(rental_rate) AS MaiorRental,
    MIN(rental_rate) AS MenorRental
FROM
	film;

-- 35. Quantos clientes estão ativos e quantos estão inativos? (Use GROUP BY e active).
SELECT
	active,
    COUNT(customer_id) AS TotalClientes
FROM
	customer
GROUP BY 
	active;
	
-- 36. Calcule o número de filmes por rating (classificação).
SELECT
	rating,
    COUNT(film_id) AS TotalPorRating
FROM
	film
GROUP BY
	rating;

-- 37. Determine a soma total de amount para cada customer_id.
SELECT
	customer_id,
    SUM(amount)
FROM
	payment
GROUP BY
	customer_id;

-- 38. Qual a duração média dos filmes para cada rating?
SELECT
	rating,
    AVG(length)
FROM film
GROUP BY rating;

-- 39. Conte quantos filmes existem para cada rental_duration.
SELECT
	rental_duration,
	COUNT(film_id)
FROM
	film
GROUP BY
	rental_duration;

-- 40. Liste os ratings que possuem mais de 200 filmes.
SELECT
	COUNT(film_id) AS QuantidadeFilmes,
    rating
FROM
	film
GROUP BY
	rating
HAVING
	COUNT(*) > 200;

-- 41. Encontre os customer_ids que fizeram mais de 40 pagamentos.
SELECT
	customer_id,
    COUNT(payment_id)
FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id) > 40;

-- 42. Calcule a média de rental_rate para cada release_year, mostrando 
--     apenas os anos cuja média é maior que 3.00.
SELECT
	release_year,
    AVG(rental_rate)
FROM
	film
GROUP BY
	release_year
HAVING 
	AVG(rental_rate) > 3.00;

-- 43. Liste os países (do country_id na tabela city) que têm mais de 10 cidades 
--     registradas.
SELECT
	country_id,
    COUNT(city_id) AS TotalCidades
FROM
	city
GROUP BY
	country_id
HAVING
	COUNT(country_id) > 10;
    
-- 44. Qual o film_id e o COUNT de atores para cada filme que tem mais de 5 atores? 
--     (Precisa de JOIN e GROUP BY aqui).
SELECT
    f.film_id,
    f.title,
    COUNT(fa.actor_id) AS TotalAtores
FROM
	film as f
INNER JOIN
	film_actor AS fa ON f.film_id = fa.film_id
GROUP BY
	f.film_id,
    f.title
HAVING
	COUNT(fa.actor_id) > 5;
	

	

