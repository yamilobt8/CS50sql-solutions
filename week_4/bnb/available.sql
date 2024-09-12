create view available as
select l.id, l.property_type, l.host_name, a.date
from listings l
join availabilities a on a.listing_id = l.id
where available = 'TRUE';


