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


