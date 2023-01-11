-- from the terminal run: 
-- psql < craiglist.sql

DROP DATABASE IF EXISTS craiglist; 

CREATE DATABASE craiglist; 

\c craiglist 

CREATE TABLE region 
(
    id SERIAL PRIMARY KEY, 
    region TEXT NOT NULL, 
    time_zone TEXT
); 


CREATE TABLE users 
(
    id SERIAL PRIMARY KEY, 
    username VARCHAR(15), 
    region_id INTEGER REFERENCES region ON DELETE CASCADE, 
    when_created INTEGER NOT NULL
); 


CREATE TABLE categories 
(
    id SERIAL PRIMARY KEY, 
    category TEXT NOT NULL
); 


CREATE TABLE posts
(
    id SERIAL PRIMARY KEY, 
    title TEXT NOT NULL, 
    description TEXT, 
    categories_id INTEGER REFERENCES categories ON DELETE CASCADE, 
    users_id INTEGER REFERENCES users ON DELETE CASCADE, 
    location TEXT NOT NULL, 
    region_id INTEGER REFERENCES region ON DELETE CASCADE
);

