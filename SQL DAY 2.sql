use student;
CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(30),
    Salary INT,
    City VARCHAR(30),
    Age INT
);
INSERT INTO Employees VALUES
(101,'Amit','HR',35000,'Pune',25),
(102,'Priya','IT',55000,'Mumbai',28),
(103,'Rahul','Sales',40000,'Pune',30),
(104,'Sneha','IT',60000,'Delhi',27),
(105,'Karan','HR',38000,'Mumbai',35),
(106,'Neha','Finance',70000,'Pune',32),
(107,'Riya','IT',65000,'Pune',29),
(108,'Mohit','Sales',45000,'Delhi',26),
(109,'Ankit','Finance',52000,'Mumbai',31),
(110,'Pooja','HR',42000,'Pune',24);
#Display employees who belong to HR or IT departments.
select * from employees 
where department in('HR','IT');
#BETWEEN is used to find values within a range BETWEEN 40000 AND 60000
SELECT Emp_Name, Salary
FROM Employees
WHERE Salary BETWEEN 40000 AND 60000;
#Display employees whose names start with the letter A.
select * from employees
where Emp_Name like "A%";
#Display employees whose names have exactly 4 letters.
select * from employees
where Emp_Name like "____";
#Display employees whose Emp_Name is NULL.
select * from employees
where Emp_Name is NULL;
#Count All Employees
SELECT COUNT(*)
FROM Employees;
#Count Unique Departments
SELECT COUNT(DISTINCT Department)
FROM Employees;
#Count how many employees are from Pune.
SELECT COUNT(*)
FROM Employees
WHERE City = 'Pune';
#Calculate the total salary of employees from Pune
SELECT SUM(Salary)
FROM Employees
WHERE City = 'Pune';
#Calculate the total salary of HR employees.
select sum(salary) from employees
where department='HR';
#Calculate the total salary of employees whose salary is greater than 50,000.
SELECT SUM(Salary) AS Total_Salary
FROM Employees
WHERE Salary > 50000;
#Find the average salary of employees from Pune.
select avg(salary) from employees
where city='pune';
#Find the average salary of HR employees.
select avg(salary) from employees
where department='HR';
#Find the average salary of employees whose salary is greater than 50,000.
select avg(salary) from employees
where salary>50000;
#Find the highest salary of employees from Pune.
select max(salary) from employees
where city='pune';
#Find the lowest salary of employees from Delhi
select min(salary) from employees
where city='delhi';
#Find the youngest employee's age
select min(age) from employees;
#Find the oldest employee's age
select max(age) from employees;
#Display employees who:
#Work in HR or IT
#Salary is between 40,000 and 70,000
#Name starts with P or R
#Sort by Salary (Highest → Lowest)
SELECT *
FROM Employees
WHERE Department IN ('HR', 'IT')
  AND Salary BETWEEN 40000 AND 70000
  AND (Emp_Name LIKE 'P%' OR Emp_Name LIKE 'R%')
ORDER BY Salary DESC;