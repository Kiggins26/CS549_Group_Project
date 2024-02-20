CREATE TABLE Employees (
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    name VARCHAR(255) NOT NULL,
    department VARCHAR(255) NOT NULL,
    software_based BOOLEAN,
    manager BOOLEAN,
    job_type ENUM('Front-end Engineer', 'Backend Engineer', 'DevOps Engineer', 'Marketing'),
    team_id INT UNIQUE,
    office_address VARCHAR(255)
);

CREATE TABLE Teams (
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    manager_id INT
);

CREATE TABLE Project(
    id INT NOT NULL AUTO_INCREMENT UNIQUE,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    category VARCHAR(255),
    team_id INT UNIQUE,
    project_manager INT UNIQUE,
    progress FLOAT CHECK (progress BETWEEN 0.0 AND 1.0)
);

CREATE TABLE Task(
    id INT NOT NULL,
    progress FLOAT,
    emp_id INT NOT NULL,
    proj_od  INT,
    progress FLOAT CHECK (progress BETWEEN 0.0 AND 1.0),
    weight INT CHECK (weight BETWEEN 1 AND 5)
);

CREATE TABLE Monthly_Report(
    report_month_id INT NOT NULL UNIQUE,
    task_id INT NOT NULL,
    emp_id INT,
    proj_id INT
);

