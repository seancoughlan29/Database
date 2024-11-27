-- TASK 3
-- ===========================================================================================
-- Author: Euan Jennings
-- Description: 
-- This view aggregates detailed performance data for each artist, including 
-- the number of concerts, songs performed, ticket sales metrics, and the last fan interaction.
-- The data is filtered to include artists with at least one concert and an average ticket 
-- price greater than 20.
-- ===========================================================================================

CREATE VIEW artist_concert_performance_details AS
SELECT 
    a.artist_id,
    a.artist_name,
    COUNT(DISTINCT ca.concert_id) AS num_concerts,     -- Number of concerts
    COUNT(DISTINCT cs.song_id) AS num_songs_performed, -- Number of songs performed
    AVG(t.ticket_price) AS avg_ticket_price,     -- Average ticket price
    SUM(t.ticket_price) AS total_ticket_sales,   -- Total ticket revenue
    COALESCE(MAX(c.date_of_concert), '1970-01-01') AS last_performance_date,  -- Last concert date
    COALESCE(MAX(f.fan_name), 'No Fans') AS last_fan_interaction  -- Last fan interaction
FROM 
    artists a
INNER JOIN 
    concert_artists ca ON a.artist_id = ca.artist_id     -- Join artists with the concerts they participated in
LEFT JOIN 
    concerts c ON ca.concert_id = c.concert_id           -- Join concerts data
RIGHT JOIN 
    ticket_concert tc ON c.concert_id = tc.concert_id    -- Join ticket-concert association
LEFT JOIN 
    tickets t ON tc.ticket_id = t.ticket_id              -- Join ticket data for pricing information
LEFT JOIN 
    concert_songs cs ON c.concert_id = cs.concert_id     -- Join songs performed at the concert
LEFT JOIN 
    ticket_fan tf ON t.ticket_id = tf.ticket_id          -- Join ticket-fan association for fan interactions
LEFT JOIN 
    fans f ON tf.fan_id = f.fan_id                       -- Join fans data for fan details
GROUP BY 
    a.artist_id, a.artist_name
HAVING 
    COUNT(DISTINCT ca.concert_id) >= 1   -- Ensure the artist has performed in at least one concert
    AND AVG(t.ticket_price) > 20;        -- Filter for artists with an average ticket price greater than 20


