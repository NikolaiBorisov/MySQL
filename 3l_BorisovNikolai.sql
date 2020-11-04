#1
SELECT 
    co.title AS country_title,
    r.title AS region_title,
    ci.title AS city_title
FROM
    _cities ci
        JOIN
    _countries co ON ci.country_id = co.id
        LEFT JOIN
    _regions r ON ci.region_id = r.id;
#2
SELECT 
    ci.title AS city_title
FROM
    _cities ci
        JOIN
    _regions r ON ci.region_id = r.id
WHERE
    r.title = "Московская область";
#3
SELECT 
    departments.dept_no AS department,
    AVG(salaries.salary) AS average_salary
FROM
    departments
        JOIN
    dept_emp ON departments.dept_no = dept_emp.dept_no
        JOIN
    salaries ON salaries.emp_no = dept_emp.emp_no
WHERE
    salaries.to_date = '9999-01-01'
    AND dept_emp.to_date = '9999-01-01'
GROUP BY departments.dept_no;
#4
SELECT 
    employees.last_name,
    employees.birth_date,
    MAX(salary) AS max_salary
FROM
    employees
        JOIN
    salaries ON employees.emp_no = salaries.emp_no
GROUP BY employees.emp_no;

#5
DELETE FROM employees 
WHERE
    employees.emp_no = (SELECT 
        emp_no
    FROM
        salaries
    
    WHERE
        to_date = '9999-01-01'
    ORDER BY salary DESC
    LIMIT 1);
    
#6
SELECT 
departments.dept_no AS dep_number,
count(*) AS emp_quantity 
FROM
    departments
    JOIN dept_emp
    USING(dept_no)
    WHERE
    curdate() BETWEEN dept_emp.from_date AND dept_emp.to_date
GROUP BY departments.dept_no
ORDER BY departments.dept_no;

#7
SELECT 
    departments.dept_no AS dep_number,
    COUNT(*) AS emp_quantity,
    SUM(salaries.salary) AS total_salary
FROM
    departments
        JOIN
    dept_emp USING (dept_no)
        JOIN
    salaries USING (emp_no)
WHERE
    CURDATE() BETWEEN dept_emp.from_date AND dept_emp.to_date
        AND CURDATE() BETWEEN salaries.from_date AND salaries.to_date
GROUP BY departments.dept_no
ORDER BY departments.dept_no;
        