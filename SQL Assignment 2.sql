--Q1) Create   Database Name as Order_Stores_Data 

---Q2) Create two Table names as Orders_Table and Stores_Table

---Q3) Insert All records present here in the Orders_table and Stores_Table.

create table Order_Table(OrderDate date, Region varchar(max), Rep varchar(max), Order_Item varchar(max), Units int, Unit_Cost decimal(10,2), Total_Price decimal(10,2), Order_Id int)
select * from Order_Table
create table Stores_Table(Store_Id int, StoreType varchar(max), Assortment int, CompetitionDistance int, Month int, Year int, PromoInterval varchar(max))
select * from Stores_Table
-------------------------------------------------------------------------------------------
---Q3) Make Order_Id  Column as Primary Key.
create table Order_Tableprimary (OrderDate date, Region varchar(max), Rep varchar(max), Order_Item varchar(max), Units int, Unit_Cost decimal(10,2), Total_Price decimal(10,2), Order_Id int primary key)
select * from Order_Tableprimary
--------------------------------------------------------------------------------------------
---Q4) Add one Column Name  as Store_Names and insert the records given above in Stores table.
select * from Stores_Table
alter table stores_table add store_name varchar(max)
insert into Stores_Table values (11,'b', 24, 4523, 11,2020, 'May', 'Car')
insert into Stores_Table values (12,'c', 33, 1585, 6,2011, 'Jan', 'Bike')
---------------------------------------------------------------------------------------------
---Q5) Make Stored_Id as a Foreign Key with reference too Orders_Table 
select * from Stores_Table
SELECT * FROM Order_Table
use Order_Store_Data
SELECT * FROM Order_Table
ALTER TABLE stores_table 
ADD constraint FK_Stored_orders
FOREIGN KEY (Store_Id) 
REFERENCES Order_Table(Order_Id)
-----------------------------------------------------------------------------------------------
---Q6) Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet
select * from Order_Table
update Order_Table set order_item='Books' where Order_Id in(3,4,5,7,9) 
---------------------------------------------------------------------------------------
---Q7) Update the missing records in the PromoInterval Column in Stores Table.
select * from Stores_Table
update Stores_Table set PromoInterval='Dec' where Store_Id in(4,7,9) 
---------------------------------------------------------------------------------------
--Q8) Rename the column name  of Assortment to Store_Nos in Stores_Table.
select * from Stores_Table
sp_rename 'stores_table.assortment', 'store_Nos', 'Column'
-------------------------------------------------------------------------------------------
--Q9) Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table.
select * from Order_Table
exec sp_rename 'order_table.Order_item', 'Item_name', 'column'
exec sp_rename 'order_table.rep', 'Customer_name', 'column' 
--------------------------------------------------------------------------------------
--Q10) Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.
select * from Order_Table
select order_id, unit_cost as 'Unit Cost Desc', Total_Price as 'Total Price Asc' from Order_Table order by [Unit Cost Desc]desc, [Total Price Asc]asc
----------------------------------------------------------------------------------------------------
--Q11) Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.
select * from Order_Table
exec sp_rename 'order_table.customer_name', 'Cus_name', 'column'
select region, COUNT(cus_name) as customer_count from Order_Table group by Region
--------------------------------------------------------------------------------------------------------
--Q12) Find the sum of Total_Price Column and Unit Cost  in Orders_Table 
select * from Order_Table
select  SUM(total_price) 'Sum of Total Price', SUM(unit_cost) 'Sum of unit cost' from Order_Table
--------------------------------------------------------------------------------------------------------
--Q13) Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names that table as Order_Stores_Table.
select * from Order_Table
select * from Stores_Table
select Order_Table.Order_Id, Order_Table.OrderDate, Order_Table.Unit_Cost, Stores_Table.StoreType, Stores_Table.Year from Order_Table left join Stores_Table
on Order_Table.Order_Id=Stores_Table.Store_Id
--- OR---
create table Order_store_Table(OrderDate date, Unit_Cost decimal(10,2), storeType varchar(max), Year int)
select * from Order_store_Table
----------------------------------------------------------------------------------------------------------
--Q14)  Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9
select * from Order_Table
select item_name, region from Order_Table where Order_Id in (4,5,6,9)
---------------------------------------------------------------------------------------------------
---Q15) Show me year  whose ComptetitionDistance is 29910  , 310 , 3160
select * from Stores_Table
select YEAR from Stores_Table where CompetitionDistance in (29910,310,3160)
---------------------------------------------------------------------------------------------------------
---Q16)  Give me that Item_name whose  Total_Price is greater than 200 and less than 400
select * from Order_Table
select item_name, Total_Price from Order_Table where Total_Price>200 
select item_name, Total_Price from Order_Table where Total_Price<400 
------------------------------------------------------------------------------------------------------
--Q17) Rename the CompetitionDistance as CD and find the total CD in Stores_Table.
select * from Stores_Table
exec sp_rename 'stores_table.competitiondistance', 'CD', 'column'
select SUM(CD) 'Total_CD' from Stores_Table
select SUM(CD) over() as 'Total_CD' from Stores_Table
select *, SUM(cd) over() as 'Total_CD' from Stores_Table
---------------------------------------------------------------------------------------------------
--Q18) What is the Total Count of Stores_Type and CD columns
select * from Stores_Table
select count(storetype) as'Total Count storetype' , COUNT(CD) as 'Total Count CD' from Stores_Table
--------------------------------------------------------------------------------------------------
Q19) Apply the Cross Join in  Orders_Table and Stores_Table.
select * from Stores_Table
select * from Order_Table
select * from Stores_Table cross join Order_Table
-------------------------------------------------------------------------------------------------------
--Q20) DROP both the databases
drop table Stores_Table
drop table Order_Table
drop database Order_Store_Data
-----------------------------------------------------------------------------------------------------------------------------------