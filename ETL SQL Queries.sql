Project Structure: 

Invoice_ETL_Project/
│
├── metadata/
│   ├── invoice_metadata.sql
│   └── data_sources.sql
│
├── schemas/
│   ├── staging_schema.sql
│   ├── production_schema.sql
│   └── customer_schema.sql
│
├── tables/
│   ├── create_invoice_table.sql
│   └── create_customer_table.sql
│
└── etl_process/
    ├── extract.sql
    ├── transform.sql
    └── load.sql

2. Metadata Creation
    
<<<<<<<<<<<<<metadata/invoice_metadata.sql>>>>>>>>>>>

sql
-- Metadata for Invoice ETL Project
CREATE TABLE invoice_metadata (
    id INT PRIMARY KEY,
    source_name VARCHAR(255),
    source_type VARCHAR(50),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO invoice_metadata (id, source_name, source_type) VALUES
(1, 'Invoices', 'CSV'),
(2, 'Customers', 'Database');

----------------------------------------------------------------------------------------
<<<<<<<<<<<<metadata/data_sources.sql >>>>>>>>>>>>>
    
sql
-- Data Sources Configuration
CREATE TABLE data_sources (
    id INT PRIMARY KEY,
    source_name VARCHAR(255),
    source_path VARCHAR(255)
);

INSERT INTO data_sources (id, source_name, source_path) VALUES
(1, 'Invoices', '/path/to/invoice_data.csv'),
(2, 'Customers', '/path/to/customer_data.csv');


==============================================================================================
3. Schema Creation

<<<<<<<<<<<<schemas/staging_schema.sql>>>>>>>>>>>>>>>>>>>>>>>>>
    
sql
-- Creating Staging Schema
CREATE SCHEMA staging;

-- Staging tables for intermediate processing
CREATE TABLE staging.invoice_staging (
    InvoiceNo VARCHAR(50),
    StockCode VARCHAR(50),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATE,
    UnitPrice DECIMAL(10, 2),
    CustomerID VARCHAR(50),
    Country VARCHAR(100)
);

<<<<<<<<<<schemas/production_schema.sql>>>>>>>>>>>>>>>>>>>

sql
-- Creating Production Schema
CREATE SCHEMA production;

-- Production table for final output
CREATE TABLE production.invoice_facts (
    InvoiceNo VARCHAR(50),
    StockCode VARCHAR(50),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATE,
    UnitPrice DECIMAL(10, 2),
    CustomerID VARCHAR(50),
    Country VARCHAR(100),
    TotalPrice DECIMAL(10, 2)
);

<<<<<<<<<<<<<<<schemas/customer_schema.sql>>>>>>>>>>>>>>>>>

sql
-- Customer Dimension Table
CREATE TABLE production.customer_dimension (
    CustomerID VARCHAR(50) PRIMARY KEY,
    Country VARCHAR(100),
    CustomerName VARCHAR(255)
);
