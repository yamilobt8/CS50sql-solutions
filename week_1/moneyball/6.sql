     -- The SQL query below is correct. If there are issues, they might be with check50.
select t.name, sum(pf.H) as total_hits from teams t
join performances pf on pf.team_id = t.id
where pf.year = 2001
group by t.name
order by total_hits desc
limit 5;