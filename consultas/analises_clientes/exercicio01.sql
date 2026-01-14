-- ============================================
-- EXERCÍCIO: Categorização de Clientes com CASE WHEN
-- ============================================
-- Objetivo: Praticar CASE WHEN criando categorias baseadas em comportamento de compra
--
-- CONTEXTO:
-- Você já tem a segmentação original dos clientes (VIP, TOP_TIER, REGULAR),
-- mas agora quer criar uma NOVA categorização baseada no valor real de compras (receita total).
--
-- TAREFA:
-- 1. Calcule a receita total de cada cliente (soma de todas as compras)
-- 2. Use CASE WHEN para categorizar os clientes em:
--    - "VIP": receita total >= R$ 10.000
--    - "TOP_TIER": receita total entre R$ 5.000 e R$ 9.999
--    - "REGULAR": receita total < R$ 5.000
-- 3. Mostre: nome do cliente, receita total, segmento criado
-- 4. Ordene por receita total (decrescente)
--
-- CONCEITOS USADOS:
-- - JOIN (clientes com vendas)
-- - GROUP BY (agrupar por cliente)
-- - SUM (calcular receita total)
-- - CASE WHEN (criar categorias)
--
-- DICA:
-- Lembre-se: todas as colunas no SELECT que não são funções de agregação
-- devem estar no GROUP BY.

SELECT 
    c.nome_cliente,
    SUM(v.quantidade * v.preco_unitario) AS Receita_total,
    CASE 
        WHEN SUM(v.quantidade * v.preco_unitario) >=10000 THEN 'VIP'
        WHEN SUM(v.quantidade * v.preco_unitario) < 5000 THEN 'REGULAR'
        ELSE 'TOP_TIER'
    END
    AS Segmentação_do_cliente
FROM 
    clientes c
LEFT JOIN
    vendas v ON v.id_cliente = c.id_cliente
GROUP BY 
    c.id_cliente
ORDER BY
    SUM(v.quantidade * v.preco_unitario) DESC

