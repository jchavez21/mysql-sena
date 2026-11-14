-- EJERCICIO 5 - PARTE A
-- filtra los paises de sudamerica que se independizaron antes de 1820
SELECT Name, IndepYear
FROM world.country
WHERE Continent = 'South America'
  AND IndepYear < 1820;
