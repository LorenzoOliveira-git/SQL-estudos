--Quais categorias geram mais de R$ 50.000 em receita?

SELECT
    p.categoria,
    SUM(v.quantidade * v.preco_unitario) AS Receita_total
FROM
    produtos p
JOIN
    vendas v ON v.id_produto = p.id_produto
GROUP BY
    p.categoria
HAVING
    SUM(v.quantidade * v.preco_unitario) > 50000