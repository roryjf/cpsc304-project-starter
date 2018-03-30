DROP TABLE IF EXISTS updated_by;
DROP TABLE IF EXISTS matches_played_by_teams;
DROP TABLE IF EXISTS leagues;
DROP TABLE IF EXISTS teams_in_league;
DROP TABLE IF EXISTS players_in_team;
DROP TABLE IF EXISTS managers;
DROP TABLE IF EXISTS coaches;
DROP TABLE IF EXISTS staff_in_team;

CREATE TABLE leagues (
 	league_name char(20),
 	country char(20),
    numTeams int,
    PRIMARY KEY (league_name, country)
);

CREATE TABLE teams_in_league (
    t_name char(20) NOT NULL,
 	team_id char(5) NOT NULL,
	wins int,
	losses int,
	draws int,
    ratings decimal(2),
    goals int,
    totalYellowCards int,
    totalRedCards int,
    standing int,
    league_name char(20) NOT NULL,
 	country char(20) NOT NULL,
    PRIMARY KEY (t_name),
    FOREIGN KEY (league_name, country)
        REFERENCES leagues
);

CREATE TABLE players_in_team (
    pname char(20),
    jerseyNum int,
    position char(3),
    ratings decimal(2),
    fouls int,
    goals int,
    assists int,
    t_name char(20) NOT NULL,
    PRIMARY KEY (pname, jerseyNum),
    FOREIGN KEY (t_name)
        REFERENCES teams_in_league
);

CREATE TABLE staff_in_team (
    staff_id char(5),
    sName char(20),
    t_name char(20) NOT NULL,
    PRIMARY KEY (staff_id),
    FOREIGN KEY (t_name)
        REFERENCES teams_in_league
	        ON DELETE NO ACTION
	        ON UPDATE CASCADE
);

CREATE TABLE coaches (
    staff_id char(5),
    title char(20),
    PRIMARY KEY (staff_id),
    FOREIGN KEY (staff_id)
        REFERENCES staff_in_team
);

CREATE TABLE managers (
    staff_id char(5),
    t_name char(20),
    PRIMARY KEY (staff_id),
    FOREIGN KEY (staff_id)
        REFERENCES staff_in_team
);

CREATE TABLE matches_played_by_teams(
 	t_name char(20) NOT NULL,
    match_id int NOT NULL,
 	location char(20),
    result char(4) NOT NULL,
 	time int,
	date date,
 	goals int,
	numyellowCards int,
	numredCards int,
	PRIMARY KEY (t_name, match_id),
    FOREIGN KEY (t_name)
        REFERENCES teams_in_league
	        ON DELETE CASCADE
);

CREATE TABLE updated_by (
 	staff_id char(5),
 	uname char (20) NOT NULL,
    PRIMARY KEY (staff_id),
    FOREIGN KEY (staff_id)
        REFERENCES managers
);