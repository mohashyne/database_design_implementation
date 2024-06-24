
-- First Normal Form (1NF) requires that:

--     Each column in a table contains atomic (indivisible) values.
--     Each column contains values of a single type.
--     Each column must have a unique name.
--     The order in which data is stored does not matter.

-- In the context of the user_profile and phone_number tables, we should ensure that:

--     Each phone number is stored in a separate row rather than as a comma-separated list within a single column.

-- Create the user_profile table
CREATE TABLE IF NOT EXISTS user_profile (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    gender TEXT CHECK(gender IN ('MALE', 'FEMALE')),
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now()
);

-- Create the phone_number table with a foreign key linking to user_profile
CREATE TABLE IF NOT EXISTS phone_number (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    user_profile_id BIGINT NOT NULL REFERENCES user_profile(id),
    phone_number TEXT NOT NULL
);

-- INSERT DATA

-- Insert data into user_profile table
INSERT INTO user_profile (first_name, last_name, email, gender, created_at)
VALUES
    ('John', 'Doe', 'john.doe@example.com', 'MALE', now()),
    ('Jane', 'Smith', 'jane.smith@example.com', 'FEMALE', now());

-- Insert data into phone_number table
INSERT INTO phone_number (user_profile_id, phone_number)
VALUES
    (1, '123-456-7890'),
    (1, '098-765-4321'),
    (2, '555-555-5555');


-- Query the user_profile table
-- Select data to illustrate 1NF
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.gender,
    u.created_at,
    p.phone_number
FROM 
    user_profile u
LEFT JOIN 
    phone_number p ON u.id = p.user_profile_id;


