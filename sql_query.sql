-- Queries

-- 1. List the ID and name of all employees.
select emp_id, name from Employees;

-- 2. List the name of all projects together with their type.
select distinct(Name), type from Projects;

-- 3. List the ID and name of all employees together with the project name and project category that they work on.
select Employees.emp_id, Employees.name, Projects.Name, Projects.Category from Employees, Projects where Employees.team_id = Projects.team_id;

-- 4. List the ID and name of all tasks together with the name and ID of the employee who works on this task.
select Tasks.Code, Tasks.Name, Employees.emp_id, Employees.Name from Tasks, Employees where Tasks.emp_id = Employees.emp_id;

-- 5. List the ID and name of all employees together with the office number that they are based in.
select id, name, office_location from Employees;

