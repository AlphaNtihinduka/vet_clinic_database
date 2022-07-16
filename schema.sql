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

-- Create table owners
CREATE TABLE owners(
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
full_name varchar(40),
age INT);

-- create table species
CREATE TABLE species(
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name varchar(40));

-- remove column species
ALTER TABLE animals
DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD COLUMN species_id INT,
ADD FOREIGN KEY(species_id) REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD FOREIGN KEY(species_id) REFERENCES owners(id);


CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(40),
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    vets_id INT,
    species_id INT,
    FOREIGN KEY (vets_id) REFERENCES vets(id),
    FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE visits (
    animals_id INT,
    vets_id INT,
    date_of_visit DATE,
    FOREIGN KEY (animals_id) REFERENCES animals(id),
    FOREIGN KEY (vets_id) REFERENCES vets(id)
);