select name from schools
where district_id
in (select id from districts where name = 'Cambridge');