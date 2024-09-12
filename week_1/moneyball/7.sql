select p.first_name, p.last_name from players p
join salaries s on s.player_id = p.id
order by s.salary desc
limit 1;