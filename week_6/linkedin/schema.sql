CREATE TABLE Users (
    user_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255),
    PRIMARY KEY(user_id)
);

CREATE TABLE schools (
    school_id INT AUTO_INCREMENT,
    school_name VARCHAR(255),
    school_type VARCHAR(255),
    school_location VARCHAR(255),
    foundation_year INT,
    PRIMARY KEY(school_id)
);

CREATE TABLE Companies (
    company_id INT AUTO_INCREMENT,
    company_name VARCHAR(255),
    company_industry VARCHAR(255),
    company_location VARCHAR(255),
    PRIMARY KEY(company_id)
);

CREATE TABLE users_connections (
    user1_id INT,
    user2_id INT,
    FOREIGN KEY (user1_id) REFERENCES Users(user_id),
    FOREIGN KEY (user2_id) REFERENCES Users(user_id)
);

CREATE TABLE schools_connections (
    user_id INT,
    school_id INT,
    start_date INT,
    end_date INT,
    degree_type VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (school_id) REFERENCES schools(school_id)
);

CREATE TABLE companies_connections (
    user_id INT,
    company_id INT,
    start_date INT,
    end_date INT,
    title VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);
