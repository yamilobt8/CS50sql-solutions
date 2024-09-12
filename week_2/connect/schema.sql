create table Users(
    user_id int,
    first_name text,
    last_name text,
    username text not null unique,
    password text,
    primary key(user_id)
);

create table schools(
    school_id int,
    school_name text,
    school_type text,
    school_location text,
    foundation_year int,
    primary key(school_id)
);

create table Companies(
    company_id int,
    company_name text,
    company_industry text,
    company_location text,
    primary key(company_id)
);

create table users_connections (
    user1_id int,
    user2_id int,
    foreign key (user1_id) references Users(user_id),
    foreign key (user2_id) references Users(user_id)
);

create table schools_connections (
    user_id int,
    school_id int,
    start_date int,
    end_date int,
    degree_type text,
    foreign key (user_id) references Users(user_id),
    foreign key (school_id) references schools(school_id)
);

create table companies_connections (
    user_id int,
    company_id int,
    start_date int,
    end_date int,
    title text,
    foreign key (user_id) references Users(user_id),
    foreign key (company_id) references companies(company_id)
);