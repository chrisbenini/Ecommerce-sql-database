	CREATE TABLE cliente(
		id_cliente INT AUTO_INCREMENT PRIMARY KEY,
		nome VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        telefone VARCHAR(20),
        tipo_cliente ENUM('PF', 'PJ') NOT NULL,
        cpf VARCHAR(14) UNIQUE,
        cnpj VARCHAR(18) UNIQUE,
        data_cadastro DATE NOT NULL);
        
	CREATE TABLE categoria(
		id_categoria INT AUTO_INCREMENT PRIMARY KEY,
        nome_categoria VARCHAR(100) NOT NULL,
        descricao VARCHAR(255));
        
	CREATE TABLE produto(
		id_produto INT AUTO_INCREMENT PRIMARY KEY,
        id_categoria INT NOT NULL,
        nome_produto VARCHAR(100) NOT NULL,
        descricao VARCHAR(255),
        sku VARCHAR(50) NOT NULL UNIQUE,
        preco DECIMAL(10,2) NOT NULL,
        ativo BOOLEAN NOT NULL DEFAULT TRUE,
        CONSTRAINT fk_produto_categoria
			FOREIGN KEY (id_categoria)
            REFERENCES categoria(id_categoria));
            
CREATE TABLE fornecedor(
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(150) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20));

CREATE TABLE produto_fornecedor(
    id_produto_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    id_fornecedor INT NOT NULL,
    preco_fornecimento DECIMAL(10,2) NOT NULL,
    prazo_entrega_dias INT NOT NULL,
    CONSTRAINT fk_produto_fornecedor_produto
        FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto),
    CONSTRAINT fk_produto_fornecedor_fornecedor
        FOREIGN KEY (id_fornecedor)
        REFERENCES fornecedor(id_fornecedor));

CREATE TABLE estoque(
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    local_estoque VARCHAR(100) NOT NULL,
    descricao VARCHAR(255));

CREATE TABLE produto_estoque(
    id_produto_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    id_estoque INT NOT NULL,
    quantidade_disponivel INT NOT NULL,
    data_atualizacao DATE NOT NULL,
    CONSTRAINT fk_produto_estoque_produto
        FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto),
    CONSTRAINT fk_produto_estoque_estoque
        FOREIGN KEY (id_estoque)
        REFERENCES estoque(id_estoque));
        
CREATE TABLE pedido(
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    status_pedido VARCHAR(50) NOT NULL,
    valor_total DECIMAL(10,2),
    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente));

CREATE TABLE item_pedido(
    id_item_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    desconto DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    CONSTRAINT fk_item_pedido_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido),
    CONSTRAINT fk_item_pedido_produto
        FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto));

CREATE TABLE pagamento(
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    forma_pagamento VARCHAR(50) NOT NULL,
    valor_pagamento DECIMAL(10,2) NOT NULL,
    status_pagamento VARCHAR(50),
    data_pagamento DATE,
    CONSTRAINT fk_pagamento_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido));

CREATE TABLE entrega(
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    status_entrega VARCHAR(50),
    codigo_rastreio VARCHAR(100),
    transportadora VARCHAR(100),
    data_envio DATE,
    data_entrega DATE,
    CONSTRAINT fk_entrega_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido));
        
CREATE TABLE vendedor(
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(150) NOT NULL,
    nome_fantasia VARCHAR(150),
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20));

CREATE TABLE vendedor_produto(
    id_vendedor_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_vendedor INT NOT NULL,
    id_produto INT NOT NULL,
    preco_praticado DECIMAL(10,2),
    comissao_percentual DECIMAL(5,2),
    CONSTRAINT fk_vendedor_produto_vendedor
        FOREIGN KEY (id_vendedor)
        REFERENCES vendedor(id_vendedor),
    CONSTRAINT fk_vendedor_produto_produto
        FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto),
    CONSTRAINT uq_vendedor_produto UNIQUE (id_vendedor, id_produto));
    