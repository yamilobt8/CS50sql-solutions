create table users (
    id integer primary key autoincrement,
    first_name text not null,
    last_name text not null,
    birth_date date not null,
    address text not null,
    phone_number text unique not null,
    email text unique not null,
    password text not null,
    join_date date not null
);

create table accounts (
    id integer primary key autoincrement,
    user_id int,
    type text not null,
    balance real,
    date_opened date not null,
    foreign key (user_id) references users(id)
);

create table transactions(
    id integer primary key autoincrement,
    from_account_id integer,
    to_account_id int,
    type text not null,
    amount real,
    transfer_date date not null,
    foreign key (from_account_id) references accounts(id),
    foreign key (to_account_id) references accounts(id)
);

create table cards (
    id integer primary key autoincrement,
    user_id int,
    account_id int,
    number text not null,
    type text not null,
    expiration_date text not null,
    card_limit real,
    foreign key (user_id) references users(id),
    foreign key (account_id) references accounts(id)
);

create table users_logs (
    id integer primary key autoincrement,
    user_id int,
    old_password text,
    new_password text not null,
    ip_address text,
    log_date date not null,
    foreign key (user_id) references users(id)
);

create trigger password_update
after update OF password on users
for EACH ROW
begin
    insert into users_logs (user_id, old_password, new_password, ip_address, log_date)
    values (OLD.id, OLD.password, NEW.password, 'unknown', DATE('now'));
end;

create view important_informations as
select u.first_name, u.last_name, a.balance, t.type, t.amount, t.transfer_date
from users u
join accounts a on a.user_id = u.id
join transactions t on t.from_account_id = u.id;

create view users_transfers as
select
    u1.first_name AS from_first_name,
    u1.last_name AS from_last_name,
    u2.first_name AS to_first_name,
    u2.last_name AS to_last_name,
    t.amount,
    t.transfer_date
FROM transactions t
JOIN accounts a1 ON t.from_account_id = a1.id
JOIN accounts a2 ON t.to_account_id = a2.id
JOIN users u1 ON a1.user_id = u1.id
JOIN users u2 ON a2.user_id = u2.id;

