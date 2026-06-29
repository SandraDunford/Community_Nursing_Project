SELECT
    TRIM(area) AS area,

    TRIM(country) AS country,

    sex,

    age,

    pop_2001,
    pop_2002,
    pop_2003,
    pop_2004,
    pop_2005,
    pop_2006,
    pop_2007,
    pop_2008,
    pop_2009,
    pop_2010,
    pop_2011,
    pop_2012,
    pop_2013,
    pop_2014,
    pop_2015,
    pop_2016,
    pop_2017,
    pop_2018

FROM {{ source('raw', 'ons_population') }}