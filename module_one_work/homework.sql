select lpep_pickup_datetime from green_taxi_data

where trip_distance=( select max(trip_distance) from green_taxi_data)


SELECT 
    SUM(CASE WHEN trip_distance <= 1 THEN 1 ELSE 0 END) AS "Up to 1 mile",
    SUM(CASE WHEN trip_distance > 1 AND trip_distance <= 3 THEN 1 ELSE 0 END) AS "1 to 3 miles",
    SUM(CASE WHEN trip_distance > 3 AND trip_distance <= 7 THEN 1 ELSE 0 END) AS "3 to 7 miles",
    SUM(CASE WHEN trip_distance > 7 AND trip_distance <= 10 THEN 1 ELSE 0 END) AS "7 to 10 miles",
    SUM(CASE WHEN trip_distance > 10 THEN 1 ELSE 0 END) AS "Over 10 miles"
FROM green_taxi_data
WHERE lpep_pickup_datetime >= '2019-10-01 00:00:00' AND lpep_pickup_datetime < '2019-11-01 00:00:00';


SELECT t."Zone"
FROM taxi_zone_lookup as t
INNER JOIN green_taxi_data as g
ON t."LocationID" = g."PULocationID"
WHERE DATE(g.lpep_pickup_datetime)= '2019-10-18'
GROUP BY t."Zone"
HAVING SUM(g.total_amount) > 13000;



SELECT t."Zone"
FROM taxi_zone_lookup AS t
INNER JOIN green_taxi_data AS g
ON t."LocationID" = g."DOLocationID"
WHERE DATE(g."lpep_pickup_datetime") BETWEEN '2019-10-01' AND '2019-10-31'
AND g."PULocationID" = (SELECT "LocationID" FROM taxi_zone_lookup WHERE "Zone" = 'East Harlem North')
ORDER BY g."tip_amount" DESC
LIMIT 1;
