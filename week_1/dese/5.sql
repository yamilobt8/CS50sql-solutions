select city, count(type) as 'public_school_count' from schools
where type = 'Public School'
group by city
having public_school_count <= 3
order by public_school_count desc, city;