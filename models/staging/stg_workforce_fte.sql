SELECT
    TRIM(region) AS region,

    TRIM(trust) AS trust,

    year_2009,
    year_2010,
    year_2011,
    year_2012,
    year_2013,
    year_2014,
    year_2015,
    year_2016,
    year_2017,
    year_2018

FROM {{ source('raw', 'workforce_fte') }}