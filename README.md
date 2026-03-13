<p align="center">
  <img src="recursos/logo/Logo-c.png" width="160" alt="Logo do projeto">
</p>

<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=24&pause=1000&color=00E5FF&center=true&vCenter=true&width=1000&lines=E-commerce+SQL+Database;Relational+Modeling+%7C+MySQL+%7C+Queries;Academic+Project+with+Realistic+Business+Scenario" alt="Typing SVG" />
</p>

<h1 align="center">E-commerce SQL Database</h1>

<p align="center">
Projeto de <b>modelagem e implementação de banco de dados relacional</b> para um sistema de e-commerce, desenvolvido com <b>MySQL</b> como parte de um projeto acadêmico voltado à prática de modelagem, estruturação e consulta de dados.
</p>

<p align="center">
  <img alt="MySQL" src="https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
  <img alt="SQL" src="https://img.shields.io/badge/SQL-Queries-CC2927?style=for-the-badge&logo=postgresql&logoColor=white">
  <img alt="MySQL Workbench" src="https://img.shields.io/badge/MySQL%20Workbench-Data%20Modeling-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
  <img alt="Relational Database" src="https://img.shields.io/badge/Relational-Database-00618A?style=for-the-badge">
  <img alt="GitHub" src="https://img.shields.io/badge/GitHub-Version%20Control-181717?style=for-the-badge&logo=github&logoColor=white">
</p>

---

## `> overview`

O banco foi projetado para representar operações de um ambiente de **e-commerce / marketplace**, simulando cenários comuns de plataformas digitais com múltiplos vendedores, controle de pedidos, estoque, pagamentos e entregas.

O objetivo do projeto foi aplicar, de forma prática, conceitos de:

- modelagem relacional
- integridade referencial
- normalização
- relacionamentos entre entidades
- consultas SQL para análise operacional e comercial

---

## `> business_entities`

O modelo contempla as principais entidades de um sistema de e-commerce:

- clientes
- vendedores parceiros
- produtos
- categorias
- fornecedores
- estoque
- pedidos
- pagamentos
- entregas

Este cenário simula um ambiente onde **múltiplos vendedores podem comercializar produtos dentro da mesma plataforma**, aproximando o projeto de uma lógica real de marketplace.

---

## `> entity_relationship_diagram`

A imagem abaixo apresenta o **modelo relacional completo do banco**, com suas tabelas e relacionamentos.

<p align="center">
  <img src="Images/Diagrama_ecommerce.png" width="850" alt="Diagrama relacional do banco de dados">
</p>

### Estrutura representada no diagrama

- relacionamento entre **clientes e pedidos**
- associação entre **produtos e categorias**
- controle de **estoque por local**
- relação entre **produto e fornecedor**
- relação entre **vendedor e produto**
- fluxo de **pedido → pagamento → entrega**

---

## `> physical_structure`

A imagem abaixo mostra a estrutura das tabelas após a criação do banco no **MySQL Workbench**.

<p align="center">
  <img src="Images/Tabelas_ecommerce.png" width="520" alt="Estrutura de tabelas no MySQL Workbench">
</p>

### Principais tabelas do sistema

- `categoria`
- `cliente`
- `vendedor`
- `entrega`
- `estoque`
- `fornecedor`
- `item_pedido`
- `pagamento`
- `pedido`
- `produto`
- `produto_estoque`
- `produto_fornecedor`
- `vendedor_produto`

---

## `> project_structure`

```text
Ecommerce-sql-database
│
├── Images/
│   ├── Diagrama_ecommerce.png
│   └── Tabelas_ecommerce.png
│
├── recursos/
│   └── logo/
│       └── Logo-c.png
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

> sql_scripts

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

> sample_queries

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

> concepts_applied

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

> project_goal

Com a estrutura criada, é possível evoluir o projeto para análises como:

* desempenho de vendas por produto
* faturamento por cliente
* 

Este projeto foi desenvolvido como parte dos estudos em **Análise de dados**, com foco em:

* modelagem de banco relacional
* organização de dados comerciais
* consultas SQL para análise de vendas e operações

---

> possible_analysis_scenarios


# 👨‍💻 Autor

**Christopher Benini**

Profissional focado em **dados, automação e integrações**, com experiência no desenvolvimento de soluções para análise e transformação de dados.

🔗 GitHub
https://github.com/chrisbenini
