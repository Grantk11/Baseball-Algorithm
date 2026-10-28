CREATE DATABASE IF NOT EXISTS Pitcher_Development;
USE Pitcher_Development;

-- PLAYER TABLE
CREATE TABLE Player (
    MLB_Player_ID INT UNIQUE,
    Full_Name VARCHAR(100) NOT NULL,
    Birthdate DATE,
    Position VARCHAR(20),
    Bats VARCHAR(10),
    Throws VARCHAR(10)
);

-- TEAM TABLE
CREATE TABLE Team (
    MLB_Team_ID INT UNIQUE,
    Team_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Level VARCHAR(20),
    Parent_Organization VARCHAR(100)
);

-- SEASON TABLE
CREATE TABLE Season (
    Season_ID INT AUTO_INCREMENT PRIMARY KEY,
    Season_Year INT NOT NULL UNIQUE
);

-- PLAYER SEASON STATS TABLE
CREATE TABLE Player_Season_Stats (
    Player_Season_Stats_ID INT AUTO_INCREMENT PRIMARY KEY,

    MLB_Player_ID INT NOT NULL,
    Season_ID INT NOT NULL,
    Team_ID INT NOT NULL,

    Player_Name VARCHAR(100),
    MLB_Team_ID INT,
    Team_Name VARCHAR(100),
    Sport_ID INT,
    Season INT,

    -- PITCHING STATISTICS
    Games_Pitched INT,
    Games_Started INT,
    Wins INT,
    Losses INT,
    Innings_Pitched DECIMAL(6,1),
    Hits_Allowed INT,
    Earned_Runs INT,
    Walks_Allowed INT,
    Pitching_Strikeouts INT,
    ERA DECIMAL(5,2),
    WHIP DECIMAL(5,2),

    -- FOREIGN KEYS
    FOREIGN KEY (MLB_Player_ID)
        REFERENCES Player(MLB_Player_ID),

    FOREIGN KEY (Season_ID)
        REFERENCES Season(Season_ID),

    FOREIGN KEY (Team_ID)
        REFERENCES Team(Team_ID),

    -- PREVENT DUPLICATE STATISTICS
    CONSTRAINT uq_player_team_season_group
        UNIQUE (MLB_Player_ID, Team_ID, Season_ID)
);