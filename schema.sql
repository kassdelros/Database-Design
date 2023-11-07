-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
-- Define the Artists table
CREATE TABLE IF NOT EXISTS "artists" (
    "id" INTEGER PRIMARY KEY,
    "first_name" TEXT,
    "last_name" TEXT,
    "bio" TEXT
);

-- Define the Albums table
CREATE TABLE IF NOT EXISTS "albums" (
    "id" INTEGER PRIMARY KEY,
    "title" TEXT,
    "release_date" DATE,
    "artist_id" INTEGER,
    "genre_id" INTEGER,
    FOREIGN KEY ("artist_id") REFERENCES "artists" ("id"),
    FOREIGN KEY ("genre_id") REFERENCES "genres" ("id")
);

-- Define the Tracks table
CREATE TABLE IF NOT EXISTS "tracks" (
    "id" INTEGER PRIMARY KEY,
    "title" TEXT,
    "duration" REAL,
    "album_id" INTEGER,
    FOREIGN KEY ("album_id") REFERENCES "albums" ("id")
);

-- Define the Genres table
CREATE TABLE IF NOT EXISTS "genres" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT
);

-- Create an index on the artist_id column in the albums table for faster artist-based queries
CREATE INDEX IF NOT EXISTS "idx_artist_id"
    ON "albums" ("artist_id");

-- Create an index on the genre_id column in the albums table for faster genre-based queries
CREATE INDEX IF NOT EXISTS "idx_genre_id"
    ON "albums" ("genre_id");
