1. Stored Procedure to Populate Customer Dimension Table

CREATE OR REPLACE PROCEDURE populate_customer_dimension()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN
    INSERT INTO e_commerce_db.dimensions.customer_dimension (customer_id, country)
    SELECT DISTINCT
        CustomerID AS customer_id,
        Country
    FROM
        e_commerce_db.raw.raw_invoices
    WHERE
        CustomerID IS NOT NULL;

    RETURN 'Customer dimension table populated successfully';
END;
$$;




2. Stored Procedure to Populate Product Dimension Table

CREATE OR REPLACE PROCEDURE populate_product_dimension()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN
    INSERT INTO e_commerce_db.dimensions.product_dimension (stock_code, description, unit_price)
    SELECT DISTINCT
        StockCode AS stock_code,
        Description AS description,
        UnitPrice AS unit_price
    FROM
        e_commerce_db.raw.raw_invoices
    WHERE
        StockCode IS NOT NULL;

    RETURN 'Product dimension table populated successfully';
END;
$$;



3. Stored Procedure to Populate Time Dimension Table

CREATE OR REPLACE PROCEDURE populate_time_dimension()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN
    INSERT INTO e_commerce_db.dimensions.time_dimension (time_id, date, month, quarter, year)
    SELECT DISTINCT
        TO_CHAR(InvoiceDate, 'YYYY-MM-DD') AS time_id,
        InvoiceDate AS date,
        EXTRACT(MONTH FROM InvoiceDate) AS month,
        EXTRACT(QUARTER FROM InvoiceDate) AS quarter,
        EXTRACT(YEAR FROM InvoiceDate) AS year
    FROM
        e_commerce_db.raw.raw_invoices
    WHERE
        InvoiceDate IS NOT NULL;

    RETURN 'Time dimension table populated successfully';
END;
$$;



4. Stored Procedure to Populate Sales Fact Table

CREATE OR REPLACE PROCEDURE populate_sales_fact()
RETURNS STRING
LANGUAGE SQL
AS
$$
BEGIN
    INSERT INTO e_commerce_db.facts.sales_fact (invoice_no, stock_code, customer_id, time_id, quantity, unit_price, total_amount)
    SELECT
        InvoiceNo AS invoice_no,
        StockCode AS stock_code,
        CustomerID AS customer_id,
        TO_CHAR(InvoiceDate, 'YYYY-MM-DD') AS time_id,
        Quantity AS quantity,
        UnitPrice AS unit_price,
        Quantity * UnitPrice AS total_amount
    FROM
        e_commerce_db.raw.raw_invoices
    WHERE
        InvoiceNo IS NOT NULL AND
        StockCode IS NOT NULL AND
        CustomerID IS NOT NULL AND
        InvoiceDate IS NOT NULL;

    RETURN 'Sales fact table populated successfully';
END;
$$;


Execution of Stored Procedures
After creating these stored procedures, you can call them in sequence to populate your Data Warehouse:

CALL populate_customer_dimension();
CALL populate_product_dimension();
CALL populate_time_dimension();
CALL populate_sales_fact();


Summary
Customer Dimension: Populates unique customers based on CustomerID and Country.
Product Dimension: Populates unique products based on StockCode and Description.
Time Dimension: Extracts and stores date-related information from InvoiceDate.
Sales Fact Table: Stores transactional data along with calculated total amounts.
