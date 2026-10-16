INSERT INTO Nationality VALUES (1, 'American');
INSERT INTO Nationality VALUES (2, 'British');
INSERT INTO Nationality VALUES (3, 'German');
INSERT INTO Nationality VALUES (4, 'French');
INSERT INTO Nationality VALUES (5, 'Bulgarian');


INSERT INTO Destination VALUES (1, 'New York', 1);
INSERT INTO Destination VALUES (2, 'London', 2);
INSERT INTO Destination VALUES (3, 'Berlin', 3);
INSERT INTO Destination VALUES (4, 'Paris', 4);
INSERT INTO Destination VALUES (5, 'Sofia', 5);


INSERT INTO Passenger VALUES (1001, 'John Smith', 1);
INSERT INTO Passenger VALUES (1002, 'Emily Clarke', 2);
INSERT INTO Passenger VALUES (1003, 'Hans Mueller', 3);
INSERT INTO Passenger VALUES (1004, 'Marie Dupont', 4);
INSERT INTO Passenger VALUES (1005, 'Ivan Petrov', 5);


INSERT INTO Company VALUES (1, 'Boeing');
INSERT INTO Company VALUES (2, 'Airbus');
INSERT INTO Company VALUES (3, 'Embraer');


INSERT INTO Model VALUES (1, 'Boeing 737', 180, 1);
INSERT INTO Model VALUES (2, 'Boeing 777', 350, 1);
INSERT INTO Model VALUES (3, 'Airbus A320', 160, 2);
INSERT INTO Model VALUES (4, 'Airbus A380', 500, 2);
INSERT INTO Model VALUES (5, 'Embraer E190', 100, 3);


INSERT INTO Plane VALUES (1, 1);
INSERT INTO Plane VALUES (2, 2);
INSERT INTO Plane VALUES (3, 3);
INSERT INTO Plane VALUES (4, 4);
INSERT INTO Plane VALUES (5, 5);


INSERT INTO Flight VALUES (1, DATE '2025-06-01', 450.00, 1, 5, 1);
INSERT INTO Flight VALUES (2, DATE '2025-06-05', 320.00, 2, 1, 2);
INSERT INTO Flight VALUES (3, DATE '2025-06-10', 210.00, 3, 2, 3);
INSERT INTO Flight VALUES (4, DATE '2025-06-15', 180.00, 4, 3, 4);
INSERT INTO Flight VALUES (5, DATE '2025-06-20', 390.00, 5, 4, 5);


INSERT INTO Position VALUES (1, 'Pilot');
INSERT INTO Position VALUES (2, 'Co-Pilot');
INSERT INTO Position VALUES (3, 'Flight Attendant');

INSERT INTO Employee VALUES (1, 'Robert Green', '+1234567890', 1);
INSERT INTO Employee VALUES (2, 'Sarah White', '+1234567891', 2);
INSERT INTO Employee VALUES (3, 'James Brown', '+1234567892', 3);
INSERT INTO Employee VALUES (4, 'Anna Black', '+1234567893', 3);
INSERT INTO Employee VALUES (5, 'Peter Gray', '+1234567894', 4);


INSERT INTO SeatClass VALUES (1, 'Economy', 0);
INSERT INTO SeatClass VALUES (2, 'Business', 10);
INSERT INTO SeatClass VALUES (3, 'First Class', 20);


INSERT INTO Seat VALUES (1, '1A', 3, 1);
INSERT INTO Seat VALUES (2, '1B', 3, 1);
INSERT INTO Seat VALUES (3, '10A', 2, 1);
INSERT INTO Seat VALUES (4, '10B', 2, 1);
INSERT INTO Seat VALUES (5, '20A', 1, 1);
INSERT INTO Seat VALUES (6, '20B', 1, 1);
INSERT INTO Seat VALUES (7, '1A', 3, 2);
INSERT INTO Seat VALUES (8, '15A', 1, 2);
INSERT INTO Seat VALUES (9, '1A', 3, 3);
INSERT INTO Seat VALUES (10, '12A', 1, 3);


INSERT INTO Ticket VALUES (1, 5, 1, 1001, 3);
INSERT INTO Ticket VALUES (2, 8, 2, 1002, 3);
INSERT INTO Ticket VALUES (3, 10, 3, 1003, 4);
INSERT INTO Ticket VALUES (4, 3, 4, 1004, 3);
INSERT INTO Ticket VALUES (5, 7, 5, 1005, 4);

COMMIT;
