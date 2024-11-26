CREATE VIEW artist_concert_performance_details_complex AS
SELECT 
    a.artist_id,
    a.artist_name,
    COUNT(DISTINCT ca.concert_id) AS num_concerts,
    COUNT(DISTINCT cs.song_id) AS num_songs_performed,
    AVG(t.ticket_price) AS avg_ticket_price,
    SUM(t.ticket_price) AS total_ticket_sales,
    COALESCE(MAX(c.date_of_concert), '1970-01-01') AS last_performance_date,
    COALESCE(MAX(f.fan_name), 'No Fans') AS last_fan_interaction
FROM 
    artists a
INNER JOIN 
    concert_artists ca ON a.artist_id = ca.artist_id
LEFT JOIN 
    concerts c ON ca.concert_id = c.concert_id
RIGHT JOIN 
    ticket_concert tc ON c.concert_id = tc.concert_id
LEFT JOIN 
    tickets t ON tc.ticket_id = t.ticket_id
LEFT JOIN 
    concert_songs cs ON c.concert_id = cs.concert_id
LEFT JOIN 
    ticket_fan tf ON t.ticket_id = tf.ticket_id
LEFT JOIN 
    fans f ON tf.fan_id = f.fan_id
GROUP BY 
    a.artist_id, a.artist_name
HAVING 
    COUNT(DISTINCT ca.concert_id) >= 1
    AND AVG(t.ticket_price) > 20;
