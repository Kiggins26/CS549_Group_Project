-- Employees 
create table Employees(
    emp_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name varchar(255) NOT NULL,
    department varchar(255) NOT NULL,
    software_based boolean,
    admin_based boolean,
    job_role varchar(255),
    team_id INT,
    office_location varchar(255),
    CONSTRAINT CHK_based CHECK (software_based OR admin_based) 
);


-- Teams
create table Teams(
    team_id INT NOT NULL PRIMARY KEY,
    team_manager INT
);


-- Insert values in Employees Table

insert into Employees values(1, "John Doe", "Engineering", 1, 0, "Software Developer", 111, "London"),
(2, "Jane Smith", "Marketing", 0, 1, "Marketing Specialist", 222 , "Glasgow"),
(3, "Michael Johnson", "Finance", 0, 1, "Accountant", 333, "Manchester"),
(4, "Emily Brown", "HR", 0, 1, "HR Manager ", 333, "Edinburgh"),
(5, "Chris Lee", "Engineering", 1, 1, "Software Developer", 111, "Edinburgh");

-- Insert values in Teams table

insert into Teams values(111, 1),
(222, 2),
(333, 4);

-- Adding foreign key constraints in Employee and Teams table

ALTER TABLE Employees ADD FOREIGN KEY (team_id) REFERENCES Teams(team_id);
ALTER TABLE Teams ADD FOREIGN KEY (team_manager) REFERENCES Employees(emp_id);

-- Projects  
create table Projects(
    project_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(255) NOT NULL,
    type varchar(255) NOT NULL,
    category varchar(255) NOT NULL,
    team_id INT,
    project_manager INT,
    progress FLOAT CHECK (progress BETWEEN 0.0 AND 1.0),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

-- Tasks
create table Tasks(
    Code INT NOT NULL,
    name varchar(255),
    weight INT CHECK (weight Between 1 and 5),
    project_id INT NOT NULL,
    emp_id INT NOT NULL,
    PRIMARY KEY (Code, project_id, emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

-- Progress

create table Monthly_Progress(
    month_id INT NOT NULL,
    emp_id INT NOT NULL,
    project_id INT NOT NULL,
    task_code INT NOT NULL,
    completion_percent INT CHECK (completion_percent BETWEEN 0 AND 100),
    PRIMARY KEY (project_id, task_code),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (task_code) REFERENCES Tasks(Code)
);


-- Insert values in Projects 

insert into Projects values(1, "InnovateX", "Web App", "Enterprise Software", 111, 1, .7),
(2, "Salesforce CRM", "Desktop App", "Enterprise Software", 111, 1, .06),
(3, "ESS Portal", "Desktop App", "Payrol Software", 333, 1, .5);


-- Insert values in Tasks

insert into Tasks values(101, "Frontend Design", 4, 1, 1), 
(101,"Frontend Design",4 ,2, 1),
(102, "Frontend Testing", 3, 1, 5); 


-- Insert values in Monthly_Progress

insert into Monthly_Progress values(1, 2, 1, 101, 100),
(2, 1, 3, 101, 50),
(3, 5, 1, 102, 10);






