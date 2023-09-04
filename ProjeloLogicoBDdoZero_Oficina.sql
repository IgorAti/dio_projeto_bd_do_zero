CREATE DATABASE oficina_mecanica;
-- drop database oficina_mecanica;
USE oficina_mecanica;

CREATE TABLE clientes (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nome_cliente VARCHAR(100) NOT NULL,
  telefone VARCHAR(20),
  email VARCHAR(100),
  CONSTRAINT check_cliente CHECK (telefone IS NOT NULL OR email IS NOT NULL)
);

CREATE TABLE servicos (
  id_servico INT AUTO_INCREMENT PRIMARY KEY,
  servico_realizado VARCHAR(200) NOT NULL,
  data DATE NOT NULL,
  preco DECIMAL(10, 2) NOT NULL,
  dono_veiculo VARCHAR(100) NOT NULL,
  CONSTRAINT check_servico CHECK (dono_veiculo IS NOT NULL)
);
-- CONSTRAINT fk_cliente FOREIGN KEY (dono_veiculo) REFERENCES clientes(nome_cliente)

CREATE TABLE funcionario (
  id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
  nome_funcionario VARCHAR(100) NOT NULL,
  id_servico INT NOT NULL,
  CONSTRAINT fk_servico FOREIGN KEY (id_servico) REFERENCES servicos(id_servico)
);

show tables;

INSERT INTO clientes (nome_cliente, telefone, email) VALUES
  ('Cliente 1', '1234567890', 'cliente1@example.com'),
  ('Cliente 2', '0987654321', 'cliente2@example.com'),
  ('Cliente 3', '1111111111', NULL),
  ('Cliente 4', NULL, 'cliente4@example.com'),
  ('Cliente 5', '2222222222', 'cliente5@example.com'),
  ('Cliente 6', 2222292292, NULL),
  ('Cliente 7', '3333333333', 'cliente7@example.com'),
  ('Cliente 8', '4444444444', NULL),
  ('Cliente 9', NULL, 'cliente9@example.com'),
  ('Cliente 10', '5555555555', 'cliente10@example.com');

INSERT INTO servicos (servico_realizado, data, preco, dono_veiculo) VALUES
  ('servico 1', '2021-01-01', 100.00, 'Cliente 1'),
  ('servico 2', '2021-02-02', 200.00, 'Cliente 2'),
  ('servico 3', '2021-03-03', 300.00, 'Cliente 3'),
  ('servico 4', '2021-04-04', 400.00, 'Cliente 4'),
  ('servico 5', '2021-05-05', 500.00, 'Cliente 5'),
  ('servico 6', '2021-06-06', 600.00, 'Cliente 6'),
  ('servico 7', '2021-07-07', 700.00, 'Cliente 7'),
  ('servico 8', '2021-08-08', 800.00, 'Cliente 8'),
  ('servico 9', '2021-09-09', 900.00, 'Cliente 9'),
  ('servico 10', '2021-10-10', 1000.00, 'Cliente 10');

INSERT INTO funcionario (nome_funcionario, id_servico) VALUES
  ('Funcionário 1', 1),
  ('Funcionário 2', 2),
  ('Funcionário 3', 3),
  ('Funcionário 4', 4),
  ('Funcionário 5', 5),
  ('Funcionário 6', 6),
  ('Funcionário 7', 7),
  ('Funcionário 8', 8),
  ('Funcionário 9', 9),
  ('Funcionário 10', 10),
  ('Funcionário 11', 1),
  ('Funcionário 12', 2);
  
  select * from clientes;
  select * from funcionario;
  select * from servicos;
  
  -- Recuperações simples com SELECT Statement
SELECT * FROM clientes;
SELECT * FROM servicos;
SELECT * FROM funcionario;

-- Filtros com WHERE Statement
SELECT * FROM clientes 
WHERE telefone IS NOT NULL;
SELECT * FROM servicos 
WHERE preco > 200.00;
SELECT * FROM funcionario 
WHERE nome_funcionario LIKE 'Funcionario%';

-- Crie expressões para gerar atributos derivados
SELECT dono_veiculo, CONCAT('R$', preco) AS preco_formatado FROM servicos;

-- Defina ordenações dos dados com ORDER BY
SELECT * FROM clientes 
ORDER BY nome_cliente ASC;
SELECT * FROM servicos 
ORDER BY data DESC;
SELECT * FROM funcionario 
ORDER BY id_funcionario ASC;

-- Condições de filtros aos grupos – HAVING Statement
SELECT dono_veiculo, COUNT(*) AS total_servicos FROM servicos GROUP BY dono_veiculo HAVING total_servicos > 1;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT c.nome_cliente, s.servico_realizado, s.data, s.preco
FROM clientes c
JOIN servicos s 
ON c.nome_cliente = dono_veiculo;

SELECT c.nome_cliente, f.nome_funcionario
FROM clientes c
JOIN servicos s 
ON c.nome_cliente = s.nome_cliente
JOIN funcionario f 
ON s.id_servico = f.id_servico;