Step-by-Step Guide to Populate Raw Tables
Step 1: Create a Database and Schema

First, create a database and a schema where the raw data will be stored.
sql
-- Create Database
CREATE OR REPLACE DATABASE e_commerce_db; -- Create the main database for e-commerce data

-- Create Schema
CREATE OR REPLACE SCHEMA e_commerce_db.raw_schema; -- Create a schema for raw data
-------------------------------------------------------------------------------------------------------
Step 2: Create Raw Table
Next, create the raw table to store the incoming invoice data.
  
-- Create Raw Invoices Table
CREATE OR REPLACE TABLE e_commerce_db.raw_schema.raw_invoices (
    InvoiceNo STRING, -- Unique identifier for each invoice
    StockCode STRING, -- Code representing the stock item
    Description STRING, -- Description of the stock item
    Quantity INT, -- Quantity of the item sold
    InvoiceDate TIMESTAMP, -- Date and time of the invoice
    UnitPrice FLOAT, -- Price per unit of the item
    CustomerID STRING, -- Unique identifier for the customer
    Country STRING -- Country of the customer
)
COMMENT = 'Raw invoices data from CSV files'; -- Comment for the table

-------------------------------------------------------------------------------------
Step 3: Create a Stage for Data Loading
Now, create a stage to hold the CSV file.

sql

-- Create Stage for Data Loading
CREATE OR REPLACE STAGE e_commerce_db.my_internal_stage
COMMENT = 'Stage for storing CSV files containing invoice data'; -- Internal stage for loading data
Step 4: Upload Data Files to the Stage
You will need to upload your CSV file (invoices.csv) containing the data to the my_internal_stage.
This step is typically done using the Snowflake UI or a command-line tool.
  
---------------------------------------------------------------------------------
  
Step 5: Copy Data into Raw Tables
Once the data is in the stage, use the COPY INTO command to load it into the raw_invoices table.
sql
-- Copy Data into Raw Invoices Table
COPY INTO e_commerce_db.raw_schema.raw_invoices
FROM @e_commerce_db.my_internal_stage/invoices.csv -- Path to the CSV file in the stage
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' HEADER = TRUE) -- Specify file format
ON_ERROR = 'CONTINUE'; -- Continue loading even if some rows have errors


Summary of Steps: 
Create a Database: Set up a database to hold the e-commerce data.
Create a Schema: Define a schema for the raw data.
Create a Raw Table: Design the raw table to match the structure of the incoming CSV data.
Create a Stage: Create a stage in Snowflake to temporarily hold the data files.
Upload Data: Upload your CSV files to the stage.
Copy Data: Load the data from the stage into the raw table.
