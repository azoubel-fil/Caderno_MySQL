-- 45. (INNER JOIN) Liste o título do filme e o nome do idioma (language.name).
SELECT 
	f.title, 
    l.name
FROM 
	film AS F
INNER JOIN
	language AS l
ON
	f.language_id = l.language_id;

-- 46. (INNER JOIN) Mostre o first_name e last_name do cliente junto com o
--     amount de cada pagamento que ele fez.
SELECT
	c.first_name,
    c.last_name,
    p.amount
FROM
	customer AS c
INNER JOIN
	payment AS p
ON
	c.customer_id = p.customer_id;
    
-- 46 modificado para mostrar a soma de pagamentos de cada cliente
SELECT
	c.first_name,
    c.last_name,
    SUM(p.amount) AS TotalPagamento
FROM
	customer AS c
INNER JOIN
	payment AS p
ON
	c.customer_id = p.customer_id
GROUP BY
	c.customer_id;

-- 47. (INNER JOIN com três tabelas) Liste o título do filme, o nome da categoria 
--     (category.name) e o nome do idioma (language.name).
SELECT
	f.title,
    c.name,
    l.name
FROM
	film AS f
INNER JOIN film_category AS fc ON f.film_id = fc.film_id
INNER JOIN category AS c ON fc.category_id = c.category_id
INNER JOIN language AS l ON f.language_id = l.language_id;

-- 48. (LEFT JOIN) Liste todos os filmes e, se houver, o nome da categoria. 
--     Inclua filmes que não estão associados a nenhuma categoria (se houver).
SELECT
	f.title,
    c.name
FROM 
	film AS f
LEFT JOIN film_category AS fc ON fc.film_id = f.film_id
LEFT JOIN category AS c ON c.category_id = fc.category_id;

-- 49. (LEFT JOIN com contagem) Conte quantos aluguéis cada cliente fez, 
--     incluindo clientes que não fizeram nenhum aluguel (o resultado de COUNT 
--     para esses clientes deve ser 0). Mostre first_name, last_name e a contagem.
SELECT
	c.first_name,
    c.last_name,
    COUNT(r.rental_id)
FROM
	customer AS C
LEFT JOIN 
	rental AS r 
ON 
	c.customer_id = r.customer_id
GROUP BY c.customer_id;

-- 50. (RIGHT JOIN) Liste todos os idiomas e os títulos dos filmes associados a 
--     cada um. Inclua idiomas que não têm nenhum filme associado.
SELECT
	l.name,
    f.title
FROM film AS F
RIGHT JOIN language AS l ON f.language_id = l.language_id;

-- 51. (SELF JOIN) Encontre pares de atores que têm o mesmo last_name. Mostre o 
--     first_name e last_name de ambos os atores, garantindo que não seja o mesmo 
--     ator comparado consigo mesmo.
SELECT
	a1.first_name AS NomeAtor1,
    a2.first_name AS NomeAtor2,
    a1.last_name AS SobrenomeComum
FROM actor AS a1
JOIN actor AS a2 ON a1.last_name = a2.last_name AND a1.actor_id <> a2.actor_id;

-- 52. (INNER JOIN com filtro) Liste todos os atores que atuaram em filmes do gênero 'Action'.
SELECT
	a.first_name AS Nome,
    a.last_name AS Sobrenome,
    COUNT(f.film_id) AS TotalFilmesAcao
FROM actor AS a
INNER JOIN film_actor as fa ON a.actor_id = fa.actor_id
INNER JOIN film AS f ON f.film_id = fa.film_id
INNER JOIN film_category AS fc ON fc.film_id = f.film_id
INNER JOIN category AS c ON c.category_id = fc.category_id
WHERE c.name = 'Action'
GROUP BY a.actor_id;

-- 53. (INNER JOIN e ORDER BY) Mostre o título do filme e o nome completo do ator 
--     (first_name, last_name), ordenado pelo título do filme e depois pelo sobrenome 
--     do ator.
SELECT
	f.title AS TituloFilme,
    a.first_name AS Nome,
    a.last_name AS Sobrenome
FROM film AS f
INNER JOIN film_actor AS fc ON fc.film_id = f.film_id
INNER JOIN actor AS a ON a.actor_id = fc.actor_id
ORDER BY f.title, a.last_name;
