--Quais vendas foram feitas de produtos não cadastrados?

SELECT
    v.*
FROM
    vendas v
LEFT JOIN
    produtos p ON v.id_produto = p.id_produto
WHERE p.id_produto is NULL