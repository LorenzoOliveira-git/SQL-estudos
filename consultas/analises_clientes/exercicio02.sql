--Quais clientes compram mais?

SELECT
    c.nome_cliente,
    COUNT(v.*) AS Total_compras
FROM
    clientes c
JOIN
    vendas v ON c.id_cliente = v.id_cliente
GROUP BY
    c.id_cliente
ORDER BY
    2 DESC