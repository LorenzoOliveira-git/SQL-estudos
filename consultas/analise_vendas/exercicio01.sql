--Qual é o total de vendas, receita total e ticket médio?

SELECT
    COUNT(*) AS Total_de_vendas,
    ROUND(SUM(quantidade * preco_unitario)::NUMERIC,2) AS receita_total,
    ROUND(SUM(quantidade * preco_unitario) / COUNT(*)::NUMERIC, 2) AS ticket_medio
FROM
    vendas