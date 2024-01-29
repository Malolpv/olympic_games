-- Create the database
CREATE DATABASE IF NOT EXISTS olympic_games;

-- Use the database
USE olympic_games;

-- Create the athlete_events table
CREATE TABLE IF NOT EXISTS athlete_events (
    ID INT,
    Name VARCHAR(255),
    Sex CHAR(1),
    Age INT,
    Height FLOAT,
    Weight FLOAT,
    Team VARCHAR(255),
    NOC CHAR(3),
    Games VARCHAR(255),
    Year INT,
    Season VARCHAR(20),
    City VARCHAR(255),
    Sport VARCHAR(255),
    Event VARCHAR(255),
    Medal VARCHAR(255)
);

-- Load data from CSV into the table
LOAD DATA INFILE '/var/lib/mysql-files/athlete_events.csv'
INTO TABLE athlete_events
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS

-- Set 'NA' values to NULL
(@ID, @Name, @Sex, @Age, @Height, @Weight, @Team, @NOC, @Games, @Year, @Season, @City, @Sport, @Event, @Medal)
SET
  ID = NULLIF(@ID, 'NA'),
  Name = NULLIF(@Name, 'NA'),
  Sex = NULLIF(@Sex, 'NA'),
  Age = NULLIF(@Age, 'NA'),
  Height = NULLIF(@Height, 'NA'),
  Weight = NULLIF(@Weight, 'NA'),
  Team = NULLIF(@Team, 'NA'),
  NOC = NULLIF(@NOC, 'NA'),
  Games = NULLIF(@Games, 'NA'),
  Year = NULLIF(@Year, 'NA'),
  Season = NULLIF(@Season, 'NA'),
  City = NULLIF(@City, 'NA'),
  Sport = NULLIF(@Sport, 'NA'),
  Event = NULLIF(@Event, 'NA'),
  Medal = NULLIF(@Medal, 'NA');