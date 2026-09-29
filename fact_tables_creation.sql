CREATE TABLE fact_accident (
    accident_fact_key INT PRIMARY KEY AUTO_INCREMENT,

    date_key INT,
    time_key INT,
    weather_key INT,
    road_condition_key INT,
    vehicle_type_key INT,

    accident_id VARCHAR(50),
    location VARCHAR(100),
    casualties INT,
    number_of_vehicles INT,
    accident_severity VARCHAR(50),
    traffic_density VARCHAR(50),

    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (time_key) REFERENCES dim_time(time_key),
    FOREIGN KEY (weather_key) REFERENCES dim_weather(weather_key),
    FOREIGN KEY (road_condition_key) REFERENCES dim_road_condition(road_condition_key),
    FOREIGN KEY (vehicle_type_key) REFERENCES dim_vehicle_type(vehicle_type_key)
);




CREATE TABLE fact_traffic (
    traffic_fact_key INT PRIMARY KEY AUTO_INCREMENT,

    date_key INT,
    time_key INT,

    sensor_id VARCHAR(50),
    location VARCHAR(100),
    vehicle_count INT,
    average_speed INT,
    congestion_level VARCHAR(50),

    FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    FOREIGN KEY (time_key) REFERENCES dim_time(time_key)
);