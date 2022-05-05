SELECT * FROM animals WHERE name LIKE '%mon%';

SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-1-1' AND '2019-12-31';

SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT * FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE NOT name  = 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) AS avrage FROM animals;

SELECT neutered, COUNT(escape_attempts) AS count FROM animals WHERE escape_attempts > 0 GROUP BY neutered;

SELECT species,MIN(weight_kg),MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-1-1' 
AND date_of_birth <= '2000-12-31' GROUP BY species;

BEGIN;

UPDATE animals
SET species = 'unspecified';

ROLLBACK;

BEGIN;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

COMMIT;

BEGIN;

DELETE FROM animals;

ROLLBACK;

BEGIN;

DELETE FROM animals
WHERE date_of_birth >= '2022-1-1';

SAVEPOINT delete_pet;

UPDATE animals
SET weight_kg = weight_kg * -1;

ROLLBACK TO delete_pet;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

COMMIT;

SELECT name FROM owners JOIN animals ON owners.id= animals.owner_id WHERE full_name='Melody Pond';

SELECT animals.name FROM species JOIN animals ON  species.id = animals.species_id WHERE species.name = 'Pokemon';

SELECT full_name,name FROM owners LEFT JOIN animals ON owners.id= animals.owner_id;

SELECT species.name, COUNT(animals.name) FROM species 
JOIN animals ON  species.id = animals.species_id GROUP BY species.name;

SELECT animals.name FROM owners JOIN animals ON owners.id= animals.owner_id 
JOIN species ON species.id = animals.species_id WHERE full_name='Jennifer Orwell' AND species.name = 'Digimon';

SELECT name FROM owners JOIN animals ON owners.id= animals.owner_id WHERE full_name='Dean Winchester'
AND animals.escape_attempts = 0;

SELECT full_name FROM owners 
JOIN animals ON  owners.id = animals.owner_id GROUP BY full_name ORDER BY COUNT(name) DESC LIMIT 1;