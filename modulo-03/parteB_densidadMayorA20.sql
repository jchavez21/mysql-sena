-- filtrar solo de los países de Suramérica con densidad mayor a 20. 
SELECT Name, Population, SurfaceArea, Population / SurfaceArea AS densidad
FROM world.country
WHERE Continent = 'South America'
  AND  Population / SurfaceArea > 20;