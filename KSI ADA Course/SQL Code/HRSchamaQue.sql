
USE HRSchema;
-- 1. Only retrieve employees who have job history records.
SELECT 
	first_name,
	last_name,
	start_date,
	end_date
FROM employees e
RIGHT JOIN job_history h
ON e.employee_id = h.employee_id

-- 2. Retrieve all employees, even if they don’t have any job history.
SELECT 
	first_name,
	last_name,
	start_date,
	end_date
FROM employees e
LEFT JOIN job_history h
ON e.employee_id = h.employee_id

-- 3. Employees who have left the company.

--Fatch the department wise total salary

SELECT 
    d.department_id,
    department_name,
    SUM(salary) AS Total_Salary
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, department_name;



