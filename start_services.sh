#!/bin/bash
echo "Starting the MySQL Service with Docker"
docker-compose up --build -d

echo "Waiting services to init (20 seconds)"
sleep 20

echo "Creating the Database"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample < sqls/database_setup.sql"


echo "Creating Tables"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/tables/create_airline.sql"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/tables/create_airport.sql"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/tables/create_flight.sql"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights -e 'SHOW TABLES';"

echo "Loading airport data"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/load/airport_data.sql"

echo "Loading airline data"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/load/airline_data.sql"

echo "Loading flight data (this may take some minutes, go grab a coffee)"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/load/flight_data.sql"