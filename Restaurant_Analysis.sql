CREATE DATABASE restaurant_analysis;
USE restaurant_analysis;

CREATE TABLE restaurants (
    Restaurant_ID INT PRIMARY KEY,
    Name VARCHAR(150),
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    Zip_Code VARCHAR(20),
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    Alcohol_Service VARCHAR(50),
    Smoking_Allowed VARCHAR(50),
    Price VARCHAR(20),
    Franchise VARCHAR(10),
    Area VARCHAR(50),
    Parking VARCHAR(50)
);

CREATE TABLE restaurant_cuisines (
    Restaurant_ID INT,
    Cuisine VARCHAR(100),

    FOREIGN KEY (Restaurant_ID)
    REFERENCES restaurants(Restaurant_ID)
);

CREATE TABLE ratings (
    Consumer_ID VARCHAR(20),
    Restaurant_ID INT,
    Overall_Rating INT,
    Food_Rating INT,
    Service_Rating INT,

    FOREIGN KEY (Restaurant_ID)
    REFERENCES restaurants(Restaurant_ID)
);

CREATE TABLE consumers (
    Consumer_ID VARCHAR(20) PRIMARY KEY,
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    Smoker VARCHAR(10),
    Drink_Level VARCHAR(50),
    Transportation_Method VARCHAR(50),
    Marital_Status VARCHAR(50),
    Children VARCHAR(50),
    Age INT,
    Occupation VARCHAR(50),
    Budget VARCHAR(20)
);

CREATE TABLE consumer_preferences (
    Consumer_ID VARCHAR(20),
    Preferred_Cuisine VARCHAR(100),

    FOREIGN KEY (Consumer_ID)
    REFERENCES consumers(Consumer_ID)
);

SELECT COUNT(*) AS Total_Restaurants
FROM restaurants;

SELECT COUNT(*) AS Total_Consumers
FROM consumers;

SELECT COUNT(*) AS Total_Ratings
FROM ratings;

SELECT
    ROUND(AVG(Overall_Rating), 2) AS Average_Rating
FROM ratings;


SELECT
    r.Restaurant_ID,
    r.Name,
    ROUND(AVG(rt.Overall_Rating), 2) AS Average_Rating,
    COUNT(rt.Overall_Rating) AS Rating_Count
FROM restaurants r
JOIN ratings rt
    ON r.Restaurant_ID = rt.Restaurant_ID
GROUP BY r.Restaurant_ID, r.Name
HAVING COUNT(rt.Overall_Rating) >= 5
ORDER BY Average_Rating DESC
LIMIT 10;


SELECT
    ROUND(AVG(Food_Rating), 2) AS Avg_Food_Rating,
    ROUND(AVG(Service_Rating), 2) AS Avg_Service_Rating,
    ROUND(AVG(Overall_Rating), 2) AS Avg_Overall_Rating
FROM ratings;


SELECT
    rc.Cuisine,
    ROUND(AVG(rt.Overall_Rating), 2) AS Average_Rating,
    COUNT(rt.Overall_Rating) AS Rating_Count
FROM restaurant_cuisines rc
JOIN ratings rt
    ON rc.Restaurant_ID = rt.Restaurant_ID
GROUP BY rc.Cuisine
ORDER BY Average_Rating DESC;


SELECT
    Cuisine,
    COUNT(*) AS Restaurant_Count
FROM restaurant_cuisines
GROUP BY Cuisine
ORDER BY Restaurant_Count DESC;


SELECT
    Preferred_Cuisine,
    COUNT(*) AS Consumer_Count
FROM consumer_preferences
GROUP BY Preferred_Cuisine
ORDER BY Consumer_Count DESC;


SELECT
    c.Budget,
    ROUND(AVG(r.Overall_Rating), 2) AS Average_Rating,
    COUNT(r.Overall_Rating) AS Rating_Count
FROM consumers c
JOIN ratings r
    ON c.Consumer_ID = r.Consumer_ID
GROUP BY c.Budget
ORDER BY Average_Rating DESC;


SELECT
    CASE
        WHEN c.Age < 20 THEN 'Under 20'
        WHEN c.Age BETWEEN 20 AND 29 THEN '20-29'
        WHEN c.Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN c.Age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50+'
    END AS Age_Group,
    ROUND(AVG(r.Overall_Rating), 2) AS Average_Rating,
    COUNT(*) AS Rating_Count
FROM consumers c
JOIN ratings r
    ON c.Consumer_ID = r.Consumer_ID
GROUP BY Age_Group
ORDER BY Average_Rating DESC;


SELECT
    c.Occupation,
    ROUND(AVG(r.Overall_Rating), 2) AS Average_Rating,
    COUNT(*) AS Rating_Count
FROM consumers c
JOIN ratings r
    ON c.Consumer_ID = r.Consumer_ID
GROUP BY c.Occupation
ORDER BY Average_Rating DESC;


SELECT
    res.Price,
    ROUND(AVG(r.Overall_Rating), 2) AS Average_Rating,
    COUNT(r.Overall_Rating) AS Rating_Count
FROM restaurants res
JOIN ratings r
    ON res.Restaurant_ID = r.Restaurant_ID
GROUP BY res.Price
ORDER BY Average_Rating DESC;


SELECT
    res.Franchise,
    ROUND(AVG(r.Overall_Rating), 2) AS Average_Rating,
    COUNT(*) AS Rating_Count
FROM restaurants res
JOIN ratings r
    ON res.Restaurant_ID = r.Restaurant_ID
GROUP BY res.Franchise;


SELECT
    res.City,
    COUNT(DISTINCT res.Restaurant_ID) AS Restaurant_Count,
    ROUND(AVG(r.Overall_Rating), 2) AS Average_Rating
FROM restaurants res
JOIN ratings r
    ON res.Restaurant_ID = r.Restaurant_ID
GROUP BY res.City
ORDER BY Average_Rating DESC;


SELECT
    Overall_Rating,
    ROUND(AVG(Food_Rating), 2) AS Avg_Food_Rating,
    ROUND(AVG(Service_Rating), 2) AS Avg_Service_Rating,
    COUNT(*) AS Rating_Count
FROM ratings
GROUP BY Overall_Rating
ORDER BY Overall_Rating;


SELECT
    r.Restaurant_ID,
    r.Name AS Restaurant_Name,
    r.City AS Restaurant_City,
    r.State,
    r.Price,
    r.Franchise,
    r.Parking,
    rc.Cuisine,
    rt.Consumer_ID,
    rt.Overall_Rating,
    rt.Food_Rating,
    rt.Service_Rating,
    c.City AS Consumer_City,
    c.Age,
    c.Smoker,
    c.Drink_Level,
    c.Transportation_Method,
    c.Marital_Status,
    c.Children,
    c.Occupation,
    c.Budget,
    cp.Preferred_Cuisine
    
FROM restaurants r
LEFT JOIN restaurant_cuisines rc
    ON r.Restaurant_ID = rc.Restaurant_ID
LEFT JOIN ratings rt
    ON r.Restaurant_ID = rt.Restaurant_ID
LEFT JOIN consumers c
    ON rt.Consumer_ID = c.Consumer_ID
LEFT JOIN consumer_preferences cp
    ON c.Consumer_ID = cp.Consumer_ID;