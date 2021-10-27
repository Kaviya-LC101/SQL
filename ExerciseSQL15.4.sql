CREATE TABLE seeds (
   seed_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   crop VARCHAR(40),
   encourages VARCHAR(80),
   use_by INTEGER
);

INSERT INTO seeds (crop, encourages, use_by)
VALUES ("Agastache", "bees & hummingbirds", 2020);

INSERT INTO seeds (crop, use_by)
VALUES ("crop2", 2020);

INSERT INTO seeds (crop, use_by)
VALUES ("Sun Gold Tomato", 2022);

INSERT INTO seeds (crop, encourages,use_by)
VALUES ("Vine Ripe Tomato","Birds", 2022);


INSERT INTO seeds (crop, encourages,use_by)
VALUES ("Russell Potatoes","Birds", 2023);

INSERT INTO seeds (crop, encourages,use_by)
VALUES ("Green beans","cucumber", 2023);


Select *
from Seeds

Select crop
from Seeds

Select crop, use_by
from seeds
order by use_by DESC, crop ASC;

Select *
from Seeds
where seed_id=2;


update seeds
set use_by=2024
where seed_id=1;


update seeds
set use_by=2025, encourages="Birds"
where seed_id=4;


Alter Table seeds
Add expired boolean;

update seeds
set expired=true
where use_by <= 2021;