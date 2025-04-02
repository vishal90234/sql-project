-- =========================
-- Clothing Store Database
-- Author: Manveer Kaur
-- St. Clair College, Toronto
-- =========================

-- 1️⃣ Create Customers Table
CREATE TABLE Customers (
    customer_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2️⃣ Create Categories Table
CREATE TABLE Categories (
    category_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- 3️⃣ Create Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT
);

-- 4️⃣ Create Products Table
CREATE TABLE Products (
    product_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    supplier_id INT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    size VARCHAR(10),
    color VARCHAR(50),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- 5️⃣ Create Orders Table
CREATE TABLE Orders (
    order_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10,2),
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 6️⃣ Create Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- 7️⃣ Create Inventory Table
CREATE TABLE Inventory (
    inventory_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_id INT,
    stock_quantity INT NOT NULL,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- =========================
-- Insert Sample Data
-- =========================

-- Insert Customers
INSERT INTO Customers (first_name, last_name, email, phone, address)
VALUES 
('Alice', 'Smith', 'alice@example.com', '123-456-7890', '123 Main St'),
('Bob', 'Johnson', 'bob@example.com', '987-654-3210', '456 Elm St'),
('Charlie', 'Brown', 'charlie@example.com', '555-555-5555', '789 Oak St');

-- Insert Categories
INSERT INTO Categories (category_name)
VALUES ('T-Shirts'), ('Jeans'), ('Jackets'), ('Shoes'), ('Accessories');

-- Insert Suppliers
INSERT INTO Suppliers (supplier_name, contact_name, email, phone, address)
VALUES 
('Fashion Supply Co', 'John Doe', 'supplier1@example.com', '999-111-2222', '100 Fashion St'),
('Trendy Textiles', 'Jane Smith', 'supplier2@example.com', '888-333-4444', '200 Trend Ave');

-- Insert Products
INSERT INTO Products (product_name, category_id, supplier_id, price, stock_quantity, size, color, description)
VALUES 
('Cotton T-Shirt', 1, 1, 19.99, 50, 'M', 'White', 'Soft cotton T-shirt'),
('Denim Jeans', 2, 2, 49.99, 30, 'L', 'Blue', 'Classic straight fit');

-- Insert Orders
INSERT INTO Orders (customer_id, total_price, status)
VALUES 
(1, 69.98, 'Completed'),
(2, 99.99, 'Pending');

-- Insert Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, price)
VALUES 
(1, 1, 2, 39.98),
(1, 2, 1, 49.99);

-- Insert Inventory
INSERT INTO Inventory (product_id, stock_quantity)
VALUES 
(1, 50),
(2, 30);

-- =========================
-- Queries for Data Retrieval
-- =========================

-- View All Customers
SELECT * FROM Customers;

-- View All Orders with Customer Details
SELECT Orders.order_id, Customers.first_name, Customers.last_name, Orders.order_date, Orders.total_price, Orders.status
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id;

-- View Products by Category
SELECT Products.product_name, Categories.category_name, Products.price
FROM Products
JOIN Categories ON Products.category_id = Categories.category_id;

-- Check Inventory Levels
SELECT Products.product_name, Inventory.stock_quantity 
FROM Inventory
JOIN Products ON Inventory.product_id = Products.product_id
ORDER BY Inventory.stock_quantity ASC;

-- Get Order Details with Products
SELECT Orders.order_id, Customers.first_name, Products.product_name, Order_Items.quantity, Order_Items.price
FROM Order_Items
JOIN Orders ON Order_Items.order_id = Orders.order_id
JOIN Customers ON Orders.customer_id = Customers.customer_id
JOIN Products ON Order_Items.product_id = Products.product_id;

-- Total Sales per Product
SELECT Products.product_name, SUM(Order_Items.quantity) AS total_sold, SUM(Order_Items.price) AS total_revenue
FROM Order_Items
JOIN Products ON Order_Items.product_id = Products.product_id
GROUP BY Products.product_name
ORDER BY total_revenue DESC;
