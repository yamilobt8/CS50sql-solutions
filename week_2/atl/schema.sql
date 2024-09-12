create table Passengers (
    id int,
    first_name text,
    last_name text,
    age int,
    primary key(id)
);

create table CheckIns (
    passenger_id int,
    date_time numeric,
    flight_id int,
    foreign key (passenger_id) references Passengers(id),
    foreign key (flight_id) references Flights(id)
);

create table Airlines(
    name text,
    concourse char(1), check(concourse in ('A', 'B', 'C', 'D', 'E', 'F', 'T'))
);

create table Flights(
    id int,
    flight_number int,
    depart_airport_code text,
    head_airport_code text,
    depart_datetime datetime,
    arrival_datetime datetime,
    primary key(id)
);