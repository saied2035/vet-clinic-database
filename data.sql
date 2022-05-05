/* Animals table*/

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Agumon','2020-2-3',0,true,10.23);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Gabumon','2018-11-15',2,true,8);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Pikachu','2021-1-7',1,false,15.04);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Devimon','2017-5-12',5,true,11);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Charmander','2020-2-8',0,false,-11);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Plantmon','2021-11-15',2,true,-5.7);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Squirtle','1993-4-2',3,false,-12.13);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Angemon','2005-6-12',1,true,-45);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Boarmon','2005-6-7',7,true,20.4);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Blossom','1998-10-13',3,true,17);

INSERT INTO animals(name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES ('Ditto','2022-5-14',4,true,22);

/*owners table*/

INSERT INTO owners(full_name,age)
VALUES ('Sam Smith',34);

INSERT INTO owners(full_name,age)
VALUES ('Jennifer Orwell',19 );

INSERT INTO owners(full_name,age)
VALUES ('Bob',45 );

INSERT INTO owners(full_name,age)
VALUES ('Melody Pond',77 );

INSERT INTO owners(full_name,age)
VALUES ('Dean Winchester',14 );

INSERT INTO owners(full_name,age)
VALUES ('Jodie Whittaker',38 );

UPDATE animals
SET owner_id = 1
WHERE name ='Agumon';

UPDATE animals
SET owner_id = 2
WHERE name IN ('Gabumon','Pikachu');

UPDATE animals
SET owner_id = 3
WHERE name IN ('Devimon','Plantmon');

UPDATE animals
SET owner_id = 4
WHERE name IN ('Charmander','Squirtle','Blossom');

UPDATE animals
SET owner_id = 5
WHERE name IN ('Angemon','Boarmon');

/*species table*/

INSERT INTO species(name)
VALUES ('Pokemon');

INSERT INTO species(name)
VALUES ('Digimon');

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;

/*vets table*/

INSERT INTO vets(name,age,date_of_graduation)
VALUES ('William Tatcher',45,'2000-4-23');

INSERT INTO vets(name,age,date_of_graduation)
VALUES ('Maisy Smith',26,'2019-1-17');

INSERT INTO vets(name,age,date_of_graduation)
VALUES ('Stephanie Mendez',64,'1981-5-4');

INSERT INTO vets(name,age,date_of_graduation)
VALUES ('Jack Harkness',38,'2008-6-8');

/*specializations table*/

INSERT INTO specializations(vet_id,species_id)
VALUES (1,1);

INSERT INTO specializations(vet_id,species_id)
VALUES (3,1);

INSERT INTO specializations(vet_id,species_id)
VALUES (3,2);

INSERT INTO specializations(vet_id,species_id)
VALUES (4,2);