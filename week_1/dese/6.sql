select name from schools
where id
in (select school_id from graduation_rates where graduated = 100);