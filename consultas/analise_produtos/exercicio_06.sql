--Classifique os produtos por faixa de preço em relação ao concorrente.

--REGRA DE NEGÓCIO: se o produto estiver com um valor acima de 1/4 do concorrente, vai ser faixado como VALOR ALTO, se estiver com um valor abaixo de 1/4 var ser faixado como VALOR BAIXO, se não vai ser faixado como VALOR NORMAL.

--CTE
WITH valor_concorrente AS (
    SELECT 
        id_produto,
        ROUND(AVG(preco_concorrente)::NUMERIC, 2) AS preco_concorrente
    FROM
        preco_competidores
    GROUP BY
        id_produto
)

SELECT
    p.id_produto,
    p.nome_produto,
    p.preco_atual AS nosso_preco_atual,
    v.preco_concorrente,
    CASE 
        WHEN p.preco_atual > v.preco_concorrente*1.25 THEN 'VALOR ALTO'
        WHEN p.preco_atual < v.preco_concorrente*0.75 THEN 'VALOR BAIXO'
        ELSE 'VALOR NORMAL'
    END
    AS classificação
FROM 
    produtos p
JOIN
    valor_concorrente v ON p.id_produto = v.id_produto
