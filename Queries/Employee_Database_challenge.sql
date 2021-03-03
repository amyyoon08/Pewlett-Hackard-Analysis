---------------------------------------------
-- Deliverable 1

select emp_no, first_name, last_name
from employees

select title, from_date, to_date 
from titles

select e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY (e.emp_no);
 
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

select count(emp_no), title
into retiring_titles
from unique_titles
group by title 
order by count(title) DESC;

--------------------------------------------------------
-- Deliverable 2
select DISTINCT on (e.emp_no) e.emp_no,
e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, ti.title
into mentorship_eligibility
from employees as e
inner join dept_emp as de
on (e.emp_no = de.emp_no)
inner join titles as ti
on (e.emp_no = ti.emp_no)
where (e.birth_date between '1965-01-01' and '1965-12-31')
and (de.to_date = '9999-01-01')
order by e.emp_no;


