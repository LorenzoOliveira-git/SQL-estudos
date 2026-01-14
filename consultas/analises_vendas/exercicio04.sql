--Como ver o nome do produto junto com a venda? 

SELECT
    p.nome_produto,
    v.*
FROM
    produtos p
JOIN
    vendas v ON p.id_produto = v.id_produto