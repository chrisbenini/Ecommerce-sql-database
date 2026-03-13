INSERT INTO cliente (nome, email, telefone, tipo_cliente, cpf, cnpj, data_cadastro) VALUES
('Ana Souza', 'ana.souza@email.com', '11999990001', 'PF', '123.456.789-01', NULL, '2024-01-10'),
('Bruno Lima', 'bruno.lima@email.com', '11999990002', 'PF', '234.567.890-12', NULL, '2024-01-15'),
('Carla Mendes', 'carla.mendes@email.com', '11999990003', 'PF', '345.678.901-23', NULL, '2024-02-01'),
('TechStore LTDA', 'contato@techstore.com', '1133334444', 'PJ', NULL, '12.345.678/0001-90', '2024-02-05'),
('Mercado Prime', 'financeiro@mercadoprime.com', '1144445555', 'PJ', NULL, '98.765.432/0001-10', '2024-02-12');

INSERT INTO categoria (nome_categoria, descricao) VALUES
('Eletrônicos', 'Produtos eletrônicos em geral'),
('Informática', 'Equipamentos e acessórios de informática'),
('Periféricos', 'Teclados, mouses, headsets e similares'),
('Casa Inteligente', 'Dispositivos conectados para automação residencial');

INSERT INTO produto (id_categoria, nome_produto, descricao, sku, preco, ativo) VALUES
(1, 'Smartphone Galaxy X', 'Smartphone com 128GB e 6GB RAM', 'SKU-001', 1899.90, TRUE),
(2, 'Notebook Ultra Pro', 'Notebook i7 16GB RAM SSD 512GB', 'SKU-002', 4599.90, TRUE),
(3, 'Mouse Gamer RGB', 'Mouse óptico com iluminação RGB', 'SKU-003', 149.90, TRUE),
(3, 'Teclado Mecânico', 'Teclado mecânico ABNT2 com LED', 'SKU-004', 299.90, TRUE),
(4, 'Lâmpada Smart WiFi', 'Lâmpada inteligente compatível com app', 'SKU-005', 79.90, TRUE),
(2, 'Monitor 24 Polegadas', 'Monitor Full HD IPS 24"', 'SKU-006', 899.90, TRUE);

INSERT INTO fornecedor (razao_social, cnpj, email, telefone) VALUES
('Distribuidora Alpha LTDA', '11.111.111/0001-11', 'vendas@alpha.com', '1130303030'),
('Comercial Beta SA', '22.222.222/0001-22', 'contato@beta.com', '1140404040'),
('Importadora Gamma LTDA', '33.333.333/0001-33', 'suporte@gamma.com', '1150505050');

INSERT INTO estoque (local_estoque, descricao) VALUES
('CD São Paulo', 'Centro de distribuição principal em São Paulo'),
('CD Rio de Janeiro', 'Unidade de apoio logístico no Rio de Janeiro'),
('CD Belo Horizonte', 'Estoque regional de Minas Gerais');

INSERT INTO produto_fornecedor (id_produto, id_fornecedor, preco_fornecimento, prazo_entrega_dias) VALUES
(1, 1, 1500.00, 7),
(2, 1, 3900.00, 10),
(3, 2, 90.00, 5),
(4, 2, 180.00, 6),
(5, 3, 45.00, 12),
(6, 1, 700.00, 8),
(6, 3, 720.00, 9);

INSERT INTO produto_estoque (id_produto, id_estoque, quantidade_disponivel, data_atualizacao) VALUES
(1, 1, 25, '2024-03-01'),
(1, 2, 10, '2024-03-01'),
(2, 1, 8, '2024-03-01'),
(3, 1, 40, '2024-03-01'),
(4, 2, 30, '2024-03-01'),
(5, 3, 50, '2024-03-01'),
(6, 1, 15, '2024-03-01'),
(6, 3, 12, '2024-03-01');

INSERT INTO pedido (id_cliente, data_pedido, status_pedido, valor_total) VALUES
(1, '2024-03-05', 'Pago', 2049.80),
(2, '2024-03-06', 'Enviado', 299.90),
(3, '2024-03-07', 'Entregue', 979.80),
(4, '2024-03-08', 'Em análise', 4599.90),
(1, '2024-03-09', 'Pago', 229.80);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, desconto, subtotal) VALUES
(1, 1, 1, 1899.90, 0.00, 1899.90),
(1, 3, 1, 149.90, 0.00, 149.90),
(2, 4, 1, 299.90, 0.00, 299.90),
(3, 5, 1, 79.90, 0.00, 79.90),
(3, 6, 1, 899.90, 0.00, 899.90),
(4, 2, 1, 4599.90, 0.00, 4599.90),
(5, 3, 1, 149.90, 0.00, 149.90),
(5, 5, 1, 79.90, 0.00, 79.90);

INSERT INTO pagamento (id_pedido, forma_pagamento, valor_pagamento, status_pagamento, data_pagamento) VALUES
(1, 'Cartão de Crédito', 2049.80, 'Aprovado', '2024-03-05'),
(2, 'PIX', 299.90, 'Aprovado', '2024-03-06'),
(3, 'Boleto', 979.80, 'Aprovado', '2024-03-07'),
(4, 'Cartão de Crédito', 3000.00, 'Pendente', '2024-03-08'),
(4, 'Voucher', 1599.90, 'Pendente', '2024-03-08'),
(5, 'PIX', 229.80, 'Aprovado', '2024-03-09');

INSERT INTO entrega (id_pedido, status_entrega, codigo_rastreio, transportadora, data_envio, data_entrega) VALUES
(1, 'Preparando envio', 'BR123456789', 'Correios', '2024-03-06', NULL),
(2, 'Em transporte', 'BR223456789', 'Jadlog', '2024-03-07', NULL),
(3, 'Entregue', 'BR323456789', 'Correios', '2024-03-08', '2024-03-10'),
(4, 'Aguardando pagamento', NULL, NULL, NULL, NULL),
(5, 'Preparando envio', 'BR523456789', 'Loggi', '2024-03-10', NULL);

INSERT INTO vendedor (razao_social, nome_fantasia, cnpj, email, telefone) VALUES
('Marketplace Seller One LTDA', 'Seller One', '44.444.444/0001-44', 'contato@sellerone.com', '1160606060'),
('Loja Tech Parceira LTDA', 'Tech Parceira', '55.555.555/0001-55', 'vendas@techparceira.com', '1170707070'),
('Comercial Alpha LTDA', 'Alpha Parceira', '11.111.111/0001-11', 'parceiros@alpha.com', '1180808080');

INSERT INTO vendedor_produto (id_vendedor, id_produto, preco_praticado, comissao_percentual) VALUES
(1, 1, 1949.90, 10.00),
(1, 3, 159.90, 12.00),
(2, 2, 4699.90, 8.50),
(2, 6, 949.90, 7.00),
(3, 1, 1899.90, 9.00),
(3, 5, 89.90, 11.00);