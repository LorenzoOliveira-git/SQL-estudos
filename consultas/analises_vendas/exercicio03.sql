--Quantos produtos diferentes foram vendidos?

SELECT
    COUNT(DISTINCT id_produto) AS Quantidade_de_produtos_diferentes_vendidos
FROM
    vendas