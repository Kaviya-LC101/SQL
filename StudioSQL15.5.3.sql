#1
select title 
from movies;

#2
select title,year_released
from movies
order by year_released DESC;

#3
select *
from directors
order by country ;

#4
select *
from directors
order by country ASC ,last_name ASC;

#5
Insert into directors (first_name,last_name,country)
values("Rob","Reiner","USA");

#6
select last_name,director_id
from directors
where last_name="Reiner";

#7
Insert into movies(title, year_released,director_id)
values("The Princess Bride",1987,11);

#8
select movie_id,title as MovieTitle ,year_released, last_name as DirectorLastName
from movies
inner join directors on movies.director_id=directors.director_id;

#9
select movie_id, title as MoiveTitle, first_name as DirectorFirstName , last_name as DirectorLastName
from movies
left join directors on movies.director_id=directors.director_id
order by last_name;

#10
select title as MovieTitle, first_name as DirectorFirstName , last_name as DirectorLastName
from movies,directors
#left join directors on movies.director_id=directors.director_id
where title="The Incredibles" and movies.director_id=directors.director_id;


#11
select title as MovieTitle, last_name as DirectorLastName, country 
from movies
left join directors on movies.director_id=directors.director_id
where title="Roma";


#12
Delete from movies
where movie_id=17;


# checking movie_id =17 is deleted
Select *
from movies
where movie_id=17;


#13
# cant delete director due to foreign key relation ship
Delete from directors
where director_id=10;


#Bonus mission

select title as MovieTitle,first_name as DirectorFirstName, last_name as DirectorLastName
from movies
left join directors on movies.director_id=directors.director_id
where first_name="Peter";
