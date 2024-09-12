CREATE TABLE IF NOT EXISTS "listings" (
    "id" INTEGER,
    "property_type" TEXT,
    "host_name" TEXT,
    "accommodates" INTEGER,
    "bedrooms" INTEGER,
    "description" TEXT,
    PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "availabilities" (
    "id" INTEGER,
    "listing_id" INTEGER,
    "date" NUMERIC,
    "available" INTEGER,
    "price" NUMERIC,
    PRIMARY KEY("id"),
    FOREIGN KEY("listing_id") REFERENCES "listings"("id")
);
CREATE TABLE IF NOT EXISTS "reviews" (
    "id" INTEGER,
    "listing_id" INTEGER,
    "date" NUMERIC,
    "reviewer_name" TEXT,
    "comments" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("listing_id") REFERENCES "listings"("id")
);
CREATE VIEW no_descriptions as
select id, property_type, host_name, accommodates, bedrooms
from listings
/* no_descriptions(id,property_type,host_name,accommodates,bedrooms) */;
CREATE VIEW one_bedrooms as
select id, property_type, host_name, accommodates
from listings where bedrooms = 1
/* one_bedrooms(id,property_type,host_name,accommodates) */;
CREATE VIEW frequently_reviewed as
select l.id, l.property_type, l.host_name, count(r.id) as review_count from listings l
join reviews r on r.listing_id = l.id
group by l.id, l.property_type, l.host_name
order by review_count desc, l.property_type asc, l.host_name asc
limit 100
/* frequently_reviewed(id,property_type,host_name,review_count) */;
CREATE VIEW june_vacancies as
select l.id, l.property_type, l.host_name, count(a.date) as vacation_days
from listings l
join availabilities a on a.listing_id = l.id
where date between '2023-06-01' and '2023-06-31'
and available = 'TRUE'
group by a.listing_id
/* june_vacancies(id,property_type,host_name,vacation_days) */;
CREATE VIEW available as
select l.id, l.property_type, l.host_name, a.date
from listings l
join availabilities a on a.listing_id = l.id
where available = 'TRUE'
/* available(id,property_type,host_name,date) */;
