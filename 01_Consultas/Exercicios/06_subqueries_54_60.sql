-- 54. (Subconsulta Escalar no WHERE) Encontre o título e a duração dos filmes que têm a 
--     duração maior que a duração média de todos os filmes.
SELECT
  title,
  length
FROM film
WHERE
  length > (
    SELECT
      AVG(length)
    FROM film
	);

-- 55. (Subconsulta de Lista no WHERE com IN) Liste os nomes completos (first_name, 
--     last_name) dos clientes que moram em cidades que pertencem ao país 'Brazil'.
SELECT
  first_name,
  last_name
FROM customer
WHERE
  address_id IN (
    SELECT
      address_id
    FROM address
    WHERE
      city_id IN (
        SELECT
          city_id
        FROM city
        WHERE
          country_id = (
            SELECT
              country_id
            FROM country
            WHERE
              country = 'Brazil'
          )
      )
  );

-- 56. (Subconsulta de Lista no WHERE com NOT IN) Encontre os filmes que não foram 
--     alugados por nenhum cliente (ou seja, não possuem registro na tabela rental).
SELECT
  title
FROM film
WHERE
  film_id NOT IN (
    SELECT DISTINCT
      film_id
    FROM inventory
    WHERE
      inventory_id IN (
        SELECT DISTINCT
          inventory_id
        FROM rental
      )
  );

-- 57. (Subconsulta no FROM - Tabela Derivada) Encontre os 5 rental_rates mais comuns 
--     e a quantidade de filmes que possuem cada um desses rental_rates.
SELECT
  rental_rate,
  quantidade_filmes
FROM (
  SELECT
    rental_rate,
    COUNT(film_id) AS quantidade_filmes
  FROM film
  GROUP BY
    rental_rate
  ORDER BY
    quantidade_filmes DESC
) AS top_rental_rates
LIMIT 5;

-- 58. (Subconsulta no SELECT - Escalar) Para cada filme, liste o title e a quantidade 
--      total de atores que atuaram nele.
SELECT
  f.title,
  (
    SELECT
      COUNT(fa.actor_id)
    FROM film_actor AS fa
    WHERE
      fa.film_id = f.film_id
  ) AS total_atores
FROM film AS f;

-- 59. (Subconsulta Correlacionada - EXISTS) Liste os first_name e last_name de clientes 
--     que fizeram pelo menos um aluguel.
SELECT
  c.first_name,
  c.last_name
FROM customer AS c
WHERE EXISTS (
  SELECT
    1
  FROM rental AS r
  WHERE
    r.customer_id = c.customer_id
);

-- 60. (Subconsulta Correlacionada - NOT EXISTS) Liste os first_name e last_name de atores 
--      que NÃO atuaram em nenhum filme com rating 'R'.
SELECT first_name, last_name
FROM actor a
WHERE NOT EXISTS (
    SELECT 1
    FROM film_actor fa
    JOIN film f ON fa.film_id = f.film_id
    WHERE fa.actor_id = a.actor_id
      AND f.rating = 'R'
);
