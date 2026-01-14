--Qual é a receita total por categoria?

SELECT
    p.categoria,
    COALESCE(SUM(v.quantidade * v.preco_unitario),0) AS Receita_total
FROM
    produtos p
LEFT JOIN
    vendas v ON p.id_produto = v.id_produto
GROUP BY
    p.categoria
