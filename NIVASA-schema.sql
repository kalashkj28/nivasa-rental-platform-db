DROP DATABASE IF EXISTS Nivasa;
CREATE DATABASE Nivasa;
USE Nivasa;

CREATE TABLE Landlords (
    landlord_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    is_verified BOOLEAN DEFAULT FALSE
);

CREATE TABLE Properties (
    property_id INT PRIMARY KEY,
    landlord_id INT,
    title VARCHAR(150),
    type VARCHAR(20),               -- 'PG', 'Flat', 'Room'
    area VARCHAR(100),              -- locality name e.g. 'Tatibandh', 'Saddu'
    city VARCHAR(50),
    rent_per_month DECIMAL(10,2),
    is_furnished BOOLEAN,
    roommates_allowed BOOLEAN,
    distance_from_nit DECIMAL(5,2), -- in km
    available_from DATE,
    FOREIGN KEY (landlord_id) REFERENCES Landlords(landlord_id)
);

CREATE TABLE Amenities (
    amenity_id INT PRIMARY KEY,
    property_id INT,
    wifi BOOLEAN,
    parking BOOLEAN,
    ac BOOLEAN,
    laundry BOOLEAN,
    water_included BOOLEAN,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id)
);

-- Landlords
INSERT INTO Landlords VALUES
(1, 'Ramesh Gupta',   '9300011111', 'ramesh@mail.com',  TRUE),
(2, 'Sunita Yadav',   '9300022222', 'sunita@mail.com',  TRUE),
(3, 'Manoj Tiwari',   '9300033333', 'manoj@mail.com',   FALSE),
(4, 'Anita Sahu',     '9300044444', 'anita@mail.com',   TRUE),
(5, 'Deepak Verma',   '9300055555', 'deepak@mail.com',  FALSE);

-- Properties (area references near NIT Raipur)
INSERT INTO Properties VALUES
(101, 1, 'Affordable PG Near NIT Gate',     'PG',   'Tatibandh',     'Raipur', 4500.00,  FALSE, TRUE,  0.8,  '2024-07-01'),
(102, 2, 'Furnished Flat in Saddu',          'Flat', 'Saddu',         'Raipur', 9000.00,  TRUE,  FALSE, 2.5,  '2024-07-15'),
(103, 3, 'Budget Room near Khamardih',       'Room', 'Khamardih',     'Raipur', 3500.00,  FALSE, TRUE,  3.2,  '2024-06-20'),
(104, 4, 'Semi-Furnished PG Tatibandh',      'PG',   'Tatibandh',     'Raipur', 5500.00,  TRUE,  TRUE,  1.1,  '2024-07-01'),
(105, 5, 'Spacious Flat with Parking',       'Flat', 'Mowa',          'Raipur', 12000.00, TRUE,  FALSE, 4.0,  '2024-08-01'),
(106, 1, 'Shared Room Walking Distance',     'Room', 'Tatibandh',     'Raipur', 3000.00,  FALSE, TRUE,  0.5,  '2024-06-15'),
(107, 3, 'PG with Wifi near Saddu Chowk',   'PG',   'Saddu',         'Raipur', 6000.00,  TRUE,  FALSE, 2.8,  '2024-07-10'),
(108, 4, 'Premium Flat Mowa',                'Flat', 'Mowa',          'Raipur', 15000.00, TRUE,  FALSE, 4.5,  '2024-08-01');

-- Amenities
INSERT INTO Amenities VALUES
(1, 101, FALSE, FALSE, FALSE, FALSE, TRUE),
(2, 102, TRUE,  TRUE,  TRUE,  TRUE,  TRUE),
(3, 103, FALSE, FALSE, FALSE, FALSE, FALSE),
(4, 104, TRUE,  FALSE, FALSE, TRUE,  TRUE),
(5, 105, TRUE,  TRUE,  TRUE,  FALSE, FALSE),
(6, 106, FALSE, FALSE, FALSE, FALSE, TRUE),
(7, 107, TRUE,  FALSE, FALSE, FALSE, TRUE),
(8, 108, TRUE,  TRUE,  TRUE,  TRUE,  TRUE);
