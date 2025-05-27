-- FUNÇÕES DE STRING
SELECT
	CONCAT(first_name, ' ', last_name) AS NomeCompleto,
    CHAR_LENGTH(title) AS TamanhoTitulo,
    UPPER(last_name) AS SobrenomeMaiusculo,
    LOWER(first_name) AS NomeMinusculo,
    SUBSTRING(description, 1, 20) AS DescricaoCurta,
    TRIM('    Exemplo com espaços     ') AS ExTrim,
    REPLACE(title, 'ACADEMY', 'UNIVERSAL') AS TituloModificado
FROM
	actor,
    film
WHERE
	actor_id = 1 AND film_id = 1;

-- FUNÇÕES NUMÉRICAS
SELECT
	ROUND(rental_rate, 1) AS TaxaAluguelArredondada,
    CEIL(rental_rate) AS ArredondadaParaCima,
    FLOOR(rental_rate) AS ArredondadaParaBaixo,
    ABS(-15.83) AS ValorAbsoluto
FROM
	film
WHERE
	film_id = 1;

-- FUNÇÕES DE DATA E HORA
SELECT
	NOW() AS DataHoraAtualSistema,
    CURDATE() AS DataAtualSistema,
    CURTIME() AS HoraAtualSistema,
    DATE_FORMAT(last_update, '%d/%m/%Y %H:%i:%s') AS UltimaAtualizacaoFormatada,
    DATEDIFF('2025-06-15', '2025-06-01') AS DiasEntreDatas,
    YEAR(last_update) AS AnodoUpdate,
    MONTH(last_update) AS MesDoUpdate,
    DAY(last_update) AS DiaDoUpdate
FROM
	film
WHERE
	film_id = 1;

-- FUNÇÕES DE FLUXO DE CONTROLE
-- Usando CASE para categorizar filmes com base na duração
SELECT
    f.title AS TituloFilme,
    f.rental_rate,
    f.length,
    CASE
        WHEN f.length < 60 THEN 'Curta Duração'
        WHEN f.length >= 60 AND f.length < 120 THEN 'Duração Média'
        ELSE 'Longa Duração'
    END AS CategoriaDuracao
FROM
    film AS f
WHERE
    f.rental_rate > 2.99 -- Filtra filmes com taxa de aluguel acima de um valor
LIMIT 10;

-- Exemplo de IF para verificar o status de um cliente específico
SELECT
    c.first_name,
    c.last_name,
    c.active,
    IF(c.active = 1, 'Cliente Ativo', 'Cliente Inativo') AS StatusDoCliente
FROM
    customer AS c;