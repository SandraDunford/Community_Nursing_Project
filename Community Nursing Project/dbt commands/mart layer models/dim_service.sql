{{ config(materialized='table') }}

SELECT *

FROM {{ source('lookup','service_lookup') }}