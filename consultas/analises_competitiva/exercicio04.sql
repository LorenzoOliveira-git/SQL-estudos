--Quais produtos top sellers estão mais caros que todos os concorrentes?
--top sellers = 10 produtos mais vendidos

WITH top_sellers AS (
    SELECT
        p.id_produto,
        p.preco_atual,
        COUNT(v.*) AS Total_vendas
    FROM
        produtos p
    LEFT JOIN
        vendas v ON p.id_produto = v.id_produto
    GROUP BY
        1,2
    ORDER BY
        3 DESC
    LIMIT 10
)

SELECT
    t.*
FROM 
    top_sellers t
WHERE
    t.preco_atual > ALL(
        SELECT
            preco_concorrente
        FROM
            preco_competidores
        WHERE
            t.id_produto = id_produto and preco_concorrente IS NOT NULL
    )

--Outra auternativa mais performática
WITH top_sellers AS (
    SELECT
        p.id_produto,
        p.preco_atual,
        COUNT(v.*) AS Total_vendas
    FROM
        produtos p
    LEFT JOIN
        vendas v ON p.id_produto = v.id_produto
    GROUP BY
        1,2
    ORDER BY
        3 DESC
    LIMIT 10
)

SELECT
    t.*
FROM 
    top_sellers t
WHERE
    t.preco_atual > (
        SELECT
            MAX(preco_concorrente)
        FROM
            preco_competidores
        WHERE
            t.id_produto = id_produto AND preco_concorrente IS NOT NULL
    )

