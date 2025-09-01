create database store;
use store;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    City VARCHAR(30) DEFAULT 'Unknown'
);
select * from Customers;
use store;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Category VARCHAR(30)
);

select * from Products;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ProductID INT,
    Quantity INT DEFAULT 1,
    OrderDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
select * from Orders;

-- Insert Customers
INSERT INTO Customers (Name, Email, City) 
VALUES ('Jay', 'jay@example.com', 'Jalgoan'),
('rahul', 'rahul123@example.com', 'Mumbai'),
('Keshav', 'keshv@example.com', 'Pune');

select * from Customers;

-- Insert Products
INSERT INTO Products (ProductName, Price, Category) VALUES
('Laptop', 80000, 'Electronics'),
('Smartphone', 57000, 'Electronics'),
('Jeans', 500, 'Fashion'),
('Watch', 150, 'Accessories');

select * from Products;

-- Insert Orders
INSERT INTO Orders (CustomerID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 1, '2025-08-01'),
(2, 2, 2, '2025-08-05'),
(1, 3, 3, '2025-08-10'),
(3, 4, 1, '2025-08-15');

select * from Orders;

-- 3. Display all customers
SELECT * FROM Customers;

-- 4. Display customers who live in New York
SELECT * FROM Customers WHERE City = 'Pune';

-- 5. Display products that belong to Electronics and have price > 600
SELECT * FROM Products
WHERE Category = 'Electronics' AND Price > 600;

-- 6. Display customers who live in New York OR Los Angeles
SELECT * FROM Customers
WHERE City = 'Nagpur ' OR City = 'Jalgoan';

-- 7. Display products that are NOT in Fashion category
SELECT * FROM Products
WHERE Category <> 'Fashion';

-- 8. Products with price between 100 and 600
SELECT * FROM Products
WHERE Price BETWEEN 100 AND 600;

-- 9. Display all customers who live in New York or Chicago using IN.

SELECT * FROM Customers
WHERE City IN ('Pune', 'Mumbai');

-- 10. Customers whose name starts with A
SELECT * FROM Customers
WHERE Name LIKE 'A%';

-- 11. Products in ascending order of Price
SELECT * FROM Products
ORDER BY Price ASC;

-- 12. Customers in descending order of Name
SELECT * FROM Customers
ORDER BY Name DESC;

-- 13. Total quantity ordered by each customer
SELECT C.Name, SUM(O.Quantity) AS TotalQuantity
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
GROUP BY C.Name;

-- 14. Total sales amount for each product category
SELECT P.Category, SUM(P.Price * O.Quantity) AS TotalSales
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY P.Category;

-- 15. Only categories with total sales > 500
SELECT P.Category, SUM(P.Price * O.Quantity) AS TotalSales
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY P.Category
HAVING SUM(P.Price * O.Quantity) > 500;


















