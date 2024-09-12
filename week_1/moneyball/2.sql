select salary, year from salaries
join players p on p.id = salaries.player_id
where p.first_name = 'Cal' and p.last_name = 'Ripken'
order by year desc;