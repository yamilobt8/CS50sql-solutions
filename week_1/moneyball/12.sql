with Hits_Cost as (
    select p.id, p.first_name, p.last_name, s.salary / pf.H as Dollars_Per_Hit from players p
    join salaries s on s.player_id =  p.id
    join performances pf on pf.player_id = p.id
    where s.year = 2001
    and pf.year = 2001
    and pf.H > 0
    order by Dollars_Per_Hit
    limit 10
),

RBIs_Cost as (
    select p.id, s.salary / pf.RBI as Dollars_Per_RBI from players p
    join salaries s on s.player_id = p.id
    join performances pf on pf.player_id = s.player_id
    where s.year = 2001 and pf.year = 2001 and pf.RBI > 0
    order by Dollars_Per_RBI
    limit 10
)

select h.first_name, h.last_name from Hits_Cost h
join RBIs_Cost r on h.id = r.id
order by h.id;