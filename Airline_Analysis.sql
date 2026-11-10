CREATE DATABASE airline_analysis;
use airline_analysis;

SELECT *
FROM flight_data
LIMIT 10;

# Which airline operates the maximum flights?

SELECT
    Airline,
    COUNT(*) AS Total_Flights
FROM flight_data
GROUP BY Airline
ORDER BY Total_Flights DESC
LIMIT 1;

# Which airline generates the highest revenue?

SELECT
    Airline,
    SUM(Revenue_INR) AS Total_Revenue
FROM flight_data
GROUP BY Airline
ORDER BY Total_Revenue DESC
LIMIT 1;


# 3. Which airline has the highest average delay?

SELECT
    Airline,
    ROUND(AVG(Arrival_Delay_Min), 2) AS Average_Delay
FROM flight_data
GROUP BY Airline
ORDER BY Average_Delay DESC
LIMIT 1;


# Which routes have the most flights?

SELECT
    Origin_City,
    Destination_City,
    COUNT(*) AS Total_Flights
FROM flight_data
GROUP BY Origin_City, Destination_City
ORDER BY Total_Flights DESC
LIMIT 10;


# Which airline has the highest profit?

SELECT
    Airline,
    SUM(Estimated_Profit_INR) AS Total_Profit
FROM flight_data
GROUP BY Airline
ORDER BY Total_Profit DESC
LIMIT 1;


# What is the overall cancellation rate?

DESCRIBE flight_data;
SELECT
    COUNT(*) AS Total_Flights,
    SUM(CASE
        WHEN Cancelled_Flag = 'Cancelled' THEN 1
        ELSE 0
    END) AS Cancelled_Flights,
    ROUND(
        SUM(CASE
            WHEN Cancelled_Flag = 'Cancelled' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*), 2
    ) AS Cancellation_Rate_Percentage
FROM flight_data;


# Which aircraft model generates the highest revenue?

SELECT
    Aircraft_Model,
    SUM(Revenue_INR) AS Total_Revenue
FROM flight_data
GROUP BY Aircraft_Model
ORDER BY Total_Revenue DESC
LIMIT 1;


# Which city has the highest flight traffic?

SELECT
    City,
    SUM(Flight_Count) AS Total_Traffic
FROM (
    SELECT Origin_City AS City, COUNT(*) AS Flight_Count
    FROM flight_data
    GROUP BY Origin_City

    UNION ALL

    SELECT Destination_City AS City, COUNT(*) AS Flight_Count
    FROM flight_data
    GROUP BY Destination_City
) AS City_Traffic
GROUP BY City
ORDER BY Total_Traffic DESC
LIMIT 1;


#  What is the average customer rating for each airline?

SELECT
    Airline,
    ROUND(AVG(Customer_Rating), 2) AS Average_Customer_Rating
FROM flight_data
GROUP BY Airline
ORDER BY Average_Customer_Rating DESC;


#10. Which routes have the highest average delay?

SELECT
    Origin_City,
    Destination_City,
    ROUND(AVG(Arrival_Delay_Min), 2) AS Average_Delay
FROM flight_data
GROUP BY Origin_City, Destination_City
ORDER BY Average_Delay DESC
LIMIT 10;



