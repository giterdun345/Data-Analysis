DROP PROCEDURE IF EXISTS avg_salary_pr;
DELIMITER //
CREATE PROCEDURE avg_salary_pr(
 min_value_range FLOAT,
 max_value_range FLOAT
 )
BEGIN
SELECT 
e.gender, ROUND(AVG(s.salary),2) as avg_salary, d.dept_name
FROM
    t_salaries s
        JOIN
    t_dept_emp de ON de.emp_no = s.emp_no
        JOIN
    t_employees e ON e.emp_no = de.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
WHERE salary >= min_value_range AND salary <= max_value_range
GROUP BY dept_name, gender;
END// 
DELIMITER ; 

call avg_salary_pr(50000, 90000)