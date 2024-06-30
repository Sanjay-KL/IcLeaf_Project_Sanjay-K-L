--Create tables

CREATE TABLE Events (
    Event_Id INT PRIMARY KEY,
    Event_Name VARCHAR(100),
    Event_Date DATE,
    Event_Location VARCHAR(100),
    Event_Description VARCHAR(150)
);

CREATE TABLE Attendees (
    Attendee_Id INT PRIMARY KEY,
    Attendee_Name VARCHAR(100),
    Attendee_Phone VARCHAR(15),
    Attendee_Email VARCHAR(100),
    Attendee_City VARCHAR(100)
);

CREATE TABLE Registrations (
    Registration_id INT PRIMARY KEY,
    Event_Id INT,
    Attendee_Id INT,
    Registration_Date DATE,
    Registration_Amount INT,
    FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id),
    FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)
);

-- Data Creation
-- Inserting sample data into Events

INSERT INTO Events (Event_Id, Event_Name, Event_Date, Event_Location, Event_Description) VALUES
(1, 'Tech Conference', '2023-09-15', 'Convention Center', 'A tech conference for industry professionals.'),
(2, 'Athletic Meet', '2022-01-15', 'AK Stadium', 'An Athletic meet'),
(3, 'World Cup', '2019-01-15', 'Lords Stadium', 'Cricket World Cup'),
(4, 'Swimming Championship', '2015-01-15', 'Swim world indoor Stadium', 'Swimming championship');

--Inserting sample data into Attendees

INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) VALUES
(1, 'Raam', '1234567890', 'raam@example.com', 'Bengaluru'),
(2, 'Raghu', '1233337890', 'ragu@example.com', 'Kolar'),
(3, 'Naman', '1222267890', 'nam@example.com', 'Hyderabad'),
(4, 'Aditi', '1234555890', 'aditi@example.com', 'Mysuru');

-- Insert sample data into Registrations

INSERT INTO Registrations (Registration_id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount) VALUES
(1, 1, 1, '2023-08-01', 100.00),(2, 2, 3, '2023-08-01', 100.00),(3, 3, 4, '2023-08-01', 100.00),
(4, 4, 2, '2023-08-01', 100.00);

--3) Manage Event Details

--1. Insert a new event

INSERT INTO Events (Event_Id, Event_Name, Event_Date, Event_Location, Event_Description) VALUES
(5, 'Music Festival', '2023-10-20', 'Cubbon Park', 'An annual music festival with various artists.');

SELECT * FROM events;

--2. Update an event's information

UPDATE Events SET Event_Location = 'Open Theatre' WHERE Event_Id = 1;

SELECT * FROM Events;


--3. Delete an event

DELETE FROM Events WHERE Event_Id = 5;

SELECT * FROM Events;

--Manage Track Attendees & Handle Events
-- 1) Insert a new attendee

INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) VALUES
(5 , 'Sundar', '0987654321', 'sund@example.com', 'Delhi');

SELECT * FROM attendees;

--2. Register an attendee for an event

INSERT INTO Registrations (Registration_id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount) VALUES
(5, 2, 4, '2021-08-10', 100.00);

SELECT * FROM Registrations;

--Queries for Event Managements:

--1.Retrieve event information

SELECT * FROM Events;


--2. Generate attendee lists

SELECT Attendee_Name, Event_Name
FROM Attendees
JOIN Registrations ON Attendees.Attendee_Id = Registrations.Attendee_Id
JOIN Events ON Registrations.Event_Id = Events.Event_Id;


--3. Calculate event attendance statistics

SELECT Event_Name, COUNT(Attendee_Id) AS Attendee_Count
FROM Events
JOIN Registrations ON Events.Event_Id = Registrations.Event_Id
GROUP BY Event_Name;

