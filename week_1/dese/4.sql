select city, count(type) as 'public_school_count' from schools
where type = 'Public School'
group by city
order by public_school_count desc, city
limit 10;