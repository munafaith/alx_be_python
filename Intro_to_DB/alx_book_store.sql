-- alx_book_store.sql

CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

CREATE TABLE AUTHORS (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

CREATE TABLE BOOKS (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

CREATE TABLE CUSTOMERS (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

CREATE TABLE ORDERS (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

CREATE TABLE ORDER_DETAILS (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);

-- Insert Authors
INSERT INTO authors (author_name) VALUES
('Chinua Achebe'),
('Ngũgĩ wa Thiong\'o'),
('Chimamanda Ngozi Adichie');

-- Insert Books
INSERT INTO books (title, author_id, price, publication_date) VALUES
('Things Fall Apart', 1, 12.99, '1958-06-17'),
('The River Between', 2, 10.50, '1965-03-21'),
('Half of a Yellow Sun', 3, 15.75, '2006-09-12');

-- Insert Customers
INSERT INTO customers (customer_name, email, address) VALUES
('Faith Wairimu', 'faith@example.com', 'Nairobi, Kenya'),
('John Doe', 'john@example.com', 'Mombasa, Kenya');

-- Insert Orders
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-08-17'),
(2, '2025-08-17');

-- Insert Order Details
INSERT INTO order_details (order_id, book_id, quantity) VALUES
(1, 1, 2),  -- Faith buys 2 copies of "Things Fall Apart"
(1, 3, 1),  -- Faith buys 1 copy of "Half of a Yellow Sun"
(2, 2, 1);  -- John buys 1 copy of "The River Between"
