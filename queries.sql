/*basic queries + tansactions*/

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

/*join  tables (one to many)*/

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

/*join tables query (many yo many)*/

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'William Tatcher' 
ORDER BY visits.visit_date DESC LIMIT 1;

SELECT COUNT(animals.name) FROM animals JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name,species.name FROM vets 
LEFT JOIN specializations ON vets.id = specializations.vet_id 
LEFT JOIN species ON species.id = specializations.species_id ORDER BY vets.id;

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Stephanie Mendez' 
AND visits.visit_date >= '2020-4-1' AND visits.visit_date <= '2020-8-30';

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON vets.id = visits.vet_id GROUP BY animals.name ORDER BY COUNT(vets.name) DESC LIMIT 1;

SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Maisy Smith' 
ORDER BY visits.visit_date LIMIT 1;

SELECT animals.*, visits.visit_date, vets.* FROM animals JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON vets.id = visits.vet_id ORDER BY visits.visit_date DESC LIMIT 1;

SELECT vets.name,COUNT(vets.name) AS num_of_visits FROM vets 
LEFT JOIN specializations ON vets.id = specializations.vet_id JOIN visits ON vets.id = visits.vet_id 
WHERE specializations.species_id IS NULL 
GROUP BY vets.name ORDER BY COUNT(vets.name) DESC;

SELECT species.name AS expected_specialty FROM animals JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON vets.id = visits.vet_id JOIN species ON species.id = animals.species_id 
WHERE vets.name = 'Maisy Smith' GROUP BY species.name 
ORDER BY COUNT(DISTINCT animals.name) DESC LIMIT 1;

SELECT COUNT(*) FROM visits where animal_id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits WHERE animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits WHERE vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners WHERE email = 'owner_18327@mail.com';

\d visits;
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits WHERE animal_id = 4;