#1 List each country name where the population is larger than that of 'Russia'. world(name, continent, area, population, gdp)
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
      
#2 Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name FROM world
  WHERE gdp/population >
     (SELECT gdp/population FROM world
      WHERE name='United Kingdom')
and continent = 'Europe';

#3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

Select name, continent
from world
where continent in (select continent from world
                    where name in ('Argentina','Australia'))
order by name;

#4  Which country has a population that is more than Canada but less than Poland? Show the name and the population.
select name, population
from world
where population > (select population from world
                    where name = 'Canada')
and population <
(select population from world
where name = 'Poland');

#5 Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany. Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

select name, concat(round(population/(select population/100 from world where name ='Germany'),0),'%')as percentage
from world
where continent = 'Europe';

#6 Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
select name
from world
where GDP > (select max(gdp) from world where continent = 'Europe');


