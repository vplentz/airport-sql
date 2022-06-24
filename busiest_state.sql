WITH busiest_airport AS (
SELECT
    AIRPORT.STATE,
    COUNT(*) NUMBER_OF_FLIGHTS
FROM
    AIRPORT AS AIRPORT
    INNER JOIN FLIGHT AS FLIGHT ON (AIRPORT.IATA_CODE = FLIGHT.ORIGIN_AIRPORT)
    OR (AIRPORT.IATA_CODE = FLIGHT.DESTINATION_AIRPORT)
GROUP BY
    AIRPORT.STATE
ORDER BY
    COUNT(*) DESC)

SELECT * FROM busiest_airport LIMIT 1;