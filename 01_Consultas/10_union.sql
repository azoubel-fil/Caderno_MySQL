-- Lista os primeiros nomes e sobrenomes de todos os atores e clientes,
-- removendo duplicatas se houver nomes idênticos em ambas as tabelas.
SELECT
	first_name,
    last_name
FROM actor
UNION
SELECT
	first_name,
    last_name
FROM customer
ORDER BY first_name, last_name
LIMIT 10;

-- Lista os títulos de filmes e os sobrenomes de atores em uma única coluna,
-- identificando o tipo de cada entrada, e incluindo todas as duplicatas.
SELECT 
	title AS NomeEntidade, 
    'Filme' AS TipoEntidade
FROM 
	film
WHERE 
	rating = 'PG'
UNION ALL
SELECT 
	last_name AS NomeEntidade, 
    'Ator' AS TipoEntidade
FROM 
	actor
WHERE 
	CHAR_LENGTH(last_name) < 5
ORDER BY 
	TipoEntidade, 
    NomeEntidade;