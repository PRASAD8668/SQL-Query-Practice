drop database student;
create database student;
use student;
CREATE TABLE Departments (
    Dept_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50),
    Location VARCHAR(50)
);

INSERT INTO Departments
(Dept_ID, Department_Name, Location)
VALUES
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

INSERT INTO Employees
(Emp_ID, Emp_Name, Department, Dept_ID, Salary, City, Age, Manager_ID, Email)
VALUES
(101, 'Amit', 'HR', 1, 35000, 'Pune', 25, NULL, 'amit@gmail.com'),
(102, 'Priya', 'IT', 2, 55000, 'Mumbai', 28, NULL, 'priya@gmail.com'),
(103, 'Rahul', 'Sales', 3, 40000, 'Pune', 30, 102, 'rahul@gmail.com'),
(104, 'Sneha', 'IT', 2, 60000, 'Delhi', 27, 102, 'sneha@gmail.com'),
(105, 'Karan', 'HR', 1, 38000, 'Mumbai', 35, 101, NULL),
(106, 'Neha', 'Finance', 4, 70000, 'Pune', 32, NULL, 'neha@gmail.com'),
(107, 'Riya', 'IT', 2, 65000, 'Pune', 29, 102, NULL),
(108, 'Mohit', 'Sales', 3, 45000, 'Delhi', 26, 103, 'mohit@gmail.com'),
(109, 'Ankit', 'Finance', 4, 52000, 'Mumbai', 31, 106, 'ankit@gmail.com'),
(110, 'Pooja', 'HR', 1, 42000, 'Pune', 24, 101, 'pooja@gmail.com');
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customers
(Customer_ID, Customer_Name, City)
VALUES
(201, 'Rohan', 'Pune'),
(202, 'Snehal', 'Mumbai'),
(203, 'Vikas', 'Delhi'),
(204, 'Meena', 'Pune'),
(205, 'Arjun', 'Mumbai');
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product VARCHAR(50),
    Amount INT,
    Order_Date DATE
);

INSERT INTO Orders
(Order_ID, Customer_ID, Product, Amount, Order_Date)
VALUES
(301, 201, 'Laptop', 60000, '2026-01-10'),
(302, 202, 'Mobile', 25000, '2026-01-12'),
(303, 201, 'Mouse', 1500, '2026-01-15'),
(304, 203, 'Laptop', 65000, '2026-02-01'),
(305, 204, 'Keyboard', 3000, '2026-02-05'),
(306, 202, 'Laptop', 55000, '2026-02-10'),
(307, 205, 'Mobile', 22000, '2026-02-15'),
(308, 201, 'Monitor', 18000, '2026-03-01')
;
#Find employees whose salary is greater than the average salary of all employees.
SELECT *
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);
#Find the employee(s) who have the highest salary.
SELECT
    Emp_ID,
    Emp_Name,
    Department,
    Salary
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
);
#Find employees who work in departments where the average salary is greater than ₹50,000.
SELECT
    Emp_Name,
    Department,
    Salary
FROM Employees
WHERE Dept_ID IN (
    SELECT Dept_ID
    FROM Employees
    GROUP BY Dept_ID
    HAVING AVG(Salary) > 50000
);
#Find customers who have never placed an order using NOT IN.
SELECT
    Customer_ID,
    Customer_Name,
    City
FROM Customers
WHERE Customer_ID NOT IN (
    SELECT Customer_ID
    FROM Orders
);
#Find customers who have placed at least one order.
SELECT
    c.Customer_ID,
    c.Customer_Name,
    c.City
FROM Customers AS c
WHERE EXISTS (
    SELECT 1
    FROM Orders AS o
    WHERE o.Customer_ID = c.Customer_ID
);
#Find customers who have never placed an order using NOT EXISTS
SELECT
    c.Customer_ID,
    c.Customer_Name,
    c.City
FROM Customers AS c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders AS o
    WHERE o.Customer_ID = c.Customer_ID
);
#Find employees whose salary is greater than the average salary of their own department.
SELECT
    e1.Emp_ID,
    e1.Emp_Name,
    e1.Department,
    e1.Salary
FROM Employees AS e1
WHERE e1.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employees AS e2
    WHERE e2.Dept_ID = e1.Dept_ID
);
#Find employees who work in departments where:
#The average salary is greater than ₹50,000
#The total salary is greater than ₹1,00,000
SELECT
    Emp_ID,
    Emp_Name,
    Department,
    Salary
FROM Employees
WHERE Dept_ID IN (
    SELECT Dept_ID
    FROM Employees
    GROUP BY Dept_ID
    HAVING AVG(Salary) > 50000
       AND SUM(Salary) > 100000
);
#Find departments that satisfy ALL of these conditions:
#Condition 1
#Department has at least 2 employees.
#Condition 2
#Department's average salary is greater than ₹45,000.
#Condition 3
#Department's total salary is greater than ₹1,00,000.
SELECT
    d.Department_Name,
    d.Location,
    COUNT(*) AS Total_Employees,
    SUM(e.Salary) AS Total_Salary,
    AVG(e.Salary) AS Average_Salary,
    MAX(e.Salary) AS Highest_Salary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.Dept_ID = d.Dept_ID
GROUP BY
    d.Department_Name,
    d.Location
HAVING COUNT(*) >= 2
   AND AVG(e.Salary) > 45000
   AND SUM(e.Salary) > 100000
ORDER BY Total_Salary DESC;