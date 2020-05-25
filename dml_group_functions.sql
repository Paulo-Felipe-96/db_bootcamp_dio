-- Select nas colunas
SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;
SELECT numero, nome, email FROM cliente;
SELECT banco_numero, agencia_numero, cliente_numero FROM cliente_transacoes;
SELECT * FROM conta_corrente;

-- Exibir informações dos schemas
SELECT column_name FROM information_schema.columns WHERE table_name = 'tipo_transacao';
SELECT column_name FROM information_schema.columns WHERE table_name = 'cliente';
SELECT column_name FROM information_schema.columns WHERE table_name = 'cliente_transacoes';
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'agencia';

SELECT * FROM information_schema.columns WHERE table_name = 'banco';

-- AVG
SELECT * FROM cliente_transacoes;

SELECT AVG(valor) FROM cliente_transacoes;

-- Avg + join + nome_transacao
SELECT AVG(valor), tipo_transacao_id, tipo_transacao.nome
FROM cliente_transacoes
JOIN tipo_transacao
ON id_transacao = tipo_transacao_id
GROUP BY tipo_transacao_id, tipo_transacao.nome;

-- COUNT (HAVING)
SELECT COUNT(numero) FROM cliente;

SELECT COUNT(numero), email
FROM cliente
WHERE email ILIKE '%gmail.com'
GROUP BY email;

-- Count + having
SELECT COUNT(id_cliente_transacoes), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
HAVING COUNT(id_cliente_transacoes) > 150;

-- MAX

SELECT MAX(numero)
FROM cliente;

SELECT MAX(valor)
FROM cliente_transacoes;

SELECT MAX(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;

-- Max + join + nome_transacao
SELECT MAX(valor), tipo_transacao_id, tipo_transacao.nome
FROM cliente_transacoes
JOIN tipo_transacao
ON tipo_transacao_id = id_transacao
GROUP BY tipo_transacao_id, tipo_transacao.nome;

-- MIN

SELECT MIN(numero)
FROM cliente;

SELECT MIN(valor)
FROM cliente_transacoes;

SELECT MIN(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;

-- Min + join + nome_transacao + order by
SELECT MIN(valor), tipo_transacao_id, tipo_transacao.nome
FROM cliente_transacoes
JOIN tipo_transacao
ON id_transacao = tipo_transacao_id
GROUP BY tipo_transacao_id, tipo_transacao.nome
ORDER BY tipo_transacao.nome;

-- SUM
SELECT SUM(valor)
FROM cliente_transacoes;

SELECT SUM(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
ORDER BY tipo_transacao_id; -- por defaul ASC

-- Sum group by e order by
SELECT SUM(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
ORDER BY tipo_transacao_id DESC; -- Descendente

-- Sum group by, order by, join e having
SELECT SUM(valor), tipo_transacao_id, tipo_transacao.nome
FROM cliente_transacoes
JOIN tipo_transacao
ON id_transacao = tipo_transacao_id
GROUP BY tipo_transacao_id, tipo_transacao.nome
HAVING SUM(valor) > 14000
ORDER BY tipo_transacao.nome;