INSERT INTO dim_date
(
    full_date,
    day_num,
    month_num,
    month_name,
    quarter_num,
    year_num
)
SELECT DISTINCT
    DATE(date_time),
    DAY(date_time),
    MONTH(date_time),
    MONTHNAME(date_time),
    QUARTER(date_time),
    YEAR(date_time)
FROM stg_accidents;


INSERT INTO dim_time
(
    hour_num,
    part_of_day
)
SELECT DISTINCT
    HOUR(date_time),

    CASE
        WHEN HOUR(date_time) BETWEEN 0 AND 5 THEN 'Night'
        WHEN HOUR(date_time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN HOUR(date_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END

FROM stg_accidents;

INSERT INTO dim_weather (weather_condition)
SELECT DISTINCT weather_condition
FROM stg_accidents;

INSERT INTO dim_road_condition (road_condition)
SELECT DISTINCT road_condition
FROM stg_accidents;

INSERT INTO dim_vehicle_type (vehicle_type)
SELECT DISTINCT vehicle_type
FROM stg_accidents;

