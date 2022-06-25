INSERT INTO
    busiest_state_regional_trips_mv
SELECT
    ORIGIN_AIRPORT.STATE,
    COUNT(*) AS NUMBER_OF_FLIGHTS
FROM
    FLIGHT AS FLIGHT
    INNER JOIN AIRPORT AS ORIGIN_AIRPORT ON FLIGHT.ORIGIN_AIRPORT = ORIGIN_AIRPORT.IATA_CODE
    INNER JOIN AIRPORT AS DEST_AIPORT ON FLIGHT.DESTINATION_AIRPORT = DEST_AIPORT.IATA_CODE
WHERE
    ORIGIN_AIRPORT.STATE = DEST_AIPORT.STATE
GROUP BY
    ORIGIN_AIRPORT.STATE
ORDER BY
    COUNT(*) DESC;