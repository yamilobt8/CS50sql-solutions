select distinct t.name from players p
join performances pf on p.id = pf.player_id
join teams t on pf.team_id = t.id
where p.first_name = 'Satchel' and p.last_name = 'Paige';