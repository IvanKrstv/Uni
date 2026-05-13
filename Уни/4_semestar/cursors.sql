-- Search fly by destination
CREATE OR REPLACE PROCEDURE SEARCH_FLIGHT_BY_DEST
(v_city_name DESTINATION.CITY_NAME%type)
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Flights to ' || v_city_name);
    DECLARE
    CURSOR FLIGHT_TO_CURSOR IS
        SELECT
            f.FLIGHT_DATE,
            d_from.CITY_NAME as FROM_CITY,
            d_to.CITY_NAME as TO_CITY,
            f.PRICE,
            m.MODEL_NAME,
            c.COMPANY_NAME
        FROM
            FLIGHT f
                JOIN
            DESTINATION d_from
            ON
                f.FROM_DESTINATION_ID = d_from.DESTINATION_ID
                JOIN
            DESTINATION d_to
            ON
                f.TO_DESTINATION_ID = d_to.DESTINATION_ID
                JOIN
            PLANE p
            ON
                p.PLANE_ID = f.PLANE_ID
                JOIN
            MODEL m
            ON
                m.MODEL_ID = p.MODEL_ID
                JOIN
            Company c
            ON
                c.COMPANY_ID = m.COMPANY_ID
        WHERE
            d_to.city_name = v_city_name
        ORDER BY f.FLIGHT_DATE;
    BEGIN
        FOR FLIGHT IN FLIGHT_TO_CURSOR
        LOOP
            DBMS_OUTPUT.PUT_LINE(FLIGHT.FLIGHT_DATE || ' | ' || FLIGHT.FROM_CITY || ' | ' || FLIGHT.TO_CITY || ' | ' || FLIGHT.PRICE || ' | ' || FLIGHT.MODEL_NAME || ' | ' || FLIGHT.COMPANY_NAME);
        end loop;
    end;
end;


BEGIN
    SEARCH_FLIGHT_BY_DEST('London');
end;



-- Search flight by date
CREATE OR REPLACE PROCEDURE SEARCH_FLIGHT_BY_DATE
(v_flight_date DATE)
    IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Flights on ' || v_flight_date);
    DECLARE
        CURSOR FLIGHT_ON_DATE_CURSOR IS
            SELECT
                f.FLIGHT_DATE,
                d_from.CITY_NAME as FROM_CITY,
                d_to.CITY_NAME as TO_CITY,
                f.PRICE,
                m.MODEL_NAME,
                c.COMPANY_NAME
            FROM
                FLIGHT f
                    JOIN
                DESTINATION d_from
                ON
                    f.FROM_DESTINATION_ID = d_from.DESTINATION_ID
                    JOIN
                DESTINATION d_to
                ON
                    f.TO_DESTINATION_ID = d_to.DESTINATION_ID
                    JOIN
                PLANE p
                ON
                    p.PLANE_ID = f.PLANE_ID
                    JOIN
                MODEL m
                ON
                    m.MODEL_ID = p.MODEL_ID
                    JOIN
                Company c
                ON
                    c.COMPANY_ID = m.COMPANY_ID
            WHERE
                TRUNC(f.flight_date) = v_flight_date
            ORDER BY f.FLIGHT_DATE;
    BEGIN
        FOR FLIGHT IN FLIGHT_ON_DATE_CURSOR
            LOOP
                DBMS_OUTPUT.PUT_LINE(FLIGHT.FLIGHT_DATE || ' | ' || FLIGHT.FROM_CITY || ' | ' || FLIGHT.TO_CITY || ' | ' || FLIGHT.PRICE || ' | ' || FLIGHT.MODEL_NAME || ' | ' || FLIGHT.COMPANY_NAME);
            end loop;
    end;
end;


BEGIN
    SEARCH_FLIGHT_BY_DATE(DATE '2025-07-01');
END;



-- Search fly by company
CREATE OR REPLACE PROCEDURE SEARCH_FLIGHT_BY_COMP
(v_company_name COMPANY.COMPANY_NAME%type)
    IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Flights from ' || v_company_name);
    DECLARE
        CURSOR FLIGHT_FROM_CURSOR IS
            SELECT
                f.FLIGHT_DATE,
                d_from.CITY_NAME as FROM_CITY,
                d_to.CITY_NAME as TO_CITY,
                f.PRICE,
                m.MODEL_NAME,
                c.COMPANY_NAME
            FROM
                FLIGHT f
                    JOIN
                DESTINATION d_from
                ON
                    f.FROM_DESTINATION_ID = d_from.DESTINATION_ID
                    JOIN
                DESTINATION d_to
                ON
                    f.TO_DESTINATION_ID = d_to.DESTINATION_ID
                    JOIN
                PLANE p
                ON
                    p.PLANE_ID = f.PLANE_ID
                    JOIN
                MODEL m
                ON
                    m.MODEL_ID = p.MODEL_ID
                    JOIN
                Company c
                ON
                    c.COMPANY_ID = m.COMPANY_ID
            WHERE
                c.COMPANY_NAME = v_company_name
            ORDER BY f.FLIGHT_DATE;
    BEGIN
        FOR FLIGHT IN FLIGHT_FROM_CURSOR
            LOOP
                DBMS_OUTPUT.PUT_LINE(FLIGHT.FLIGHT_DATE || ' | ' || FLIGHT.FROM_CITY || ' | ' || FLIGHT.TO_CITY || ' | ' || FLIGHT.PRICE || ' | ' || FLIGHT.MODEL_NAME || ' | ' || FLIGHT.COMPANY_NAME);
            end loop;
    end;
end;


BEGIN
    SEARCH_FLIGHT_BY_COMP('Boeing');
end;



-- Passengers on flight
CREATE OR REPLACE PROCEDURE PASSENGER_PER_FLIGHT
(v_from_city DESTINATION.CITY_NAME%type,
v_to_city DESTINATION.CITY_NAME%type,
v_flight_datetime FLIGHT.FLIGHT_DATE%type)
    IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Passengers on flight from ' || v_from_city || ' to ' || v_to_city || ' on ' || v_flight_datetime || ':');
    DECLARE
        CURSOR FLIGHT_FROM_CURSOR IS
            SELECT
                f.FLIGHT_DATE,
                d_from.CITY_NAME as FROM_CITY,
                d_to.CITY_NAME as TO_CITY,
                p.PASSPORT_ID,
                p.PASSENGER_NAME,
                s.SEAT_NAME,
                sc.SEAT_CLASS_NAME
            FROM
                Ticket t
                    JOIN
                FLIGHT f
                ON
                    t.FLIGHT_ID = f.FLIGHT_ID
                    JOIN
                DESTINATION d_from
                ON
                    f.FROM_DESTINATION_ID = d_from.DESTINATION_ID
                    JOIN
                DESTINATION d_to
                ON
                    f.TO_DESTINATION_ID = d_to.DESTINATION_ID
                    JOIN
                PASSENGER p
                ON
                    t.PASSENGER_ID = p.PASSENGER_ID
                    JOIN
                SEAT s
                ON
                    t.SEAT_ID = s.SEAT_ID
                    JOIN
                SEATCLASS sc
                ON
                    sc.SEAT_CLASS_ID = s.SEAT_CLASS_ID
            WHERE
                d_from.CITY_NAME = v_from_city
              AND d_to.CITY_NAME = v_to_city
              AND f.FLIGHT_DATE = v_flight_datetime
            ORDER BY p.PASSPORT_ID;
    BEGIN
        FOR FLIGHT IN FLIGHT_FROM_CURSOR
            LOOP
                DBMS_OUTPUT.PUT_LINE(FLIGHT.PASSPORT_ID || ' | ' || FLIGHT.PASSENGER_NAME || ' | ' || FLIGHT.SEAT_NAME || ' | ' || FLIGHT.SEAT_CLASS_NAME);
            end loop;
    end;
end;


BEGIN
    PASSENGER_PER_FLIGHT('Sofia', 'Paris', TIMESTAMP '2025-07-20 11:30:00');
end;



-- Occupancy of a flight
CREATE OR REPLACE PROCEDURE FLIGHTS_OCCUPANCY
    IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Flights occupancy:');
    DECLARE
        CURSOR FLIGHTS_OCCUPANCY_CURSOR IS
            SELECT
                (select f.FLIGHT_DATE from FLIGHT f where f.FLIGHT_ID = t.FLIGHT_ID) as FLIGHT_DATE,
                MAX(d_from.CITY_NAME) as FROM_CITY,
                MAX(d_to.CITY_NAME) as TO_CITY,
                MAX(m.MODEL_NAME) as MODEL,
                MAX(c.COMPANY_NAME) as COMPANY,
                COUNT(t.TICKET_ID) as SEATS_OCCUPIED,
                MAX(m.MODEL_CAPACITY) AS SEATS_CAPACITY
            FROM
                TICKET t
                    JOIN
                FLIGHT f
                ON
                    t.FLIGHT_ID = f.FLIGHT_ID
                    JOIN
                DESTINATION d_from
                ON
                    f.FROM_DESTINATION_ID = d_from.DESTINATION_ID
                    JOIN
                DESTINATION d_to
                ON
                    f.TO_DESTINATION_ID = d_to.DESTINATION_ID
                    JOIN
                PLANE p
                ON
                    p.PLANE_ID = f.PLANE_ID
                    JOIN
                MODEL m
                ON
                    m.MODEL_ID = p.MODEL_ID
                    JOIN
                Company c
                ON
                    c.COMPANY_ID = m.COMPANY_ID
            GROUP BY
                t.FLIGHT_ID
            ORDER BY
                (select f.FLIGHT_DATE from FLIGHT f where f.FLIGHT_ID = t.FLIGHT_ID);
    BEGIN
        FOR FLIGHT IN FLIGHTS_OCCUPANCY_CURSOR
            LOOP
                DBMS_OUTPUT.PUT_LINE(FLIGHT.FLIGHT_DATE || ' from ' || FLIGHT.FROM_CITY || ' to ' || FLIGHT.TO_CITY || ' with ' || FLIGHT.MODEL || ', ' || FLIGHT.COMPANY || ': ' || FLIGHT.SEATS_OCCUPIED || '/' || FLIGHT.SEATS_CAPACITY);
            end loop;
    end;
end;

BEGIN
    FLIGHTS_OCCUPANCY();
END;


-- Ticket revenue for a period of time
CREATE OR REPLACE PROCEDURE TICKET_REVENUE
(v_from_datetime FLIGHT.FLIGHT_DATE%type,
v_to_datetime FLIGHT.FLIGHT_DATE%type)
    IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Ticket revenue for the period from ' || v_from_datetime || ' to ' || v_to_datetime);
    DECLARE
        CURSOR TICKET_REVENUE_CURSOR IS
            SELECT
                COUNT(t.TICKET_ID) as TOTAL_TICKETS,
                SUM(f.PRICE + (sc.PERCENT_DISCOUNT / 100) * f.PRICE) AS TOTAL_REVENUE
            FROM
                TICKET t
                    JOIN
                FLIGHT f
                ON
                    t.FLIGHT_ID = f.FLIGHT_ID
                    JOIN
                SEAT s
                ON
                    t.SEAT_ID = s.SEAT_ID
                    JOIN
                SEATCLASS sc
                ON
                    s.SEAT_CLASS_ID = sc.SEAT_CLASS_ID
            WHERE
                f.FLIGHT_DATE BETWEEN v_from_datetime AND v_to_datetime;
    BEGIN
        FOR FLIGHT IN TICKET_REVENUE_CURSOR
            LOOP
                DBMS_OUTPUT.PUT_LINE('Total tickets sold: ' || FLIGHT.TOTAL_TICKETS || '; Total revenue: ' || FLIGHT.TOTAL_REVENUE);
            end loop;
    end;
end;

BEGIN
    TICKET_REVENUE(TIMESTAMP '2025-06-01 00:00:00', TIMESTAMP '2025-07-31 23:59:59');
end;



-- Top 5 destinations for a period of time
CREATE OR REPLACE PROCEDURE TOP_DESTINATIONS
(v_from_datetime FLIGHT.FLIGHT_DATE%type,
 v_to_datetime FLIGHT.FLIGHT_DATE%type)
    IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Top 5 most selling destinations for the period from ' || v_from_datetime || ' to ' || v_to_datetime);
    DECLARE
        CURSOR TOP_DEST_CURSOR IS
            SELECT
                (SELECT d.CITY_NAME from DESTINATION d where d.DESTINATION_ID = f.TO_DESTINATION_ID) AS City,
                COUNT(t.TICKET_ID) as TOTAL_TICKETS,
                ROUND(SUM(f.PRICE + (sc.PERCENT_DISCOUNT / 100) * f.PRICE), 2) AS TOTAL_REVENUE
            FROM
                TICKET t
                    JOIN
                FLIGHT f
                ON
                    t.FLIGHT_ID = f.FLIGHT_ID
                    JOIN
                SEAT s
                ON
                    t.SEAT_ID = s.SEAT_ID
                    JOIN
                SEATCLASS sc
                ON
                    s.SEAT_CLASS_ID = sc.SEAT_CLASS_ID
            WHERE
                f.FLIGHT_DATE BETWEEN v_from_datetime AND v_to_datetime
            GROUP BY f.TO_DESTINATION_ID
            ORDER BY TOTAL_REVENUE DESC
                FETCH FIRST 5 ROWS ONLY;
    BEGIN
        FOR FLIGHT IN TOP_DEST_CURSOR
            LOOP
                DBMS_OUTPUT.PUT_LINE(FLIGHT.City || '-> Total tickets sold: ' || FLIGHT.TOTAL_TICKETS || '; Total revenue: ' || FLIGHT.TOTAL_REVENUE);
            end loop;
    end;
end;

BEGIN
    TOP_DESTINATIONS(TIMESTAMP '2025-06-01 00:00:00', TIMESTAMP '2025-07-31 23:59:59');
end;



-- Passengers with 3 or more flights in the last 6 months
CREATE OR REPLACE PROCEDURE TOP_CLIENTS
    IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Passengers with 3 or more flights in the last 18 months:');
    DECLARE
        CURSOR TOP_CLIENTS_CURSOR IS
            SELECT
                (SELECT p.PASSENGER_NAME from PASSENGER p where p.PASSENGER_ID = t.PASSENGER_ID) AS NAME,
                (SELECT n.NATIONALITY_NAME from PASSENGER p JOIN NATIONALITY n ON n.NATIONALITY_ID = p.NATIONALITY_ID where p.PASSENGER_ID = t.PASSENGER_ID) AS NATIONALITY,
                COUNT(t.TICKET_ID) AS TOTAL_TRIPS
            FROM
                TICKET t
                    JOIN
                FLIGHT f
                ON
                    t.FLIGHT_ID = f.FLIGHT_ID
            WHERE
                f.FLIGHT_DATE >= ADD_MONTHS(SYSDATE, -18)
            GROUP BY t.PASSENGER_ID
            HAVING
                COUNT(t.PASSENGER_ID) >= 3
            ORDER BY TOTAL_TRIPS DESC
        ;
    BEGIN
        FOR CLIENT IN TOP_CLIENTS_CURSOR
            LOOP
                DBMS_OUTPUT.PUT_LINE(CLIENT.NAME || ', ' || CLIENT.NATIONALITY || ': ' || CLIENT.TOTAL_TRIPS || ' total trips');
            end loop;
    end;
end;

BEGIN
    TOP_CLIENTS();
end;
