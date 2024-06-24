-- Second Normal Form (2NF) requires that:

--     The table is already in First Normal Form (1NF).
--     All non-key attributes are fully functional dependent on the primary key. In other words, there should be no partial dependency of any column on the primary key.

-- Create the user_profile table
CREATE TABLE IF NOT EXISTS user_profile (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    gender TEXT CHECK(gender IN ('MALE', 'FEMALE')),
    created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT now()
);

-- Create the address table with a foreign key linking to user_profile
CREATE TABLE IF NOT EXISTS address (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    user_profile_id BIGINT NOT NULL REFERENCES user_profile(id),
    address TEXT NOT NULL,
    postcode TEXT NOT NULL
);

-- -- Insert data into user_profile table
INSERT INTO user_profile (first_name, last_name, email, gender, created_at)
VALUES
    ('John', 'Doe', 'john.doe@example.com', 'MALE', now()),
    ('Jane', 'Smith', 'jane.smith@example.com', 'FEMALE', now());

-- Insert data into address table
INSERT INTO address (user_profile_id, address, postcode)
VALUES
    (1, '123 Main St, Springfield', '12345'),
    (1, '456 Elm St, Springfield', '12345'),
    (2, '789 Maple St, Shelbyville', '67890');


-- Query the user_profile table
-- Select data to illustrate 2NF
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.gender,
    u.created_at,
    a.address,
    a.postcode
FROM 
    user_profile u
LEFT JOIN 
    address a ON u.id = a.user_profile_id;
