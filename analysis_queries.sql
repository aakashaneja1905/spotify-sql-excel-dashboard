-- 1 Tracks released per year
SELECT LEFT(release_date, 4) AS year, COUNT(*) AS num_tracks
FROM spotify_tracks
GROUP BY year
ORDER BY year;

-- 2 Avg popularity per year
SELECT LEFT(release_date, 4) AS year, AVG(popularity) AS avg_popularity
FROM spotify_tracks
GROUP BY year
ORDER BY year;

-- 3 Top 10 tracks
SELECT name, artist, popularity
FROM spotify_tracks
ORDER BY popularity DESC
LIMIT 10;

-- 4 Top 10 artists
SELECT artist, COUNT(*) AS num_tracks
FROM spotify_tracks
GROUP BY artist
ORDER BY num_tracks DESC
LIMIT 10;

-- 5 Tracks per month
SELECT LEFT(release_date, 7), COUNT(*) FROM spotify_tracks WHERE release_date IS NOT NULL AND release_date <> '' GROUP BY LEFT(release_date, 7) ORDER BY LEFT(release_date, 7);


-- 6 Percentage of tracks released per year
SELECT LEFT(release_date, 4), (COUNT(*) / (SELECT COUNT(*) FROM spotify_tracks)) * 100 AS percent_tracks
FROM spotify_tracks
WHERE release_date IS NOT NULL AND release_date <> ''
GROUP BY LEFT(release_date, 4)
ORDER BY LEFT(release_date, 4);

-- 7 Tracks released by month
SELECT 
  MONTH(release_date) AS release_month,
  COUNT(*) AS num_tracks
FROM spotify_tracks
GROUP BY release_month
ORDER BY release_month;

-- 8 Albums with most tracks
SELECT album_name, COUNT(*) AS num_tracks
FROM spotify_tracks
GROUP BY album_name
ORDER BY num_tracks DESC
LIMIT 5;
