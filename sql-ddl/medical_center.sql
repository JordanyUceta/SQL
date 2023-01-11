-- from the terminal run: 
-- psql < medical_center.sql


DROP DATABASE IF EXISTS medical_center; 

CREATE DATABASE medical_center; 

\c medical_center

CREATE TABLE doctors 
(
    id SERIAL PRIMARY KEY, 
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL, 
    phone_number INTEGER, 
    specialty TEXT NOT NULL 
); 

CREATE TABLE patients 
(
    id SERIAL PRIMARY KEY, 
    patient_first_name TEXT NOT NULL, 
    patien_last_name TEXT NOT NULL, 
    birth_date INTEGER NOT NULL, 
    insurance TEXT
); 

CREATE TABLE diseases 
(
    id SERIAL PRIMARY KEY, 
    disease_name TEXT NOT NULL, 
    rariry TEXT, 
    danger_levet TEXT NOT NULL
); 

CREATE TABLE medical_center 
(
    id SERIAL PRIMARY KEY, 
    doctors_id INTEGER REFERENCES doctors ON DELETE CASCADE, 
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE, 
    diseases_id INTEGER REFERENCES diseases ON DELETE CASCADE,
    description TEXT
);

