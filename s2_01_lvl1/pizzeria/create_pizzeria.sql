DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria CHARACTER SET utf8mb4;
USE pizzeria;

DROP TABLE IF EXISTS province;
CREATE TABLE province (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS locality;
CREATE TABLE locality (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    province_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (province_id) REFERENCES province (id)
);

DROP TABLE IF EXISTS address;
CREATE TABLE address (
    id_address INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(50) NOT NULL,
    number INT NOT NULL,
    floor INT NOT NULL,
    door INT NOT NULL,
    postal_code INT NOT NULL,
    locality_id INT UNSIGNED NOT NULL,
    province_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (locality_id) REFERENCES locality (id),
    FOREIGN KEY (province_id) REFERENCES province (id)
);

DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
    id_customer INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    address_id INT UNSIGNED NOT NULL,
    locality_id INT UNSIGNED NOT NULL,
    province_id INT UNSIGNED NOT NULL,
    phone VARCHAR(15) NOT NULL,
    FOREIGN KEY (address_id) REFERENCES address (id_address),
    FOREIGN KEY (locality_id) REFERENCES locality (id),
    FOREIGN KEY (province_id) REFERENCES province (id)
);

DROP TABLE IF EXISTS shop;
CREATE TABLE shop (
    id_shop INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address_id INT UNSIGNED NOT NULL,
    locality_id INT UNSIGNED NOT NULL,
    province_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (address_id) REFERENCES address (id_address),
    FOREIGN KEY (locality_id) REFERENCES locality (id),
    FOREIGN KEY (province_id) REFERENCES province (id)
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
    id_employee INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    nif VARCHAR(20) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    role ENUM ('COOK', 'DELIVERY') NOT NULL,
    shop_id INT UNSIGNED,
    FOREIGN KEY (shop_id) REFERENCES shop (id_shop)
);

DROP TABLE IF EXISTS category;
CREATE TABLE category (
    id_category INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS product;
CREATE TABLE product (
    id_product INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    price DECIMAL(6, 2) NOT NULL,
    type ENUM ('PIZZA', 'BURGER', 'DRINK') NOT NULL
);

DROP TABLE IF EXISTS pizza;
CREATE TABLE pizza (
    id_pizza INT UNSIGNED PRIMARY KEY, -- mismo que product.id_product
    category_id INT UNSIGNED,
    FOREIGN KEY (id_pizza) REFERENCES product (id_product),
    FOREIGN KEY (category_id) REFERENCES category (id_category)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    id_orders INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    customer_id INT UNSIGNED NOT NULL,
    shop_id INT UNSIGNED NOT NULL,
    created_at DATETIME NOT NULL,
    is_delivery BOOLEAN NOT NULL,
    total_price DECIMAL(8, 2) NOT NULL,
    delivery_employee_id INT UNSIGNED,
    delivery_datetime DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customer (id_customer),
    FOREIGN KEY (shop_id) REFERENCES shop (id_shop),
    FOREIGN KEY (delivery_employee_id) REFERENCES employee (id_employee)
);

DROP TABLE IF EXISTS orders_detail;
CREATE TABLE orders_detail (
    orders_detail_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    orders_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    quantity INT DEFAULT 1,
    FOREIGN KEY (orders_id) REFERENCES orders (id_orders),
    FOREIGN KEY (product_id) REFERENCES product (id_product)
);
