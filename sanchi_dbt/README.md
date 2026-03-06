# Project Overview
This project implements a dbt-based data transformation pipeline on Databricks using the medallion architecture (Bronze → Silver → Gold).

The pipeline ingests raw data, performs transformations, applies data quality tests, and builds analytics-ready datasets for reporting.

### dbt is used to manage:
-SQL transformations  
-data lineage  
-testing  
-documentation  
-environment deployment (dev → prod)  

## Architecture
The project follows the Medallion Architecture.
### Bronze Layer
Models:  
-bronze_customer  
-bronze_product  
-bronze_sales  
-bronze_returns  
-bronze_store  
-bronze_date  

### Silver Layer
Models:   
-silver_sales_obt  
-silver_returns_obt  

### Gold Layer
Models:  
-gold_item  
-dedup  

## Environment Configuration
Environment separation is handled using targets in profiles.yml.  
Environment -->	Catalog  
dev-->	dbt_dev  
prod-->	dbt_prod  

## Running the Project
1. Activate the virtual environment: source .venv/bin/activate
2. Run transformations: dbt build
3. Run tests only: dbt test
4. Run snapshots: dbt snapshot