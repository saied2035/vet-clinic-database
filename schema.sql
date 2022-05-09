/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
 id INT GENERATED ALWAYS AS IDENTITY,
 name varchar(100) NOT NULL,
 date_of_birth DATE NOT NULL,
 escape_attempts SMALLINT NOT NULL,
 neutered BOOLEAN NOT NULL,
 weight_kg DECIMAL NOT NULL,
 PRIMARY KEY (id)
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(20);

CREATE TABLE owners (
 id INT GENERATED ALWAYS AS IDENTITY,
 full_name varchar(100) NOT NULL,
 age SMALLINT NOT NULL,
 PRIMARY KEY (id)
);

CREATE TABLE species (
 id INT GENERATED ALWAYS AS IDENTITY,
 name varchar(100) NOT NULL,
 PRIMARY KEY (id)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT,
ADD FOREIGN KEY (species_id) REFERENCES species (id)
ON DELETE CASCADE;

ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD FOREIGN KEY (owner_id) REFERENCES owners (id)
ON DELETE DEFAULT;

CREATE TABLE vets (
 id INT GENERATED ALWAYS AS IDENTITY,
 name varchar(100) NOT NULL,
 age SMALLINT,
 date_of_graduation DATE NOT NULL,
 PRIMARY KEY (id)
);

CREATE TABLE specializations (
 vet_id INT REFERENCES vets(id) NOT NULL,
 species_id INT REFERENCES species(id) NOT NULL    
);

CREATE TABLE visits (
 vet_id INT REFERENCES vets(id) NOT NULL,
 animal_id INT REFERENCES animals(id) NOT NULL,
 visit_date DATE NOT NULL    
);

/*performance project*/

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animal_id_asc ON visits (animal_id ASC);

CREATE INDEX vet_id_asc ON visits (vet_id ASC);