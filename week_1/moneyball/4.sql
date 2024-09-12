select p.first_name, p.last_name, s.salary from players p
join salaries s on s.player_id = p.id
where s.year = 2001
order by s.salary, p.first_name, p.last_name, p.id
limit 50;