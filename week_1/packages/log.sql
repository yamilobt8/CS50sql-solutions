-- *** The Lost Letter ***

select id from packages where from_address_id = (select id from addresses where address = '900 Somerville Avenue')
and to_address_id = (select id from addresses where address like '2 Finn%');
select action, address_id from scans where package_id = 384;
select address, type from addresses where id = 854;


-- *** The Devious Delivery ***

select id, contents from packages  where from_address_id is null;
select action, id, address_id  from scans where package_id = 5098;
select address, type  from addresses where id = 348;

-- *** The Forgotten Gift ***
select id from addresses where address = '728 Maple Place';
select address, type from addresses where address = '728 Maple Place';

