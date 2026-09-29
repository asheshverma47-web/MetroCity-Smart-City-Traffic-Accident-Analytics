import pandas as pd
import pymysql

print("STEP 1")

conn = pymysql.connect(
    host="localhost",
    user="root",
    password="ashesh2708",
    database="smart_city_traffic_dw"
)

print("STEP 2")

# Load Accident Data
acc_df = pd.read_csv("traffic_accident_data.csv")

acc_df.columns = [
    "accident_id",
    "date_time",
    "location",
    "weather_condition",
    "road_condition",
    "vehicle_type",
    "accident_severity",
    "number_of_vehicles",
    "casualties",
    "traffic_density"
]

acc_df["date_time"] = pd.to_datetime(
    acc_df["date_time"],
    errors="coerce"
)

print("STEP 3")

# Load Sensor Data
sensor_df = pd.read_csv("road_traffic_sensor_data.csv")

sensor_df.columns = [
    "sensor_id",
    "location",
    "date_time",
    "vehicle_count",
    "average_speed",
    "congestion_level"
]

sensor_df["date_time"] = pd.to_datetime(
    sensor_df["date_time"],
    errors="coerce"
)

print("STEP 4")

cursor = conn.cursor()

# Clear tables before loading
cursor.execute("DELETE FROM stg_accidents")
cursor.execute("DELETE FROM stg_traffic_sensor")

# Insert Accident Data
for _, row in acc_df.iterrows():
    cursor.execute("""
        INSERT INTO stg_accidents
        VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
    """, tuple(row))

# Insert Sensor Data
for _, row in sensor_df.iterrows():
    cursor.execute("""
        INSERT INTO stg_traffic_sensor
        VALUES (%s,%s,%s,%s,%s,%s)
    """, tuple(row))

conn.commit()

print("STEP 5")
print("Data Loaded Successfully!")

cursor.close()
conn.close()