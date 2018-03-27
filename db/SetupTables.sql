DROP TABLE IF EXISTS updatedBy;
DROP TABLE IF EXISTS matchesPlayedByTeams;
DROP TABLE IF EXISTS leagues;
DROP TABLE IF EXISTS teamsInLeague;
DROP TABLE IF EXISTS playersInTeam;
DROP TABLE IF EXISTS managers;
DROP TABLE IF EXISTS coaches;
DROP TABLE IF EXISTS staffInTeam;


CREATE TABLE staffInTeam (
    staffId char(5),
    sName char(20),
    teamId int NOT NULL,
    PRIMARY KEY (staffId),
    FOREIGN KEY (teamId)
        REFERENCES Teams
	        ON DELETE NO ACTION
	        ON UPDATE CASCADE
);

CREATE TABLE coaches (
    staffId int,
    title char(20),
    PRIMARY KEY (staffId),
    FOREIGN KEY (staffId)
        REFERENCES staffInTeam
);

CREATE TABLE managers (
    staffId int,
    teamId int,
    PRIMARY KEY (staffId),
    FOREIGN KEY (staffId)
        REFERENCES staffInTeam
);


CREATE TABLE playersInTeam (
    pname char(20),
    jerseyNum int,
    position char(3),
    ratings double(1, 2),
    fouls int,
    onGoal% int,
    goals int,
    assists int,
    teamId int NOT NULL,
    PRIMARY KEY (pname, jerseyNum),
    FOREIGN KEY (teamId)
        REFERENCES teamsInLeague
);

CREATE TABLE teamsInLeague (
 	tName char(20),
	teamId int,
	wins int,
	losses int,
	draws int,
    ratings double(1, 2),
    goals int,
    totalYellowCards int,
    totalRedCards int,
    standing int,
    lName char(20) NOT NULL,
 	country char(20) NOT NULL,
    PRIMARY KEY (tName),
    FOREIGN KEY (lName, country)
        REFERENCES leagues
);


CREATE TABLE leagues (
 	leaguename char(20),
 	country char(20),
    numTeams int,
    PRIMARY KEY (leaguename, country)
        ON DELETE CASCADE
);

CREATE TABLE matchesPlayedByTeams(
 	matchId int,
 	location char(20),
	teamId int,
    result char(4) NOT NULL,
 	time int,
	date date,
 	goals int,
	numyellowCards int,
	numredCards int,
	PRIMARY KEY (teamId, matchId)
    FOREIGN KEY (teamId)
        REFERENCES teamsInLeague
	        ON DELETE CASCADE
);

CREATE TABLE updatedBy (
 	staffId int,
 	uname char (20) NOT NULL,
 	jerseyNum int NOT NULL,
    PRIMARY KEY (staffId, uname, jerseyNum)
    FOREIGN KEY (staffId)
        REFERENCES managers,
    FOREIGN KEY (uname, jerseyNum)
        REFERENCES PlayersInLeague
);
