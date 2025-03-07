--Write an SQL query to get unique values of Department from Employee table?
Select Distinct Department from Employee;


--Write an SQL query to get “FIRST_NAME” from Employee table using the alias name as WORKER_NAME and only provide top 5 records in ascending order.
Select  First_name As Worker_Name From Employee Limit 5;


--Write an SQL query to get all Employee details from the Employee table where Department is not consulting and order by Salary descending.
Select * From Employee
Where Department Not In ("Consulting")
Order By Salary Desc;


--Write an SQL query to get the details of employees excluding first names, “John” and “Ishita” and includes only “Consulting” department from Employee table.

Select * From Employee
Where First_name Not In ("John","Ishita") And Department In ("Consulting");


--Write an SQL query to print FIRST_NAME of the Employee whose FIRST_NAME contains ‘a’ in any position using Employee table.
Select  first_name  From Employee 
Where First_name Like "%a%" OR "a%" OR "%a";


--Write an SQL query to print details of the Employee whose salaries are greater than or equal to 90000 or less than or equal to 40000 using Employee table.
Select  * From Employee
Where Salary >= 90000 OR Salary <= 40000;


-- Write an SQL query to fetch the no. of workers for each department in the descending order using Employee table.
Select   Department, Count (Employee_id) AS No_of_Workers From Employee
Group By Department
Order By No_of_Workers Desc;


--Write an SQL query to get the names of workers who earn the highest salary. Please provide corresponding salary as well using Employee table.
Select   First_Name, Max(Salary) From Employee;

--If we want names of workers who earn the highest salary in each department:

Select   First_Name, Max(Salary) From Employee
Group By Department;


-- Write an SQL query to get the departments that have less than five people in it. Provide number of employees as well using Employee table.
Select   Department, Count (Employee_id) < 5 AS Number_of_Employees From Employee
Group By Department;


--Who has the maximum salary in the consulting department? What is the salary amount? Use Employee table.      
Select   First_Name, Department, Max(Salary)AS Salary_Amount From Employee
Where Department IN ("Consulting");

           
--Who has the minimum salary in the consulting department? What is the salary amount? Use Employee table.
Select   First_Name, Department, Min(Salary)AS Salary_Amount From Employee
Where Department IN ("Consulting");


--What is the contact number for ‘Seb Carter’? Use both Employee and Employee_details table.
Select Employee.First_Name, Employee.Last_name, EMPLOYEE_DETAILS.PHONE_NUMBER 
From Employee
Left Join EMPLOYEE_DETAILS
On Employee.Employee_id = EMPLOYEE_DETAILS.Employee_id
Where Employee.First_Name = "Seb" AND Employee.Last_name = "Carter";


--.Are Hiring dates for each employee_id known? If not, for whom are they missing? Use both Employee and Employee_details table.
No, Hiring dates for each employee_id are not known.

Select Employee.First_Name,Employee.Last_name, EMPLOYEE_DETAILS.HIRE_DATE 
From Employee
Left Join EMPLOYEE_DETAILS
On Employee.Employee_id = EMPLOYEE_DETAILS.Employee_id
Where EMPLOYEE_DETAILS.HIRE_DATE IS Null;


--Using Joins, find out in what years have Employee_IDs (‘1003’,’1006’,’1008’) been working with the organization? Use both Employee and basic_pays table.
Select Employee.Employee_id, Group_Concat(Distinct BASIC_PAYS.fiscal_year) AS Worked_Years
From BASIC_PAYS
Left Join Employee
On BASIC_PAYS.Employee_id = Employee.Employee_id
Where Employee.Employee_id In ("1003","1006","1008")
Group By Employee.Employee_id ;