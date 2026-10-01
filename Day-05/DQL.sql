create database flipkart;
use flipkart;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT,
    CreatedAt DATE,
    IsAvailable BOOLEAN
);
INSERT INTO Products VALUES
(1, 'iPhone 15', 'Electronics', 80000, 10, '2024-01-10', TRUE),
(2, 'Samsung S24', 'Electronics', 75000, 15, '2024-02-15', TRUE),
(3, 'Dell Laptop', 'Electronics', 65000, 5, '2023-12-01', TRUE),
(4, 'HP Laptop', 'Electronics', 60000, 7, '2023-11-20', TRUE),
(5, 'Office Chair', 'Furniture', 7000, 20, '2024-03-05', TRUE),
(6, 'Study Table', 'Furniture', 12000, 8, '2024-03-12', TRUE),
(7, 'Water Bottle', 'Accessories', 500, 50, '2024-01-01', TRUE),
(8, 'Backpack', 'Accessories', 1500, 30, '2024-02-01', TRUE),
(9, 'Smart Watch', 'Electronics', 15000, 12, '2024-04-01', TRUE),
(10, 'Bluetooth Speaker', 'Electronics', 3000, 25, '2024-04-10', TRUE),
(11, 'Notebook', 'Stationery', 50, 100, '2024-01-05', TRUE),
(12, 'Pen Pack', 'Stationery', 100, 200, '2024-01-08', TRUE),
(13, 'Gaming Mouse', 'Electronics', 2000, 18, '2023-10-10', TRUE),
(14, 'Keyboard', 'Electronics', 2500, 22, '2023-09-15', TRUE),
(15, 'Monitor', 'Electronics', 18000, 6, '2023-08-20', TRUE),
(16, 'Sofa', 'Furniture', 35000, 3, '2023-07-01', TRUE),
(17, 'Dining Table', 'Furniture', 40000, 2, '2023-06-10', FALSE),
(18, 'Headphones', 'Electronics', 5000, 14, '2024-05-01', TRUE),
(19, 'Coffee Mug', 'Accessories', 300, 60, '2024-05-05', TRUE),
(20, 'Tablet', 'Electronics', 30000, 9, '2024-06-01', TRUE);
show databases;
desc Products;
select * from products;
select productname from products;
select price from products;
select stock from products;
select category, price, stock from products;
select productid, productname from products;
select productname, createdat, isavailable from products;
select * from products where category='electronics';
select * from products where price<5000;
select * from products where stock>60;
select price as MRP, productname from products;
select * from products where price between 5000 and 10000;
select * from products where stock between 10 and 40;
select* from products where price between 6000 and 7000;
select* from products where productname like 'd%';
select* from products where productname like '%s';
select* from products where productname like '%h%';
select* from products where category in ('accessories','furniture');
select* from products where category not in ('accessories','furniture');
select * from products order by price asc;
select * from products order by stock;
select * from products order by stock desc;
select distinct category from products;
select distinct price from products;
select * from products limit 5;
select sum(price) as TotalValue from products;
select avg(price) as AvgPrice from products;
select max(price) as MaxPrice from products;
select min(price) as MinPrice from products;
select count(category) from products where category='Electronics';
select count(category) from products where category='Accessories';
select count(*) as total_rows from products;
select category, count(*) as ProductCount from products group by category;
select category, max(Price) as MaximumPrice from products group by category;
select category, min(Price) as MinimumPrice from products group by category;
select category, avg(Stock) as AvgStocks from products group by category;
select category, sum(Price) as TotalPrice, sum(stock) as totalstocks from products group by category;
select category, avg(Stock) as AvgStocks from products group by category having AvgStocks>15;
select category, count(*) as ProductCount from products group by category having ProductCount<5;
SELECT Category, sum(stock) as TotalStock from Products group by Category having TotalStock>100;
SELECT Category, avg(price) as AvgCategoryPrice from Products group by Category having AvgCategoryPrice>100;
select productname, price, price+(price*0.15) as IncreasedPrice from products;
select productname, price, price-(price*0.06) as DecreasedPrice from products;
select productname, price, price*2 as DoublePrice from products;
select productname, price, price/2 as HalfPrice from products;
select productname, stock, stock%2 as StockRemainder from products;
select * from products where category='Furniture';
select * from products where category<>'Electronics';
select * from products where Price>50000;
select * from products where stock>50;
select * from products where stock>=200;
select * from products where Price<=50;
select * from products where category is null;
select * from products where category is not null;
select * from products where price>10000 and stock>5;
select * from products where category='Furniture' or category='Stationery';
select * from products where not category='Accessories';
select 10&6 as BitwiseAND;
select 10|6 as BitwiseOR;
select 10^6 as BitwiseXOR;
select ~10 as BitwiseNOT;
select 5<<1 as leftshift;
select 20>>2 as rightshift;
set @total:=100;
select @total;
select @total as AssignedValue;