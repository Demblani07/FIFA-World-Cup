USE FIFA_World_Cup;

SELECT * FROM world_cup_matches;
SELECT * FROM world_cup_line_ups;
SELECT * FROM world_cup_tournaments;

# Which country hosted the World Cup in 2014?

SELECT * 
FROM world_cup_tournaments 
WHERE year = 2014;

# Which team won the World Cup in 2006, and who was the runner-up?

SELECT Winner, Runners_Up 
FROM world_cup_tournaments 
WHERE year = 2006;

# How many goals were scored in total during the 2010 World Cup?

SELECT GoalsScored 
FROM world_cup_tournaments 
WHERE year = 2010;

# List all countries that finished in third place from 1990 to 2018.

SELECT year, Third 
FROM world_cup_tournaments 
WHERE year BETWEEN 1990 AND 2018;

# How many matches were played in the 2014 World Cup?

SELECT MatchesPlayed 
FROM world_cup_tournaments 
WHERE year = 2014;

# Which stadium hosted the final match of the 1998 World Cup, and which teams played in the final?

SELECT Stadium, Home_Team_Name,Home_Team_Goals 
FROM world_cup_matches 
WHERE year = 1998 AND Stage = "Final";

# What was the attendance for the match between Brazil and Germany in the 2014 semi-finals?

SELECT Attendance 
FROM world_cup_matches 
WHERE Year = 2014 AND Home_Team_Name = 'Brazil' 
AND Away_Team_Name = 'Germany';

# Identify the match with the highest number of goals scored in the 2002 World Cup. Provide details about the teams, goals scored, and stage of the tournament.

SELECT Home_Team_Name, Away_Team_Name, Home_Team_Goals, Away_Team_Goals, Stage 
FROM world_cup_matches 
WHERE Year = 2002 
ORDER BY (Home_Team_Goals + Away_Team_Goals) 
DESC LIMIT 1;

# Who was the coach of the Italian team in the 2006 World Cup final?

SELECT Coach_Name, Player_Name
FROM world_cup_line_ups 
WHERE Team_Initials = 'ITA' 
AND MatchID = (SELECT MatchID FROM world_cup_matches WHERE Year = 2006 AND Stage = 'Final');

# List the starting lineup (player names and shirt numbers) for the French team in the 1998 World Cup final.

SELECT Shirt_Number, Player_Name 
FROM world_cup_line_ups 
WHERE Team_Initials = 'FRA' 
AND MatchID = (SELECT MatchID FROM world_cup_matches WHERE Year = 1998 AND Stage = 'Final');

# Which player scored the most goals in a single match in the 2010 World Cup? Provide details of the match

SELECT l.Player_Name, COUNT(*) AS Goals_Scored
FROM world_cup_line_ups l
JOIN world_cup_matches m ON l.MatchID = m.MatchID
WHERE m.Year = 2010
GROUP BY l.Player_Name
ORDER BY Goals_Scored DESC
LIMIT 1;

# The average number of goals scored per match in the 1994 World Cups.

SELECT AVG(Home_Team_Goals + Away_Team_Goals) as Average_of_team_goals
FROM world_cup_matches 
WHERE Year = 1994;

# Identify the team with the highest average attendance per match in the 2010 World Cup.

SELECT Home_Team_Name, AVG(Attendance) as Average_attendance
FROM world_cup_matches 
WHERE Year = 2010 
GROUP BY Home_Team_Name 
ORDER BY AVG(Attendance) 
DESC LIMIT 1;

# Which referee officiated the most matches in the 2014 World Cup?

SELECT Referee, COUNT(*) as Matches_Officiated 
FROM world_cup_matches 
WHERE Year = 2014 
GROUP BY Referee 
ORDER BY Matches_Officiated 
DESC LIMIT 1;

# Analyze the trend in the number of qualified teams and matches played from 1990 to 2018. What observations can be made about the growth of the tournament?

SELECT Year, QualifiedTeams, MatchesPlayed 
FROM world_cup_tournaments 
WHERE Year BETWEEN 1990 AND 2014 
ORDER BY Year;
