create view most_populated as
select
    district,
    families,
    households,
    population,
    male,
    female
from census
order by population desc;

