create database student;
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
#Find the number of employees in each department.
SELECT Department,
       COUNT(*) AS Total_Employees
FROM Employees
GROUP BY Department;
#Find the total salary for each city.
select city,sum(salary) from employees
group by city;
#Find the total salary of employees by Age
select age,sum(salary) from employees
group by age;
#Find the total salary for each department, sorted from highest to lowest.
select department,sum(salary) from employees
group by department
order by sum(salary) desc;
#Find the average salary for each city.
select city, avg(salary) from employees
group by city;
#Find the average age for each department.
select department ,avg(age) from employees
group by department;
#Find the youngest employee's age in each department.
select department,min(age) from employees
group by department;
#Find the lowest salary in each department, sorted from lowest to highest.
select department,min(salary) from employees
group by department
order by min(salary) asc;
#Find the oldest employee's age in each department
select department,max(age) from employees
group by department;
#Find the highest salary in each department, sorted from highest to lowest.
select department ,max(salary) from  employees
group by department
order by max(salary);
#Find the total salary for each Department and City.
select department,city,sum(salary)
from employees
group by department,city;
#Find the average salary of each department and sort from highest to lowest.
SELECT Department,
       AVG(Salary) AS Average_Salary
FROM Employees
GROUP BY Department
ORDER BY Average_Salary DESC;
#Display cities whose maximum salary is greater than ₹60,000.
select city,max(salary) from employees
group by city
having max(salary)>60000;
#Display departments that satisfy both conditions:
#Have at least 2 employees
#Have an average salary greater than ₹50,00
SELECT Department,
       COUNT(*) AS Total_Employees,
       SUM(Salary) AS Total_Salary,
       AVG(Salary) AS Average_Salary
FROM Employees
GROUP BY Department
HAVING COUNT(*) >= 2
   AND AVG(Salary) > 50000;
#Display departments that satisfy all of the following conditions:
#Average salary is greater than ₹45,000
#Total salary is greater than ₹1,00,000
#Employee count is 2 or more
#Sort by Total Salary (Highest → Lowest)
SELECT Department,
       COUNT(*) AS Total_Employees,
       SUM(Salary) AS Total_Salary,
       AVG(Salary) AS Average_Salary,
       MIN(Salary) AS Lowest_Salary,
       MAX(Salary) AS Highest_Salary
FROM Employees
GROUP BY Department
HAVING COUNT(*) >= 2
   AND SUM(Salary) > 100000
   AND AVG(Salary) > 45000
ORDER BY Total_Salary DESC;