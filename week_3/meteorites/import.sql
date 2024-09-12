-- creating the table
create table meteorites_temp (
    name text,
    id int,
    name_type text,
    class text,
    mass real,
    discovery text,
    year real,
    lat real,
    long real,
    primary key(id)
);

-- importing the csv file to the database
.import --csv --skip 1 meteorites.csv meteorites_temp

-- ensure no empty values
update meteorites_temp
set
    year = NULLIF(year, ''),
    mass = NULLIF(mass, ''),
    lat = NULLIF(lat, ''),
    long = NULLIF(long, '');

-- rounding decimal values
update meteorites_temp
set
    mass = round(mass, 2),
    lat = round(lat, 2),
    long = round(long, 2);

create table meteorites (
    name text,
    id int,
    class text,
    mass real,
    discovery text,
    year real,
    lat real,
    long real,
    primary key(id)
);

-- transfering meteorites_temp data to meteorites table
insert into meteorites (name, class, mass, discovery, year, lat, long)
select name, class, mass, discovery, year, lat, long
from meteorites_temp where name_type not like '%relict%'
order by year, name;



