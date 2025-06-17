DROP DATABASE IF EXISTS optics;
CREATE DATABASE optics CHARACTER SET utf8mb4;
USE optics;

CREATE TABLE adress (
    id_adress INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(50) NOT NULL,
    number INT NOT NULL,
    floor INT NOT NULL,
    door INT NOT NULL,
    city VARCHAR(20) NOT NULL,
    postal_code INT NOT NULL,
    country VARCHAR(20) NOT NULL
);

CREATE TABLE supplier (
    id_supplier INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    id_adress INT UNSIGNED NOT NULL,
    telf VARCHAR(15) NOT NULL,
    fax VARCHAR(15) NOT NULL,
    nif VARCHAR(25) UNIQUE NOT NULL,
    FOREIGN KEY(id_adress) REFERENCES adress(id_adress)
);

CREATE TABLE brand_supplier (
    brand VARCHAR(25) PRIMARY KEY,
    id_supplier INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_supplier) REFERENCES supplier(id_supplier)
);

CREATE TABLE glass (
    id_glass INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    graduation FLOAT NOT NULL,
    color VARCHAR(20) NOT NULL
);

CREATE TABLE frame (
    id_frame INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    frame_material ENUM('floating', 'paste', 'metallic') NOT NULL,
    color VARCHAR(20) NOT NULL
);

CREATE TABLE employee (
    id_employee INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    rol VARCHAR(25) NOT NULL
);

CREATE TABLE client (
    id_client INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    postal_code INT NOT NULL,
    telf VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL,
    register DATE,
    id_recommended_by INT UNSIGNED,
    FOREIGN KEY(id_recommended_by) REFERENCES client(id_client)
);

CREATE TABLE glasses (
    id_glasses INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(25) NOT NULL,
    id_glass INT UNSIGNED NOT NULL,
    id_frame INT UNSIGNED NOT NULL,
    price FLOAT NOT NULL,
    id_seller INT UNSIGNED NOT NULL,
    FOREIGN KEY(brand) REFERENCES brand_supplier(brand),
    FOREIGN KEY(id_glass) REFERENCES glass(id_glass),
    FOREIGN KEY(id_frame) REFERENCES frame(id_frame),
    FOREIGN KEY(id_seller) REFERENCES employee(id_employee)
);

CREATE TABLE invoice (
    id_invoice INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_client INT UNSIGNED NOT NULL,
    id_glasses INT UNSIGNED NOT NULL,
    id_employee INT UNSIGNED NOT NULL,
    date DATE NOT NULL,
    total FLOAT NOT NULL,
    FOREIGN KEY(id_client) REFERENCES client(id_client),
    FOREIGN KEY(id_glasses) REFERENCES glasses(id_glasses),
    FOREIGN KEY(id_employee) REFERENCES employee(id_employee)
);