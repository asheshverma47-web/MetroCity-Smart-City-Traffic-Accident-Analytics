CREATE TABLE dim_date (
    date_key INT PRIMARY KEY AUTO_INCREMENT,
    full_date DATE,
    day_num INT,
    month_num INT,
    month_name VARCHAR(20),
    quarter_num INT,
    year_num INT
);

CREATE TABLE dim_time (
    time_key INT PRIMARY KEY AUTO_INCREMENT,
    hour_num INT,
    part_of_day VARCHAR(20)
);

CREATE TABLE dim_weather (
    weather_key INT PRIMARY KEY AUTO_INCREMENT,
    weather_condition VARCHAR(50)
);

CREATE TABLE dim_road_condition (
    road_condition_key INT PRIMARY KEY AUTO_INCREMENT,
    road_condition VARCHAR(50)
);

CREATE TABLE dim_vehicle_type (
    vehicle_type_key INT PRIMARY KEY AUTO_INCREMENT,
    vehicle_type VARCHAR(50)
);

