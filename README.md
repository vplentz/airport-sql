# Kayak Take Home SQL Exercise

## Assignment description

Using the data sets provided here https://www.kaggle.com/usdot/flight-delays please provide
the DDL necessary to create tables for storing the 3 data sets.


Assuming you’ve loaded the data into 3 tables, please write SQL to answer following questions:
* Busiest day of the week
* Busiest airport
* Busiest state (most flights with either an origin or destination in the state)
* Busiest state (most flights with both an origin and destination in the state)

## First Step before running:
Download the data and paste into raw_data/.
```
kayak-airports-sql
|---- /raw_data
|-------- /raw_data/airlines.csv
|-------- /raw_data/airports.csv
|-------- /raw_data/flights.csv
```

## Infraestructure requirements:
* Docker;
* Docker-Compose;

## Lifting the infraestructure:
The local infrastructure is a MySQL Server and a connected web admin.

* To start the services with views containing the exercise answers run ```./start_services_with_views.sh```.
* To start the services without views (and wait for each exercies query every time you run them) ```./start_services_with_views.sh```.


When you start the services using the above commands the following happens:
* tables are created;
* the data inserted into db;
* (Optionally) views with the query answers of each exercise are created and results are shown.

## Shuting down the infraestrucure:
To shut down the infraestructure run ```docker-compose down```

## Running the exercices SQLs:
It's possible to run the exercises SQLs using the Admin or inside the MySQL container.

### Using the Admin:

With the admin is possible to do some exploration in the tables (but you probably would be better of using Workbench or MySQL Client);
* Access http://localhost:8080 username root password example;
* Click into "SQL command";
* Copy and Run the desired SQL Query;

### Using the MySQL container:
* Get inside the container ```docker exec -it kayak-airports-sql_db_1 bash```;
* Run ```mysql -uroot -p domestic_flights```;
* Copy and Run the desired SQL query;

### SQL Queries for each exercise:
* Busiest day of the week = ```busiest_day_of_the_week.sql```
* Busiest airport = ```busiest_airport.sql```
* Busiest state (most flights with either an origin or destination in the state) = ```busiest_state.sql```
* Busiest state (most flights with both an origin and destination in the state) = ```busiest_state_regional_flights.sql```

**Example running those queries:**
```bash
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights < sqls/exercises/busiest_day_of_week.sql"
```


### Using the Materialized Views:
In my enviroment using Docker some queries are taking to long, so I've created Materialized Views (tables with the query result for top 10 busiest of each exerciese) when the services are started;
Views for each exercise:
* Busiest day of the week = ```busiest_day_of_the_week_mv```
* Busiest airport = ```busiest_airport_mv```
* Busiest state (most flights with either an origin or destination in the state) = ```busiest_state_mv_```
* Busiest state (most flights with both an origin and destination in the state) = ```busiest_state_regional_flights_mv```

**Example selecting from those views:**
```bash
docker exec kayak-airports-sql_db_1 sh -c "mysql -uroot -pexample domestic_flights -e 'SELECT * FROM busiest_state_mv'"
```
If you want only the first one then add ```LIMIT 1``` to the end of the SQL query.
