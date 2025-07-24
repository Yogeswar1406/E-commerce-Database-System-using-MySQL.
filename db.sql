
-- E-Commerce Website Database Schema Based on UML Diagram
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- USER Table
CREATE TABLE User (
    userId INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    passwordHash VARCHAR(255) NOT NULL,
    address VARCHAR(255)
);

-- CATEGORY Table
CREATE TABLE Category (
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- PRODUCT Table
CREATE TABLE Product (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price FLOAT NOT NULL,
    stock INT DEFAULT 0,
    categoryId INT,
    FOREIGN KEY (categoryId) REFERENCES Category(categoryId)
);

-- CART Table
CREATE TABLE Cart (
    cartId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT,
    createdDate DATE,
    FOREIGN KEY (userId) REFERENCES User(userId)
);

-- CART ITEM Table
CREATE TABLE CartItem (
    cartItemId INT AUTO_INCREMENT PRIMARY KEY,
    cartId INT,
    productId INT,
    quantity INT DEFAULT 1,
    FOREIGN KEY (cartId) REFERENCES Cart(cartId) ON DELETE CASCADE,
    FOREIGN KEY (productId) REFERENCES Product(productId) ON DELETE CASCADE
);

-- ORDER Table
CREATE TABLE `Order` (
    orderId INT AUTO_INCREMENT PRIMARY KEY,
    userId INT,
    orderDate DATE,
    status VARCHAR(50),
    totalAmount FLOAT,
    FOREIGN KEY (userId) REFERENCES User(userId)
);

-- ORDER ITEM Table
CREATE TABLE OrderItem (
    orderItemId INT AUTO_INCREMENT PRIMARY KEY,
    orderId INT,
    productId INT,
    quantity INT,
    price FLOAT,
    FOREIGN KEY (orderId) REFERENCES `Order`(orderId) ON DELETE CASCADE,
    FOREIGN KEY (productId) REFERENCES Product(productId)
);

-- PAYMENT Table
CREATE TABLE Payment (
    paymentId INT AUTO_INCREMENT PRIMARY KEY,
    orderId INT,
    paymentDate DATE,
    amount FLOAT,
    paymentMethod VARCHAR(50),
    FOREIGN KEY (orderId) REFERENCES `Order`(orderId)
);
