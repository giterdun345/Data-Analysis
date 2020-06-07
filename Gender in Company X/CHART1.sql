SELECT
	YEAR(d.from_date) as calendar_year, 
	e.gender, 
	COUNT(e.emp_no) as num_of_employees
FROM 
	t_employees e
JOIN
	t_dept_emp d ON d.emp_no = e. emp_no
WHERE YEAR(d.from_date) > 1990
GROUP BY calendar_year, e.gender
