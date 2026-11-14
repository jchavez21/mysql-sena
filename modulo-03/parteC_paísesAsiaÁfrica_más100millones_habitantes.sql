-- Población de los países de Asia o de África con más de 100 millones de habitantes.
SELECT Name, Continent, Population
FROM world.country
WHERE (Continent = 'Asia'
  OR continent = 'africa') AND population > 100000000;