# 📥 Insert Sample Data for Clothing Store Database  
📌 *Made by Manveer Kaur, St. Clair College, Toronto*  

This file contains **SQL INSERT statements** to populate the database with sample data for testing.  

---

## 📌 **Insert Sample Data (10 Records Per Table)**  

```sql
-- Insert Customers
INSERT INTO Customers (first_name, last_name, email, phone, address)
VALUES 
('Alice', 'Smith', 'alice@example.com', '123-456-7890', '123 Main St'),
('Bob', 'Johnson', 'bob@example.com', '987-654-3210', '456 Elm St'),
('Charlie', 'Brown', 'charlie@example.com', '555-555-5555', '789 Oak St'),
('David', 'Williams', 'david@example.com', '111-222-3333', '101 Pine St'),
('Emma', 'Taylor', 'emma@example.com', '222-333-4444', '202 Cedar St'),
('Frank', 'Anderson', 'frank@example.com', '333-444-5555', '303 Birch St'),
('Grace', 'Lee', 'grace@example.com', '444-555-6666', '404 Maple St'),
('Henry', 'Harris', 'henry@example.com', '555-666-7777', '505 Walnut St'),
('Isabella', 'Clark', 'isabella@example.com', '666-777-8888', '606 Cherry St'),
('Jack', 'Martin', 'jack@example.com', '777-888-9999', '707 Spruce St');

-- Insert Categories
INSERT INTO Categories (category_name)
VALUES 
('T-Shirts'),
('Jeans'),
('Jackets'),
('Shoes'),
('Accessories'),
('Sweaters'),
('Shorts'),
('Dresses'),
('Hats'),
('Bags');

-- Insert Suppliers
INSERT INTO Suppliers (supplier_name, contact_name, email, phone, address)
VALUES 
('Fashion Supply Co', 'John Doe', 'supplier1@example.com', '999-111-2222', '100 Fashion St'),
('Trendy Textiles', 'Jane Smith', 'supplier2@example.com', '888-333-4444', '200 Trend Ave'),
('Elite Apparel', 'Michael Brown', 'supplier3@example.com', '777-222-3333', '300 Style Blvd'),
('Urban Wear Ltd', 'Sarah Davis', 'supplier4@example.com', '666-111-4444', '400 Modern St'),
('Classic Clothing', 'Kevin Wilson', 'supplier5@example.com', '555-999-0000', '500 Heritage Rd'),
('Street Style Inc.', 'Laura Miller', 'supplier6@example.com', '444-888-7777', '600 Trendy Ln'),
('Luxury Fashion', 'Daniel Garcia', 'supplier7@example.com', '333-777-6666', '700 Luxury Dr'),
('Sports Wearhouse', 'Emily Martinez', 'supplier8@example.com', '222-666-5555', '800 Athletic St'),
('Vintage Attire', 'James Anderson', 'supplier9@example.com', '111-555-4444', '900 Retro St'),
('Modern Fits', 'Sophia White', 'supplier10@example.com', '000-444-3333', '1000 Contemporary Ave');

-- Insert Products
INSERT INTO Products (product_name, category_id, supplier_id, price, stock_quantity, size, color, description)
VALUES 
('Cotton T-Shirt', 1, 1, 19.99, 50, 'M', 'White', 'Soft cotton T-shirt'),
('Denim Jeans', 2, 2, 49.99, 30, 'L', 'Blue', 'Classic straight fit'),
('Leather Jacket', 3, 3, 99.99, 20, 'XL', 'Black', 'Stylish leather jacket'),
('Running Shoes', 4, 4, 79.99, 40, '10', 'Red', 'Comfortable running shoes'),
('Gold Chain Necklace', 5, 5, 29.99, 15, 'One Size', 'Gold', 'Elegant chain necklace'),
('Wool Sweater', 6, 6, 39.99, 25, 'L', 'Gray', 'Warm wool sweater'),
('Cargo Shorts', 7, 7, 24.99, 35, 'M', 'Green', 'Durable cargo shorts'),
('Floral Dress', 8, 8, 59.99, 30, 'S', 'Pink', 'Beautiful floral dress'),
('Baseball Cap', 9, 9, 14.99, 50, 'One Size', 'Navy Blue', 'Classic baseball cap'),
('Leather Handbag', 10, 10, 89.99, 20, 'Medium', 'Brown', 'Elegant leather handbag');

-- Insert Orders
INSERT INTO Orders (customer_id, total_price, status)
VALUES 
(1, 69.98, 'Completed'),
(2, 99.99, 'Pending'),
(3, 45.00, 'Shipped'),
(4, 129.99, 'Completed'),
(5, 79.99, 'Cancelled'),
(6, 159.99, 'Processing'),
(7, 49.99, 'Completed'),
(8, 19.99, 'Completed'),
(9, 89.99, 'Pending'),
(10, 199.99, 'Shipped');

-- Insert Order Items
INSERT INTO Order_Items (order_id, product_id, quantity, price)
VALUES 
(1, 1, 2, 39.98),
(1, 2, 1, 49.99),
(2, 3, 1, 99.99),
(3, 4, 2, 159.98),
(4, 5, 1, 29.99),
(5, 6, 1, 39.99),
(6, 7, 3, 74.97),
(7, 8, 1, 59.99),
(8, 9, 2, 29.98),
(9, 10, 1, 89.99);

-- Insert Inventory
INSERT INTO Inventory (product_id, stock_quantity)
VALUES 
(1, 50),
(2, 30),
(3, 20),
(4, 40),
(5, 15),
(6, 25),
(7, 35),
(8, 30),
(9, 50),
(10, 20);
