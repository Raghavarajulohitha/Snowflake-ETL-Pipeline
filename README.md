# Snowflake-ETL-Pipeline
This project will walk you through building an end-to-end data pipeline from an external data source into Snowflake, transforming the data, and loading it into Snowflake's Data Warehouse.


**Project Title: Building an ETL Pipeline in Snowflake**

**Project Overview:**
The goal of this project is to build an automated ETL (Extract, Transform, Load) pipeline using Snowflake to integrate data from an external source (e.g., CSV file,Oracle, Sql server, REST API (heterogenous data sources), transform it, and load it into a Snowflake Data Warehouse. The process will use cloud-native tools such as Snowflake, and SQL for data transformation.

**Phase 1**
Requirements Gathering & Analysis

**Phase 2**
ETL pipeline Design

**Phase 3**
Snowflake Data Model Design 

**Phase 4**
Job Creation and Scheduling

**Phase 5**
Data Validation and testing

**Phase 6**
Deployment and Monitoring

**Note: **Document the ETL pipeline, including source-to-target mappings, transformation logic, and job dependencies.Prepare a documentation for running and maintaining the ETL pipeline


**Project Overview**

This ETL (Extract, Transform, Load) project aims to extract **e-commerce sales and customer data**, clean and transform it using SQL and Informatica IICS, integrate it into a Snowflake data warehouse hosted on AWS, and visualize insights with Tableau for advanced sales analytics and customer behavior insights.

**Technologies Used**

Oracle (for transactional data storage)
SQL (for data cleaning and transformation)
Informatica Intelligent Cloud Services (IICS) (for ETL and data integration)
Snowflake Data Warehouse (for cloud-based data storage and querying)
AWS Cloud (hosting platform for Snowflake)
POWER BI(for visualization and dashboarding)
Data Pipeline


**Data Pipeline Overview**

Data Extraction: Extract raw sales and customer data from Oracle and external CSV files.
Data Transformation: Clean, format, and enrich the data using SQL and Informatica IICS.
Data Loading: Load the transformed data into Snowflake using Snowpipe.
Visualization: Create interactive Poweer BI dashboards connected to Snowflake for real-time analytics.

**ETL Process**

Data Extraction: E-commerce sales and customer data is extracted from a Oracle database and supplementary CSV files.
Data Cleaning & Transformation: SQL scripts and Informatica IICS workflows are used for cleaning, transforming, and aggregating the data to meet business requirements.
Data Integration: Cleaned and transformed data is integrated into Snowflake via Informatica IICS, leveraging Snowpipe for continuous loading.
Visualization: Snowflake data is connected to Power BI to create insightful dashboards on sales trends, customer segmentation, and performance metrics.

