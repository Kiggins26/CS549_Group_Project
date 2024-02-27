--1. List the ID and name of all employees.
SELECT id, name FROM Employees;
--2. List the name of all projects together with their type
SELECT name, type FROM Projects; 
--3. List the ID and name of all employees together with the project name and project category that they work on.
SELECT Employees.id, Employees.name, Projects.name, Projects.category FROM Employees INNER JOIN Employees.team_id = Projects.team_id GROUP BY Projects.category, Projects.name;
--4. List the ID and name of all tasks together with the name and ID of the employee who works on this task
SELECT Tasks.task_id, Tasks.name, Employees.name, Employees.id FROM Tasks INNER JOIN Tasks.emp_id = Employees.id;
--5. List the ID and name of all employees together with the office number that they are based in
SELECT id, name, office_address FROM Employees GROUP BY office_address;
