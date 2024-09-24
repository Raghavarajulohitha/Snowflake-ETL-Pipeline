Step-by-Step Setup for Snowflake
1. Create a Database
sql
CREATE DATABASE e_commerce_db --'Database for E-commerce Sales and Customer Data';

2. Create a Warehouse
sql
CREATE WAREHOUSE e_commerce_warehouse 
    WITH WAREHOUSE_SIZE = 'SMALL' 
    AUTO_RESUME = TRUE 
    AUTO_SUSPEND = 60 
    --'Warehouse for processing E-commerce data';

3. Create Schemas
sql
CREATE SCHEMA e_commerce_db.raw_schema --'Schema for untransformed raw data';
CREATE SCHEMA e_commerce_db.staging_schema --'Schema for transformed staging data';
CREATE SCHEMA e_commerce_db.production_schema --'Schema for production data ready for analytics';

4. Create Tables in the Raw Schema
sql
CREATE TABLE e_commerce_db.raw_schema.raw_invoices (
    InvoiceNo VARCHAR(50) COMMENT 'Unique identifier for each invoice.',
    StockCode VARCHAR(50) COMMENT 'Unique identifier for each stock item.',
    Description VARCHAR(255) COMMENT 'Description of the product.',
    Quantity INT COMMENT 'Quantity of items sold in the invoice.',
    InvoiceDate DATE COMMENT 'Date when the invoice was generated.',
    UnitPrice DECIMAL(10, 2) COMMENT 'Price per unit of the item sold.',
    CustomerID VARCHAR(50) COMMENT 'Identifier for the customer making the purchase.',
    Country VARCHAR(50) COMMENT 'Country of the customer.'
);

5. Create Tables in the Staging Schema
sql
CREATE TABLE e_commerce_db.staging_schema.staging_invoices (
    InvoiceNo VARCHAR(50) COMMENT 'Unique identifier for each invoice.',
    StockCode VARCHAR(50) COMMENT 'Unique identifier for each stock item.',
    Quantity INT COMMENT 'Quantity of items sold in the invoice.',
    InvoiceDate DATE COMMENT 'Date when the invoice was generated.',
    UnitPrice DECIMAL(10, 2) COMMENT 'Price per unit of the item sold.',
    CustomerID VARCHAR(50) COMMENT 'Identifier for the customer making the purchase.',
    Country VARCHAR(50) COMMENT 'Country of the customer.',
    ProcessedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Date when the data was processed in staging.'
);

6. Create Tables in the Production Schema
sql
CREATE TABLE e_commerce_db.production_schema.invoice_facts (
    InvoiceNo VARCHAR(50) COMMENT 'Unique identifier for each invoice.',
    StockCode VARCHAR(50) COMMENT 'Unique identifier for each stock item.',
    Quantity INT COMMENT 'Quantity of items sold in the invoice.',
    InvoiceDate DATE COMMENT 'Date when the invoice was generated.',
    UnitPrice DECIMAL(10, 2) COMMENT 'Price per unit of the item sold.',
    CustomerID VARCHAR(50) COMMENT 'Identifier for the customer making the purchase.',
    TotalAmount DECIMAL(10, 2) COMMENT 'Total amount for the invoice (Quantity * UnitPrice).',
    PRIMARY KEY (InvoiceNo) COMMENT 'Primary key for the invoice facts table.'
);

CREATE TABLE e_commerce_db.production_schema.product_dimension (
    StockCode VARCHAR(50) COMMENT 'Unique identifier for each stock item.',
    Description VARCHAR(255) COMMENT 'Description of the product.',
    PRIMARY KEY (StockCode) COMMENT 'Primary key for the product dimension table.'
);

CREATE TABLE e_commerce_db.production_schema.customer_dimension (
    CustomerID VARCHAR(50) COMMENT 'Unique identifier for each customer.',
    Country VARCHAR(50) COMMENT 'Country of the customer.',
    PRIMARY KEY (CustomerID) COMMENT 'Primary key for the customer dimension table.'
);



Summary of Steps
Database Creation: A database named e_commerce_db is created to store all related schemas and tables.
Warehouse Creation: A warehouse named e_commerce_warehouse is created to perform data processing.
Schema Creation: Three schemas are created:
raw_schema: For untransformed raw data.
staging_schema: For transformed data before loading into production.
production_schema: For cleaned and enriched data ready for analysis.

Table Creation:
raw_invoices in the raw schema captures the initial raw data.
staging_invoices in the staging schema is for transformed data.
invoice_facts, product_dimension, and customer_dimension in the production schema store structured, analytical-ready data.
