--Qual é o ticket médio por segmento de cliente?
--segmento:
--Use CASE WHEN para categorizar os clientes em:
--    - "VIP": receita total >= R$ 10.000
--    - "TOP_TIER": receita total entre R$ 5.000 e R$ 9.999
--    - "REGULAR": receita total < R$ 5.000

WITH segmentacao AS (
    SELECT
        c.id_cliente,
        c.nome_cliente,
        SUM(v.quantidade * v.preco_unitario) AS Total_gasto,
        CASE 
            WHEN SUM(v.quantidade * v.preco_unitario) >=10000 THEN 'VIP'
            WHEN SUM(v.quantidade * v.preco_unitario) < 5000 THEN 'REGULAR'
            ELSE 'TOP_TIER'
        END
        AS Segmentação_do_cliente
    FROM
        clientes c
    LEFT JOIN
        vendas v ON c.id_cliente = v.id_cliente
    GROUP BY
        1,2
)

SELECT
    Segmentação_do_cliente,
    SUM(Total_gasto) AS Receita_total,
    COUNT(*) AS Quantidade_de_clientes,
    ROUND((SUM(Total_gasto) / COUNT(*))::NUMERIC,2) AS Ticket_medio 
FROM
    segmentacao
GROUP BY
    1
