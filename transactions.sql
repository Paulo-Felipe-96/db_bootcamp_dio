SELECT numero, nome, ativo FROM banco ORDER BY numero;
SELECT numero, nome, ativo FROM banco WHERE numero = 0;

UPDATE banco SET ativo = false WHERE numero = 0;

BEGIN;
UPDATE banco SET ativo = true WHERE numero = 0;
SAVEPOINT sv_func;
ROLLBACK sv_func;

BEGIN;
UPDATE banco SET ativo = true WHERE numero = 0;
COMMIT;
