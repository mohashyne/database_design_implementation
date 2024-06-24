
-- MUST satisfy 2NF   and No Transitive Dependency

CREATE DATABASE games;

\c games;


CREATE TABLE IF NOT EXISTS tournament (
                                          id BIGSERIAL NOT NULL PRIMARY KEY,
                                          tournament_name TEXT NOT NULL,
                                          year INT NOT NULL,
                                          winner TEXT NOT NULL
);

-- Create the winner_details table
CREATE TABLE IF NOT EXISTS winner_details (
                                              id BIGSERIAL NOT NULL PRIMARY KEY,
                                              winner TEXT NOT NULL UNIQUE,
                                              date_of_birth DATE NOT NULL
);

-- Insert data into the winner_details table
INSERT INTO winner_details (winner, date_of_birth)
VALUES
    ('John Doe', '1980-01-15'),
    ('Jane Smith', '1985-05-20'),
    ('Alice Johnson', '1990-10-30');

-- Insert data into the tournament table
INSERT INTO tournament (tournament_name, year, winner)
VALUES
    ('Championship 2021', 2021, 'John Doe'),
    ('Championship 2022', 2022, 'Jane Smith'),
    ('Championship 2023', 2023, 'Alice Johnson');

-- Select data to illustrate 3NF
SELECT
    t.tournament_name,
    t.year,
    t.winner,
    w.date_of_birth
FROM
    tournament t
        JOIN
    winner_details w ON t.winner = w.winner;


