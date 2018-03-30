INSERT INTO leagues (league_name, country, numTeams)
VALUES ('EnglishPremierLeague', 'England', 20);
INSERT INTO leagues (league_name, country, numTeams)
VALUES ('Bundesliga', 'Germany', 18);
INSERT INTO leagues (league_name, country, numTeams)
VALUES ('LaLiga', 'Spain', 20);
INSERT INTO leagues (league_name, country, numTeams)
VALUES ('LigaMX', 'Mexico', 18);
INSERT INTO leagues (league_name, country, numTeams)
VALUES ('SerieA', 'Italy', 20);


INSERT INTO teams_in_league (t_name, team_id, wins, losses, draws, ratings, goals, totalYellowCards, totalRedCards, standing, league_name, country)
VALUES ('ManchesterUnited', '42032', 30, 3, 6, '99', 98, 13, 3, 1, 'EnglishPremierLeague', 'England');
INSERT INTO teams_in_league (t_name, team_id, wins, losses, draws, ratings, goals, totalYellowCards, totalRedCards, standing, league_name, country)
VALUES ('FCBayernMunich', '85739', 25, 7, 7, '98', 89, 14, 5, 2, 'Bundesliga', 'Germany');
INSERT INTO teams_in_league (t_name, team_id, wins, losses, draws, ratings, goals, totalYellowCards, totalRedCards, standing, league_name, country)
VALUES ('FCBarcelona', '98969', 23, 6, 4, '97', 88, 13, 4, 3, 'LaLiga', 'Spain');
INSERT INTO teams_in_league (t_name, team_id, wins, losses, draws, ratings, goals, totalYellowCards, totalRedCards, standing, league_name, country)
VALUES ('ClubAmerica', '92240', 22, 7, 8, '96', 85, 15, 5, 4, 'LigaMX', 'Mexico');
INSERT INTO teams_in_league (t_name, team_id, wins, losses, draws, ratings, goals, totalYellowCards, totalRedCards, standing, league_name, country)
VALUES ('Juventus', '60242', 21, 8, 9, '95', 78, 17, 8, 5, 'SerieA', 'Italy');


INSERT INTO players_in_team (pname, jerseyNum, position, ratings, fouls, goals, assists, t_name)
VALUES ('Wayne Rooney', 03, 'FW', '99', 20, 253, 62, 'ManchesterUnited');
INSERT INTO players_in_team (pname, jerseyNum, position, ratings, fouls, goals, assists, t_name)
VALUES ('Ryan Giggs', 99, 'MF', '90', 10, 155, 30, 'ManchesterUnited');
INSERT INTO players_in_team (pname, jerseyNum, position, ratings, fouls, goals, assists, t_name)
VALUES ('Gerd Muller', 23, 'FW', '99', 5, 365, 100, 'FCBayernMunich');
INSERT INTO players_in_team (pname, jerseyNum, position, ratings, fouls, goals, assists, t_name)
VALUES ('Thomas Muller', 44, 'FW', '89', 20, 151, 30, 'FCBayernMunich');
INSERT INTO players_in_team (pname, jerseyNum, position, ratings, fouls, goals, assists, t_name)
VALUES ('Lionel Messi', 35, 'FW', '99', 13, 368, 100, 'FCBarcelona');
INSERT INTO players_in_team (pname, jerseyNum, position, ratings, fouls, goals, assists, t_name)
VALUES ('Ronald Koeman', 27, 'DF', '81', 0, 67, 0, 'FCBarcelona');
INSERT INTO players_in_team (pname, jerseyNum, position, ratings, fouls, goals, assists, t_name)
VALUES ('Christian Effertz', 54, 'FW', '88', 13, 70, 44, 'ClubAmerica');
INSERT INTO players_in_team (pname, jerseyNum, position, ratings, fouls, goals, assists, t_name)
VALUES ('Darien Heidenreich', 11, 'DF', '75', 0, 30, 0, 'ClubAmerica');
INSERT INTO players_in_team (pname, jerseyNum, position, ratings, fouls, goals, assists, t_name)
VALUES ('Dayana Collier', 67, 'MF', '78', 15, 20, 5, 'Juventus');
INSERT INTO players_in_team (pname, jerseyNum, position, ratings, fouls, goals, assists, t_name)
VALUES ('Alexandro Adams', 88, 'MF', '82', 20, 56, 10, 'Juventus');


INSERT INTO staff_in_team (staff_id, sName, t_name)
VALUES ('05129', 'Adolf Lang', 'ManchesterUnited');
INSERT INTO staff_in_team (staff_id, sName, t_name)
VALUES ('19829', 'Sam Fisher', 'ManchesterUnited');
INSERT INTO staff_in_team (staff_id, sName, t_name)
VALUES ('06516', 'Merl Rolfson II', 'FCBayernMunich');
INSERT INTO staff_in_team (staff_id, sName, t_name)
VALUES ('16316', 'Merl Rolfson I', 'FCBayernMunich');
INSERT INTO staff_in_team (staff_id, sName, t_name)
VALUES ('09369', 'Michael Larson', 'FCBarcelona');
INSERT INTO staff_in_team (staff_id, sName, t_name)
VALUES ('13369', 'Michael Jackson', 'FCBarcelona');
INSERT INTO staff_in_team (staff_id, sName, t_name)
VALUES ('01674', 'Daphnee OHara', 'ClubAmerica');
INSERT INTO staff_in_team (staff_id, sName, t_name)
VALUES ('11374', 'Leo Opera', 'ClubAmerica');
INSERT INTO staff_in_team (staff_id, sName, t_name)
VALUES ('09950', 'Abel Balistreri', 'Juventus');
INSERT INTO staff_in_team (staff_id, sName, t_name)
VALUES ('19750', 'Ben Yang', 'Juventus');

INSERT INTO coaches (staff_id, title)
VALUES ('19829', 'SD');
INSERT INTO coaches (staff_id, title)
VALUES ('16316', 'AC');
INSERT INTO coaches (staff_id, title)
VALUES ('13369', 'AC');
INSERT INTO coaches (staff_id, title)
VALUES ('11374', 'SD');
INSERT INTO coaches (staff_id, title)
VALUES ('19750', 'AC');


INSERT INTO managers (staff_id, t_name)
VALUES ('05129', 'ManchesterUnited');
INSERT INTO managers (staff_id, t_name)
VALUES ('06516', 'FCBayernMunich');
INSERT INTO managers (staff_id, t_name)
VALUES ('09369', 'FCBarcelona');
INSERT INTO managers (staff_id, t_name)
VALUES ('01674', 'ClubAmerica');
INSERT INTO managers (staff_id, t_name)
VALUES ('09950', 'Juventus');

INSERT INTO matches_played_by_teams (t_name, match_id, location, result, time, date, goals, numyellowCards, numredCards)
VALUES ('ManchesterUnited', 15999900, 'sit', 'nihi', 741582959, '2008-03-22', 69663576, 7, 0);
INSERT INTO matches_played_by_teams (t_name, match_id, location, result, time, date, goals, numyellowCards, numredCards)
VALUES ('FCBayernMunich', 53514022, 'nisi', 'volu', 1172626456, '2005-02-17', 6101854, 4, 8);
INSERT INTO matches_played_by_teams (t_name, match_id, location, result, time, date, goals, numyellowCards, numredCards)
VALUES ('FCBarcelona', 23251040, 'necessitatibus', 'rati', 1057492892, '2016-05-04', 197799725, 6, 1);
INSERT INTO matches_played_by_teams (t_name, match_id, location, result, time, date, goals, numyellowCards, numredCards)
VALUES ('ClubAmerica', 41115420, 'asperiores', 'aspe', 844607629, '2012-08-17', 471, 5, 7);
INSERT INTO matches_played_by_teams (t_name, match_id, location, result, time, date, goals, numyellowCards, numredCards)
VALUES ('Juventus', 35977447, 'voluptate', 'aute', 485625183, '2001-05-05', 1225, 5, 1);


INSERT INTO updated_by (staff_id, uname)
VALUES ('05129', 'akertzmann');
INSERT INTO updated_by (staff_id, uname)
VALUES ('06516', 'beatty.stanford');
INSERT INTO updated_by (staff_id, uname)
VALUES ('09369', 'evelyn.windler');
INSERT INTO updated_by (staff_id, uname)
VALUES ('01674', 'ksipes');
INSERT INTO updated_by (staff_id, uname)
VALUES ('09950', 'bkunde');