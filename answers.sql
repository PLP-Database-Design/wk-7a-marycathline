CREATE DATABASE Nomalizationdb;
USE Nomalizationdb;
USE salesdb;

-- 1NF Table: ProductDetails_1NF
--it removes repeating groups and ensures that each column contains atomic values.
-- It also ensures that each record is unique by using a primary key.
CREATE TABLE ProductDetails_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- rows reflecting 1NF
INSERT INTO ProductDetails_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- 2NF Table: ProductDetails_2NF
-- It removes partial dependencies by ensuring that all non-key attributes are fully functionally dependent on the primary key.
-- In this case, we separate the customer information from the product details.
-- Table 1: Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Table 2: OrderItems
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
