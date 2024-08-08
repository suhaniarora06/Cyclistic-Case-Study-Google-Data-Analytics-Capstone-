USE G_CAPSTONE;


DROP TABLE IF EXISTS [dbo].[all_tripdata];

--making the structure of the combined table
SELECT *
INTO [dbo].[all_tripdata]
FROM [dbo].[202309-divvy-tripdata]
WHERE 1 = 0;

--inserting data
INSERT INTO [dbo].[all_tripdata]
  SELECT * FROM [dbo].[202307-divvy-tripdata]
  UNION ALL
  SELECT * FROM [dbo].[2023 08 tripdata]
  UNION ALL
  SELECT * FROM [dbo].[202309-divvy-tripdata]
  UNION ALL
  SELECT * FROM [dbo].[202310-divvy-tripdata]
  UNION ALL
  SELECT * FROM [dbo].[202311-divvy-tripdata]
  UNION ALL
  SELECT * FROM [dbo].[202312-divvy-tripdata]
  UNION ALL
  SELECT * FROM [dbo].[202401-divvy-tripdata]
  UNION ALL
  SELECT * FROM [dbo].[202402-divvy-tripdata]
  UNION ALL
  SELECT * FROM [dbo].[202403-divvy-tripdata]
  UNION ALL
  SELECT * FROM [dbo].[202404-divvy-tripdata]
  UNION ALL
  SELECT * FROM [dbo].[202405-divvy-tripdata]
  UNION ALL
  SELECT * FROM [dbo].[202406-divvy-tripdata]
;

SELECT *
FROM [dbo].[all_tripdata];

--removing unneccesary columns
ALTER TABLE [dbo].[all_tripdata]
DROP COLUMN start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng,
			end_lat, end_lng;

--adding new columns that split the data in 'started_at' and 'ended_at' columns
ALTER TABLE [dbo].[all_tripdata]
ADD start_date date,
	start_time time,
	start_month varchar(20),
	start_day varchar(20),
	start_year int,
	end_date date,
	end_time time,
	end_month varchar(20),
	end_day varchar(20),
	end_year int;

--changing the data-types for better analysis
SELECT started_at, CONVERT(TIME, started_at)
FROM [dbo].[all_tripdata];

UPDATE [dbo].[all_tripdata]
SET start_date = CAST(started_at AS DATE),
	start_time = CONVERT(TIME, started_at),
	start_month = DATENAME(MONTH, started_at),
	start_day = DATENAME(WEEKDAY, started_at),
	start_year = YEAR(started_at),
	end_date = CAST(ended_at AS DATE),
	end_time = CONVERT(TIME, ended_at),
	end_month = DATENAME(MONTH, ended_at),
	end_day = DATENAME(WEEKDAY, ended_at),
	end_year = YEAR(ended_at);


SELECT *
FROM [dbo].[all_tripdata_STAGING]
ORDER BY start_date;

