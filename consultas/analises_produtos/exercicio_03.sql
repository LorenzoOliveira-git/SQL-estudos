--Quais são os 10 primeiros produtos mais caros?

SELECT 
    *
FROM 
    produtos
ORDER BY 
    preco_atual DESC
LIMIT 10