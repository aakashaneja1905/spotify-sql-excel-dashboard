-- STEP 1: Create database (if not created)
CREATE DATABASE IF NOT EXISTS spotify_project;
USE spotify_project;

-- STEP 2: Drop table if already exists (safe for re-run)
DROP TABLE IF EXISTS spotify_tracks;

-- STEP 3: Create table with correct columns
CREATE TABLE spotify_tracks (
    name TEXT,
    artist TEXT,
    release_date VARCHAR(20),
    popularity INT,
    album_name TEXT,
    track_id VARCHAR(100),
    track_url TEXT
);

-- STEP 4: Load CSV data into table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/spotify_tracks_2024_2025.csv'
INTO TABLE spotify_tracks
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(name, artist, release_date, popularity, album_name, track_id, track_url);