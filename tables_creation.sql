CREATE TABLE traffic_accidents (
    accident_id VARCHAR(50),
    date_time DATETIME,
    location VARCHAR(100),
    weather_condition VARCHAR(50),
    road_condition VARCHAR(100),
    vehicle_type VARCHAR(50),
    accident_severity VARCHAR(50),
    number_of_vehicles INT,
    casualties INT,
    traffic_density VARCHAR(50)
);

CREATE TABLE traffic_sensors (
    sensor_id VARCHAR(50),
    location VARCHAR(100),
    date_time DATETIME,
    vehicle_count INT,
    average_speed INT,
    congestion_level VARCHAR(50)
);