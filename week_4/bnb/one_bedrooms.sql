create view one_bedrooms as
select id, property_type, host_name, accommodates
from listings where bedrooms = 1;