select d.name, e.per_pupil_expenditure from districts d
join expenditures e on e.district_id = d.id
where d.type = 'Public School District'
order by e.per_pupil_expenditure desc
limit 10;



