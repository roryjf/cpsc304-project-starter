import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()
 

 matchID, teamID, location, time, date, goals, result, #redCards, #yellowCards

router.get('/matches/get_matches', function (req, res, next) {
    const query = 'SELECT * FROM matches_played_by_teams;'
    connection.query(query, { type: connection.QueryTypes.SELECT })
        .then(matches => {
            console.log(matches)
            res.json(matches)
        })
})


/**
 * match result 
 */
  router.get('/matches/get_result/', function (req, res, next) {
    const match_id = req.body.data.match_id
    const queryResult = connection.query('SELECT * FROM result WHERE m.match_id = :match_id',{ type: connection.QueryTypes.SELECT,
        replacements:{
            match_id: match_id
        }
    })
    .then(result => {
        console.log(result)
        res.json(result)
    })
})

/**
 * add player 
 */
router.post('/matches/add_match', bodyParser.json(), function (req, res, next) {
  const match_id = Math.floor((Math.random() * 9999) + 1000);
  const team_id = req.body.data.team_id;
  const location = req.body.data.location;
  const time = req.body.data.time;
  const date = req.body.data.date;
  const goals = req.body.params.goals;
  const result = req.body.data.result;
  const no_red_cards = req.body.data.no_red_cards;
  const no_yellow_cards = req.body.data.no_yellow_cards;

  const query =
        'INSERT INTO players_in_team(match_id, team_id, location, time, date, goals, result, no_red_cards, no_yellow_cards)' +
        'VALUES (:match_id, :team_id, :location, :time, :date, :goals, :result, :no_red_cards, :no_yellow_cards);';
  connection.query(query,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {
        match_id: match_id,
        team_id: team_id,
       location: location,
       time: time,
       date: date,
       goals: goals,
       result: result,
       no_red_cards: no_red_cards,
       no_yellow_cards: no_yellow_cards
      }
    })
    .then(result => {
      console.log(result);
      res.send('/matches')
    })
    .catch((e) => {
      console.log(e);
      res.send('Unable to add your match');
    })
})

/**
 * update operation
 */
router.post('/matches/update_match', bodyParser.json(), function (req, res, next) {
  const match_id = req.body.data.match_id
  const result = req.body.params.result

  const query =
        'UPDATE matches_played_by_teams SET result = :result WHERE match_id = :match_id;'
  connection.query(query,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        match_id: match_id,
        result: result
      }
    })
    .then(result => {
      res.send('/matches')
    })
})

/**
 * delete match query
 */
router.post('/matches/delete_match', bodyParser.json(), function (req, res, next) {
  const match_id = req.params.jersey_no
  const query = 'DELETE FROM matches_played_by_teams m WHERE m.match_id = :match_id;'
  connection.query(query,
    {
      type: connection.QueryTypes.DELETE,
      replacements: {
        match_id: match_id
      }
    })
    .then(result => {
      res.send('/matches')
    })
})

export default router
