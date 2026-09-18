/*
	This script will be used for creating the database "DataWarehouse" and the schemas inside.
	It first checks if the Db exists. 

	WARNING: Running this script will drop the entire "DataWarehouse" Db if it does exists. Ensure
	that you have proper backups before running this script

*/


-- go to master db

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;

USE DataWarehouse;
GO

-- Creating the schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;

