-- Sample data for artists
INSERT INTO artists (artist_id, artist_name, genre, debut_year) VALUES
('ART_001', 'Band Alpha', 'Rock', 2005),
('ART_002', 'Solo Star', 'Pop', 2012),
('ART_003', 'The Jazz Collective', 'Jazz', 2008),
('ART_004', 'DJ Mirage', 'Electronic', 2015),
('ART_005', 'Country Roads', 'Country', 2010),
('ART_006', 'Indie Dreamers', 'Indie', 2017),
('ART_007', 'The Rolling Beats', 'Rock', 1980),
('ART_008', 'Funky Vibes', 'Funk', 2010),
('ART_009', 'Electric Sparks', 'Electronic', 2014),
('ART_010', 'Classical Symphony', 'Classical', 1990),
('ART_011', 'Urban Flow', 'Hip Hop', 2015),
('ART_012', 'Indie Stars', 'Indie', 2018),
('ART_013', 'Jazz Masters', 'Jazz', 1985),
('ART_014', 'Disco Inferno', 'Disco', 1978);


-- Sample data for albums
INSERT INTO albums (album_id, album_title, release_date) VALUES
('ALB_001', 'First Album', '2010-05-10'),
('ALB_002', 'Second Album', '2018-09-25'),
('ALB_003', 'Electric Vibes', '2021-02-14'),
('ALB_004', 'Indie Stories', '2019-06-20'),
('ALB_005', 'The Rolling Journey', '1985-07-12'),
('ALB_006', 'Funky Night', '2013-11-10'),
('ALB_007', 'Electric Dreams', '2015-02-25'),
('ALB_008', 'Classical Masterpieces', '2000-03-05'),
('ALB_009', 'Hip Hop Royalty', '2018-08-18'),
('ALB_010', 'Indie Dreams', '2021-01-21'),
('ALB_011', 'Jazz Hits', '1992-09-01'),
('ALB_012', 'Disco Fever', '1979-12-20');

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
('SON_008', 'Rising Stars', 5.25, '2018-08-25'),
('SON_009', 'Journey Through Time', 4.10, '1985-07-12'),
('SON_010', 'Funky Beat', 5.00, '2013-11-10'),
('SON_011', 'Electric Waves', 4.30, '2015-02-25'),
('SON_012', 'Classical Elegance', 6.00, '2000-03-05'),
('SON_013', 'Royal Flow', 3.45, '2018-08-18'),
('SON_014', 'Dreamscape', 4.50, '2021-01-21'),
('SON_015', 'Smooth Jazz', 5.10, '1992-09-01'),
('SON_016', 'Disco Groove', 3.55, '1979-12-20');

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
('CON_002', 'Electro Indie Nights', 'Club Echo', '2023-08-15'),
('CON_003', 'Rock Legends Live', 'Arena One', '2023-10-10'),
('CON_004', 'Funk Night Special', 'Funky Club', '2023-09-15'),
('CON_005', 'Electric Vibes Show', 'Electric Stadium', '2023-07-30'),
('CON_006', 'Classical Serenade', 'Opera House', '2023-06-05'),
('CON_007', 'Hip Hop Festival', 'Urban Park', '2023-05-22'),
('CON_008', 'Indie Wave Live', 'Indie Hall', '2023-08-25'),
('CON_009', 'Jazz Legends', 'Jazz Arena', '2023-09-05'),
('CON_010', 'Disco Party Night', 'Disco Club', '2023-06-25');

-- Sample data for concert-artists (associating multiple artists with concerts)
INSERT INTO concert_artists (concert_id, artist_id) VALUES
('CON_001', 'ART_001'),
('CON_001', 'ART_002'),
('CON_001', 'ART_003'),
('CON_002', 'ART_004'),
('CON_002', 'ART_005'),
('CON_002', 'ART_006'),
('CON_003', 'ART_007'),
('CON_003', 'ART_008'),
('CON_003', 'ART_009'),
('CON_004', 'ART_008'),
('CON_004', 'ART_009'),
('CON_005', 'ART_010'),
('CON_005', 'ART_011'),
('CON_006', 'ART_012'),
('CON_007', 'ART_013'),
('CON_008', 'ART_012'),
('CON_009', 'ART_013'),
('CON_010', 'ART_014');


-- Sample data for concert songs (the order in which songs were performed in concerts)
INSERT INTO concert_songs (concert_id, song_id, order_performance) VALUES
('CON_001', 'SON_001', 1),
('CON_001', 'SON_002', 2),
('CON_001', 'SON_003', 3),
('CON_002', 'SON_004', 1),
('CON_002', 'SON_005', 2),
('CON_002', 'SON_006', 3),
('CON_003', 'SON_009', 1),
('CON_003', 'SON_010', 2),
('CON_003', 'SON_011', 3),
('CON_004', 'SON_010', 1),
('CON_004', 'SON_011', 2),
('CON_005', 'SON_012', 1),
('CON_005', 'SON_013', 2),
('CON_006', 'SON_014', 1),
('CON_007', 'SON_015', 1),
('CON_008', 'SON_014', 1),
('CON_009', 'SON_015', 1),
('CON_010', 'SON_016', 1);


-- Sample data for fans
INSERT INTO fans (fan_id, fan_name, fan_email, age) VALUES
('FAN_001', 'Alice Smith', 'alice@example.com', 29),
('FAN_002', 'Bob Johnson', 'bob@example.com', 35),
('FAN_003', 'Charlie Brown', 'charlie@example.com', 24),
('FAN_004', 'Diana White', 'diana@example.com', 41),
('FAN_005', 'Eva Green', 'eva@example.com', 28),
('FAN_006', 'Frank Black', 'frank@example.com', 34),
('FAN_007', 'Grace Lee', 'grace@example.com', 22),
('FAN_008', 'Helen Brown', 'helen@example.com', 37),
('FAN_009', 'Ivy James', 'ivy@example.com', 26),
('FAN_010', 'Jack White', 'jack@example.com', 41),
('FAN_011', 'Karen Black', 'karen@example.com', 30),
('FAN_012', 'Liam Scott', 'liam@example.com', 23);

-- Sample data for fan favorite artists (which artists each fan likes)
INSERT INTO fan_favorite_artists (fan_id, artist_id) VALUES
('FAN_001', 'ART_001'),
('FAN_001', 'ART_003'),
('FAN_002', 'ART_002'),
('FAN_002', 'ART_004'),
('FAN_003', 'ART_005'),
('FAN_003', 'ART_006'),
('FAN_004', 'ART_001'),
('FAN_004', 'ART_006'),
('FAN_005', 'ART_008'),
('FAN_006', 'ART_009'),
('FAN_007', 'ART_010'),
('FAN_008', 'ART_012'),
('FAN_009', 'ART_013'),
('FAN_010', 'ART_007'),
('FAN_011', 'ART_011'),
('FAN_012', 'ART_014');

-- Sample data for tickets
INSERT INTO tickets (ticket_id, purchase_date, ticket_price) VALUES
('TKT_001', '2023-07-01', 99.99),
('TKT_002', '2023-07-10', 49.99),
('TKT_003', '2023-07-02', 79.99),
('TKT_004', '2023-08-10', 59.99),
('TKT_005', '2023-08-10', 59.99),
('TKT_006', '2023-07-01', 79.99),
('TKT_007', '2023-07-15', 65.99),
('TKT_008', '2023-08-12', 49.99),
('TKT_009', '2023-09-22', 55.99),
('TKT_010', '2023-08-10', 120.00),
('TKT_011', '2023-09-30', 150.00),
('TKT_012', '2023-10-15', 89.99),
('TKT_013', '2023-06-25', 45.99);


-- Sample data for ticket_concert (associating tickets with concerts)
INSERT INTO ticket_concert (ticket_id, concert_id) VALUES
('TKT_001', 'CON_001'),
('TKT_002', 'CON_001'),
('TKT_003', 'CON_001'),
('TKT_004', 'CON_002'),
('TKT_005', 'CON_002'),
('TKT_006', 'CON_003'),
('TKT_007', 'CON_004'),
('TKT_008', 'CON_005'),
('TKT_009', 'CON_006'),
('TKT_010', 'CON_007'),
('TKT_011', 'CON_008'),
('TKT_012', 'CON_009'),
('TKT_013', 'CON_010');

-- Sample data for ticket-fan (fan-specific seat details per ticket)
INSERT INTO ticket_fan (ticket_id, fan_id, seat_zone, seat_number) VALUES
('TKT_001', 'FAN_001', 'VIP', 'A12'),
('TKT_001', 'FAN_002', 'VIP', 'A13'),
('TKT_002', 'FAN_001', 'General', 'B45'),
('TKT_002', 'FAN_004', 'General', 'B46'),
('TKT_003', 'FAN_002', 'VIP', 'A14'),
('TKT_004', 'FAN_003', 'VIP', 'A15'),
('TKT_006', 'FAN_005', 'VIP', 'C23'),
('TKT_007', 'FAN_006', 'VIP', 'B34'),
('TKT_008', 'FAN_007', 'General', 'D45'),
('TKT_009', 'FAN_008', 'VIP', 'E56'),
('TKT_010', 'FAN_009', 'VIP', 'A11'),
('TKT_011', 'FAN_010', 'General', 'F67'),
('TKT_012', 'FAN_011', 'VIP', 'G78'),
('TKT_013', 'FAN_012', 'VIP', 'H89');