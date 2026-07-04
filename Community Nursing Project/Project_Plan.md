Community Nursing Analytics Engineering Project Plan

Project Goal

Create an end-to-end analytics engineering project that demonstrates how community nursing operational data can be transformed into a reporting-ready analytics dataset using modern data tooling.

Target Skills

* Snowflake
        * Datebase creation
        * Schemas
        * Tables
        * Views
        * Loading data
        * Date warehouse concepts
        * Data security
        * Query optimisation
    
    Deliverables
        * Working Snowflake environment
        * Structured warehouse
        * Loaded healthcare dataset

* dbt
        * Sources
        * Models
        * Materialisations
        * Tests
        * Documentation
        * Snapshots
        * Macros
    
    Deliverables
        * Fully documented dby project
        * Automated transformations
        * Data quality tests

* Git & GitHub

        * Repository management
        * Commits
        * Branches
        * Pull requests
        * Merge conflicts
        * Documentation

    Deliverables
        * Regular commit history
        * Version-controlled documentation
        * Feature branches

Proposed Pipeline

    Raw Data
        * Community Nursing Datasets
        * Community EOL datasets
        * Community wound care datasets
        * ONS population data
        * .Gov levels of deprivation data
        * NHS workforce statistics

    Staging Layer
        * Rename columns
        * Standardise formats
        * Correct data types
        * Remove duplicates

    Intermediate Layer
        * Join datasets
        * Derive metrics
        * Calculate activity measures

    Analytics Mart Layer
        FACT TABLES
        fact_visits
        fact_referrals
        DIM TABLES
        dim_date
        dim_nurse
        dim_team
        dim_patient
        output - star schema ready for reporting

    

    