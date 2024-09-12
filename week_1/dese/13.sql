select d.name, e.per_pupil_expenditure, e.id from districts d
join expenditures e on e.district_id = d.id
limit 5;