DROP TABLE IF EXISTS sample;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;

CREATE TABLE customers (
    customer_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(50)     NOT NULL,
    email       VARCHAR(100)    NOT NULL UNIQUE, -- unique constraint
    password    VARCHAR(255)    NOT NULL,
    address     VARCHAR(255)    NOT NULL,
    join_date   DATETIME        DEFAULT CURRENT_TIMESTAMP, -- default value at creation
    updated_at  DATETIME        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- default value at creation and update
);

CREATE TABLE products (
    product_id      BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(100)    NOT NULL,
    description     TEXT,
    price           DECIMAL(10, 2)  NOT NULL,
    stock_quantity  INT UNSIGNED    NOT NULL DEFAULT 0
);

CREATE TABLE orders (
    order_id        BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    customer_id     BIGINT UNSIGNED NOT NULL,
    product_id      BIGINT UNSIGNED NOT NULL,
    quantity        INT UNSIGNED    NOT NULL,
    order_date      DATETIME        DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20)     NOT NULL DEFAULT 'PENDING',
    CONSTRAINT  fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    CONSTRAINT  fk_orders_products  FOREIGN KEY (product_id) REFERENCES products(product_id)
);