#!/bin/bash
./start_services.sh

echo $"Creating Tables (Materialized Views)"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/views/create_busiest_day_of_week_mv.sql"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/views/create_busiest_airport_mv.sql"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/views/create_busiest_state_mv.sql"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/views/create_busiest_state_regional_flights_mv.sql"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights -e 'SHOW TABLES';"

echo $"INSERTING DATA INTO VIEWS:"

echo $"Inserting into busiest_day_of_week_mv"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/views/insert_busiest_day_of_week.sql"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights -e 'SELECT * FROM busiest_day_of_week_mv LIMIT 1'"

echo $"Inserting into busiest_airport_mv (another coffee please)"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/views/insert_busiest_airport.sql"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights -e 'SELECT * FROM busiest_airport_mv LIMIT 1'"

echo $"Inserting data into busiest_state_mv"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/views/insert_busiest_state.sql"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights -e 'SELECT * FROM busiest_state_mv LIMIT 1'"

echo "Inserting data into busiest_state_regional_flights_mv"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/views/insert_busiest_state_regional_flights.sql"
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights -e 'SELECT * FROM busiest_state_regional_flights_mv LIMIT 1'"
