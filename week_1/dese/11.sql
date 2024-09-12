select s.name, e.per_pupil_expenditure, g.graduated from schools s
join expenditures e on e.district_id = s.district_id
join graduation_rates g on g.school_id = s.id
order by per_pupil_expenditure desc, s.name;