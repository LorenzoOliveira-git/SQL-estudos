--Quais produtos estão mais caros que a média dos concorrentes?

WITH media_concorrentes AS (
    SELECT
        id_produto,
        ROUND(AVG(preco_concorrente)::NUMERIC,2) AS media_de_preco
    FROM
        preco_competidores
    GROUP BY
        1
)

SELECT
    p.id_produto,
    p.preco_atual,
    m.media_de_preco AS Media_preco_concorrente
FROM
    produtos p
JOIN
    media_concorrentes m ON p.id_produto = m.id_produto
WHERE p.preco_atual > m.media_de_preco