CREATE DATABASE commerce_db;
USE commerce_db;
CREATE TABLE product_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name CHAR(50) NOT NULL,
    regular_price INT NOT NULL,
    disc_price INT,
    card_price INT,
    photoURL TEXT NOT NULL,
    special_promo CHAR(40),
    product_type_id INT NOT NULL,
    FOREIGN KEY (product_type_id) REFERENCES product_type(id)
);