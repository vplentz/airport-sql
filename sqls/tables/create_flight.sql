CREATE TABLE FLIGHT (
    YEAR INTEGER,
    MONTH INTEGER,
    DAY INTEGER,
    DAY_OF_WEEK INTEGER,
    AIRLINE VARCHAR(50),
    FLIGHT_NUMBER INTEGER,
    TAIL_NUMBER VARCHAR(50),
    ORIGIN_AIRPORT VARCHAR(50),
    DESTINATION_AIRPORT VARCHAR(50),
    SCHEDULED_DEPARTURE NUMERIC,
    DEPARTURE_TIME VARCHAR(25),
    DEPARTURE_DELAY VARCHAR(25),
    TAXI_OUT VARCHAR(25),
    WHEELS_OFF VARCHAR(25),
    SCHEDULED_TIME VARCHAR(25),
    ELAPSED_TIME VARCHAR(25),
    AIR_TIME VARCHAR(25),
    DISTANCE VARCHAR(25),
    WHEELS_ON VARCHAR(25),
    TAXI_IN VARCHAR(25),
    SCHEDULED_ARRIVAL VARCHAR(25),
    ARRIVAL_TIME VARCHAR(25),
    ARRIVAL_DELAY VARCHAR(25),
    DIVERTED NUMERIC,
    CANCELLED NUMERIC,
    CANCELLATION_REASON VARCHAR(50),
    AIR_SYSTEM_DELAY VARCHAR(25),
    SECURITY_DELAY VARCHAR(25),
    AIRLINE_DELAY VARCHAR(25),
    LATE_AIRCRAFT_DELAY VARCHAR(25),
    WEATHER_DELAY VARCHAR(25)
);
