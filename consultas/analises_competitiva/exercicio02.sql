--Quais produtos estão mais baratos no concorrente do que na nossa tabela? 

SELECT
    p.nome_produto,
    c.nome_concorrente,
    p.preco_atual AS Nosso_preco,
    c.preco_concorrente
FROM
    produtos p
RIGHT JOIN
    preco_competidores c ON p.id_produto = c.id_produto
WHERE
    p.preco_atual > c.preco_concorrente
