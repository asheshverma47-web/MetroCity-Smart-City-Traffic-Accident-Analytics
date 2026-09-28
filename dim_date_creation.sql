CREATE TABLE dim_date (
    date_id INT AUTO_INCREMENT PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    month_name VARCHAR(20),
    quarter_no INT
);

INSERT INTO dim_date
(full_date, year, month, month_name, quarter_no)

SELECT DISTINCT
DATE(date_time),
YEAR(date_time),
MONTH(date_time),
MONTHNAME(date_time),
QUARTER(date_time)
FROM traffic_accidents;

SELECT COUNT(*) FROM dim_date;