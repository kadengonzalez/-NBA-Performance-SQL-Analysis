-- Average points and home win rate by season
SELECT
  season,
  ROUND(AVG(pts_home), 2) AS avg_home_score,
  ROUND(AVG(pts_away), 2) AS avg_away_score
FROM
  nba.games
GROUP BY
  season
ORDER BY
  season ASC;
