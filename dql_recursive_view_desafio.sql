CREATE TABLE IF NOT EXISTS funcionarios (
	id SERIAL,
	nome VARCHAR(50),
	gerente INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY (gerente) REFERENCES funcionarios(id)
);

INSERT INTO funcionarios (nome, gerente)
VALUES
	('Ancelmo',null),
	('Beatriz',1),
	('Magno',1),
	('Cremilda',2),
	('Wagner',4);

SELECT id, nome, gerente FROM funcionarios WHERE gerente is NULL
UNION ALL
SELECT id, nome, gerente FROM funcionarios WHERE id = 999; -- apenas exemplificando

CREATE OR REPLACE RECURSIVE VIEW vw_func(id, gerente, funcionario) AS (
	SELECT id, gerente, nome
	FROM funcionarios
	WHERE gerente IS NULL
	UNION ALL
	SELECT funcionarios.id, funcionarios.gerente, funcionarios.nome
	FROM funcionarios
	JOIN vw_func ON vw_func.id = funcionarios.gerente
);

SELECT funcionario, funcionarios.nome AS gerente
FROM vw_func
JOIN funcionarios
ON funcionarios.id = vw_func.gerente;