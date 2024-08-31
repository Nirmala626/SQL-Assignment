---Assignment 4 --------------
--Create a Student table and ADD 20 records in them
CREATE TABLE Student (StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Surname VARCHAR(50),
    Class VARCHAR(10),
    Gender CHAR(1),
    SchoolNumber INT,
    BirthYear INT)
select * from Student
-- Insert 20 sample records
INSERT INTO Student (StudentID, Name, Surname, Class, Gender, SchoolNumber, BirthYear) VALUES
(1, 'John', 'Doe', '10Math', 'M', 101, 2000),
(2, 'Jane', 'Smith', '10Sci', 'F', 102, 2001),
(3, 'Bob', 'Johnson', '9His', 'M', 103, 2002),
(4, 'Alice', 'Williams', '10Bio', 'F', 104, 2995),
(5, 'David', 'Brown', '9Math', 'M', 105, 2004),
(6, 'Eva', 'Taylor', '10Math', 'F', 106, 2005),
(7, 'Mark', 'Anderson', '9Bio', 'M', 107, 2006),
(8, 'Sophia', 'Martin', '10Sci', 'F', 108, 1997),
(9, 'Daniel', 'Clark', '9His', 'M', 109, 2008),
(10, 'Olivia', 'White', '10Bio', 'F', 110, 1999),
(11, 'Michael', 'Moore', '9Math', 'M', 111, 2002),
(12, 'Emma', 'Davis', '10Math', 'F', 112, 1989),
(13, 'William', 'Lee', '9Bio', 'M', 113, 1996),
(14, 'Ava', 'Jones', '10Sci', 'F', 114, 1997),
(15, 'Matthew', 'Brown', '9His', 'M', 115, 2000),
(16, 'Mia', 'Garcia', '10Bio', 'F', 116, 1993),
(17, 'James', 'Martinez', '9Math', 'M', 117, 1999),
(18, 'Ella', 'Taylor', '10Sci', 'F', 118, 2007),
(19, 'Christopher', 'Clark', '9Bio', 'M', 119, 2018),
(20, 'Sophia', 'Walker', '10Math', 'F', 120, 2019);
---------------------Complete these Set of Questions--------------------------------
--Example 1:  List all the records in the student chart
select * from Student
-------------------------------------------------------------------------------------
---Example 2: List the name surname and class of the student in the student table
select name, surname, class from Student
-------------------------------------------------------------------------------------
--Example 3: List the gender Female (F) records in the student table
select gender from Student where gender='F'
-------------------------------------------------------------------------------------
--Example 4: List the names of each class in the way of being seen once in the student table
select * from Student
select   distinct class from Student
-------------------------------------------------------------------------------------
--Example 5: List the students with Female gender and the class 10Math in the student table
select * from Student where gender='F' and class='10Math'
-------------------------------------------------------------------------------------
--Example 6: List the names, surnames, and classes of the students in the class 10Math or 10Sci in the student table
select name, surname, class from student where Class in ('10math','10sci')
-------------------------------------------------------------------------------------
--Example 7: List the students name surname and school number in the student table
select name, surname, schoolnumber from Student
-------------------------------------------------------------------------------------
--Example 8: List the students name and surname by combining them as name surname in the student table
select name, surname, CONCAT(name,' ',surname) as 'Fullname' from Student
-------------------------------------------------------------------------------------
--Example 9: List the students with the names starting with “A” letter in the student table
select * from Student
select name from Student where name like 'A%'
-------------------------------------------------------------------------------------
--Example 10: List the students with names Emma Sophia and Robert in the student table
select * from student where name in ('Emma','Sophia','Robert')
-------------------------------------------------------------------------------------
--Example 11: List the students with names starting with A D and K in the student table
select name from student where name like 'A%'or name like 'D%' or name like 'K%'
-------------------------------------------------------------------------------------
--Example 12: List the names surnames classes and genders of males in 9Math or females in 9His in the student table
select * from Student
select name, surname, class, Gender from Student where (Gender='M' and Class= '9Math') or (Gender='F'and class='9His')
-------------------------------------------------------------------------------------
--Example 13: List the males whose classes are 10Math or 10Bio
select gender, Class from Student where Class in ('10math', '10bio')
-------------------------------------------------------------------------------------
--Example 14: List the students with birth year 1989 in the student table
select * from Student
select name, BirthYear from Student where BirthYear=1989
-------------------------------------------------------------------------------------
