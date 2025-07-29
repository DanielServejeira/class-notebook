use teste;

DELIMITER $$

DROP PROCEDURE IF EXISTS simple_proc $$
CREATE PROCEDURE simple_proc() 
BEGIN 
	SELECT 'teste';
END $$

DELIMITER //

DROP PROCEDURE IF EXISTS insere_cliente //
CREATE PROCEDURE insere_cliente(v_nome VARCHAR(60), v_endereco VARCHAR(60))
BEGIN
	IF (v_nome != '' AND v_endereco != '') THEN
    INSERT INTO cliente(nome, endereco) VALUES (v_nome, v_endereco);
ELSE
	SELECT 'NOME e ENDEREÇO devem ser preenchidos';
END IF;
END //

CALL insere_cliente ('', 'Rua das flores'); 

    
