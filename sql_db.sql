CREATE TABLE Employees (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    department VARCHAR(255) NOT NULL,
    software_based BOOLEAN,
    admin_based BOOLEAN,
    job_type VARCHAR(50),
    team_id INT,
    office_address TEXT, 
    CONSTRAINT CHK_based CHECK (NOT software_based = 1 OR NOT admin_based = 1) 
);

CREATE TABLE Teams (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES Employees(id) 
);

CREATE TABLE Projects(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    category VARCHAR(255),
    team_id INT,
    project_manager INT,
    progress FLOAT CHECK (progress BETWEEN 0.0 AND 1.0)
);

CREATE TABLE Tasks(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    task_id INT NOT NULL,
    progress FLOAT CHECK (progress BETWEEN 0.0 AND 1.0),
    weight INT CHECK (weight BETWEEN 1 AND 5),
    emp_id INT,
    proj_id  INT,
    FOREIGN KEY (emp_id) REFERENCES Employees(id),
    FOREIGN KEY (proj_id) REFERENCES Projects(id) 
);

CREATE TABLE Monthly_Reports(
    report_month_id INT NOT NULL PRIMARY KEY,
    task_id INT NOT NULL,
    emp_id INT,
    proj_id INT,
    FOREIGN KEY (task_id) REFERENCES Tasks(id),
    FOREIGN KEY (emp_id) REFERENCES Employees(id), 
    FOREIGN KEY (proj_id) REFERENCES Projects(id)
);

-- Insert queries for Employees:
INSERT INTO Employees (name, department, software_based, admin_based, job_type, team_id, office_address) VALUES 
('John Doe', 'Engineering', TRUE, FALSE, 'Developer', 1, '123 Main Street'),
('Jane Smith', 'Marketing', FALSE, TRUE, 'Marketing Specialist', 2, '456 Elm Street'),
('Michael Johnson', 'Finance', FALSE, FALSE, 'Accountant', 3, '789 Oak Street'),
('Emily Brown', 'Engineering', TRUE, FALSE, 'Software Engineer', 1, '123 Main Street'),
('Chris Lee', 'HR', FALSE, TRUE, 'HR Manager', 4, '101 Pine Street');

-- Insert queries for Teams:
INSERT INTO Teams (manager_id) VALUES 
(1),
(2),
(3),
(4);

-- Insert queries for Projects:
INSERT INTO Projects (name, type, category, team_id, project_manager, progress) VALUES 
('Project A', 'Development', 'Web', 1, 1, 0.8),
('Project B', 'Research', 'Data Analysis', 2, 2, 0.6),
('Project C', 'Development', 'Mobile', 3, 3, 0.7),
('Project D', 'Marketing', 'Campaign', 4, 4, 0.5);

-- Insert queries for Tasks:
INSERT INTO Tasks (task_id, progress, weight, emp_id, proj_id) VALUES 
(1, 0.9, 3, 1, 1),
(2, 0.7, 2, 2, 2),
(3, 0.8, 4, 3, 3),
(4, 0.6, 1, 4, 4),
(5, 0.5, 5, 5, 1);

-- Insert queries for Monthly_Reports (assuming some values):
INSERT INTO Monthly_Reports (report_month_id, task_id, emp_id, proj_id) VALUES 
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 1);

