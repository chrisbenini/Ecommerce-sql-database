<p align="center">
  <img src="recursos/logo/Logo-c.png" width="160">
</p>

<h1 align="center">
E-commerce SQL Database
</h1>

<p align="center">
Projeto de modelagem e implementação de um banco de dados relacional para um sistema de e-commerce utilizando MySQL.
</p>

---

<p align="center">
  <img alt="MySQL" src="https://img.shields.io/badge/MySQL-Database-4479A1?style=flat-square&logo=mysql&logoColor=white">
  <img alt="SQL" src="https://img.shields.io/badge/SQL-Queries-CC2927?style=flat-square&logo=postgresql&logoColor=white">
  <img alt="MySQL Workbench" src="https://img.shields.io/badge/MySQL%20Workbench-Data%20Modeling-4479A1?style=flat-square&logo=mysql&logoColor=white">
  <img alt="Relational Database" src="https://img.shields.io/badge/Relational-Database-00618A?style=flat-square">
  <img alt="GitHub" src="https://img.shields.io/badge/GitHub-Version%20Control-181717?style=flat-square&logo=github&logoColor=white">
</p>

---

# 📊 Modelo do Banco de Dados

O banco foi projetado para representar operações reais de um sistema de **e-commerce**, incluindo:

* clientes
* vendedores parceiros
* produtos
* categorias
* fornecedores
* estoque
* pedidos
* pagamentos
* entregas

Este modelo simula um ambiente de **marketplace**, onde múltiplos vendedores podem comercializar produtos dentro da plataforma.

---

# 🧩 Diagrama Entidade-Relacionamento

A imagem abaixo mostra o **modelo relacional completo do banco**, incluindo as tabelas e seus relacionamentos.

<p align="center">
  <img src="Images/Diagrama_ecommerce.png" width="800">
</p>

Este diagrama representa:

* relacionamento entre **clientes e pedidos**
* associação entre **produtos e categorias**
* controle de **estoque por local**
* relação **produto-fornecedor**
* relação **vendedor-produto (marketplace)**
* fluxo de **pedido → pagamento → entrega**

---

# 🗂 Estrutura das Tabelas

A imagem abaixo mostra as **tabelas criadas no MySQL Workbench** após a execução dos scripts SQL.

<p align="center">
  <img src="Images/Tabelas_ecommerce.png" width="500">
</p>

As principais entidades do sistema incluem:

* `categoria`
* `cliente`
* `vendedor`
* `entrega`
* `estoque`
* `fornecedor`
* `item_pedido`
* `pagamento`
* `pedido`
* `produto`
* `produto_estoque`
* `produto_fornecedor`
* `vendedor_produto`

---

# 📁 Estrutura do Projeto

O projeto está organizado em scripts SQL que representam cada etapa da construção do banco.

```
Ecommerce-sql-database
│
├── Images/
│   ├── Diagrama_ecommerce.png
│   └── Tabelas_ecommerce.png
│   
├── recursos/
│
├── Sql/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_insert_dados.sql
│   └── 04_queries.sql
│
└── README.md
```

---

# 🧠 Scripts SQL

### Criação do banco

```
Sql/01_create_database.sql
```

Responsável pela criação do banco de dados **ecommerce**.

---

### Criação das tabelas

```
Sql/02_create_tables.sql
```

Define toda a estrutura do banco:

* Primary Keys
* Foreign Keys
* Relacionamentos
* Constraints

---

### Inserção de dados

```
Sql/03_insert_dados.sql
```

Insere dados simulados para permitir:

* testes
* consultas analíticas
* simulação de operações de e-commerce

---

### Consultas SQL

```
Sql/04_queries.sql
```

Contém consultas utilizadas para análise de dados como:

* produtos mais vendidos
* faturamento por cliente
* controle de estoque
* pedidos e entregas

---

# 🔎 Exemplos de Consultas

### Produtos mais vendidos

```sql
SELECT
    pr.nome_produto,
    SUM(ip.quantidade) AS total_vendido
FROM item_pedido ip
INNER JOIN produto pr
    ON ip.id_produto = pr.id_produto
GROUP BY pr.id_produto, pr.nome_produto
ORDER BY total_vendido DESC;
```

---

### Faturamento total por cliente

```sql
SELECT
    c.nome,
    SUM(p.valor_total) AS faturamento_total
FROM cliente c
INNER JOIN pedido p
    ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY faturamento_total DESC;
```

---

### Produtos com estoque baixo

```sql
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
```

---

# 🧠 Conceitos Aplicados

Este projeto utiliza conceitos importantes de **banco de dados relacionais**:

* Modelagem de dados
* Normalização
* Integridade referencial
* Relacionamentos 1:N
* Relacionamentos N:N
* Tabelas associativas
* JOIN
* GROUP BY
* HAVING
* ORDER BY
* Consultas analíticas

---

# 🚀 Objetivo do Projeto

Este projeto foi desenvolvido como parte dos estudos em **Análise de dados**, com foco em:

* modelagem de banco relacional
* organização de dados comerciais
* consultas SQL para análise de vendas e operações

---

# 👨‍💻 Autor

**Christopher Benini**

Profissional focado em **dados, automação e integrações**, com experiência no desenvolvimento de soluções para análise e transformação de dados.

🔗 GitHub
https://github.com/chrisbenini
