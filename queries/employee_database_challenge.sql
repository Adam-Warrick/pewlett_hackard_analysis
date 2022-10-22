
--Challenge Code
SELECT e.emp_no,
	e.first_name, 
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees AS e
	LEFT JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Unique Titles
SELECT DISTINCT ON (emp_no)
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

-- Retrieve number of employees by most recent job title who are about to retire
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY title
ORDER BY count DESC;

-- Create a mentorship eligibility table that holds employees eligible to participate in a mentorship program.
SELECT DISTINCT ON (emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (t.to_date = '9999-01-01')
ORDER BY emp_no; 

SELECT DISTINCT ON (emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO Employees_outside_mentorship
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1920-01-01' AND '1964-12-31')
	AND (t.to_date = '9999-01-01')
ORDER BY emp_no; 