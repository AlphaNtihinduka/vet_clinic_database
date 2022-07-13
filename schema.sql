/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
id int PRIMARY KEY NOT NULL,
name VARCHAR(30) NOT NULL,
date_of_birth DATE,
escape_attempts INT,
neutered BOOL,
weight_kg DECIMAL);

-- update colums
ALTER TABLE animals 
ADD species varchar(30);

-- unspecified to species column
BEGIN TRANSACTION;
UPDATE animals
SET species='unspecified';

-- Set species to digimon
BEGIN TRANSACTION;
UPDATE animals
SET species='digimon'
WHERE name LIKE '%mon';

-- Set species to pokemon
BEGIN TRANSACTION;
UPDATE animals
SET species='pokemon'
WHERE species ISNULL;
COMMIT TRANSACTION;

-- Deleting all records from animals
BEGIN TRANSACTION;
DELETE FROM animals;

ROLLBACK;

-- Deleting and set SAVEPOINT
BEGIN TRANSACTION;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT savepoint1;

ROLLBACK TO savepoint1;
UPDATE animals SET weight_kg= weight_kg * -1
WHERE weight_kg < 0;
COMMIT TRANSACTION;
