CREATE DATABASE IndiaData;
USE IndiaData;

-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Phone VARCHAR(15)
);
-- Insert Data into Customers
INSERT INTO Customers (Name, City, State, Phone) VALUES
('Amit Sharma', 'Delhi', 'Delhi', '9876543210'),
('Priya Singh', 'Mumbai', 'Maharashtra', '9876501234'),
('Rajesh Kumar', 'Bangalore', 'Karnataka', '9876512345'),
('Anita Verma', 'Kolkata', 'West Bengal', '9876523456'),
('Vikram Joshi', 'Chennai', 'Tamil Nadu', '9876534567'),
('Neha Kapoor', 'Hyderabad', 'Telangana', '9876545678'),
('Arjun Nair', 'Pune', 'Maharashtra', '9876556789'),
('Sneha Iyer', 'Ahmedabad', 'Gujarat', '9876567890'),
('Karan Malhotra', 'Jaipur', 'Rajasthan', '9876578901'),
('Pooja Reddy', 'Lucknow', 'Uttar Pradesh', '9876589012'),
('Rahul Gupta', 'Chandigarh', 'Punjab', '9876590123'),
('Sunita Das', 'Bhopal', 'Madhya Pradesh', '9876601234'),
('Manoj Tiwari', 'Patna', 'Bihar', '9876612345'),
('Swati Mishra', 'Indore', 'Madhya Pradesh', '9876623456'),
('Vivek Saxena', 'Nagpur', 'Maharashtra', '9876634567'),
('Deepika Yadav', 'Coimbatore', 'Tamil Nadu', '9876645678'),
('Rohit Menon', 'Vadodara', 'Gujarat', '9876656789'),
('Meera Sen', 'Visakhapatnam', 'Andhra Pradesh', '9876667890'),
('Gaurav Khanna', 'Ludhiana', 'Punjab', '9876678901'),
('Sonia Chawla', 'Thiruvananthapuram', 'Kerala', '9876689012');
-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Add a new column OrderStatus to Orders table
ALTER TABLE Orders ADD COLUMN OrderStatus VARCHAR(20) DEFAULT 'Pending';
-- Insert Data into Orders
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, OrderStatus) VALUES
(1, '2024-01-10', 50000.00, 'Completed'),
(2, '2024-01-12', 20000.00, 'Pending'),
(3, '2024-01-15', 15000.00, 'Shipped'),
(4, '2024-01-18', 30000.00, 'Delivered'),
(5, '2024-01-20', 25000.00, 'Pending'),
(6, '2024-01-22', 35000.00, 'Shipped'),
(7, '2024-01-25', 12000.00, 'Completed'),
(8, '2024-01-28', 40000.00, 'Pending'),
(9, '2024-01-30', 5000.00, 'Delivered'),
(10, '2024-02-02', 10000.00, 'Completed'),
(11, '2024-02-05', 3000.00, 'Shipped'),
(12, '2024-02-08', 2000.00, 'Pending'),
(13, '2024-02-10', 1000.00, 'Delivered'),
(14, '2024-02-12', 5000.00, 'Completed'),
(15, '2024-02-15', 2500.00, 'Shipped'),
(16, '2024-02-18', 4000.00, 'Pending'),
(17, '2024-02-20', 45000.00, 'Shipped'),
(18, '2024-02-22', 7000.00, 'Delivered'),
(19, '2024-02-25', 2500.00, 'Completed'),
(20, '2024-02-28', 1500.00, 'Pending');


-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
-- Insert Data into Products
INSERT INTO Products (ProductName, Category, Price) VALUES
('Laptop', 'Electronics', 50000.00),
('Smartphone', 'Electronics', 20000.00),
('Tablet', 'Electronics', 15000.00),
('Television', 'Electronics', 30000.00),
('Washing Machine', 'Appliances', 25000.00),
('Refrigerator', 'Appliances', 35000.00),
('Microwave Oven', 'Appliances', 12000.00),
('Air Conditioner', 'Appliances', 40000.00),
('Headphones', 'Accessories', 5000.00),
('Smartwatch', 'Accessories', 10000.00),
('Shoes', 'Fashion', 3000.00),
('Jeans', 'Fashion', 2000.00),
('T-Shirt', 'Fashion', 1000.00),
('Saree', 'Fashion', 5000.00),
('Formal Shirt', 'Fashion', 2500.00),
('Running Shoes', 'Fashion', 4000.00),
('Camera', 'Electronics', 45000.00),
('Speaker', 'Accessories', 7000.00),
('Backpack', 'Accessories', 2500.00),
('Wristband', 'Accessories', 1500.00);


-- Rename column Name to FullName and Phone to PhoneNumber
ALTER TABLE Customers RENAME COLUMN Name TO FullName;
ALTER TABLE Customers RENAME COLUMN Phone TO PhoneNumber;

SELECT * FROM Customers;

SELECT * FROM Orders WHERE OrderStatus = 'Pending';

SELECT * FROM Products WHERE Category = 'Electronics';

SELECT SUM(TotalAmount) AS TotalSpent FROM Orders WHERE CustomerID = 1;

SELECT c.FullName, o.OrderDate, o.TotalAmount FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.State = 'Maharashtra' AND o.OrderStatus = 'Completed';

UPDATE Customers
SET PhoneNumber = '9876999999'
WHERE CustomerID = 1;

UPDATE Orders
SET OrderStatus = 'Completed'
WHERE OrderID = 2;

UPDATE Products
SET Price = Price * 1.10
WHERE Category = 'Electronics';

CREATE VIEW View_PendingOrders AS
SELECT * FROM Orders
WHERE OrderStatus = 'Pending';

CREATE VIEW View_Electronics AS
SELECT * FROM Products
WHERE Category = 'Electronics';

CREATE VIEW View_LargeOrders AS
SELECT * FROM Orders
WHERE TotalAmount > 5000;

CREATE VIEW View_CustomersMaharashtra AS
SELECT * FROM Customers
WHERE State = 'Maharashtra';

SELECT c.FullName, o.OrderDate, o.TotalAmount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT c.FullName, o.OrderDate, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

SELECT c.FullName, o.OrderDate, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

CREATE VIEW View_Union_LeftRight_Join AS
SELECT c.FullName, o.OrderDate, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.FullName, o.OrderDate, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;


CREATE VIEW View_InnerJoin_CustomersOrders AS
SELECT c.FullName, o.OrderDate, o.TotalAmount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

CREATE VIEW View_LeftJoin_CustomersOrders AS
SELECT c.FullName, o.OrderDate, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

CREATE VIEW View_RightJoin_CustomersOrders AS
SELECT c.FullName, o.OrderDate, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

CREATE VIEW View_FullJoin_CustomersOrders AS
SELECT c.FullName, o.OrderDate, o.TotalAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.FullName, o.OrderDate, o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;



