USE [G_CAPSTONE]
GO
/****** Object:  StoredProcedure [dbo].[tripdata_proc]    Script Date: 30-07-2024 18:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[tripdata_proc]
AS
SELECT *
FROM [dbo].[all_tripdata_STAGING]
ORDER BY start_date;