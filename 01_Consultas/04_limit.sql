-- Seleciona os 5 primeiros filmes
SELECT title
FROM film
LIMIT 5;

-- Pula os 10 primeiros filmes mais longos e retorna os próximos 5
SELECT title, length
FROM film
ORDER BY length desc
LIMIT 10, 5;

-- Retorna os 5 primeiros filmes mais curtos (offset 0 implícito)
SELECT title, length
FROM film
ORDER BY length ASC
LIMIT 5;