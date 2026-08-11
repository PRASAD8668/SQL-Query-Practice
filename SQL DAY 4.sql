drop database student;
create database student;
use student;
CREATE TABLE Departments (
    Dept_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50),
    Location VARCHAR(50)
);
INSERT INTO Departments VALUES
(1, 'HR', 'Pune'),
(2, 'IT', 'Mumbai'),
(3, 'Sales', 'Delhi'),
(4, 'Finance', 'Pune'),
(5, 'Marketing', 'Mumbai');
CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Dept_ID INT,
    Salary INT,
    City VARCHAR(50),
    Age INT,
    Manager_ID INT,
    Email VARCHAR(100)
);
INSERT INTO Employees VALUES
(101,'Amit','HR',1,35000,'Pune',25,NULL,'amit@gmail.com'),
(102,'Priya','IT',2,55000,'Mumbai',28,NULL,NULL),
(103,'Rahul','Sales',3,40000,'Pune',30,102,'rahul@gmail.com'),
(104,'Sneha','IT',2,60000,'Delhi',27,102,'sneha@gmail.com'),
(105,'Karan','HR',1,38000,'Mumbai',35,101,NULL),
(106,'Neha','Finance',4,70000,'Pune',32,NULL,'neha@gmail.com'),
(107,'Riya','IT',2,65000,'Pune',29,102,NULL),
(108,'Mohit','Sales',3,45000,'Delhi',26,103,'mohit@gmail.com'),
(109,'Ankit','Finance',4,52000,'Mumbai',31,106,'ankit@gmail.com'),
(110,'Pooja','HR',1,42000,'Pune',24,101,'pooja@gmail.com');
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    City VARCHAR(50)
);
INSERT INTO Customers VALUES
(201,'Rohan','Pune'),
(202,'Snehal','Mumbai'),
(203,'Vikas','Delhi'),
(204,'Meena','Pune'),
(205,'Arjun','Mumbai');
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product VARCHAR(50),
    Amount INT,
    Order_Date DATE
);
INSERT INTO Orders VALUES
(301,201,'Laptop',60000,'2026-01-10'),
(302,202,'Mobile',25000,'2026-01-12'),
(303,201,'Mouse',1500,'2026-01-15'),
(304,203,'Laptop',65000,'2026-02-01'),
(305,204,'Keyboard',3000,'2026-02-05'),
(306,202,'Laptop',55000,'2026-02-10'),
(307,205,'Mobile',22000,'2026-02-15'),
(308,201,'Monitor',18000,'2026-03-01');
#Display the employee name and their department name.
select e.Emp_Name,d.Department_Name from
employees e join departments d on
e.Dept_ID=d.Dept_ID;
#Display:
#Employee name
#Salary
#Department name
#Department location
#Use an INNER JOIN between Employees and Departments
select e.Emp_Name,e.Salary,d.Location,d.Department_Name from
employees e join departments d on
e.Dept_ID=d.Dept_ID;
#Display employees who:
#Work in the IT department
#Have a salary greater than ₹55,000
select e.Emp_Name,e.Salary,d.Location,d.Department_Name from
employees e join departments d on
e.Dept_ID=d.Dept_ID
where d.Department_Name="IT" and Salary>55000;
#Display all departments and their employees.
SELECT
    d.Dept_ID,
    d.Department_Name,
    e.Emp_Name,
    e.Salary
FROM Departments AS d
LEFT JOIN Employees AS e
    ON e.Dept_ID=d.Dept_ID
    order by d.Dept_ID;
#Find all departments that have NO employees.
SELECT
    d.Dept_ID,
    d.Department_Name,
    e.Emp_Name,
    e.Salary
FROM Departments AS d
LEFT JOIN Employees AS e
    ON e.Dept_ID=d.Dept_ID
where e.Emp_ID IS NULL;
#Display all employees along with their department name.
SELECT
    e.Emp_ID,
    e.Emp_Name,
    e.Salary,
    d.Department_Name
FROM Departments AS d
RIGHT JOIN Employees AS e
    ON e.Dept_ID=d.Dept_ID
    order by Emp_ID;
#Display:
#Department name
#Employee name
#Salary
#using a FULL OUTER JOIN.
#The result must include:
#Departments with employees
#Departments without employees
#Employees without departments
SELECT
    d.Department_Name,
    e.Emp_Name,
    e.Salary
FROM Departments AS d
LEFT JOIN Employees AS e
    ON d.Dept_ID = e.Dept_ID
UNION
SELECT
    d.Department_Name,
    e.Emp_Name,
    e.Salary
FROM Departments AS d
RIGHT JOIN Employees AS e
    ON d.Dept_ID = e.Dept_ID;
#Find the total salary for each department.
SELECT
    d.Department_Name,
    sum(e.Salary) as Total_salary
    from
Employees AS e join Departments AS d
ON d.Dept_ID = e.Dept_ID
group by d.Department_Name;
#Find departments whose total salary is greater than ₹1,00,000.
SELECT
    d.Department_Name,
    sum(e.Salary) as Total_salary
    from
Employees AS e join Departments AS d
ON d.Dept_ID = e.Dept_ID
group by d.Department_Name
having Total_salary>100000;
#Find the following for each customer:
#Customer name
#City
#Number of orders
#Total amount spent
#Average order amount
#Conditions
#Only display customers who:
#Have at least 2 orders
#Have spent more than ₹50,000
#Sort by Total Amount Spent, highest to lowest.
SELECT
    c.Customer_Name,
    c.City,
    COUNT(o.Order_ID) AS Total_Orders,
    SUM(o.Amount) AS Total_Spent,
    AVG(o.Amount) AS Average_Order
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.Customer_ID=o.Customer_ID
GROUP BY c.Customer_ID,
         c.Customer_Name,
         c.City
HAVING Total_Orders>2 and Total_Spent>5000
ORDER BY Total_Spent;