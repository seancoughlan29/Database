 --Task 6
--================================================================================
-- Author: Sean Conneally
-- # Checks if song_id(SON_001) is already associated with album_id(ALB_001),
--   if not it inserts the association into the album_songs table
-- # Gets song release date and album release date,if song release date
--   is later then the album release date it updates song release date to match

-- presumes both song_id_input and album_id_input exist in their respective tables
--================================================================================

DELIMITER $$

CREATE PROCEDURE check_and_associate_song(
    IN song_id_input VARCHAR(16),
    IN album_id_input VARCHAR(16)
)
BEGIN
    DECLARE song_release_date DATE;
    DECLARE album_release_date DATE;

    SELECT release_date INTO song_release_date
    FROM songs
    WHERE song_id = song_id_input;

    SELECT release_date INTO album_release_date
    FROM albums
    WHERE album_id = album_id_input;

    IF NOT EXISTS (
        SELECT 1
        FROM album_songs
        WHERE song_id = song_id_input AND album_id = album_id_input
    ) THEN
        INSERT INTO album_songs (album_id, song_id)
        VALUES (album_id_input, song_id_input);
    END IF;

    IF song_release_date > album_release_date THEN
        UPDATE songs
        SET release_date = album_release_date
        WHERE song_id = song_id_input;
    END IF;
END$$

DELIMITER ;
