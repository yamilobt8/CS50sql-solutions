create view june_vacancies as
select l.id, l.property_type, l.host_name, count(a.date) as vacation_days
from listings l
join availabilities a on a.listing_id = l.id
where date between '2023-06-01' and '2023-06-31'
and available = 'TRUE'
group by a.listing_id;