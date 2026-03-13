-- 1) Lista todos os clientes
SELECT * FROM cliente;

-- 2) Lista todos os produtos
SELECT * FROM produto;

-- 3) Lista todos os pedidos
SELECT * FROM pedido;

-- 4) Lista apenas clientes do tipo PF
SELECT *
FROM cliente
WHERE tipo_cliente = 'PF';

-- 5) Lista produtos com preço maior que 500
SELECT *
FROM produto
WHERE preco > 500.00;

-- 6) Lista pedidos com status Pago
SELECT *
FROM pedido
WHERE status_pedido = 'Pago';

-- 7) Lista entregas já concluídas
SELECT *
FROM entrega
WHERE status_entrega = 'Entregue';

-- 8) Mostra itens do pedido com valor final após desconto
SELECT
    id_item_pedido,
    quantidade,
    preco_unitario,
    desconto,
    (quantidade * preco_unitario) - desconto AS valor_final_item
FROM item_pedido;

-- 9) Lista produtos do mais caro para o mais barato
SELECT
    nome_produto,
    preco
FROM produto
ORDER BY preco DESC;

-- 10) Lista clientes por nome em ordem alfabética
SELECT
    id_cliente,
    nome,
    email
FROM cliente
ORDER BY nome ASC;

-- 11) Lista pedidos do mais recente para o mais antigo
SELECT
    id_pedido,
    data_pedido,
    status_pedido
FROM pedido
ORDER BY data_pedido DESC;

-- 12) Mostra pedidos com nome do cliente
SELECT
    p.id_pedido,
    c.nome AS cliente,
    p.data_pedido,
    p.status_pedido,
    p.valor_total
FROM pedido p
INNER JOIN cliente c
    ON p.id_cliente = c.id_cliente;

-- 13) Mostra produtos e suas categorias
SELECT
    pr.nome_produto,
    c.nome_categoria,
    pr.preco
FROM produto pr
INNER JOIN categoria c
    ON pr.id_categoria = c.id_categoria;

-- 14) Mostra produtos e seus fornecedores
SELECT
    pr.nome_produto,
    f.razao_social AS fornecedor,
    pf.preco_fornecimento,
    pf.prazo_entrega_dias
FROM produto_fornecedor pf
INNER JOIN produto pr
    ON pf.id_produto = pr.id_produto
INNER JOIN fornecedor f
    ON pf.id_fornecedor = f.id_fornecedor;

-- 15) Mostra produtos por estoque
SELECT
    pr.nome_produto,
    e.local_estoque,
    pe.quantidade_disponivel
FROM produto_estoque pe
INNER JOIN produto pr
    ON pe.id_produto = pr.id_produto
INNER JOIN estoque e
    ON pe.id_estoque = e.id_estoque;
    
-- 16) Quantidade de pedidos por cliente
SELECT
    c.nome,
    COUNT(p.id_pedido) AS total_pedidos
FROM cliente c
INNER JOIN pedido p
    ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome;

-- 17) Mostra clientes que fizeram mais de 1 pedido
SELECT
    c.nome,
    COUNT(p.id_pedido) AS total_pedidos
FROM cliente c
INNER JOIN pedido p
    ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
HAVING COUNT(p.id_pedido) > 1;

-- 18) Quantidade de produtos por categoria
SELECT
    c.nome_categoria,
    COUNT(pr.id_produto) AS total_produtos
FROM categoria c
INNER JOIN produto pr
    ON c.id_categoria = pr.id_categoria
GROUP BY c.id_categoria, c.nome_categoria;

-- 19) Estoques com quantidade total maior que 20 unidades
SELECT
    e.local_estoque,
    SUM(pe.quantidade_disponivel) AS total_itens
FROM estoque e
INNER JOIN produto_estoque pe
    ON e.id_estoque = pe.id_estoque
GROUP BY e.id_estoque, e.local_estoque
HAVING SUM(pe.quantidade_disponivel) > 20;

-- 20) Faturamento total por cliente
SELECT
    c.nome,
    SUM(p.valor_total) AS faturamento_total
FROM cliente c
INNER JOIN pedido p
    ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY faturamento_total DESC;

-- 21) Produtos mais vendidos por quantidade
SELECT
    pr.nome_produto,
    SUM(ip.quantidade) AS total_vendido
FROM item_pedido ip
INNER JOIN produto pr
    ON ip.id_produto = pr.id_produto
GROUP BY pr.id_produto, pr.nome_produto
ORDER BY total_vendido DESC;

-- 22) Total vendido por categoria
SELECT
    c.nome_categoria,
    SUM(ip.subtotal) AS total_vendido
FROM item_pedido ip
INNER JOIN produto pr
    ON ip.id_produto = pr.id_produto
INNER JOIN categoria c
    ON pr.id_categoria = c.id_categoria
GROUP BY c.id_categoria, c.nome_categoria
ORDER BY total_vendido DESC;

-- 23) Pedidos com pagamento pendente
SELECT
    p.id_pedido,
    c.nome AS cliente,
    pg.forma_pagamento,
    pg.valor_pagamento,
    pg.status_pagamento
FROM pagamento pg
INNER JOIN pedido p
    ON pg.id_pedido = p.id_pedido
INNER JOIN cliente c
    ON p.id_cliente = c.id_cliente
WHERE pg.status_pagamento = 'Pendente';

-- 24) Produtos com estoque baixo (menor que 15 unidades)
SELECT
    pr.nome_produto,
    e.local_estoque,
    pe.quantidade_disponivel
FROM produto_estoque pe
INNER JOIN produto pr
    ON pe.id_produto = pr.id_produto
INNER JOIN estoque e
    ON pe.id_estoque = e.id_estoque
WHERE pe.quantidade_disponivel < 15
ORDER BY pe.quantidade_disponivel ASC;

-- 25) Rastreia pedidos e entregas
SELECT
    p.id_pedido,
    c.nome AS cliente,
    e.status_entrega,
    e.codigo_rastreio,
    e.transportadora
FROM entrega e
INNER JOIN pedido p
    ON e.id_pedido = p.id_pedido
INNER JOIN cliente c
    ON p.id_cliente = c.id_cliente;
    
-- 26) Classifica produtos por faixa de preço
SELECT
    nome_produto,
    preco,
    CASE
        WHEN preco < 100 THEN 'Baixo custo'
        WHEN preco BETWEEN 100 AND 1000 THEN 'Médio custo'
        ELSE 'Alto custo'
    END AS faixa_preco
FROM produto;