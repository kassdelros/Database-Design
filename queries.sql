-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Find all artists and their respective albums
SELECT
    "artists.first_name",
    "artists.last_name",
    "artists.bio",
    "albums.title",
    "albums.release_date",
    "genres.name" AS "genre"
FROM "artists"

LEFT JOIN "albums"
    ON "artists.id" = "albums.artist_id"
LEFT JOIN "genres"
    ON "albums.genre_id" = "genres.id";

-- Find all tracks in a specific album
SELECT
    "tracks.title",
    "tracks.duration",
    "artists.first_name" AS "artist_first_name",
    "artists.last_name" AS "artist_last_name"
FROM "tracks"

INNER JOIN "albums"
    ON "tracks.album_id" = "albums.id"
INNER JOIN "artists"
    ON "albums.artist_id" = "artists.id"
WHERE "albums.title" = 'Album Title';

-- Add a new artist and their album
INSERT INTO "artists" ("first_name", "last_name", "bio")
VALUES ('New', 'Artist', 'A new artist bio');

INSERT INTO "albums" ("title", "release_date", "artist_id", "genre_id")
VALUES ('New Album', '2023-10-26', (SELECT "id" FROM "artists" WHERE "first_name" = 'New' AND "last_name" = 'Artist'), (SELECT "id" FROM "genres" WHERE "name" = 'Pop'));

-- Update track duration
UPDATE "tracks"
SET "duration" = 4.5
WHERE "title" = 'Track Title';

-- Delete an artist and their associated albums
DELETE FROM "artists"
WHERE "first_name" = 'Artist' AND "last_name" = 'ToDelete';

-- Delete a track from an album
DELETE FROM "tracks"
WHERE "title" = 'Track Title' AND "album_id" = (SELECT "id" FROM "albums" WHERE "title" = 'Album Title');

