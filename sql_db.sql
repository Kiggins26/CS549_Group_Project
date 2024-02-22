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
    emp_id INT NOT NULL,
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
