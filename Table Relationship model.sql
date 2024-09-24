1. Invoice Facts Table: invoice_facts
  
This table stores transactional data about each invoice.

Column Name	    Data Type	          Description
InvoiceNo	      VARCHAR(50)	          Unique identifier for each invoice.
StockCode	      VARCHAR(50)	          Unique identifier for each stock item.
Quantity	      INT	                  Quantity of items sold in the invoice.
InvoiceDate	    DATE	                Date of the invoice.
UnitPrice	      DECIMAL(10, 2)	      Price per unit of the item sold.
CustomerID	    VARCHAR(50)	           Identifier for the customer making the purchase.
  

2. Product Dimension Table: product_dimension
This table contains details about the products sold.

Column Name	        Data Type	     Description
StockCode	          VARCHAR(50)	   Unique identifier for each stock item (PK).
Description	        VARCHAR(255)	 Description of the product.

  
3. Customer Dimension Table: customer_dimension
This table contains customer-related information.

Column Name	          Data Type	         Description
CustomerID	          VARCHAR(50)	       Unique identifier for each customer (PK).
Country	              VARCHAR(50)	       Country of the customer.

  
Relationships
The invoice_facts table has a many-to-one relationship with both product_dimension and customer_dimension tables:

invoice_facts.StockCode → product_dimension.StockCode
invoice_facts.CustomerID → customer_dimension.CustomerID

SQL Queries for ETL Process

  1. Extract: Load Data into Staging Table
  Assuming you are using a staging table (staging_invoice_data) to temporarily hold the raw data from your Excel file.

sql

CREATE TABLE staging_invoice_data (
    InvoiceNo VARCHAR(50),
    StockCode VARCHAR(50),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATE,
    UnitPrice DECIMAL(10, 2),
    CustomerID VARCHAR(50),
    Country VARCHAR(50)
);

-- Load data from the Excel file into the staging table
-- (This would typically be done through your ETL tool, e.g., Informatica, IICS, or DataStage)

 2. Transform: Populate Dimension Tables
 This step involves inserting unique records into the dimension tables from the staging table.

sql
-- Insert into Product Dimension
INSERT INTO product_dimension (StockCode, Description)
SELECT DISTINCT StockCode, Description
FROM staging_invoice_data;

-- Insert into Customer Dimension
INSERT INTO customer_dimension (CustomerID, Country)
SELECT DISTINCT CustomerID, Country
FROM staging_invoice_data;

3. Load: Populate the Fact Table
Now, load the transformed data into the fact table.

sql
-- Insert into Invoice Facts
INSERT INTO invoice_facts (InvoiceNo, StockCode, Quantity, InvoiceDate, UnitPrice, CustomerID)
SELECT InvoiceNo, StockCode, Quantity, InvoiceDate, UnitPrice, CustomerID
FROM staging_invoice_data;

Summary
Fact Table: invoice_facts for transactions.
Dimension Tables: product_dimension for product details and customer_dimension for customer details.
Relationships: Establish connections between the fact and dimension tables based on keys.
ETL Process: Extract data into a staging table, transform it to populate dimension tables, and load the final facts into the fact table.
