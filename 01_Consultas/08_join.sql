-- INNER JOIN

-- Seleciona o título do filme e o nome do idioma
SELECT
	f.title,
    l.name AS language_name
FROM film AS f
INNER JOIN language AS l ON f.language_id = l.language_id;
    
-- Encontra o nome do cliente que fez um pagamento
SELECT
	p.payment_id,
    p.amount,
    c.first_name,
    c.last_name
FROM
	payment AS p
INNER JOIN
	customer AS c ON p.customer_id = c.customer_id;

-- Listando filmes e suas categorias
SELECT
	f.title AS Título,
    c.name AS Categoria
FROM
	film AS f
INNER JOIN
	film_category AS fc ON f.film_id
INNER JOIN
	category AS c ON fc.category_id = c.category_id

-- LEFT JOIN

-- Lista todos os clientes e seus pagamentos, incluindo clientes sem pagamentos
SELECT
	c.first_name,
    c.last_name,
    p.amount
FROM customer AS c
LEFT JOIN payment AS p ON c.customer_id = p.customer_id;

-- RIGHT JOIN

-- Lista todos os idiomas e os títulos dos filmes associados, incluindo idiomas sem filmes
SELECT 
	l.name AS language_name, 
    f.title
FROM film AS f
RIGHT JOIN language AS l ON f.language_id = l.language_id
LIMIT 10;

-- CROSS JOIN
-- Gera todas as combinações de ator com idioma
SELECT
	a.first_name,
    a.last_name,
    l.name
FROM
	actor AS a
CROSS JOIN language AS l
LIMIT 100;

-- SELF JOIN

-- Encontra pares de atores com o mesmo sobrenome
SELECT
	a1.first_name,
    a1.last_name,
    a2.first_name,
    a2.last_name
FROM 
	actor AS a1
INNER JOIN
	actor AS a2
ON a1.last_name = a2.last_name
WHERE a1.actor_id != a2.actor_id;
