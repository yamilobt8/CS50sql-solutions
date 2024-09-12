select s.salary from salaries s
join players p on p.id = s.player_id
join  performances pf on pf.player_id = p.id
where s.year = 2001
and pf.HR = (
    select max(HR) from performances
    where year = 2001
);