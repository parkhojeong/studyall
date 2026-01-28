CREATE DATABASE IF NOT EXISTS my_shop2;
USE my_shop2;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS sizes;
DROP TABLE IF EXISTS colors;

CREATE TABLE users (
    user_id BIGINT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    address VARCHAR(255),
    birth_date DATE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
);
CREATE TABLE products (
    product_id BIGINT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    price INT NOT NULL,
    stock_quantity INT NOT NULL,
    PRIMARY KEY (product_id)
);
CREATE TABLE orders (
    order_id BIGINT AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    quantity INT NOT NULL,
    status VARCHAR(50) DEFAULT 'PENDING',
    PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_users FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_orders_products FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- for SELF JOIN practice
CREATE TABLE employees (
    employee_id BIGINT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    manager_id BIGINT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id)
);
-- for CROSS JOIN practice
CREATE TABLE sizes (size VARCHAR(10) PRIMARY KEY);
-- for CROSS JOIN practice
CREATE TABLE colors (color VARCHAR(20) PRIMARY KEY);