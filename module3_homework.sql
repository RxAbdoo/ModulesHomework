-- Q1
SELECT *  FROM `dataeng-440211.nytaxi.yellow_tripdata_2024`;

-- Q2
SELECT DISTINCT COUNT(PULocationID) FROM `nytaxi.yellow_tripdata_2024`;

-- Q4

SELECT COUNT(1) FROM `nytaxi.yellow_tripdata_2024`

WHERE fare_amount=0;

-- Q5

CREATE OR REPLACE TABLE `nytaxi.yellow_tripdata_partitioned_clusterd`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID
AS
SELECT * 
FROM `nytaxi.yellow_tripdata_2024`;



-- Q6

SELECT DISTINCT VendorID FROM `nytaxi.yellow_tripdata_2024`

WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';



SELECT DISTINCT VendorID FROM `nytaxi.yellow_tripdata_partitioned_clusterd`

WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';


/* Question 9  it will read the whole table because it is an external table & will read 2.72 GB */
SELECT *  FROM `dataeng-440211.nytaxi.yellow_tripdata_2024`; 


