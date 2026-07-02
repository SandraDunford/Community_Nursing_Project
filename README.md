




Python Data Loader
Overview

To automate the ingestion of source data into the data warehouse, a reusable Python loader was developed to replace the manual upload of CSV files into Snowflake. This forms the first stage of the ELT pipeline by loading source data into the RAW schema before any transformations are performed by dbt.

The loader is designed to be reusable, secure, and easily maintainable, allowing all source datasets to be refreshed with a single command.

Objectives

The Python loader was developed to:

Automate the loading of all source CSV files.
Eliminate repetitive manual uploads through the Snowflake interface.
Ensure the raw layer can be recreated consistently at any time.
Demonstrate Python-based ETL/ELT automation as part of the project portfolio.
Follow modern data engineering practices by separating configuration from application code.
Solution Architecture

The loader consists of three Python modules:

config.py

Responsible for:

Loading environment variables from a .env file.
Managing Snowflake connection settings.
Defining project folder locations.
Automatically identifying the project root.
Creating required folders (such as the logs directory).

Separating configuration from application logic improves maintainability and prevents credentials being hard-coded within the application.

snowflake_loader.py

Implements the SnowflakeLoader class, responsible for:

Establishing a connection to Snowflake.
Discovering all CSV files within the project Data/csv folder.
Automatically deriving the destination table name from each filename.
Truncating existing data within the destination raw table.
Uploading each CSV using Snowflake's PUT command.
Loading data using Snowflake's high-performance COPY INTO command.
Closing the database connection once processing is complete.

Using the Snowflake Python Connector enables the loader to communicate directly with Snowflake without requiring manual interaction through the web interface.

load_raw_tables.py

Acts as the orchestration layer for the ingestion process.

The script:

Connects to Snowflake.
Discovers all CSV files.
Iterates through every source file.
Loads each dataset into its corresponding raw table.
Stops immediately if any table fails to load.
Closes the Snowflake connection regardless of success or failure.

This fail-fast approach prevents partial data loads and makes errors immediately visible.

Security

Sensitive connection information is stored within a .env file rather than embedded in the Python source code.

The loader reads:

Snowflake account
Username
Password
Warehouse
Database
Schema

This approach follows standard software engineering practice and ensures credentials are excluded from version control.

Loading Strategy

Each execution performs a complete refresh of the raw layer.

For every CSV file the loader:

Determines the target table from the filename.
Executes a TRUNCATE TABLE command.
Uploads the CSV to the table stage using PUT.
Executes COPY INTO to bulk load the data.
Moves to the next dataset only if the current load succeeds.

Bulk loading via PUT and COPY INTO was selected because it represents Snowflake's recommended approach for efficiently loading flat files.

Error Handling

The loader follows a fail-fast design.

If any dataset fails to load:

processing stops immediately;
the exception is displayed in the terminal;
the Snowflake connection is closed cleanly;
previously loaded datasets remain successfully refreshed.

This behaviour prevents downstream transformations from running against an inconsistent raw layer.

Project Structure
Community Nursing Project/
│
├── Data/
│   └── csv/
│       ├── dn_age.csv
│       ├── dn_referrals.csv
│       └── ...
│
├── loaders/
│   ├── config.py
│   ├── snowflake_loader.py
│   └── load_raw_tables.py
│
├── .env
├── models/
├── seeds/
└── dbt_project.yml
Outcome

The completed solution successfully automates the ingestion of all 23 Community Nursing source datasets into Snowflake.

The loader:

automatically discovers all source files;
securely authenticates with Snowflake;
refreshes every raw table;
performs bulk loading using Snowflake best practices;
requires only a single command to execute.

This significantly reduces manual effort while providing a repeatable and scalable ingestion process suitable for analytics engineering workflows.
