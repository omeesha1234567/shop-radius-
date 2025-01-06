
create database userappdb;

use userappdb;

create table users

(

    id integer auto_increment primary key,
    uname varchar(100) not null,
    email varchar(50) not null unique, 
    country varchar(50) not null, 
    passwd varchar(20) not null

);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    shopName VARCHAR(255) NOT NULL,
    addressLine1 VARCHAR(255) NOT NULL,
    addressLine2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    pincode VARCHAR(6) NOT NULL,
    shopType VARCHAR(50) NOT NULL,
    businessCategory VARCHAR(50) NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    securityQuestion VARCHAR(255) NOT NULL,
    securityAnswer VARCHAR(255) NOT NULL
);

CREATE TABLE Item (
    itemName VARCHAR(255) NOT NULL,
    itemImage BLOB, -- Or a path if you store images on the server
    itemDescription TEXT,
    itemPrice DECIMAL(10, 2) NOT NULL,
    itemQuantity INT NOT NULL,
    shopName VARCHAR(255) NOT NULL,
    PRIMARY KEY (itemName, shopName),
    FOREIGN KEY (shopName) REFERENCES Customer(shopName) ON DELETE CASCADE
);