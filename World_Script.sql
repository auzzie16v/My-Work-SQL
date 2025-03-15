# Highest populated city in each country
WITH CityRanked AS (
    SELECT Name AS City, CountryCode, Population,
           RANK() OVER (PARTITION BY CountryCode ORDER BY Population DESC) AS ranking
    FROM city
)
SELECT City, CountryCode, Population
FROM CityRanked
WHERE ranking = 1;
#Largest country in each continent by land area
SELECT Name, Continent, SurfaceArea
FROM (
    SELECT Name, Continent, SurfaceArea,
           RANK() OVER (PARTITION BY Continent ORDER BY SurfaceArea DESC) AS ranking
    FROM country
) ranked
WHERE ranking = 1;
# Countries where more than 50% of people speak an official language
SELECT cl.CountryCode, c.Name, cl.Language, cl.Percentage
FROM countrylanguage cl
JOIN country c ON cl.CountryCode = c.Code
WHERE cl.IsOfficial = 'T' AND cl.Percentage > 50;
# Finding the most common official language across the world
SELECT Language, COUNT(DISTINCT CountryCode) AS country_count
FROM countrylanguage
WHERE IsOfficial = 'T'
GROUP BY Language
ORDER BY country_count DESC
LIMIT 1;
# Countries with the highest GNP per capita
SELECT Name, GNP / Population AS GNP_per_Capita
FROM country
WHERE Population > 0
ORDER BY GNP_per_Capita DESC
LIMIT 5;
# Countries with no official language 
SELECT c.Name 
FROM country c
LEFT JOIN countrylanguage cl ON c.Code = cl.CountryCode AND cl.IsOfficial = 'T'
WHERE cl.CountryCode IS NULL;
# Smallest and largest country populations within each continent 
SELECT Continent, 
       MIN(Population) AS Smallest_Population, 
       MAX(Population) AS Largest_Population
FROM country
GROUP BY Continent;
# Finding capital cities where they are the countries largest cities 
SELECT c.Name AS Country, ct.Name AS Capital_City, ct.Population AS Capital_Population
FROM country c
JOIN city ct ON c.Capital = ct.ID
WHERE ct.Population = (SELECT MAX(Population) FROM city WHERE CountryCode = c.Code);
# Continents based on population density 
SELECT Continent, 
       SUM(Population) AS Total_Population, 
       SUM(SurfaceArea) AS Total_Area, 
       SUM(Population) / SUM(SurfaceArea) AS Population_Density
FROM country
GROUP BY Continent
ORDER BY Population_Density DESC;