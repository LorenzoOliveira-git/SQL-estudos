--Quantas vendas e qual a receita total por categoria?

SELECT 
    p.categoria,
    COUNT(*) AS Quantidade_de_vendas,
    SUM(quantidade*preco_unitario) AS Receita_total
FROM
    vendas v
JOIN
    produtos p ON p.id_produto = v.id_produto
GROUP BY
    p.categoria