CREATE TABLE plant(
plant_id INTEGER PRIMARY KEY AUTO_INCREMENT,
plant_name VARCHAR(40),
zone INTEGER,
season VARCHAR(40)
)

select * FROM plant;

CREATE TABLE seeds(
seed_id INTEGER PRIMARY KEY AUTO_INCREMENT,
expiration_date DATE,
quantity INTEGER ,
reorder BOOL ,
plant_id INTEGER,
FOREIGN KEY(plant_id) REFERENCES plant(plant_id)
)

SELECT * FROM seeds;

CREATE TABLE garden_bed(
space_number INTEGER PRIMARY KEY AUTO_INCREMENT,
date_planted DATE,
doing_well BOOL,
plant_id INTEGER,
FOREIGN KEY(plant_id) REFERENCES plant(plant_id)
)

SELECT * FROM garden_bed;

## INNER JOIN 16.4.3.1

SELECT plant_name,plant.plant_id,seed_id,space_number,date_planted 
FROM seeds
INNER JOIN garden_bed ON seeds.plant_id=garden_bed.plant_id
INNER JOIN plant ON seeds.plant_id=plant.plant_id; 


SELECT plant_name,plant.plant_id,seed_id,space_number,date_planted 
FROM seeds
left JOIN garden_bed ON seeds.plant_id=garden_bed.plant_id
left JOIN plant ON seeds.plant_id=plant.plant_id; 

SELECT plant_name,plant.plant_id,seed_id,space_number,date_planted 
FROM garden_bed
RIGHT JOIN seeds ON garden_bed.plant_id=seeds.plant_id
RIGHT JOIN plant ON garden_bed.plant_id=plant.plant_id; 


SELECT garden_bed.plant_id,plant.plant_name,space_number,date_planted,seed_id
from seeds
RIGHT JOIN garden_bed ON garden_bed.plant_id=seeds.plant_id
INNER JOIN plant ON garden_bed.plant_id=plant.plant_id;

#### Full JOIN #####

SELECT space_number,date_planted,plant_name,plant.plant_id,seed_id 
FROM seeds
left JOIN garden_bed ON seeds.plant_id=garden_bed.plant_id
left JOIN plant ON seeds.plant_id=plant.plant_id
UNION
SELECT space_number,date_planted,plant_name,plant.plant_id,seed_id
from seeds
RIGHT JOIN garden_bed ON garden_bed.plant_id=seeds.plant_id
RIGHT JOIN plant ON garden_bed.plant_id=plant.plant_id
ORDER BY space_number;

#### SUB QUERIES ###
SELECT plant_id FROM plant where plant_name LIKE 'Hosta';

INSERT INTO seeds(expiration_date,quantity,reorder,plant_id)
VALUES('2020-08-05',100,FALSE,(SELECT plant_id FROM plant where plant_name LIKE 'Hosta'));

SELECT * 
FROM seeds;

