-- Use the ecommerce database
USE ecommerce_db;

-- 1. Create necessary tables
CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

CREATE TABLE products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Price DECIMAL(10, 2)
);

CREATE TABLE order_items (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);

-- 2. Insert sample data
INSERT INTO customers VALUES 
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO orders VALUES 
(101, 1, '2024-01-10'),
(102, 2, '2024-01-15'),
(103, 3, '2024-01-20');

INSERT INTO products VALUES 
(201, 'Laptop', 800.00),
(202, 'Mouse', 20.00),
(203, 'Keyboard', 35.00);

INSERT INTO order_items VALUES 
(301, 101, 201, 1),
(302, 101, 202, 2),
(303, 102, 203, 1),
(304, 103, 202, 3);

-- 3. SELECT + WHERE + ORDER BY
SELECT * FROM products
WHERE Price > 30
ORDER BY Price DESC;

-- 4. GROUP BY + aggregate function (SUM)
SELECT ProductID, SUM(Quantity) AS TotalSold
FROM order_items
GROUP BY ProductID;

-- 5. INNER JOIN: Get order details with customer name and product info
SELECT 
    o.OrderID,
    c.CustomerName,
    p.ProductName,
    oi.Quantity,
    (p.Price * oi.Quantity) AS TotalAmount
FROM orders o
INNER JOIN customers c ON o.CustomerID = c.CustomerID
INNER JOIN order_items oi ON o.OrderID = oi.OrderID
INNER JOIN products p ON oi.ProductID = p.ProductID;

-- 6. LEFT JOIN: Show all customers, even if they haven’t placed an order
SELECT 
    c.CustomerName,
    o.OrderID
FROM customers c
LEFT JOIN orders o ON c.CustomerID = o.CustomerID;

-- 7. Subquery: Get customers who placed orders over ₹100
SELECT DISTINCT c.CustomerName
FROM customers c
WHERE c.CustomerID IN (
    SELECT o.CustomerID
    FROM orders o
    JOIN order_items oi ON o.OrderID = oi.OrderID
    JOIN products p ON oi.ProductID = p.ProductID
    GROUP BY o.OrderID
    HAVING SUM(p.Price * oi.Quantity) > 100
);

-- 8. AVG with GROUP BY: Average spending per customer
SELECT 
    c.CustomerName,
    AVG(p.Price * oi.Quantity) AS AvgSpending
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
JOIN order_items oi ON o.OrderID = oi.OrderID
JOIN products p ON oi.ProductID = p.ProductID
GROUP BY c.CustomerName;

-- 9. Create a VIEW: Total order amount per order
CREATE VIEW order_totals AS
SELECT 
    o.OrderID,
    SUM(p.Price * oi.Quantity) AS TotalAmount
FROM orders o
JOIN order_items oi ON o.OrderID = oi.OrderID
JOIN products p ON oi.ProductID = p.ProductID
GROUP BY o.OrderID;

-- 10. Add an INDEX for optimization
CREATE INDEX idx_product_price ON products(Price);

-- 11. View the created view
SELECT * FROM order_totals;
