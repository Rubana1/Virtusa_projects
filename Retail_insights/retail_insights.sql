
CREATE DATABASE FreshMart;
USE FreshMart;

-- Create Tables

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    CategoryID INT,
    ExpiryDate DATE,
    StockCount INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE SalesTransactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    Quantity INT,
    TransactionDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Dummy Data

INSERT INTO Categories (CategoryName) VALUES
('Dairy'), ('Snacks'), ('Beverages');

INSERT INTO Products (ProductName, CategoryID, ExpiryDate, StockCount, Price) VALUES
('Milk', 1, CURDATE() + INTERVAL 5 DAY, 100, 50.00),
('Cheese', 1, CURDATE() + INTERVAL 10 DAY, 30, 120.00),
('Chips', 2, CURDATE() + INTERVAL 3 DAY, 70, 20.00),
('Juice', 3, CURDATE() + INTERVAL 15 DAY, 20, 40.00),
('Old Biscuits', 2, CURDATE() + INTERVAL 2 DAY, 80, 10.00);

INSERT INTO SalesTransactions (ProductID, Quantity, TransactionDate) VALUES
(1, 10, CURDATE() - INTERVAL 5 DAY),
(2, 5, CURDATE() - INTERVAL 40 DAY),
(3, 20, CURDATE() - INTERVAL 2 DAY),
(1, 15, CURDATE() - INTERVAL 1 DAY);

-- Expiring Soon Report
SELECT ProductName, ExpiryDate, StockCount
FROM Products
WHERE ExpiryDate <= CURDATE() + INTERVAL 7 DAY
AND StockCount > 50;

-- Dead Stock (no sales in last 60 days)
SELECT p.ProductName
FROM Products p
LEFT JOIN SalesTransactions s
ON p.ProductID = s.ProductID
AND s.TransactionDate >= CURDATE() - INTERVAL 60 DAY
WHERE s.ProductID IS NULL;

-- Revenue Contribution (Last Month)
SELECT c.CategoryName, SUM(p.Price * s.Quantity) AS TotalRevenue
FROM SalesTransactions s
JOIN Products p ON s.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE MONTH(s.TransactionDate) = MONTH(CURDATE() - INTERVAL 1 MONTH)
AND YEAR(s.TransactionDate) = YEAR(CURDATE())
GROUP BY c.CategoryName
ORDER BY TotalRevenue DESC;