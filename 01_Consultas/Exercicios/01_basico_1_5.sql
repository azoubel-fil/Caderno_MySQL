-- 1. Selecione todas as colunas da tabela actor
SELECT * FROM actor;

-- 2. Liste o title e o release_year de todos os filmes.
SELECT
	title,
    release_year
FROM
	film;

-- 3. Obtenha o first_name e last_name de todos os clientes, 
--    renomeando as colunas para Nome e Sobrenome.
SELECT
	first_name AS Nome,
    last_name AS Sobrenome
FROM
	customer;
    
-- 4. Selecione o address e o phone da tabela address, 
--    renomeando-os para Endereco e Telefone.
SELECT
	address AS Endereco,
    phone AS Telefone
FROM
	address;

-- 5. Liste os film_id e inventory_id da tabela inventory.
SELECT
	film_id,
    inventory_id
FROM
	inventory;