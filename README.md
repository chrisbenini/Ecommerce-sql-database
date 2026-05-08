<h1 align="center">
🛒 E-commerce Database Project | SQL na Prática
</h1>

<p align="center">
Simulação completa de um banco de dados de marketplace,
aplicando modelagem relacional, normalização e consultas SQL para análise de vendas.
</p>

---

<p align="center">
<img src="Images/Diagrama_ecommerce.png" width="900"/>
</p>

---

## ⚡ Overview

Projeto de **modelagem de banco de dados relacional** simulando um ambiente completo de **E-commerce / Marketplace**.

✔ Modelagem relacional  
✔ Normalização de dados  
✔ Integridade referencial  
✔ Queries analíticas SQL  
✔ Estrutura pronta para cenários reais

---

## 🧱 Database Scope

O banco representa o fluxo operacional completo:

- Clientes  
- Produtos  
- Vendedores  
- Pedidos  
- Pagamentos  
- Entregas  
- Estoque  
- Fornecedores  

Simulação próxima a plataformas reais de marketplace.

---

## 🧰 Tech Stack

<p align="center">
<img src="https://skillicons.dev/icons?i=mysql,git,github" height="45"/>
</p>

<p align="center">
<img src="https://img.shields.io/badge/SQL-Data%20Queries-CC2927?style=flat-square">
<img src="https://img.shields.io/badge/Data%20Modeling-Relational-00618A?style=flat-square">
<img src="https://img.shields.io/badge/Workbench-MySQL-4479A1?style=flat-square">
</p>

---

## 🗂 Project Structure

```bash
Ecommerce-sql-database
│
├── Images/
├── Sql/
│   ├── create_database.sql
│   ├── create_tables.sql
│   ├── insert_data.sql
│   └── queries.sql
└── README.md
```

---

## ▶ How to Run

```sql
SOURCE Sql/01_create_database.sql;
SOURCE Sql/02_create_tables.sql;
SOURCE Sql/03_insert_dados.sql;
SOURCE Sql/04_queries.sql;
```

---

## 📊 Example Query

```sql
SELECT
    pr.nome_produto,
    SUM(ip.quantidade) AS total_vendido
FROM item_pedido ip
JOIN produto pr ON ip.id_produto = pr.id_produto
GROUP BY pr.nome_produto
ORDER BY total_vendido DESC;
```

---

## 🎯 Concepts Applied

- Relational Modeling  
- Normalization  
- Primary & Foreign Keys  
- 1:N / N:N Relationships  
- JOINs & Aggregations  
- Analytical Queries  

---

## 👨‍💻 Author

<p align="center">

<a href="https://github.com/chrisbenini">
<img src="https://img.shields.io/badge/GitHub-chrisbenini-181717?style=for-the-badge&logo=github&logoColor=white">
</a>

<a href="https://www.linkedin.com/in/christopher-benini-081b7833a/">
<img src="https://img.shields.io/badge/LinkedIn-Christopher%20Benini-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white">
</a>

</p>

---

<p align="center">
⭐ If you liked this project, consider giving a Star.
</p>
