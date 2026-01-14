--Quais produtos estão mais caros que a média dos concorrentes?

WITH media_preco_concorrente AS (
    SELECT
        id_produto,
        ROUND(AVG(preco_concorrente)::NUMERIC,2) AS Preco_concorrente
    FROM 
        preco_competidores
    GROUP BY
        id_produto
)

SELECT
    p.id_produto,
    p.preco_atual AS Nosso_preco,
    m.Preco_concorrente AS Preco_concorrente
FROM
    produtos p
LEFT JOIN
    media_preco_concorrente m ON m.id_produto = m.id_produto
WHERE
    p.preco_atual > m.Preco_concorrente