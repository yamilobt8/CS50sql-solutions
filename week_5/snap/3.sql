with sender_id as (
    select id from users where username = 'creativewisdom377'
)

select to_user_id from messages
where from_user_id = (select id from sender_id)
group by to_user_id
order by count(*) desc
limit 3;