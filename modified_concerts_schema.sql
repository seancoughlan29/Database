-- Task 1 
-- ===========================================================================================
-- Author: Cian Gleeson
-- Description: 
-- This schema is an improved version of the original concerts_schema 
-- This support multiple relationships between artists, albums, songs, concerts, fans, and tickets.
-- These changes ensure that:
-- 1. Multiple artists can be associated with each album, song, and concert.
-- 2. A fan can have multiple favorite artists.
-- 3. Multiple fans can share the same ticket.
--
-- Core tables are then used to represent the individual entities (artists, albums, songs, concerts, fans, and tickets)
-- Each core entity has a unique ID
-- Association tables are then introduced to define relationships between core entities.
-- These include:
-- song_artists, album_songs, album_artists, concert_songs, concert_artists,
-- fan_favorite_artists, ticket_concert, ticket_fan
-- ===========================================================================================


-- Artists Table: Stores artist details
CREATE TABLE artists (
  artist_id VARCHAR(16) PRIMARY KEY,  -- Unique ID for each artist
  artist_name VARCHAR(128),
  genre VARCHAR(64),
  debut_year YEAR
);

-- Albums Table: Stores album details
CREATE TABLE albums (
  album_id VARCHAR(16) PRIMARY KEY,  -- Unique ID for each album
  album_title VARCHAR(256),
  release_date DATE
);

-- Songs Table: Stores song details
CREATE TABLE songs (
  song_id VARCHAR(16) PRIMARY KEY,  -- Unique ID for each song
  song_title VARCHAR(128),
  length REAL,
  release_date DATE
);

-- Concerts Table: Stores concert details
CREATE TABLE concerts (
  concert_id VARCHAR(16) PRIMARY KEY,  -- Unique ID for each concert
  concert_title VARCHAR(256),
  location VARCHAR(256),
  date_of_concert DATE
);

-- Fans Table: Stores fan details
CREATE TABLE fans (
  fan_id VARCHAR(16) PRIMARY KEY,  -- Unique ID for each fan
  fan_name VARCHAR(128),
  fan_email VARCHAR(128),
  age TINYINT(3)
);

-- Tickets Table: Stores ticket details
CREATE TABLE tickets (
  ticket_id VARCHAR(16) PRIMARY KEY,  -- Unique ID for each ticket
  purchase_date DATE,
  ticket_price DOUBLE
);

-- Junction Table for Song-Artists relationship
CREATE TABLE song_artists (
  song_id VARCHAR(16),
  artist_id VARCHAR(16),
  PRIMARY KEY (song_id, artist_id),  -- Primary key to ensure each song-artist relationship is unique
  FOREIGN KEY (song_id) REFERENCES songs(song_id),  -- Foreign key linking to songs table
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)  -- Foreign key linking to artists table
);

-- Junction Table for Song-Album relationship
CREATE TABLE album_songs (
  album_id VARCHAR(16),
  song_id VARCHAR(16),
  PRIMARY KEY (album_id, song_id),  -- Primary key to ensure each album-song relationship is unique
  FOREIGN KEY (album_id) REFERENCES albums(album_id),  -- Foreign key linking to albums table
  FOREIGN KEY (song_id) REFERENCES songs(song_id)  -- Foreign key linking to songs table
);

-- Junction Table for Album-Artists relationship
CREATE TABLE album_artists (
  album_id VARCHAR(16),
  artist_id VARCHAR(16),
  PRIMARY KEY (album_id, artist_id),  -- Primary key to ensure each album-artist relationship is unique
  FOREIGN KEY (album_id) REFERENCES albums(album_id),  -- Foreign key linking to albums table
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)  -- Foreign key linking to artists table
);

-- Concert Songs Table: Stores the songs performed at each concert
CREATE TABLE concert_songs (
  concert_id VARCHAR(16),
  song_id VARCHAR(16),
  order_performance TINYINT(4),
  PRIMARY KEY (concert_id, song_id),  -- Primary key to ensure each concert-song relationship is unique
  FOREIGN KEY (concert_id) REFERENCES concerts(concert_id),  -- Foreign key linking to concerts table
  FOREIGN KEY (song_id) REFERENCES songs(song_id)  -- Foreign key linking to songs table
);

-- Junction Table for Concert-Artists relationship
CREATE TABLE concert_artists (
  concert_id VARCHAR(16),
  artist_id VARCHAR(16),
  PRIMARY KEY (concert_id, artist_id),  -- Primary key to ensure each concert-artist relationship is unique
  FOREIGN KEY (concert_id) REFERENCES concerts(concert_id),  -- Foreign key linking to concerts table
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)  -- Foreign key linking to artists table
);

-- Junction Table for Fan-Favorite Artists relationship
CREATE TABLE fan_favorite_artists (
  fan_id VARCHAR(16),
  artist_id VARCHAR(16),
  PRIMARY KEY (fan_id, artist_id),  -- Primary key to ensure each fan-artist relationship is unique
  FOREIGN KEY (fan_id) REFERENCES fans(fan_id),  -- Foreign key linking to fans table
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)  -- Foreign key linking to artists table
);

-- Concert Tickets Table: Each ticket is tied to one concert
CREATE TABLE ticket_concert (
  ticket_id VARCHAR(16) PRIMARY KEY,  -- Primary key is ticket_id, ensuring each ticket can't ascosiate with any other concerts
  concert_id VARCHAR(16),
  FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id),  -- Foreign key linking to tickets table
  FOREIGN KEY (concert_id) REFERENCES concerts(concert_id)  -- Foreign key linking to concerts table
);

-- Ticket-Fan Table: Multiple fans can share the same ticket
CREATE TABLE ticket_fan (
  ticket_id VARCHAR(16),
  fan_id VARCHAR(16),
  seat_zone VARCHAR(16),
  seat_number VARCHAR(16),
  PRIMARY KEY (ticket_id, fan_id),  -- Composite primary key to ensure each ticket-fan combination is unique
  -- The reason ticket_id isnt the primary key here is so that one ticket can represent multiple people 
  FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id),  -- Foreign key linking to tickets table
  FOREIGN KEY (fan_id) REFERENCES fans(fan_id)  -- Foreign key linking to fans table
);