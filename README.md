# SQL-Data-Analysis
## Overview

This repository demonstrates the use of SQL queries for data extraction and analysis. The dataset used is **Ecommerce_SQL_Database**, or you can choose your own dataset. This project covers essential SQL operations such as selecting data, filtering, grouping, joining tables, using aggregate functions, and optimizing queries with indexes.

## Objective

The goal of this project is to:
- Extract and analyze data from a structured database.
- Perform operations using SQL functions such as `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`, `JOIN`, and more.
- Create complex queries with subqueries and views.
- Optimize queries by creating indexes.

## Tools

- **MySQL**, **PostgreSQL**, or **SQLite**: The database management systems used for executing SQL queries.
- **SQL**: The language used for querying and manipulating the database.

## Dataset

This project uses the **Ecommerce_SQL_Database**, which contains information about products, sales, and customers in an eCommerce platform. You can also use any other dataset of your choice.
## Tasks

### Task 1: Basic SQL Queries
- **Objective**: Use `SELECT`, `WHERE`, and `ORDER BY` to extract and filter data.
- **Example Query**:
    ```sql
    SELECT product_name, price 
    FROM products 
    WHERE price > 50 
    ORDER BY price DESC;
    ```

### Task 2: Aggregate Functions and Grouping
- **Objective**: Use aggregate functions such as `SUM()`, `AVG()`, and group data with `GROUP BY`.
- **Example Query**:
    ```sql
    SELECT category_id, AVG(price) AS avg_price
    FROM products
    GROUP BY category_id;
    ```

### Task 3: Joins, Subqueries, and Views
- **Objective**: Write queries with `JOIN` operations, subqueries, and create views for data analysis.
- **Example Query**:
    ```sql
    SELECT p.product_name, s.sales_amount
    FROM products p
    JOIN sales s ON p.product_id = s.product_id
    WHERE s.sales_date >= '2025-01-01';
    ```
## Conclusion

By completing this project, you will gain hands-on experience in SQL data manipulation, including querying, filtering, grouping, joining, and optimizing queries. You will also learn how to create views and indexes to improve database performance.

---


