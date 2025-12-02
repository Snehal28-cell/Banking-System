CREATE DATABASE IF NOT EXISTS MyBank1;
USE MyBank1;

-- Admin Table
CREATE TABLE admin (
    admin_id VARCHAR(50) PRIMARY KEY,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Customer Table
CREATE TABLE customer (
    customer_account_number BIGINT PRIMARY KEY,
    pin VARCHAR(4) NOT NULL,
    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    account_created_date DATE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    account_type ENUM('Savings', 'Current') NOT NULL,
    date_of_birth DATE NOT NULL,
    mobile_number VARCHAR(15) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    kyc_document VARCHAR(100) NOT NULL
);

-- Transactions Table
CREATE TABLE transactions (
    txn_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_account_number BIGINT,
    txn_type ENUM('Deposit', 'Withdraw') NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    txn_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_account_number) REFERENCES customer(customer_account_number)
);

-- Insert Default Admin
INSERT INTO admin (admin_id, password) VALUES ('admin', 'admin@123');
