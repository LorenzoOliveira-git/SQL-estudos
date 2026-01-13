--Qual é a maior e menor venda?

SELECT
    *
FROM 
    vendas
WHERE
    (quantidade * preco_unitario) = (SELECT MAX(quantidade * preco_unitario) FROM vendas)
    or
    (quantidade * preco_unitario) = (SELECT MIN(quantidade * preco_unitario) FROM vendas)
ORDER BY
    (quantidade * preco_unitario) DESC
