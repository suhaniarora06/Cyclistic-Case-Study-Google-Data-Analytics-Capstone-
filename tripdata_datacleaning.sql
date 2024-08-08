USE G_CAPSTONE;

--DROPPING UNNECESSARY TABLES
DROP TABLE [dbo].[2023 08 tripdata];
GO
DROP TABLE [dbo].[202307-divvy-tripdata];
GO
DROP TABLE [dbo].[202309-divvy-tripdata];
GO
DROP TABLE [dbo].[202310-divvy-tripdata];
GO
DROP TABLE [dbo].[202311-divvy-tripdata];
GO
DROP TABLE [dbo].[202312-divvy-tripdata];
GO
DROP TABLE [dbo].[202401-divvy-tripdata];
GO
DROP TABLE [dbo].[202402-divvy-tripdata];
GO
DROP TABLE [dbo].[202403-divvy-tripdata];
GO
DROP TABLE [dbo].[202404-divvy-tripdata];
GO
DROP TABLE [dbo].[202405-divvy-tripdata];
GO
DROP TABLE [dbo].[202406-divvy-tripdata];

----------------------------------------------------------------------------------
--DATA CLEANING
--1. Remove Duplicates
--2. Standardize the data
--3. Take care of the NULL values
--4. Remove insignificant columns
--(in no specific order)
------------------------------------------------------------------------------------

--REMOVING DUPLICATES

-- created row nums and partitioned by every column
SELECT *,
ROW_NUMBER() OVER(PARTITION BY ride_id ORDER BY ride_id ) AS row_num
FROM [dbo].[all_tripdata_STAGING];


-- viewing the duplicate rows
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY ride_id ORDER BY ride_id ) AS row_num
FROM [dbo].[all_tripdata_STAGING]
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

--211 DUPLICATES ON MAY 31,2024


SELECT *
FROM [dbo].[all_tripdata_STAGING]
WHERE ride_id = '011C8EF97AB0F30D'

SELECT *
FROM [dbo].[all_tripdata_STAGING]
WHERE start_date = '2023-07-05' AND start_time = '18:16:16.0000000'


--deleting duplicate rows
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY ride_id ORDER BY ride_id ) AS row_num
FROM [dbo].[all_tripdata_STAGING]
)
DELETE 
FROM duplicate_cte
WHERE row_num > 1;


--------------------------------------------------------------------------------------------

--CHECKING FOR NULLS
SELECT *
FROM [dbo].[all_tripdata_STAGING];



SELECT COUNT(*) - COUNT(DISTINCT ride_id) ride_id,
		COUNT(*) - COUNT(rideable_type) ride_type,
		COUNT(*) - COUNT(member_casual) mem_cas,
		COUNT(*) - COUNT(start_date) start_date,
		COUNT(*) - COUNT(start_time) start_time,
		COUNT(*) - COUNT(end_date) end_date,
		COUNT(*) - COUNT(end_time) end_time
FROM [dbo].[all_tripdata_STAGING];

SELECT *
FROM [dbo].[all_tripdata_STAGING]
WHERE member_casual IS NULL;

--no null values

-----------------------------------------------------------------------------------
--STANDARDIZING THE DATA

SELECT DISTINCT member_casual
FROM [dbo].[all_tripdata_STAGING];

SELECT ride_id, LEN(ride_id)
FROM [dbo].[all_tripdata_STAGING]
WHERE LEN(ride_id) != 16;

SELECT LEN(ride_id) AS length_ride_id, COUNT(ride_id) AS no_of_rows
FROM [dbo].[all_tripdata_STAGING]
GROUP BY LEN(ride_id);

--length of all ride ids = 16

-- to calculate the duration (in minutes)
SELECT 
    start_time,
    End_Time,
	CASE
	WHEN start_time > end_time
    THEN (1440 - DATEDIFF(MINUTE, end_time, start_time)) --there are 1440 minutes in one day
	ELSE DATEDIFF(MINUTE, start_time, end_time)
	END AS duration
FROM 
    [dbo].[all_tripdata_STAGING];


-- adding duration to the table
ALTER TABLE [dbo].[all_tripdata_STAGING]
ADD duration INT;

UPDATE [dbo].[all_tripdata_STAGING]
SET duration = CASE
	WHEN start_time > end_time
    THEN (1440 - DATEDIFF(MINUTE, end_time, start_time)) 
	ELSE DATEDIFF(MINUTE, start_time, end_time)
	END; 

--creating a stored procedure of the cleaned data
CREATE PROCEDURE tripdata_proc
AS
SELECT *
FROM [dbo].[all_tripdata_STAGING]
ORDER BY start_date;

EXEC tripdata_proc;