-- Criando o banco de dados e selecionando-o
CREATE DATABASE loja_demo;
USE loja_demo;

-- Criando a tabela de clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    email VARCHAR(50),
    cidade VARCHAR(50)
);

-- Inserindo dados, incluindo duplicatas
INSERT INTO clientes (nome, email, cidade) VALUES
('Lucas Silva', 'lucas@email.com', 'Belém'),
('Maria Souza', 'maria@email.com', 'Belém'),
('Lucas Silva', 'lucas@email.com', 'Belém'),
('José Santos', 'jose@email.com', 'Ananindeua'),
('Maria Souza', 'maria@email.com', 'Belém'),
('Ana Lima', 'ana@email.com', 'Santarém'),
('José Santos', 'jose@email.com', 'Ananindeua');

-- Visualizando todos os registros
SELECT * FROM clientes;

-- Visualizando apenas as colunas relevantes para duplicatas
SELECT nome, email, cidade FROM clientes;

-- Identificando quais combinações estão duplicadas
SELECT nome, email, cidade, COUNT(*) AS qtd
FROM clientes
GROUP BY nome, email, cidade
HAVING COUNT(*) > 1;

-- Listando os IDs das duplicatas para poder removê-las
SELECT id, nome, email, cidade
FROM clientes
WHERE (nome, email, cidade) IN (
    SELECT nome, email, cidade
    FROM clientes
    GROUP BY nome, email, cidade
    HAVING COUNT(*) > 1
)
ORDER BY nome, email, cidade;

