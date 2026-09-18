/*
	Using bulk insert to load data into the bronze tables.
	then make it a stored procedure.
*/

-- truncate (clear table first), use a bulk insert, then validate loaded data.

CREATE OR ALTER PROCEDURE bronze.load_bronze AS 
BEGIN
BEGIN TRY
	-- Declaring variables
	DECLARE @START_TIME AS DATETIME, @END_TIME AS DATETIME, @BATCH_START_TIME AS DATETIME, @BATCH_END_TIME AS DATETIME;
	TRUNCATE TABLE bronze.crm_cust_info;

	SET @BATCH_START_TIME = GETDATE();

	SET @START_TIME = GETDATE();
	PRINT '>> Inserting crm cust info table';

	BULK INSERT bronze.crm_cust_info
	FROM "C:\Users\wavho\OneDrive\Documents\Learning\Data Engineering\datawithbaraa\datasets\datasets\engineering\source_crm\cust_info.csv"
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @END_TIME = GETDATE();
	PRINT 'The duration of the load is ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR);
	
	--------------------------------------------------------------------------------

	TRUNCATE TABLE bronze.crm_prd_info;

	SET @START_TIME = GETDATE();
	PRINT '>> Inserting crm prod info table';

	BULK INSERT bronze.crm_prd_info
	FROM "C:\Users\wavho\OneDrive\Documents\Learning\Data Engineering\datawithbaraa\datasets\datasets\engineering\source_crm\prd_info.csv"
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @END_TIME = GETDATE();

	PRINT 'The duration of the load is: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR);
	-----------------------------------------------------------------------------------------------------------------------------------------------

	TRUNCATE TABLE bronze.crm_sales_details;

	SET @START_TIME = GETDATE()

	PRINT '>> Inserting crm sales details table';

	BULK INSERT bronze.crm_sales_details
	FROM "C:\Users\wavho\OneDrive\Documents\source_crm\sales_details.csv"
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	SET @END_TIME = GETDATE();

	PRINT 'The duration of the load is: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR);
	-----------------------------------------------------------------------------------------------------------------------------------------------

	SET @START_TIME = GETDATE();
	
	TRUNCATE TABLE bronze.erp_cust_az12;

	PRINT '>> Inserting erp customers table';

	BULK INSERT bronze.erp_cust_az12
	FROM "C:\Users\wavho\OneDrive\Documents\source_erp\CUST_AZ12.csv"
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	SET @END_TIME = GETDATE();

	PRINT 'The total loading time is: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR);

	-------------------------------------------------------------------------------------------------------------------------------------------------

	TRUNCATE TABLE bronze.erp_loc_a101;

	SET @START_TIME = GETDATE();

	PRINT '>> Inserting erp locations table';

	BULK INSERT bronze.erp_loc_a101
	FROM "C:\Users\wavho\OneDrive\Documents\source_erp\LOC_A101.csv"
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	SET @END_TIME = GETDATE();

	PRINT 'The total loading time is ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR);

	--------------------------------------------------------------------------------------------------------------------------------------------------

	TRUNCATE TABLE bronze.erp_px_cat_g1v2;

	PRINT '>> Inserting erp categories table';

	SET @START_TIME = GETDATE();

	BULK INSERT bronze.erp_px_cat_g1v2
	FROM "C:\Users\wavho\OneDrive\Documents\source_erp\PX_CAT_G1V2.csv"
	WITH(
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);

	
	SET @END_TIME = GETDATE();
	SET @BATCH_END_TIME = GETDATE();

	PRINT 'The total loading time is ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR);

END TRY
BEGIN CATCH
	PRINT 'Error occured during loading the bronze layer';
	PRINT 'Error message: ' + ERROR_MESSAGE();
	PRINT 'Error line: ' + CAST(ERROR_LINE() AS NVARCHAR);
END CATCH
END;

GO

EXEC bronze.load_bronze;
