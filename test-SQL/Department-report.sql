PRAGMA foreign_keys = ON;

CREATE TABLE departments (
  id INTEGER PRIMARY KEY NOT NULL,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
  id INTEGER PRIMARY KEY NOT NULL,
  departmentId INTEGER NOT NULL,
  name VARCHAR(50) NOT NULL,
  FOREIGN KEY (departmentId) REFERENCES departments(id)
);

CREATE TABLE departmentReports (
  departmentName VARCHAR(50) NOT NULL,
  employeeCount INTEGER NOT NULL
);

INSERT INTO departments(id, name) VALUES(1, 'Sales');
INSERT INTO departments(id, name) VALUES(2, 'Customer Support');

INSERT INTO employees(id, departmentId, name) VALUES(1, 1, 'Mike Brewer');
INSERT INTO employees(id, departmentId, name) VALUES(2, 1, 'Edd China');
INSERT INTO employees(id, departmentId, name) VALUES(3, 2, 'Randy Marsh');


INSERT INTO departmentReports(departmentName, employeeCount)
SELECT departments.name as departmentName, COUNT(employees.id) AS employeeCount 
FROM departments LEFT JOIN employees 
ON employees.departmentId = departments.id
GROUP By departmentName;

SELECT * FROM departmentReports