select d.name, e.per_pupil_expenditure, s.exemplary from districts d
join expenditures e on e.district_id = d.id
join staff_evaluations s on s.district_id = d.id
where name in (
    select name from districts
    where id in (
        select distinct(district_id) from schools
        where type = 'Public School'
    )
)
and per_pupil_expenditure > (
    select avg(per_pupil_expenditure) from expenditures
)
and exemplary > (
    select avg(exemplary) from staff_evaluations
)
order by exemplary desc, per_pupil_expenditure desc;