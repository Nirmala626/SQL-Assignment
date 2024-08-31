--ASSINGMENT nos - 1
--Q1)SQL Query to fetch records that are present in one table but not in another table.
create table Employeedetails (EmpID int, FullName varchar(max), Managerid int, Dateofjoining date, city varchar(max))
select * from Employeedetails
insert into Employeedetails values(121, 'Johan Snow', 321, '2019-01-31', 'Toronto'),
(321, 'Walter White', 986, '2020-01-30', 'California'),
(421, 'Kuldeep Rana', 876, '2021-11-27', 'New Delhi')
select * from Employeedetails
create table Employeesalary (EmpID int, Project varchar(max), Salary int, variables int)
select * from Employeesalary
insert into Employeesalary values(121, 'P1', 8000, 500),
(321, 'P2', 10000, 1000),
(421, 'P1', 12000, 0)
select * from Employeesalary
select * from Employeedetails
select Employeedetails.EmpID, Employeedetails.FullName,Employeesalary.Salary,Employeesalary.Project from Employeedetails left join Employeesalary
on Employeedetails.EmpID=Employeesalary.EmpID 
where Employeedetails.EmpID is null
------------------------------------------------------------------------------------------
--Q2)SQL query to fetch all the employees who are not working on any project.
select Employeedetails.EmpID, Employeedetails.FullName,Employeesalary.Salary,Employeesalary.Project from Employeedetails left join Employeesalary
on Employeedetails.EmpID=Employeesalary.EmpID 
where Employeesalary.Project not in ('P1','P2')
-----------------------------------------------------------------------------
--Q3)SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.
select * from Employeedetails
select Dateofjoining, empid, Fullname from Employeedetails where year (Dateofjoining)=2020
-------------------------------------------------------------------------------------------------
--Q4)Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.
select Employeedetails.EmpID, Employeedetails.FullName,Employeesalary.Salary,Employeesalary.Project from Employeedetails left join Employeesalary
on Employeedetails.EmpID=Employeesalary.EmpID 
----------------------------------------------------------------------------------------
--Q5)Write an SQL query to fetch a project-wise count of employees.
select * from Employeedetails
select * from Employeesalary
select Employeesalary.Project, COUNT(Employeedetails.EmpID) as 'Emp_Count'from Employeesalary left join Employeedetails
on Employeesalary.EmpID=Employeedetails.EmpID
group by Employeesalary.Project
----------------------------------------------------------------------------------------
--Q6)Fetch employee names and salaries even if the salary value is not present for the employee.
select * from Employeedetails
select * from Employeesalary
select Employeedetails.EmpID, Employeedetails.FullName,Employeesalary.Salary,Employeesalary.Project from Employeedetails left join Employeesalary
on Employeedetails.EmpID=Employeesalary.EmpID 
-------------------------------------------------------------------------------------------------
--Q7)Write an SQL query to fetch all the Employees who are also managers.
select * from Employeedetails
select * from Employeesalary
select e.fullname as employee, m.fullname as manager from Employeedetails e left join Employeedetails m
on e.Managerid=m.EmpID
-----------------------------------------------------------------------------------------------
--Q8)Write an SQL query to fetch duplicate records from EmployeeDetails.
select * from Employeedetails
with datacte as
(
select*, ROW_NUMBER() over (partition by EmpID order by EmpID) 'rownumber' from Employeedetails 
)
delete from datacte where ROWNUMBER>1
-------------------------------------------------------------------------------------------
--Q9)Write an SQL query to fetch only odd rows from the table.
select * from Employeedetails
with numberedrows as
(
select*,  ROW_NUMBER() over (order by (Select null)) as rownum from Employeedetails 
)
select* from numberedrows where rownum % 2=1
---------------------------------------------------------------------------------------------------
--Q10)Write a query to find the 3rd highest salary from a table without top or limit keyword.
select * from Employeesalary
SELECT DISTINCT Salary
FROM EmployeeSalary
ORDER BY Salary DESC
OFFSET 2 ROWS
FETCH NEXT 1 ROW ONLY
--------------------------------------------------------------------------
---ASSINGMENT nos - 2----
---Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
select * from Employeedetails
select * from Employeesalary
SELECT EmpId, FullName
FROM EmployeeDetails
WHERE ManagerId = 986
-----------------------------------------------------------------------------
--Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.
select distinct project from Employeesalary
--------------------------------------------------------------------------------
Ques.3. Write an SQL query to fetch the count of employees working in project ‘P1’.
select COUNT(*) as 'EmployeeCount4' from Employeesalary where Project='P1'
------------------------------------------------------------------------------------
Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees.
select * from Employeedetails
select * from Employeesalary
SELECT 
    MAX(Salary) AS MaxSalary,
    MIN(Salary) AS MinSalary,
    AVG(Salary) AS AvgSalary
FROM EmployeeSalary
----------------------------------------------------------------------------------------------
Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
select empid, Salary from Employeesalary where Salary between 9000 and 15000
--------------------------------------------------------------------------------------------------
---Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
select empid, fullname, city, Managerid from Employeedetails where city='Toronto' and Managerid=321
----------------------------------------------------------------------------------------------------------
--Ques.7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
select empid, fullname, city, Managerid from Employeedetails where city='California' or Managerid=321
-----------------------------------------------------------------------------------------------------------
--Ques.8. Write an SQL query to fetch all those employees who work on Projects other than P1.
select * from Employeesalary
select empid, project from Employeesalary where not  Project='P1' 
-----------------------------------------------------------------------------------------------------
---Ques.9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
select empid, (salary+variables) as 'Total_salary' from Employeesalary
------------------------------------------------------------------------------------------------
---Ques.10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.
select * from Employeedetails
SELECT EmpId, FullName
FROM EmployeeDetails
WHERE FullName LIKE '%hn%'
----------------------------------------------------------------------------
---ASSINGMENT nos - 3----
--Ques.1 Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.
select empid from Employeedetails
union
select empid from Employeesalary

select empid from Employeedetails
union all
select empid from Employeesalary
----------------------------------------------------------------------------------------
---Ques.2 Write an SQL query to fetch common records between two tables.
select Employeedetails.EmpID, Employeedetails.FullName from Employeedetails inner join Employeesalary
on Employeedetails.EmpID=Employeesalary.EmpID
---------------------------------------------------------------------------------------------
--Ques.3. Write an SQL query to fetch records that are present in one table but not in another table.
select Employeedetails.EmpID, Employeedetails.FullName from Employeedetails left join Employeesalary
on Employeedetails.EmpID=Employeesalary.EmpID where Employeesalary.EmpID is null
---------------------------------------------------------------------------------------------
---Ques.4. Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary.
select Employeedetails.EmpID from Employeedetails inner join Employeesalary
on Employeedetails.EmpID=Employeesalary.EmpID

SELECT EmpId
FROM EmployeeDetails
INTERSECT
SELECT EmpId
FROM EmployeeSalary;
----------------------------------------------------------------------------------------------
---Ques.5. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.
select Employeedetails.EmpID, Employeedetails.FullName from Employeedetails left join Employeesalary
on Employeedetails.EmpID=Employeesalary.EmpID where Employeesalary.EmpID is null
------------------------------------------------------------------------------------------------
--Ques.6. Write an SQL query to fetch the employee’s full names and replace the space
select * from Employeedetails
select empid, fullname, replace (fullname,' ','_') as Fullnamewithunderscore from employeedetails 
-----------------------------------------------------------------------------------------------
--Ques.7. Write an SQL query to fetch the position of a given character(s) in a field.
select empid, fullname, charindex ('s', FullName) as Position_of_Characheter from employeedetails 
--------------------------------------------------------------------------------------------------
---Ques.8. Write an SQL query to display both the EmpId and ManagerId together.
select * from Employeedetails
select empid, managerid from Employeedetails
-------------------------------------------------------------------------------------------------
---Ques.9. Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table.
Select Fullname, Left(fullname,CHARINDEX(' ',fullname,1)-1) 'FirstName' from Employeedetails
-----------------------------------------------------------------------------------------------
--Ques.10. Write an SQL query to uppercase the name of the employee and lowercase the city values.
select * from Employeedetails
select UPPER(fullname) as upperfullname, LOWER(city) as lowercity from Employeedetails
---------------------------------------------------------------------------------------------------
----ASSINGMENT nos - 4----
---Ques.1. Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.
select count(len (fullname)-len (replace(fullname, 'n', ' '))) as TotalNfullname from Employeedetails
-----------------------------------------------------------------------------------------------------
--Ques.2. Write an SQL query to update the employee names by removing leading and trailing spaces.
select * from Employeedetails
UPDATE EmployeeDetails
SET FullName = TRIM(FullName)
------------------------------------------------------------------------------------------
---Ques.3. Fetch all the employees who are not working on any project.
select Employeedetails.EmpID, Employeedetails.FullName, Employeesalary.Project from Employeedetails left join  Employeesalary 
on Employeedetails.EmpID=Employeesalary.EmpID where Project is  null
-----------------------------------------------------------------------------------------------
--Ques.4. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.
select Employeedetails.EmpID, Employeedetails.FullName, Employeesalary.Salary from Employeedetails left join  Employeesalary 
on Employeedetails.EmpID=Employeesalary.EmpID where Salary =5000 or Salary <=10000
-----------------------------------------------------------------------------------------------
---Ques.5. Write an SQL query to find the current date-time.
select GETDATE () as currentdatetime
--------------------------------------------------------------------------------------------------
---Ques.6. Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.
select * from Employeedetails
select empid, fullname, Dateofjoining from Employeedetails where year (Dateofjoining) =2020
-----------------------------------------------------------------------------------------------------
---Ques.7. Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table.
select Employeedetails.EmpID, Employeedetails.FullName, Employeedetails.Managerid, Employeedetails.Dateofjoining, Employeedetails.city, Employeesalary.Salary from Employeedetails inner join  Employeesalary 
on Employeedetails.EmpID=Employeesalary.EmpID 
----------------------------------------------------------------------------------------------------
--Ques.8. Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order.
select * from Employeedetails
select * from Employeesalary
select project, COUNT(EmpID)as 'Countoffullname' from Employeesalary group by Project order by Countoffullname desc
------------------------------------------------------------------------------------------------------
---Ques.9. Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.
select Employeedetails.EmpID, Employeedetails.FullName, Employeesalary.Salary from Employeedetails left join  Employeesalary 
on Employeedetails.EmpID=Employeesalary.EmpID 
-----------------------------------------------------------------------------------------------------
--Ques.10. Write an SQL query to join 3 tables.
create table Depart(empid int, departname varchar (max))
select * from Depart
select * from Employeedetails
select * from Employeesalary
insert into Depart values (121, 'IT'), (321, 'HR'), (986, 'Service'), (876, 'Production')
select Employeedetails.EmpID, Employeedetails.FullName, Employeedetails.city, Employeedetails.Dateofjoining, Employeesalary.Salary, Depart.departname from Employeedetails full join Employeesalary
on Employeedetails.EmpID=Employeesalary.EmpID full join Depart on  Employeesalary.empid=depart.empid
----------------------------------------------------------------------------------------------------------------------------------------------------------------
----Advanced ASSINGMENT -----
---Q1)Write a query to fetch the EmpFname from the EmployeeInfo table in the upper case and use the ALIAS name as EmpName.
Create table EmpInfo_table(Empid int, EmpFname varchar(max),EmpLname varchar(max), Department varchar(max), Project varchar(max), address varchar(max), DOB date, Gender varchar(max))
select * from EmpInfo_table
create table Empposition_table (empid int, empposition varchar(max), dateofjoining date, salary int)
select * from Empposition_table

insert into EmpInfo_table values ( 1, 'Sanjay','Mehra','HR','P1','Hyderabad_HYD','1976-01-12','M')
insert into EmpInfo_table values ( 2, 'Ananya','Mishra','Admin','P2','Delhi(Del)','1968-05-05','F'), 
( 3, 'Rohan','Diwan','Account','P3','Mumbai(BOM)','1980-01-01','M'),
( 4, 'Sonia','Kulkarni','HR','P1','Hyderabad_HYD','1992-05-02','F'),
( 5, 'Ankit','Kapoor','Admin','P2','Delhi(Del)','1994-03-07','M')
select * from Empposition_table
insert into Empposition_table values ( 1, 'Manager','01-05-2022',500000)
insert into Empposition_table values ( 2, 'Executive','02-05-2022',75000),
( 3, 'Manager','01-05-2022',90000),
( 2, 'Lead','02-05-2022',85000),
( 1, 'Executive','01-05-2022',300000)
select * from Empposition_table
select * from EmpInfo_table

select EmpFname as 'Empname', UPPER(EmpFname) as 'UpperEmpname' from EmpInfo_table
--------------------------------------------------------------------------------------------------------------------------------------
--Q2)Write a query to fetch the number of employees working in the department ‘HR’.
select * from Empposition_table
select * from EmpInfo_table
select empid, department from EmpInfo_table where Department = 'HR'
select count(Department) as numberofemp from EmpInfo_table 
where Department = 'HR'
------------------------------------------------------------------------------------------------------------------------------------
--Q3)Write a query to get the current date.
select GETDATE () as currentdate
-------------------------------------------------------------------------------------------------------------------------------------------
--Q4)Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
select emplname, left(emplname, 4) as 'Leftfunction' from EmpInfo_table
-------------------------------------------------------------------------------------------------------------------------------------------
--Q5)Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.
select * from EmpInfo_table
SELECT 
 SUBSTRING(Address, 1, CHARINDEX('(', Address)) AS 'PlaceName'
FROM EmpInfo_table
----------------------------------------------------------------------------------------------------------------------------------------------
--Q6)Write a query to create a new table that consists of data and structure copied from the other table.
select * into EIF_table from EmpInfo_table
select * from EIF_table
----------------------------------------------------------------------------------------------------------------------------------------------
--Q7)Write q query to find all the employees whose salary is between 50000 to 100000.
select * from EmpInfo_table
select * from Empposition_table
select salary from Empposition_table where salary between 50000 and 100000
----------------------------------------------------------------------------------------------------------------------------------------------
--Q8)Write a query to find the names of employees that begin with ‘S’
select * from EmpInfo_table
SELECT EmpId, Empfname
FROM EmpInfo_table
WHERE EmpFname LIKE 's%'
----------------------------------------------------------------------------------------------------------------------------------------------
--Q9)Write a query to fetch top N records.
select * from EmpInfo_table
select * from Empposition_table
SELECT * FROM (SELECT TOP 5 * FROM Empposition_table ORDER BY salary DESC) AS TopEmployees
-----------------------------------------------------------------------------------------------------------------
--Q10)Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
select empfname, emplname, CONCAT(empfname,' ',emplname) as 'Fullname' from EmpInfo_table
-----------------------------------------------------------------------------------------------------------------
--Q11. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender
select DOB from EmpInfo_table where DOB between '1970-05-02' and '1975-12-31' group by Gender, DOB
-----------------------------------------------------------------------------------------------------------
--Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.
select EmpLname, Department from EmpInfo_table order by emplname desc, department asc
-----------------------------------------------------------------------------------------------------------
--Q13. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.
select emplname, right(emplname, 5) as 'rightfunction' from EmpInfo_table  where EmpLname like '%_A'
------------------------------------------------------------------------------------------------------------
--Q14. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
select * from EmpInfo_table
select * from EmpInfo_table where EmpFname not in ('Sanjay', 'sonia')
------------------------------------------------------------------------------------------------------------
--Q15. Write a query to fetch details of employees with the address as “DELHI(DEL)”.
select * from EmpInfo_table where address= 'Delhi(Del)'
------------------------------------------------------------------------------------------
--Q16. Write a query to fetch all employees who also hold the managerial position.
select * from EmpInfo_table
select * from Empposition_table
select EmpInfo_table.Empid, EmpInfo_table.EmpFname, EmpInfo_table.EmpLname, Empposition_table. empposition from EmpInfo_table left join Empposition_table
on EmpInfo_table.Empid=Empposition_table.empid where empposition='manager'
------------------------------------------------------------------------------------------
--Q17. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.
select Department, COUNT(*) as Employeecount from EmpInfo_table group by Department order by Employeecount asc
------------------------------------------------------------------------------------------
--Q18. Write a query to calculate the even and odd records from a table.
with numberedrecords as (select *, ROW_NUMBER() over (order by (empid)) as rownum from EmpInfo_table) select * from numberedrecords where rownum % 2 = 0 
--ouptput - even numbers showing --
with numberedrecords as (select *, ROW_NUMBER() over (order by (empid)) as rownum from EmpInfo_table) select * from numberedrecords where rownum % 2 = 1
--- output - odd numbers showing ---
with numberedrecords as (select *, ROW_NUMBER() over (order by (empid)) as rownum from EmpInfo_table) select *, case when rownum % 2 = 0 then 'even' else 'odd' end as recordtype from numberedrecords
-- output - odd and even records showing ---
------------------------------------------------------------------------------------------
--Q19. Write a SQL query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table.
select * from EmpInfo_table
select * from Empposition_table
select * from EmpInfo_table full join Empposition_table
on EmpInfo_table.Empid=Empposition_table.empid
select EmpInfo_table.Empid, EmpInfo_table.EmpFname, EmpInfo_table.EmpLname, EmpInfo_table.Department, EmpInfo_table.Project, EmpInfo_table.address, EmpInfo_table.DOB, EmpInfo_table.Gender, Empposition_table.dateofjoining from EmpInfo_table inner join Empposition_table
on EmpInfo_table.Empid=Empposition_table.empid
------------------------------------------------------------------------------------------
--Q20. Write a query to retrieve two minimum and maximum salaries from the EmployeePosition table.
select * from Empposition_table
select top 2 salary from Empposition_table order by salary asc 
select top 2 salary from Empposition_table order by salary desc
------------------------------------------------------------------------------------------
--Q21. Write a query to find the Nth highest salary from the table without using TOP/limit keyword.
select max(salary) from Empposition_table 
WITH RankedSalaries AS (
    SELECT Salary, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowRank
    FROM Empposition_table
)
SELECT Salary
FROM RankedSalaries
WHERE RowRank = 1
------------------------------------------------------------------------------------------
--Q22. Write a query to retrieve duplicate records from a table.
select * from EmpInfo_table
with datacte as (
select *, row_number () over(partition by empid order by empid) as 'Rownumber' from EmpInfo_table
)
delete from datacte where rownumber>1
---------------------------------------------------------------------------------------------
--Q23. Write a query to retrieve the list of employees working in the same department.
SELECT Department, STRING_AGG(empfname, ', ') AS Employees
FROM EmpInfo_table
GROUP BY Department
HAVING COUNT(*) > 1
-------------------------------------------------------------------------------------------
--Q24. Write a query to retrieve the last 3 records from the EmployeeInfo table.
select * from EmpInfo_table where Empid >2
sELECT *
FROM EmpInfo_table
ORDER BY EmpId DESC
OFFSET 0 ROWS
FETCH NEXT 3 ROWS ONLY;
-----------------------------------------------------------------------------------------
-- Q25. Write a query to find the third-highest salary from the EmpPosition table.
select * from Empposition_table
WITH RankedSalaries AS (
    SELECT Salary, ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowRank
    FROM Empposition_table
)
SELECT Salary
FROM RankedSalaries
WHERE RowRank = 3
-----------------------------------------------------------------------------------------
--Q26. Write a query to display the first and the last record from the EmployeeInfo table.
SELECT TOP 1 *
FROM EmployeeInfo
ORDER BY EmpId ASC

UNION ALL

SELECT TOP 1 *
FROM EmployeeInfo
ORDER BY EmpId DESC;
-----------------------------------------------------------------------------------------
--Q27. Write a query to add email validation to your database
ALTER TABLE EmpInfo_table add Email_validation varchar(max) 
select * from  EmpInfo_table 
ALTER TABLE eif_table
ADD CONSTRAINT chk_Email_Validation 
CHECK (Email LIKE '%_@__%.__%');
cREATE TRIGGER trg_Email_Validation
ON eif_table
after INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM inserted 
        WHERE Email NOT LIKE '%_@__%.__%'
    )
    BEGIN
        RAISERROR('Invalid email format.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
---------------------------------------------------------------------------------------------------------------------------------
--Q29. Write a query to retrieve EmpPostion along with total salaries paid for each of them
select sum(salary) as TotalSalaries from Empposition_table group by empposition
---------------------------------------------------------------------------------------------------------------------------------
--Q30. Write a query to fetch 50% records from the EmployeeInfo table.
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNum,
           COUNT(*) OVER () AS TotalCount
    FROM EmpInfo_table
)
SELECT *
FROM CTE
WHERE RowNum <= TotalCount /2;
-----------------------------------------------------------------------------------------------------
