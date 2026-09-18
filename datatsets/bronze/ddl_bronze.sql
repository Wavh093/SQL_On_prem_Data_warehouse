/*
	This script will be used for creating all ERP tables in the bronze layer
*/
IF OBJECT_ID('bronze.erp_cust_az12','U') IS NOT NULL
DROP TABLE bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12(
	cid		NVARCHAR(55),
	bdate	DATE,
	gen		NVARCHAR(50)
);
GO

IF OBJECT_ID('bronze.erp_loc_a101','U') IS NOT NULL
DROP TABLE bronze.erp_loc_a101;

CREATE TABLE bronze.erp_loc_a101(
	cid		NVARCHAR (50),
	cntry	NVARCHAR(50)
);
GO

IF OBJECT_ID('bronze.erp_px_cat_g1v2','U') IS NOT NULL
DROP TABLE bronze.erp_px_cat_g1v2;

CREATE TABLE bronze.erp_px_cat_g1v2(
	id				NVARCHAR(50),
	cat				NVARCHAR(50),
	subcat			NVARCHAR(50),
	maintenance		NVARCHAR(50)
)

/*
	Defining the crm tables
*/
IF OBJECT_ID('bronze.crm_cust_info','U') IS NOT NULL
DROP TABLE bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info(
	cst_id				INT,
	cst_key				NVARCHAR(50),
	cst_firstname		NVARCHAR(50),
	cst_lastname		NVARCHAR(50),
	cst_marital_status	NVARCHAR(50),
	cst_gndr			NVARCHAR(50),
	cst_create_date		DATE
)

GO
IF OBJECT_ID('bronze.crm_prd_info','U') IS NOT NULL
DROP TABLE bronze.crm_prd_info;

CREATE TABLE bronze.crm_prd_info(
	prd_id			INT,
	prd_key			NVARCHAR(50),
	prd_nm			NVARCHAR(60),
	prd_cost		FLOAT,
	prd_line		NVARCHAR(50),
	prd_start_dt	DATE,
	prd_end_dt		DATE
)

GO

IF OBJECT_ID('bronze.crm_sales_details','U') IS NOT NULL
DROP TABLE bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details(
	sls_ord_num		NVARCHAR(55),
	sls_prd_key		NVARCHAR(55),
	sls_cust_id		INT,
	sls_order_dt	NVARCHAR(55),
	sls_ship_dt		NVARCHAR(55),
	sls_due_dt		NVARCHAR(55),
	sls_sales		FLOAT,
	sls_quantity	INT,
	sls_price		FLOAT
)
