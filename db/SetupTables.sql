DROP TABLE IF EXISTS updatedBy;
DROP TABLE IF EXISTS matchesPlayedByTeams;
DROP TABLE IF EXISTS leagues;
DROP TABLE IF EXISTS teamsInLeague;
DROP TABLE IF EXISTS playersInTeam;
DROP TABLE IF EXISTS managers;
DROP TABLE IF EXISTS coaches;
DROP TABLE IF EXISTS staffInTeam;

CREATE TABLE leagues (
 	league_name char(20),
 	country char(20),
    numTeams int,
    PRIMARY KEY (league_name, country)
);

CREATE TABLE teamsInLeague (
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

CREATE TABLE playersInTeam (
    pname char(20),
    jerseyNum int,
    position char(3),
    ratings decimal(2),
    fouls int,
    onGoalPercentage int,
    goals int,
    assists int,
    t_name char(20) NOT NULL,
    PRIMARY KEY (pname, jerseyNum),
    FOREIGN KEY (t_name)
        REFERENCES teamsInLeague
);

CREATE TABLE staffInTeam (
    staff_id char(5),
    sName char(20),
    t_name char(20) NOT NULL,
    PRIMARY KEY (staff_id),
    FOREIGN KEY (t_name)
        REFERENCES teamsInLeague
	        ON DELETE NO ACTION
	        ON UPDATE CASCADE
);

CREATE TABLE coaches (
    staff_id char(5),
    title char(20),
    PRIMARY KEY (staff_id),
    FOREIGN KEY (staff_id)
        REFERENCES staffInTeam
);

CREATE TABLE managers (
    staff_id char(5),
    t_name char(20),
    PRIMARY KEY (staff_id),
    FOREIGN KEY (staff_id)
        REFERENCES staffInTeam
);

CREATE TABLE matchesPlayedByTeams(
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
        REFERENCES teamsInLeague
	        ON DELETE CASCADE
);

CREATE TABLE updatedBy (
 	staff_id char(5),
 	uname char (20) NOT NULL,
<<<<<<< HEAD
<<<<<<< HEAD
 	jerseyNum int NOT NULL,
    PRIMARY KEY (staffId, uname, jerseyNum),
    FOREIGN KEY (staffId)
        REFERENCES managers,
    FOREIGN KEY (uname, jerseyNum)
        REFERENCES playersInTeam
);
=======
    PRIMARY KEY (staff_id),
    FOREIGN KEY (staff_id)
        REFERENCES managers
);
>>>>>>> origin/master
=======
    PRIMARY KEY (staff_id),
    FOREIGN KEY (staff_id)
        REFERENCES managers
);
>>>>>>> origin/master
