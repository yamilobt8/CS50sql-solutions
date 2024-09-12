with lovelytrust487_friends as (
    select friend_id from friends where user_id in (
        select id from users where username = 'lovelytrust487'
    )
),
exceptionalinspiration482_friends as (
    select friend_id from friends where user_id in (
        select id from users where username = 'exceptionalinspiration482'
    )
)

select friend_id from lovelytrust487_friends
intersect
select friend_id from exceptionalinspiration482_friends;