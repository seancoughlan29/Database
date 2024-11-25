-- Artists Table: Modified for custom IDs
CREATE TABLE artists (
  artist_id VARCHAR(16) PRIMARY KEY,  -- Adjusted to support custom alphanumeric IDs
  artist_name VARCHAR(128),
  genre VARCHAR(64),
  debut_year YEAR
);

-- Albums Table: Modified for custom IDs
CREATE TABLE albums (
  album_id VARCHAR(16) PRIMARY KEY,  -- Adjusted to support custom alphanumeric IDs
  album_title VARCHAR(256),
  release_date DATE
);

-- Songs Table: Modified for custom IDs
CREATE TABLE songs (
  song_id VARCHAR(16) PRIMARY KEY,  -- Adjusted to support custom alphanumeric IDs
  song_title VARCHAR(128),
  length REAL,
  release_date DATE
);

-- Concerts Table: Modified for custom IDs
CREATE TABLE concerts (
  concert_id VARCHAR(16) PRIMARY KEY,  -- Adjusted to support custom alphanumeric IDs
  concert_title VARCHAR(256),
  location VARCHAR(256),
  date_of_concert DATE
);

-- Fans Table: Modified for custom IDs
CREATE TABLE fans (
  fan_id VARCHAR(16) PRIMARY KEY,  -- Adjusted to support custom alphanumeric IDs
  fan_name VARCHAR(128),
  fan_email VARCHAR(128),
  age TINYINT(3)
);

-- Tickets Table: Standalone table for tickets
CREATE TABLE tickets (
  ticket_id VARCHAR(16) PRIMARY KEY,  -- Custom alphanumeric ticket IDs
  purchase_date DATE,
  ticket_price DOUBLE
);

-- Junction Table for Album-Artists relationship: No change needed for custom IDs
CREATE TABLE album_artists (
  album_id VARCHAR(16),
  artist_id VARCHAR(16),
  PRIMARY KEY (album_id, artist_id),
  FOREIGN KEY (album_id) REFERENCES albums(album_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

-- Junction Table for Song-Artists relationship: No change needed for custom IDs
CREATE TABLE song_artists (
  song_id VARCHAR(16),
  artist_id VARCHAR(16),
  PRIMARY KEY (song_id, artist_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

-- Junction Table for Song-Album relationship: No change needed for custom IDs
CREATE TABLE album_songs (
  album_id VARCHAR(16),
  song_id VARCHAR(16),
  PRIMARY KEY (album_id, song_id),
  FOREIGN KEY (album_id) REFERENCES albums(album_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

-- Junction Table for Concert-Artists relationship: No change needed for custom IDs
CREATE TABLE concert_artists (
  concert_id VARCHAR(16),
  artist_id VARCHAR(16),
  PRIMARY KEY (concert_id, artist_id),
  FOREIGN KEY (concert_id) REFERENCES concerts(concert_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

-- Concert Songs Table: No change needed for custom IDs
CREATE TABLE concert_songs (
  concert_id VARCHAR(16),
  song_id VARCHAR(16),
  order_performance TINYINT(4),
  PRIMARY KEY (concert_id, song_id),
  FOREIGN KEY (concert_id) REFERENCES concerts(concert_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

-- Junction Table for Fan-Favorite Artists relationship: No change needed for custom IDs
CREATE TABLE fan_favorite_artists (
  fan_id VARCHAR(16),
  artist_id VARCHAR(16),
  PRIMARY KEY (fan_id, artist_id),
  FOREIGN KEY (fan_id) REFERENCES fans(fan_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

-- Concert Tickets Tabale: Each ticket is tied to one concert
CREATE TABLE ticket_concert (
  ticket_id VARCHAR(16) PRIMARY KEY,  -- Only ticket_id as primary key
  concert_id VARCHAR(16),
  FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id),
  FOREIGN KEY (concert_id) REFERENCES concerts(concert_id)
);

-- Ticket-Fan Table: Multiple fans can have the same ticket
CREATE TABLE ticket_fan (
  ticket_id VARCHAR(16),
  fan_id VARCHAR(16),
  seat_zone VARCHAR(16),
  seat_number VARCHAR(16),
  PRIMARY KEY (ticket_id, fan_id),  -- Unique pair for each ticket and fan
  FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id),
  FOREIGN KEY (fan_id) REFERENCES fans(fan_id)
);


