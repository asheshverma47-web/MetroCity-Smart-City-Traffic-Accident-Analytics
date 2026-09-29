INSERT INTO fact_accident
(
    date_key,
    time_key,
    weather_key,
    road_condition_key,
    vehicle_type_key,
    accident_id,
    location,
    casualties,
    number_of_vehicles,
    accident_severity,
    traffic_density
)
SELECT

    dd.date_key,
    dt.time_key,
    dw.weather_key,
    dr.road_condition_key,
    dv.vehicle_type_key,

    sa.accident_id,
    sa.location,
    sa.casualties,
    sa.number_of_vehicles,
    sa.accident_severity,
    sa.traffic_density

FROM stg_accidents sa

JOIN dim_date dd
ON DATE(sa.date_time) = dd.full_date

JOIN dim_time dt
ON HOUR(sa.date_time) = dt.hour_num

JOIN dim_weather dw
ON sa.weather_condition = dw.weather_condition

JOIN dim_road_condition dr
ON sa.road_condition = dr.road_condition

JOIN dim_vehicle_type dv
ON sa.vehicle_type = dv.vehicle_type;


INSERT INTO fact_traffic
(
    date_key,
    time_key,
    sensor_id,
    location,
    vehicle_count,
    average_speed,
    congestion_level
)
SELECT

    dd.date_key,
    dt.time_key,

    sts.sensor_id,
    sts.location,
    sts.vehicle_count,
    sts.average_speed,
    sts.congestion_level

FROM stg_traffic_sensor sts

JOIN dim_date dd
ON DATE(sts.date_time) = dd.full_date

JOIN dim_time dt
ON HOUR(sts.date_time) = dt.hour_num;

