create view by_district as
select
    district,
    sum(families) as families,
    sum(households) as households,
    sum(population)  as population,
    sum(male) as male,
    sum(female) as female
from census
group by district;


