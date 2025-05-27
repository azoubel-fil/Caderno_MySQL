-- VIEWS

-- Cria uma view que mostra o título do filme, o nome da categoria e 
-- o nome do idioma para filmes lançados em 2006.
CREATE VIEW filmes_info_2006 AS
SELECT
	f.title AS TituloFilme,
    c.name AS Categoria,
    l.name AS Idioma
FROM
	film AS f
INNER JOIN
	language AS l ON f.language_id = l.language_id
INNER JOIN
	film_category AS fc ON f.film_id = fc.film_id
INNER JOIN
	category AS c ON fc.category_id = c.category_id
WHERE
	f.release_year = 2006;
    
-- Usando a view
SELECT
	TituloFilme,
    Categoria
FROM filmes_info_2006
WHERE Categoria = 'Comedy'
LIMIT 5;

-- ALTER VIEW
-- Altera a view 'filmes_info_2006' para incluir a taxa de aluguel 
-- e agora mostrar filmes lançados a partir de 2005.
ALTER VIEW filmes_info_2006 AS
SELECT
    f.title AS TituloFilme,
    c.name AS Categoria,
    l.name AS Idioma,
    f.rental_rate AS TaxaAluguel
FROM
    film AS f
INNER JOIN 
	language AS l ON f.language_id = l.language_id
INNER JOIN 
	film_category AS fc ON f.film_id = fc.film_id
INNER JOIN 
	category AS c ON fc.category_id = c.category_id
WHERE f.release_year >= 2005;

SELECT
	TituloFilme,
    Categoria,
    Idioma,
    TaxaAluguel
FROM filmes_info_2006
WHERE Categoria = 'Comedy'
LIMIT 5;

-- DROP VIEW
-- Exclui a view 'filmes_info_2006'.
DROP VIEW filmes_info_2006;