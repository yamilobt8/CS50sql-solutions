select u.username from users u
join messages m on m.to_user_id = u.id
group by u.id, u.username
order by count(*) desc
limit 1;