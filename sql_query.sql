-- Queries

-- 1. List the ID and name of all employees.
select id, name from Employees;

-- 2. List the name of all projects together with their type.
select distinct(Name), type from Projects;

-- 3. List the ID and name of all employees together with the project name and project category that they work on.
select Employees.id, Employees.name, Projects.Name, Projects.Category from Employees, Projects where Employees.team_id = Projects.team_id;

-- 4. List the ID and name of all tasks together with the name and ID of the employee who works on this task.
select Tasks.Code, Tasks.Name, Employees.id, Employees.Name from Tasks, Employees where Tasks.emp_id = Employees.id;

-- 5. List the ID and name of all employees together with the office number that they are based in.
select id, name, office_location from Employees;

