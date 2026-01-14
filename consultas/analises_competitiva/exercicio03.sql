--Qual é a diferença percentual entre nossos preços e dos concorrentes?

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
    p.nome_produto,
    p.preco_atual,
    m.Preco_concorrente,
    (p.preco_atual - m.Preco_concorrente) / (p.preco_atual + m.Preco_concorrente) * 100 AS Diferenca_percentual
FROM    
    produtos p
LEFT JOIN
    media_preco_concorrente m ON p.id_produto = m.id_produto
ORDER BY    
    4 DESC