select year, HR from performances
join players p on p.id = performances.player_id
where (p.first_name, p.last_name, p.birth_year) = ('Ken', 'Griffey', 1969)
order by year desc;


