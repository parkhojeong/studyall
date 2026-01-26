DROP TABLE IF EXISTS sample;
CREATE TABLE sample(
   product_id INT PRIMARY KEY,
   name VARCHAR(100),
   price INT,
   stock_quantity INT,
   release_date DATE
);