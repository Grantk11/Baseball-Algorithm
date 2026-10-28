USE Pitcher_Development;
CREATE TABLE Pitcher_References (
    Reference_Season_Stats_ID INT AUTO_INCREMENT PRIMARY KEY,

    -- FOREIGN KEY IDENTIFIERS
    MLB_Player_ID INT NOT NULL,
    Season_ID INT NOT NULL,
    Team_ID INT NOT NULL,

    -- MINOR LEAGUE LEVEL
    Sport_ID INT,

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
    CONSTRAINT fk_reference_player
        FOREIGN KEY (MLB_Player_ID)
        REFERENCES Player(MLB_Player_ID),

    CONSTRAINT fk_reference_season
        FOREIGN KEY (Season_ID)
        REFERENCES Season(Season_ID),

    CONSTRAINT fk_reference_team
        FOREIGN KEY (Team_ID)
        REFERENCES Team(Team_ID),

    -- PREVENT DUPLICATE SEASON RECORDS
    CONSTRAINT uq_reference_player_team_season
        UNIQUE (MLB_Player_ID, Team_ID, Season_ID)
);