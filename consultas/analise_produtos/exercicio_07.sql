--Quais produtos têm preço acima da média geral?

SELECT
    *
FROM
    produtos
WHERE 
    preco_atual > (SELECT AVG(preco_atual) FROM produtos)