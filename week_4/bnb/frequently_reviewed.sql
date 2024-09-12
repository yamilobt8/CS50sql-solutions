create view frequently_reviewed as
select l.id, l.property_type, l.host_name, count(r.id) as review_count from listings l
join reviews r on r.listing_id = l.id
group by l.id, l.property_type, l.host_name
order by review_count desc, l.property_type asc, l.host_name asc
limit 100 ;