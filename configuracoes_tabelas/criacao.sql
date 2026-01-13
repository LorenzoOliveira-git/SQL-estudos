CREATE TABLE clientes (
    id_cliente VARCHAR(16) PRIMARY KEY,
    nome_cliente VARCHAR(50),
    estado VARCHAR(50),
    pais VARCHAR(50),
    data_cadastro TIMESTAMP
)

COPY clientes FROM '/dados/clientes.csv' DELIMITER ',' CSV HEADER

CREATE TABLE preco_competidores (
    id_produto VARCHAR(16),
    nome_concorrente VARCHAR(50),
    preco_concorrente DECIMAL,
    data_coleta TIMESTAMP
)

ALTER TABLE preco_competidores ADD PRIMARY KEY(id_produto, nome_concorrente)
COPY preco_competidores FROM '/dados/preco_competidores.csv' DELIMITER ',' CSV HEADER

CREATE TABLE produtos (
    id_produto VARCHAR(16) PRIMARY KEY,
    nome_produto VARCHAR(50),
    categoria VARCHAR(50),
    marca VARCHAR(50),
    preco_atual DECIMAL,
    data_criacao TIMESTAMP
)

COPY produtos FROM '/dados/produtos.csv' DELIMITER ',' CSV HEADER

--Aqui, eu não consigo colocar a referência de chave estrangeira nos campos id_cliente e id_produto pois alguns de seus cadastros não estão na tabela produto ou cliente, isso porque é uma análise que farei dos usuários e produtos que não estão cadastrados.
CREATE TABLE vendas (
    id_venda VARCHAR(16) PRIMARY KEY,
    data_venda TIMESTAMP,
    id_cliente VARCHAR(16),
    id_produto VARCHAR(16),
    canal_venda VARCHAR(50),
    quantidade INTEGER,
    preco_unitario DECIMAL
) 

COPY vendas FROM '/dados/vendas.csv' DELIMITER ',' CSV HEADER