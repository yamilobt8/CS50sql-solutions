create table ingredients (
    id int,
    name text,
    unit text,
    price int,
    primary key(id)
);

create table donuts (
    id int,
    name text,
    gluten_free boolean,
    price int,
    primary key(id)
);

create table donuts_ingredients (
    donut_id int,
    ingredients_id int,
    foreign key (donut_id) references donuts(id),
    foreign key (ingredients_id) references ingredients(id)
);


create table orders (
    order_number int,
    customer_id int,
    donut_id int,
    foreign key (donut_id) references donuts(id),
    foreign key (customer_id) references customers(id),
    primary key(order_number)
);

create table customers (
    id int,
    first_name text,
    last_name text,
    primary key(id)
);

create table orders_history(
    customer_id int,
    order_id int,
    foreign key(customer_id) references customers(id),
    foreign key(order_id) references orders(order_number)
);

