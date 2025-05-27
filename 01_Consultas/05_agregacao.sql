-- Conta o número total de filmes
SELECT COUNT(*) AS TotalFilmes
FROM film;

-- Calcula o valor total de todos os pagamentos
SELECT SUM(amount) AS ValorTotalPagamentos
FROM payment;

-- Calcula a média da duração de todos os filmes
SELECT AVG(length) AS DuracaoMediaFilmes
FROM film;

-- Encontra o custo de aluguel mínimo
SELECT MIN(rental_rate) AS MenorTaxaAluguel
FROM film;

-- Encontra o maior custo de reposição de um filme
SELECT MAX(replacement_cost) AS MaiorCustoReposicao
FROM film;