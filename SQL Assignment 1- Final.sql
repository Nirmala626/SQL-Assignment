----- Basic Question -----
---Basics Questions:-
---1) Create two Databases Name :- Brands , and  Products
---2) Create two tables in SQL Server  name  as ITEMS_Table in Brands database and PRODUCT_Table in Products database.
---3)  After Creating both the tables Add records in that tables (records are available above)
---4) Delete those product having the Units Sold 1618.5 , 888 and 2470.
---5) DROP the table and Create it again
--------------------------------------------------------------------------
---1) Create two Databases Name :- Brands , and  Products
---2) Create two tables in SQL Server  name  as ITEMS_Table in Brands database and PRODUCT_Table in Products database.
---3)  After Creating both the tables Add records in that tables (records are available above)
create table item_table1(Item_Id int, item_description varchar(max), vendor_nos int, vendor_name varchar(max), bottle_size int, bottle_price decimal(10,2))
select * from item_table1

create table PRODUCT_Table(Product_Id int, Country varchar(max),  Product varchar(max), Units_Sold decimal (10,2),  Manufacturing_Price decimal(10,2) default '$',  Sale_Price decimal(10,2) default '$',  Gross_Sales decimal(10,2) default '$',   Sales decimal(10,2) default '$',  COGS decimal(10,2) default '$',  Profit decimal(10,2) default '$', Date date, Month_Number int,  Month_Name varchar(max), Year int)
select * from PRODUCT_Table
insert into PRODUCT_Table values (1,'Canada', 'Carretera', 	1618.5,	3.00,	20.00,	32,370.00,	32,370.00,	16,185.00,	16,185.00,	1/1/2014,	1,	 'January', 2014)
CREATE TABLE PRODUCT_TT (
    Product_Id INT,
    Country VARCHAR(50),
    Product VARCHAR(50),
    Units_Sold FLOAT,
    Manufacturing_Price DECIMAL(10, 2),
    Sale_Price DECIMAL(10, 2),
    Gross_Sales DECIMAL(15, 2),
    Sales DECIMAL(15, 2),
    COGS DECIMAL(15, 2),
    Profit DECIMAL(15, 2),
    Date DATE,
    Month_Number INT,
    Month_Name VARCHAR(50),
    Year INT)
select * from PRODUCT_TT 
INSERT INTO PRODUCT_TT 
VALUES 
(1, 'Canada', 'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00, 16185.00, 16185.00, '2014-01-01', 1, 'January', 2014),
(2, 'Germany', 'Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '2015-01-01', 1, 'January', 2015),
(3, 'France', 'Carretera', 2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2016-06-01', 6, 'June', 2016),
(4, 'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '2017-06-01', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '2018-06-01', 6, 'June', 2018),
(6, 'Germany', 'Carretera', 1513, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '2019-12-01', 12, 'December', 2019),
(7, 'Germany', 'Montana', 921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2020-03-01', 3, 'March', 2020),
(8, 'Canada', 'Montana', 2518, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '2021-06-01', 6, 'June', 2021);
-------------------------------------------------------------------------------
 ---4) Delete those product having the Units Sold 1618.5 , 888 and 2470.
 select * from PRODUCT_TT 
delete PRODUCT_TT where Units_Sold in (1618.5, 888, 2470) 
------------------------------------------------------------------------------
---5) DROP the table and Create it again
drop table PRODUCT_TT
create table PRODUCT_TTF
(Product_Id INT,
    Country VARCHAR(50),
    Product VARCHAR(50),
    Units_Sold FLOAT,
    Manufacturing_Price DECIMAL(10, 2),
    Sale_Price DECIMAL(10, 2),
    Gross_Sales DECIMAL(15, 2),
    Sales DECIMAL(15, 2),
    COGS DECIMAL(15, 2),
    Profit DECIMAL(15, 2),
    Date DATE,
    Month_Number INT,
    Month_Name VARCHAR(50),
    Year INT)
select * from PRODUCT_TTF
INSERT INTO PRODUCT_TTF 
VALUES 
(1, 'Canada', 'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00, 16185.00, 16185.00, '2014-01-01', 1, 'January', 2014),
(2, 'Germany', 'Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '2015-01-01', 1, 'January', 2015),
(3, 'France', 'Carretera', 2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2016-06-01', 6, 'June', 2016),
(4, 'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '2017-06-01', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '2018-06-01', 6, 'June', 2018),
(6, 'Germany', 'Carretera', 1513, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '2019-12-01', 12, 'December', 2019),
(7, 'Germany', 'Montana', 921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2020-03-01', 3, 'March', 2020),
(8, 'Canada', 'Montana', 2518, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '2021-06-01', 6, 'June', 2021);

------------------------------------------------------------------------------------------------------------
---Intermediate Questions
---Big Table :--
--1) Find the Total Sale Price  and  Gross Sales 
select * from PRODUCT_TTF
select SUM(sales) as 'Total Sales', SUM(Gross_Sales) as 'Total Gross Sales' from PRODUCT_TTF
-------------------------------------------------------------------------------------------------------------
2) In which year we have got the highest sales
select * from PRODUCT_TTF
SELECT 
    TOP 1 Year, 
    SUM(Sales) AS Total_Sales 
FROM 
    PRODUCT_TTF
GROUP BY 
    Year
ORDER BY 
    Total_Sales DESC
---------------------------------------------------------------------------------------------
--3)  Which Product having the sales of $ 37,050.00
select * from PRODUCT_TTF
 select product from PRODUCT_TTF where Sales=37050.00
 -----------------------------------------------------------------------------------------------
---4) Which Countries lies between profit of $ 4,605 to $  22 , 662.00
select * from PRODUCT_TTF
select country from PRODUCT_TTF where profit between 4605 and 22662
----------------------------------------------------------------------------------------------
--5) Which Product Id having the sales of $ 24 , 700.00
select * from PRODUCT_TTF
select product_id, Sales from PRODUCT_TTF where Sales=24700.00
------------------------------------------------------------------------------------------------------
---Small Table :--
---1) Find the item_description having the bottle size of 750
select * from item_table1
select item_description  from item_table1 where bottle_size=750
-------------------------------------------------------------------------------------------------------
---2) Find the vendor Name having the vendor_nos 305 , 380 , 391
select * from item_table1
select vendor_name from item_table1 where vendor_nos in (305, 380, 391)
-----------------------------------------------------------------------------------------------------
---3) What is total Bottle_price
select * from item_table1
select SUM(bottle_price) as 'Total_bottle_Price' from item_table1
----------------------------------------------------------------------------------------------------------
--4) Make Primary Key to Item_id
select * from item_table1
create table item_tablePrimary(Item_Id int primary key, item_description varchar(max), vendor_nos int, vendor_name varchar(max), bottle_size int, bottle_price int)
select * from item_tablePrimary
-----------------------------------------------------------------------------------------------------------
--5) Which item id having the bottle_price of $ 5.06
select * from item_table1
select item_id, bottle_price from item_table1 where bottle_price=5.06
---------------------------------------------------------------------------------------------------------
--Advance Questions:--
1) Apply INNER  , FULL OUTER , LEFT JOIN types on both the table 
select * from PRODUCT_TTF
select * from item_table1
SELECT PRODUCT_TTF.Product_Id, PRODUCT_TTF.Country, PRODUCT_TTF.Product, item_table1.item_description, item_table1.vendor_name
FROM Products.dbo.PRODUCT_TTF  
left join Brands.dbo.item_table1
ON PRODUCT_TTF.Product_Id = item_table1.Item_Id

SELECT PRODUCT_TTF.Product_Id, PRODUCT_TTF.Country, PRODUCT_TTF.Product, item_table1.item_description, item_table1.vendor_name
FROM Products.dbo.PRODUCT_TTF  
inner join Brands.dbo.item_table1
ON PRODUCT_TTF.Product_Id = item_table1.Item_Id

SELECT PRODUCT_TTF.Product_Id, PRODUCT_TTF.Country, PRODUCT_TTF.Product, item_table1.item_description, item_table1.vendor_name
FROM Products.dbo.PRODUCT_TTF  
full outer join Brands.dbo.item_table1
ON PRODUCT_TTF.Product_Id = item_table1.Item_Id

------------------------------------------------------------------------------------------
2) Apply  OUTER  ,  RIGHT JOIN , CROSS JOIN types  on both the table
-- Outer--
SELECT PRODUCT_TTF.Product_Id, PRODUCT_TTF.Country, PRODUCT_TTF.Product, item_table1.item_description, item_table1.vendor_name
FROM Products.dbo.PRODUCT_TTF  
full join Brands.dbo.item_table1
ON PRODUCT_TTF.Product_Id = item_table1.Item_Id
-- Right Join ---
SELECT PRODUCT_TTF.Product_Id, PRODUCT_TTF.Country, PRODUCT_TTF.Product, item_table1.item_description, item_table1.vendor_name
FROM Products.dbo.PRODUCT_TTF  
right join Brands.dbo.item_table1
ON PRODUCT_TTF.Product_Id = item_table1.Item_Id

--cross join ---
select * from PRODUCT_TTF
select * from item_table1
SELECT PRODUCT_TTF.Product_Id, PRODUCT_TTF.Country, PRODUCT_TTF.Product, item_table1.item_description
FROM Products.dbo.PRODUCT_TTF 
cross join Brands.dbo.item_table1
-------------------------------------------------------------------------------------------------
3) Find the item_description and Product having the gross sales of 13,320.00
select * from PRODUCT_TTF
SELECT PRODUCT_TTF.Product_Id, PRODUCT_TTF.Gross_Sales, PRODUCT_TTF.Product, item_table1.item_description
FROM Products.dbo.PRODUCT_TTF 
left join Brands.dbo.item_table1
on PRODUCT_TTF.Product_Id = item_table1.Item_Id where Gross_Sales=13320
-----------------------------------------------------------------------------------------------
--4)   Split the Item_description Column into Columns Item_desc1 and Item_desc2
select * from item_table1
alter table item_table1 add item_desc1 varchar(max), item_desc2 varchar(max)

Select item_description, Left(item_description ,CHARINDEX(' ',item_description,1)-1) 'Item_desc1',
Right(item_description,Len(item_description)-CHARINDEX(' ',item_description,1)) 'item_desc2'
from item_table1
------------------------------------------------------------------------------------------------------------
