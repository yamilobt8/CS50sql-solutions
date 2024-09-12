create view total as
select
    sum(families) as families,
    sum(households) as households,
    sum(population)  as population,
    sum(male) as male,
    sum(female) as female
from census;

