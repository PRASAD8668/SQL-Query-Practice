create database Student;
use Student;
CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(30),
    Salary INT,
    City VARCHAR(30)
);
INSERT INTO Employees
VALUES
(101,'Amit','HR',35000,'Pune'),
(102,'Priya','IT',55000,'Mumbai'),
(103,'Rahul','Sales',40000,'Pune'),
(104,'Sneha','IT',60000,'Delhi'),
(105,'Karan','HR',38000,'Mumbai'),
(106,'Neha','Finance',70000,'Pune');

#Display all details of all employees.
select * from employees;
#Display only the employees who work in the IT department
select * from employees 
where department='IT';
#Display employees whose salary is greater than 50000.
select * from employees
where salary>50000;
#Display employees who work in the IT department AND have a salary greater than 55000.
select * from employees
where department='IT' and salary>55000;
#Display employees who work in the HR department OR live in Delhi.
select * from employees
where department in("IT","HR");
#Display employees who are NOT from Mumbai.
select * from employees
where City!="Mumbai";
#Display all employees in descending order of salary.
select * from employees
order by salary desc;
#Display all unique department names.
select distinct(department) from employees;
#Display the top 3 highest-paid employees
select * from employees
order by salary desc
limit 3;
#Display the top 2 highest-paid employees who:
#Work in the IT department OR
#Live in Pune
#Sort the results by Salary (Highest to Lowest).
select * from employees
where department='IT' OR city='Pune' 
order by Salary desc
limit 2;