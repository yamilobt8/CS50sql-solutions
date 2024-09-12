select p.first_name, p.last_name, s.salary, s.year, pf.HR, pf.year from players p
join salaries s on s.player_id = p.id
join performances pf on pf.player_id = p.id
where pf.year = s.year
order by p.id, s.year desc, pf.HR desc,s.salary desc;
