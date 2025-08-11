USE aula8_procedure_trigger;

CREATE TABLE employee (
	id INT PRIMARY KEY,
    first_name VARCHAR(65),
    birth_date DATE,
    address VARCHAR(65),
    salary FLOAT
);

CREATE TABLE salary_audit (
	id_alter INT AUTO_INCREMENT PRIMARY KEY,
    id_employee INT,
    salary_current FLOAT,
    salary_altered FLOAT,
    date_alter DATE,
    id_manager VARCHAR(65)
);

DELIMITER $$
DROP TRIGGER IF EXISTS log_salary;
CREATE TRIGGER log_salary AFTER UPDATE ON employee
BEGIN
	INSERT INTO employee (id_employee, salary_current, salary_altered, date_alter, id_manager) VALUES (NEW.id_employee, OLD.salary, NEW.salary, CURDATE(), NEW.id_manager);
END $$
DELIMITER ;