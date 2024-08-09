USE G_CAPSTONE;

SELECT *
FROM [dbo].[all_tripdata_STAGING]
ORDER BY start_date;

--DATA EXPLORATION

-- 1. Number and Percentage of Riders with Annual Memberships
-- 2. Number and Percentage of Casual Riders

SELECT member_casual, COUNT(ride_id) AS number_of_riders, 
(COUNT(ride_id)/(SELECT CAST(COUNT(*) AS FLOAT) FROM [dbo].[all_tripdata_STAGING])) *100 AS percentage_total
FROM [dbo].[all_tripdata_STAGING]
GROUP BY member_casual;


-- 3. Number and % of Riders using Classic, Docked, Electric Bikes
SELECT rideable_type, COUNT(ride_id) AS number_of_riders, 
(COUNT(ride_id)/(SELECT CAST(COUNT(*) AS FLOAT) FROM [dbo].[all_tripdata_STAGING])) *100 AS percentage_total
FROM [dbo].[all_tripdata_STAGING]
GROUP BY rideable_type;


-- 4. Average Ride Length of Riders with Annual Memberships 
-- 5. Average Ride Length of Casual Riders
SELECT member_casual, AVG(duration) AS avg_ride_length 
FROM [dbo].[all_tripdata_STAGING]
GROUP BY member_casual;


-- 6. Average Ride Length of Riders using Classic, Docked, Electric Bikes
SELECT rideable_type, AVG(duration) AS avg_ride_length 
FROM [dbo].[all_tripdata_STAGING]
GROUP BY rideable_type;


-- 7. Number of Riders with Annual Memberships using Classic, Docked, Electric Bikes 
-- 8. Number of Casual Riders using Classic, Docked, Electric Bikes
SELECT member_casual, rideable_type, COUNT(ride_id) AS number_of_riders,
(COUNT(ride_id)/(SELECT CAST(COUNT(*) AS FLOAT) FROM [dbo].[all_tripdata_STAGING])) *100 AS percentage_total
FROM [dbo].[all_tripdata_STAGING]
GROUP BY member_casual, rideable_type;


-- 9. Average Ride Length of Riders with Annual Memberships using Classic, Docked, Electric Bikes 
-- 10. Average Ride Length of Casual Riders using Classic, Docked, Electric Bikes
SELECT member_casual, rideable_type, AVG(duration) AS avg_ride_length
FROM [dbo].[all_tripdata_STAGING]
GROUP BY member_casual, rideable_type;