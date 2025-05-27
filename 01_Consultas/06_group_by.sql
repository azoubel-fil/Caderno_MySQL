-- Conta quantos filmes existem para cada classificação (rating)
SELECT rating, COUNT(*) AS QuantidadeFilmes
FROM film
GROUP BY rating;

-- Calcula o valor total de aluguéis e quantidade de 
-- alguéis para cada cleinte
SELECT 
	customer_id, 
    SUM(amount) AS TotalAluguelCliente, 
    COUNT(rental_id) AS QuantidadeAlugueis
FROM payment
GROUP BY customer_id;