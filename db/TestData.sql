INSERT INTO leagues (leagueName, country, numTeams)
VALUES ('aliquam', 'Pakistan', 8);
INSERT INTO leagues (leagueName, country, numTeams)
VALUES ('velit', 'Luxembourg', 9);
INSERT INTO leagues (leagueName, country, numTeams)
VALUES ('saepe', 'Samoa', 4);
INSERT INTO leagues (leagueName, country, numTeams)
VALUES ('harum', 'Serbia', 3);
INSERT INTO leagues (leagueName, country, numTeams)
VALUES ('dicta', 'Yemen', 6);


INSERT INTO teamsInLeague (tName, teamId, wins, losses, draws, ratings, goals, totalYellowCards, totalRedCards, standing, leagueName, country)
VALUES ('at', '42032', 0, 0, 0, '0', 0, 0, 0, 0, 'aliquam', 'Pakistan');
INSERT INTO teamsInLeague (tName, teamId, wins, losses, draws, ratings, goals, totalYellowCards, totalRedCards, standing, leagueName, country)
VALUES ('atque', '85739', 0, 0, 0, '99', 0, 0, 0, 0, 'velit', 'Luxembourg');
INSERT INTO teamsInLeague (tName, teamId, wins, losses, draws, ratings, goals, totalYellowCards, totalRedCards, standing, leagueName, country)
VALUES ('debitis', '98969', 0, 0, 0, '99', 0, 0, 0, 0, 'saepe', 'Samoa');
INSERT INTO teamsInLeague (tName, teamId, wins, losses, draws, ratings, goals, totalYellowCards, totalRedCards, standing, leagueName, country)
VALUES ('dicta', '92240', 0, 0, 0, '99', 0, 0, 0, 0, 'harum', 'Serbia');
INSERT INTO teamsInLeague (tName, teamId, wins, losses, draws, ratings, goals, totalYellowCards, totalRedCards, standing, leagueName, country)
VALUES ('doloremque', '60242', 0, 0, 0, '99', 0, 0, 0, 0, 'dicta', 'Yemen');


INSERT INTO playersInTeam (pname, jerseyNum, position, ratings, fouls, onGoalPercentage, goals, assists, teamId)
VALUES ('Adele Bauch', 03, 'hic', '99', 0, 0, 0, 0, '42032');
INSERT INTO playersInTeam (pname, jerseyNum, position, ratings, fouls, onGoalPercentage, goals, assists, teamId)
VALUES ('Alysson Metz', 99, 'con', '99', 0, 0, 0, 0, '42032');
INSERT INTO playersInTeam (pname, jerseyNum, position, ratings, fouls, onGoalPercentage, goals, assists, teamId)
VALUES ('Angus Pacocha', 23, 'atq', '99', 0, 0, 0, 0, '85739');
INSERT INTO playersInTeam (pname, jerseyNum, position, ratings, fouls, onGoalPercentage, goals, assists, teamId)
VALUES ('Anthony Collier', 44, 'por', '99', 0, 0, 0, 0, '85739');
INSERT INTO playersInTeam (pname, jerseyNum, position, ratings, fouls, onGoalPercentage, goals, assists, teamId)
VALUES ('Antwon Gerhold', 35, 'ips', '0', 0, 0, 0, 0, '98969');
INSERT INTO playersInTeam (pname, jerseyNum, position, ratings, fouls, onGoalPercentage, goals, assists, teamId)
VALUES ('Bethel Kertzmann', 27, 'est', '99', 0, 0, 0, 0, '98969');
INSERT INTO playersInTeam (pname, jerseyNum, position, ratings, fouls, onGoalPercentage, goals, assists, teamId)
VALUES ('Christian Effertz', 54, 'ven', '0', 0, 0, 0, 0, '92240');
INSERT INTO playersInTeam (pname, jerseyNum, position, ratings, fouls, onGoalPercentage, goals, assists, teamId)
VALUES ('Darien Heidenreich', 11, 'qua', '99', 0, 0, 0, 0, '92240');
INSERT INTO playersInTeam (pname, jerseyNum, position, ratings, fouls, onGoalPercentage, goals, assists, teamId)
VALUES ('Dayana Collier', 67, 'ten', '99', 0, 0, 0, 0, '60242');
INSERT INTO playersInTeam (pname, jerseyNum, position, ratings, fouls, onGoalPercentage, goals, assists, teamId)
VALUES ('Alexandro Adams', 88, 'in', '99', 0, 0, 0, 0, '60242');


INSERT INTO staffInTeam (staffId, sName, teamId)
VALUES ('05129', 'Adolf Lang', '42032');
INSERT INTO staffInTeam (staffId, sName, teamId)
VALUES ('06516', 'Merl Rolfson II', '85739');
INSERT INTO staffInTeam (staffId, sName, teamId)
VALUES ('09369', 'Michael Larson', '98969');
INSERT INTO staffInTeam (staffId, sName, teamId)
VALUES ('01674', 'Daphnee OHara', '92240');
INSERT INTO staffInTeam (staffId, sName, teamId)
VALUES ('09950', 'Abel Balistreri', '60242');


INSERT INTO managers (staffId, teamId)
VALUES ('05129', '42032');
INSERT INTO managers (staffId, teamId)
VALUES ('06516', '85739');
INSERT INTO managers (staffId, teamId)
VALUES ('09369', '98969');
INSERT INTO managers (staffId, teamId)
VALUES ('01674', '92240');
INSERT INTO managers (staffId, teamId)
VALUES ('09950', '60242');

INSERT INTO matchesPlayedByTeams (matchId, location, teamId, result, time, date, goals, numyellowCards, numredCards)
VALUES (15999900, 'sit', '42032', 'nihi', 741582959, '2008-03-22', 69663576, 7, 0);
INSERT INTO matchesPlayedByTeams (matchId, location, teamId, result, time, date, goals, numyellowCards, numredCards)
VALUES (53514022, 'nisi', '85739', 'volu', 1172626456, '2005-02-17', 6101854, 4, 8);
INSERT INTO matchesPlayedByTeams (matchId, location, teamId, result, time, date, goals, numyellowCards, numredCards)
VALUES (23251040, 'necessitatibus', '98969', 'rati', 1057492892, '2016-05-04', 197799725, 6, 1);
INSERT INTO matchesPlayedByTeams (matchId, location, teamId, result, time, date, goals, numyellowCards, numredCards)
VALUES (41115420, 'asperiores', '92240', 'aspe', 844607629, '2012-08-17', 471, 5, 7);
INSERT INTO matchesPlayedByTeams (matchId, location, teamId, result, time, date, goals, numyellowCards, numredCards)
VALUES (35977447, 'voluptate', '60242', 'aute', 485625183, '2001-05-05', 1225, 5, 1);


INSERT INTO updatedBy (staffId, uname)
VALUES ('05129', 'akertzmann');
INSERT INTO updatedBy (staffId, uname)
VALUES ('06516', 'beatty.stanford');
INSERT INTO updatedBy (staffId, uname)
VALUES ('09369', 'evelyn.windler');
INSERT INTO updatedBy (staffId, uname)
VALUES ('01674', 'ksipes');
INSERT INTO updatedBy (staffId, uname)
VALUES ('09950', 'bkunde');