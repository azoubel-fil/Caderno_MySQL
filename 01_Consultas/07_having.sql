-- Lista as classificações que possuem mais de 200 filmes
SELECT rating, COUNT(*) AS QuantidadeFilmes
FROM film
GROUP BY rating
HAVING COUNT(*) > 200;

-- Encontra clientes que fizeram pagamentos totais acima de 150.00
SELECT customer_id, SUM(amount) AS TotalPago
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 150.00;