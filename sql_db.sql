CREATE TABLE Employees (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    department VARCHAR(255) NOT NULL,
    software_based BOOLEAN,
    admin_based BOOLEAN,
    job_type VARCHAR(50), -- Changed from ENUM to VARCHAR
    team_id INT, -- Removed UNIQUE constraint
    office_address TEXT, -- Changed to TEXT for potentially longer addresses
    CONSTRAINT CHK_based CHECK (software_based != 0 AND admin_based != 0) -- Changed from False to 0
);

CREATE TABLE Teams (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Changed to PRIMARY KEY
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES Employees(id) -- Added foreign key constraint
);

CREATE TABLE Projects(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Changed to PRIMARY KEY
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    category VARCHAR(255),
    team_id INT, -- Removed UNIQUE constraint
    project_manager INT, -- Removed UNIQUE constraint
    progress FLOAT CHECK (progress BETWEEN 0.0 AND 1.0)
);

CREATE TABLE Tasks(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Changed to PRIMARY KEY
    task_id INT NOT NULL,
    progress FLOAT CHECK (progress BETWEEN 0.0 AND 1.0),
    weight INT CHECK (weight BETWEEN 1 AND 5),
    emp_id INT NOT NULL,
    proj_id  INT,
    FOREIGN KEY (emp_id) REFERENCES Employees(id), -- Added foreign key constraint
    FOREIGN KEY (proj_id) REFERENCES Projects(id) -- Added foreign key constraint
);

CREATE TABLE Monthly_Reports(
    report_month_id INT NOT NULL PRIMARY KEY, -- Changed to PRIMARY KEY
    task_id INT NOT NULL,
    emp_id INT,
    proj_id INT,
    FOREIGN KEY (task_id) REFERENCES Tasks(id), -- Added foreign key constraint
    FOREIGN KEY (emp_id) REFERENCES Employees(id), -- Added foreign key constraint
    FOREIGN KEY (proj_id) REFERENCES Projects(id) -- Added foreign key constraint
);
