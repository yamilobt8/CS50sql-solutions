select p.first_name, p.last_name, s.salary / pf.H as Dollars_Per_Hit from players p
join salaries s on s.player_id = p.id
join performances pf on pf.player_id = s.player_id
where s.year = 2001 and pf.year = 2001 and pf.H > 0
order by Dollars_Per_Hit, p.first_name, p.last_name
limit 10;

