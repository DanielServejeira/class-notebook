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

DELIMITER ;

CALL insere_cliente ('', 'Rua das flores'); 

DELIMITER $$

DROP PROCEDURE IF EXISTS manipula1 $$

CREATE PROCEDURE manipula1()
BEGIN
  DECLARE coluna_desconhecida CONDITION FOR SQLSTATE '42S22';
  DECLARE CONTINUE HANDLER FOR coluna_desconhecida
  BEGIN
      SELECT 'erro de coluna desconhecida' AS error;
  END;
  SELECT coluna;
  SELECT 'continua';
END $$

DELIMITER ;

CALL manipula1();

DELIMITER //

DROP PROCEDURE IF EXISTS insere_cliente //

CREATE PROCEDURE insere_cliente(v_nome VARCHAR(60), v_endereco VARCHAR(20), 
v_cpf VARCHAR(11), v_email VARCHAR(50))
BEGIN
    DECLARE EXIT HANDLER FOR SQLSTATE '23000'
	BEGIN
		SELECT 'Violação de chave duplicada!' AS Msg;
	END;
	IF ((v_nome != '') AND (v_endereco != '')) THEN
		INSERT INTO cliente1209 (nome, endereco, cpf,email) VALUES (v_nome, v_endereco, v_cpf, v_email);
	ELSE
		SELECT 'NOME e ENDEREÇO devem ser fornecidos para o cadastro!' AS Msg;
	END IF; 
END // 

DELIMITER ;

CALL insere_cliente('','','','');

INSERT INTO cliente VALUES ('2','rennan','rua galo', '123334', 'rennan@mail.com', 'M');

DELIMITER $$

DROP PROCEDURE IF EXISTS exemplo_cursor1 $$

CREATE PROCEDURE exemplo_cursor1 (OUT rid INT, OUT rnome INT)
	BEGIN
		DECLARE x,y INT;
		DECLARE sp_cursor1 CURSOR FOR SELECT id, nome FROM cliente;
		OPEN sp_cursor1;
			FETCH sp_cursor1 INTO x, y;
		CLOSE sp_cursor1;
		SET rid = x;
		SET rnome = y;
	END $$

DELIMITER ;

CALL exemplo_cursor1(1,2);