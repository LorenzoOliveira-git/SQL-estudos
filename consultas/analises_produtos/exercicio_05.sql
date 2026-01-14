--Quais produtos nunca foram vendidos?

SELECT
    p.*,
    count(*) AS quantidade_vendida
FROM 
    produtos p
LEFT JOIN 
    vendas v ON p.id_produto = v.id_produto
GROUP BY 
    p.id_produto
HAVING 
    count(*) = 0