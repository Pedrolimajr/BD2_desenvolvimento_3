CREATE TABLE produto (
id INT PRIMARY KEY NOT NULL,
descricao VARCHAR(30) NOT NULL ,
estoque_minimo INT NOT NULL,
estoque_maximo INT NOT NULL
);


CREATE TABLE entrada_produto (
id INT PRIMARY KEY NOT NULL,
id_produto INT NOT NULL,
qtde INT NOT NULL ,
valor_unitario DECIMAL(9,2) NULL DEFAULT '0.00',
data_entrada DATE NOT NULL
);

CREATE TABLE estoque (
id INT PRIMARY KEY NOT NULL ,
id_produto INT NOT NULL,
qtde INT NOT NULL,
valor_unitario DECIMAL(9,2) 
);


CREATE TABLE saida_produto (
id INT PRIMARY KEY NOT NULL ,
id_produto INT NOT NULL,
qtde INT NOT NULL,
data_saida DATE NOT NULL,
valor_unitario DECIMAL(9,2) NULL DEFAULT '0.00'
);


CREATE PROCEDURE qtd_saida
   @QUANTIDADE INT;
   AS
   BEGIN
   
    DECLARE @qtaSaidaProduto
    SET @qtaSaidaProduto = (SELECT qtdSaida.qtde FROM saida_produto LEFT JOIN qtde
    ON qtdSaida.qtde = saida_produto.qtdSaida WHERE qtde.qtdSaida = @qtaSaidaProduto)                        

        IF @qtaSaidaProduto IS NULL
                BEGIN
                SELECT * FROM qtdSaida WHERE saida_produto = @CodigoCliente;
                END
        ELSE
                BEGIN
                SELECT * FROM Clientes WHERE ClienteCodigo = @qtaSaidaProduto
                END

END;

