select year, round(avg(salary), 2)  as average_salary from salaries 
group by year
order by year desc;