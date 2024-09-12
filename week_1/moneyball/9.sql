select t.name, round(avg(s.salary), 2) as average_salary from teams t
join salaries s on s.team_id = t.id
where s.year = 2001
group by t.name
order by average_salary asc
limit 5;
