--Qual é a distribuição percentual de receita por canal?

SELECT
    p.categoria,
    CONCAT(ROUND((SUM(v.quantidade * v.preco_unitario) / (SELECT SUM(quantidade * preco_unitario) FROM vendas)) *100::NUMERIC, 2), '%') AS Distribuição_percentual_de_receita
FROM
    produtos p
JOIN
    vendas v ON p.id_produto = v.id_produto
GROUP BY
    p.categoria