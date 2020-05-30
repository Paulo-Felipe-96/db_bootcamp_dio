-- SQL FUNCTION
CREATE OR REPLACE FUNCTION func_somar(INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER
-- RETURNS NULL ON NULL INPUT
CALLED ON NULL INPUT
LANGUAGE SQL
AS $$
	SELECT COALESCE($1,0) + COALESCE($2,0);
$$;

SELECT func_somar(NULL, 10);

SELECT COALESCE (null, 'daniel', null, 'paulo');

-- PL/PGSQL FUNCTION
CREATE OR REPLACE FUNCTION bancos_add(p_numero INTEGER, p_nome VARCHAR, p_ativo BOOLEAN)
RETURNS INTEGER
SECURITY INVOKER
LANGUAGE PLPGSQL
CALLED ON NULL INPUT
AS $$
DECLARE variavel_id INTEGER;
BEGIN -- no caso de erros na transação o rollback será automático

	-- tratamento de erro
	IF p_nome IS NULL OR p_ativo IS NULL OR p_numero IS NULL THEN
		RETURN 0;
	END IF;
	
	SELECT INTO variavel_id numero
	FROM banco
	WHERE numero = p_numero;
	
	-- verifica se o valor não existe antes de inserir
	IF variavel_id IS NULL THEN
		INSERT INTO banco(numero, nome, ativo)
		VALUES (p_numero, p_nome, p_ativo);
	ELSE
		RETURN variavel_id;
	END IF;

	SELECT INTO variavel_id numero
	FROM banco
	WHERE numero = p_numero;

	RETURN variavel_id;
END; $$;

SELECT bancos_add(5433, 'Banco Novo outra porta', true);

SELECT numero, nome, ativo FROM banco WHERE numero = 5433;