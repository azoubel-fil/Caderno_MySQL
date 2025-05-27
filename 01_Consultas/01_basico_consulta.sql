USE sakila;

-- Seleciona o título e o ano de lançamento de todos os filmes
SELECT title, release_year
FROM film;

-- Seleciona todas as colunas da tabela actor
SELECT * FROM actor;

-- Seleciona o primeiro nome e o sobrenome do ator, renomeando as colunas (Alias)
SELECT first_name AS Nome,
	last_name AS Sobrenome
	FROM actor;