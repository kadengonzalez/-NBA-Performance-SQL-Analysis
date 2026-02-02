-- 1. Dataset overview
SELECT
  COUNT(*) AS total_games,
  MIN(season) AS first_season,
  MAX(season) AS last_season
FROM
  nba.games;

-- 2. Average scoring and home win rate
SELECT
  ROUND(AVG(pts_home), 2) AS avg_home_score,
  ROUND(AVG(pts_away), 2) AS avg_away_score,
  ROUND(AVG(home_team_win), 2) AS home_win_rate
FROM
  nba.games;

-- 3. Scoring trends by season
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

-- 4. Three-point efficiency vs winning (HAVING)
SELECT
  team_home,
  season,
  ROUND(AVG(pct_3p_home), 2) AS avg_3pt_pct,
  ROUND(AVG(home_team_win), 2) AS win_rate
FROM
  nba.games
WHERE
  season >= '2018'
GROUP BY
  team_home, season
HAVING
  AVG(pct_3p_home) >= 0.37;
