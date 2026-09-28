import pandas as pd
import pymysql

print("STEP 1")

conn = pymysql.connect(
    host="localhost",
    user="root",
    password="ashesh2708",
    database="smart_city_db"
)

print("STEP 2")

# Accident Data
accident_df = pd.read_csv(
    r"C:\Smart_City_Project\Data\traffic_accident_data.csv"
)

accident_df.columns = [
    'accident_id',
    'date_time',
    'location',
    'weather_condition',
    'road_condition',
    'vehicle_type',
    'accident_severity',
    'number_of_vehicles',
    'casualties',
    'traffic_density'
]

accident_df['date_time'] = pd.to_datetime(
    accident_df['date_time']
)

print("STEP 3")

accident_df.to_sql = None

cursor = conn.cursor()

for _, row in accident_df.iterrows():
    cursor.execute("""
    INSERT INTO traffic_accidents
    VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
    """, tuple(row))

conn.commit()

print("STEP 4")

sensor_df = pd.read_csv(
    r"C:\Smart_City_Project\Data\road_traffic_sensor_data.csv"
)

sensor_df.columns = [
    'sensor_id',
    'location',
    'date_time',
    'vehicle_count',
    'average_speed',
    'congestion_level'
]

sensor_df['date_time'] = pd.to_datetime(
    sensor_df['date_time']
)

for _, row in sensor_df.iterrows():
    cursor.execute("""
    INSERT INTO traffic_sensors
    VALUES (%s,%s,%s,%s,%s,%s)
    """, tuple(row))

conn.commit()

print("STEP 5")
print("Data Loaded Successfully!")

cursor.close()
conn.close()