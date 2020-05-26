SELECT column_name FROM information_schema.columns WHERE table_name = 'cliente_transacoes';
SELECT column_name FROM information_schema.columns WHERE table_name = 'tipo_transacao';
SELECT column_name FROM information_schema.columns WHERE table_name = 'banco';

SELECT
	banco.nome AS Banco,
	agencia.nome AS Agencia,
	conta_corrente.numero AS CC,
	conta_corrente.digito AS Digito,
	cliente_transacoes.id_cliente_transacoes AS id_transacao,
	tipo_transacao.nome AS Tipo_Transacao,
	cliente_transacoes.valor,
	cliente.nome AS Cliente
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
JOIN conta_corrente
	-- ON conta_corrente.banco_numero = agencia.banco_numero
	ON conta_corrente.banco_numero = banco.numero
	AND conta_corrente.agencia_numero = agencia.numero
JOIN cliente
	ON cliente.numero = conta_corrente.cliente_numero
JOIN cliente_transacoes
	ON cliente_transacoes.banco_numero = banco.numero
JOIN tipo_transacao
	ON tipo_transacao.id_transacao = cliente_transacoes.tipo_transacao_id
ORDER BY banco.nome;