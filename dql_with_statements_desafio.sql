SELECT column_name FROM information_schema.columns WHERE table_name = 'cliente_transacoes';
SELECT column_name FROM information_schema.columns WHERE table_name = 'cliente';
SELECT column_name FROM information_schema.columns WHERE table_name = 'banco';

WITH clientes_e_transacoes AS (
	SELECT
	banco.nome AS banco_nome,
	tipo_transacao.nome AS tipo_transacao_nome,
	cliente_transacoes.valor AS valor_transacao,
	cliente.nome AS cliente_nome
	FROM cliente_transacoes
	JOIN tipo_transacao ON tipo_transacao.id_transacao = cliente_transacoes.tipo_transacao_id
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN banco ON banco.numero = cliente_transacoes.banco_numero AND banco.nome ILIKE '%Itaú%'
)
SELECT banco_nome, tipo_transacao_nome, valor_transacao, cliente_nome
FROM clientes_e_transacoes;