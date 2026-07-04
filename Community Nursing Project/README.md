Community Nursing Analytics Engineering Project

Overview

This project demonstrates the design and implementation of a modern healthcare analytics pipeline using cloud data warehousing and analytics engineering principles.

The project uses community nursing data to build a scalable analytics solution that transforms raw operational data intro trusted reporting and visualisation-ready datasets suitable for service improvement, workforce planning, and performance monitoring.

The solution is being developed using:

* Snowflake (Cloud Data Warehouse)
* dbt (Data Transformation)
* SQL
* Git & GitHub
* Healthcare Analytics Principles

Project Objectives

The project aimgs to 
* Build a healthcare-focused analytics engineering portfolio piece
* Design a dimensional data model suitable for reporting
* Implement a layered data architecture
* Apply analytics engineering best practice
* Produce reporting and visualisation-ready datasets and KPIs
* Demonstrate version control and documentation standards

## Architecture Overview

This project follows a layered analytics engineering approach that transforms operational community nursing data into a reporting-ready dimensional model.

1. Raw Layer
   - Stores source data from district nursing, end of life, and wound care activity.
   - Includes reference lookup data such as organisation, service, and deprivation information.

2. Staging Layer
   - Standardises incoming data into a consistent format.
   - Applies data type corrections, naming conventions, and basic cleaning steps.

3. Intermediate Layer
   - Unifies service-specific activity into a common structure.
   - Prepares activity measures such as patients, referrals, and contacts for analysis.

4. Mart Layer
   - Builds a star schema for reporting and dashboard consumption.
   - Uses dimensions for organisation, age, service, and geography, linked to a central fact table.

The target model is centred on the fact table, fact_service_activity, which is supported by the dimensions dim_organisation, dim_age, dim_service, and dim_geography.




Author
Sandra Dunford
Healthcare Analytics Engineer Portfolio Project