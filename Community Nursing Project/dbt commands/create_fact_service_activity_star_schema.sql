-- Star schema design for community nursing service activity
-- Fact table: fact_service_activity
-- Dimension tables: dim_organisation, dim_age, dim_service, dim_geography, dim_date

CREATE OR REPLACE TABLE analytics.dim_organisation (
    organisation_key NUMBER(38,0) PRIMARY KEY,
    org_code VARCHAR(50) NOT NULL,
    org_name VARCHAR(255) NOT NULL,
    trust VARCHAR(255),
    region VARCHAR(255)
);

CREATE OR REPLACE TABLE analytics.dim_age (
    age_key NUMBER(38,0) PRIMARY KEY,
    age_group VARCHAR(100) NOT NULL
);

CREATE OR REPLACE TABLE analytics.dim_service (
    service_key NUMBER(38,0) PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL
);

CREATE OR REPLACE TABLE analytics.dim_geography (
    geography_key NUMBER(38,0) PRIMARY KEY,
    local_authority VARCHAR(255) NOT NULL,
    imd_decile NUMBER(38,0),
    population NUMBER(38,0),
    workforce NUMBER(38,0)
);

CREATE OR REPLACE TABLE analytics.dim_date (
    date_key NUMBER(38,0) PRIMARY KEY,
    full_date DATE NOT NULL,
    year_number NUMBER(38,0) NOT NULL,
    month_number NUMBER(38,0) NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    quarter_number NUMBER(38,0) NOT NULL
);

CREATE OR REPLACE TABLE analytics.fact_service_activity (
    organisation_key NUMBER(38,0) NOT NULL,
    age_key NUMBER(38,0) NOT NULL,
    service_key NUMBER(38,0) NOT NULL,
    geography_key NUMBER(38,0) NOT NULL,
    date_key NUMBER(38,0) NOT NULL,
    patients NUMBER(38,0),
    referrals NUMBER(38,0),
    contacts NUMBER(38,0),
    CONSTRAINT fk_fact_service_activity_org
        FOREIGN KEY (organisation_key) REFERENCES analytics.dim_organisation(organisation_key),
    CONSTRAINT fk_fact_service_activity_age
        FOREIGN KEY (age_key) REFERENCES analytics.dim_age(age_key),
    CONSTRAINT fk_fact_service_activity_service
        FOREIGN KEY (service_key) REFERENCES analytics.dim_service(service_key),
    CONSTRAINT fk_fact_service_activity_geo
        FOREIGN KEY (geography_key) REFERENCES analytics.dim_geography(geography_key),
    CONSTRAINT fk_fact_service_activity_date
        FOREIGN KEY (date_key) REFERENCES analytics.dim_date(date_key)
);

-- Relationship summary:
-- fact_service_activity.organisation_key -> dim_organisation.organisation_key
-- fact_service_activity.age_key -> dim_age.age_key
-- fact_service_activity.service_key -> dim_service.service_key
-- fact_service_activity.geography_key -> dim_geography.geography_key
-- fact_service_activity.date_key -> dim_date.date_key
