-- Sample data for artists
INSERT INTO artists (artist_id, artist_name, genre, debut_year) VALUES
('ART_001', 'Band Alpha', 'Rock', 2005),
('ART_002', 'Solo Star', 'Pop', 2012),
('ART_003', 'The Jazz Collective', 'Jazz', 2008),
('ART_004', 'DJ Mirage', 'Electronic', 2015),
('ART_005', 'Country Roads', 'Country', 2010),
('ART_006', 'Indie Dreamers', 'Indie', 2017);

-- Sample data for albums
INSERT INTO albums (album_id, album_title, release_date) VALUES
('ALB_001', 'First Album', '2010-05-10'),
('ALB_002', 'Second Album', '2018-09-25'),
('ALB_003', 'Electric Vibes', '2021-02-14'),
('ALB_004', 'Indie Stories', '2019-06-20');

-- Sample data for album-artists (associating multiple artists with albums)
INSERT INTO album_artists (album_id, artist_id) VALUES
('ALB_001', 'ART_001'),
('ALB_001', 'ART_002'),
('ALB_002', 'ART_003'),
('ALB_002', 'ART_004'),
('ALB_003', 'ART_004'),
('ALB_003', 'ART_005'),
('ALB_004', 'ART_005'),
('ALB_004', 'ART_006');

-- Sample data for songs
INSERT INTO songs (song_id, song_title, length, release_date) VALUES
('SON_001', 'Hit Song A', 3.45, '2010-06-15'),
('SON_002', 'Ballad B', 4.20, '2018-10-01'),
('SON_003', 'Electric Dream', 5.00, '2021-03-10'),
('SON_004', 'Country Roads', 3.10, '2010-07-05'),
('SON_005', 'Indie Wave', 4.30, '2019-06-18'),
('SON_006', 'Jazz Breeze', 4.15, '2021-03-15'),
('SON_007', 'Pop Magic', 3.55, '2020-11-12'),
('SON_008', 'Rising Stars', 5.25, '2018-08-25');

-- Sample data for song-artists (associating multiple artists with songs)
INSERT INTO song_artists (song_id, artist_id) VALUES
('SON_001', 'ART_001'),
('SON_001', 'ART_002'),
('SON_002', 'ART_003'),
('SON_002', 'ART_004'),
('SON_003', 'ART_004'),
('SON_003', 'ART_005'),
('SON_004', 'ART_005'),
('SON_004', 'ART_006'),
('SON_005', 'ART_001'),
('SON_005', 'ART_006'),
('SON_006', 'ART_003'),
('SON_006', 'ART_004'),
('SON_007', 'ART_002'),
('SON_007', 'ART_004'),
('SON_008', 'ART_001'),
('SON_008', 'ART_005');

-- Sample data for albums and their songs
INSERT INTO album_songs (album_id, song_id) VALUES
('ALB_001', 'SON_001'),
('ALB_001', 'SON_002'),
('ALB_002', 'SON_003'),
('ALB_002', 'SON_004'),
('ALB_003', 'SON_005'),
('ALB_003', 'SON_006'),
('ALB_004', 'SON_007'),
('ALB_004', 'SON_008');

-- Sample data for concerts
INSERT INTO concerts (concert_id, concert_title, location, date_of_concert) VALUES
('CON_001', 'Rock & Pop Fusion', 'Stadium One', '2023-07-20'),
('CON_002', 'Electro Indie Nights', 'Club Echo', '2023-08-15');

-- Sample data for concert-artists (associating multiple artists with concerts)
INSERT INTO concert_artists (concert_id, artist_id) VALUES
('CON_001', 'ART_001'),
('CON_001', 'ART_002'),
('CON_001', 'ART_003'),
('CON_002', 'ART_004'),
('CON_002', 'ART_005'),
('CON_002', 'ART_006');

-- Sample data for concert songs (the order in which songs were performed in concerts)
INSERT INTO concert_songs (concert_id, song_id, order_performance) VALUES
('CON_001', 'SON_001', 1),
('CON_001', 'SON_002', 2),
('CON_001', 'SON_003', 3),
('CON_002', 'SON_004', 1),
('CON_002', 'SON_005', 2),
('CON_002', 'SON_006', 3);

-- Sample data for fans
INSERT INTO fans (fan_id, fan_name, fan_email, age) VALUES
('FAN_001', 'Alice Smith', 'alice@example.com', 29),
('FAN_002', 'Bob Johnson', 'bob@example.com', 35),
('FAN_003', 'Charlie Brown', 'charlie@example.com', 24),
('FAN_004', 'Diana White', 'diana@example.com', 41);

-- Sample data for fan favorite artists (which artists each fan likes)
INSERT INTO fan_favorite_artists (fan_id, artist_id) VALUES
('FAN_001', 'ART_001'),
('FAN_001', 'ART_003'),
('FAN_002', 'ART_002'),
('FAN_002', 'ART_004'),
('FAN_003', 'ART_005'),
('FAN_003', 'ART_006'),
('FAN_004', 'ART_001'),
('FAN_004', 'ART_006');

-- Sample data for tickets
INSERT INTO tickets (ticket_id, purchase_date, ticket_price) VALUES
('TKT_001', '2023-07-01', 99.99),
('TKT_002', '2023-07-10', 49.99),
('TKT_003', '2023-07-02', 79.99),
('TKT_004', '2023-08-10', 59.99),
('TKT_005', '2023-08-10', 59.99);


-- Sample data for ticket_concert (associating tickets with concerts)
INSERT INTO ticket_concert (ticket_id, concert_id) VALUES
('TKT_001', 'CON_001'),
('TKT_002', 'CON_001'),
('TKT_003', 'CON_001'),
('TKT_004', 'CON_002'),
('TKT_005', 'CON_002');

-- Sample data for ticket-fan (fan-specific seat details per ticket)
INSERT INTO ticket_fan (ticket_id, fan_id, seat_zone, seat_number) VALUES
('TKT_001', 'FAN_001', 'VIP', 'A12'),
('TKT_001', 'FAN_002', 'VIP', 'A13'),
('TKT_002', 'FAN_001', 'General', 'B45'),
('TKT_002', 'FAN_004', 'General', 'B46'),
('TKT_003', 'FAN_002', 'VIP', 'A14'),
('TKT_004', 'FAN_003', 'VIP', 'A15');
