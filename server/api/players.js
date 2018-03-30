import { Router } from 'express'
var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

router.get('/players', function (req, res, next) {
    const query = 'SELECT * FROM players_in_team;'
    connection.query(query, { type: connection.QueryTypes.SELECT })
        .then(players => {
            console.log(players)
            res.json(players)
        })
})

/**
 * get playter sorted by least goals
 */

 router.get('/players/most_goal', function (req, res, next) {
    const query = 'SELECT *, (SELECT COUNT(*) FROM goals WHERE jersey_no = j.jersey_no) as count FROM jersey_no j ORDER BY count;'
    connection.query(query, { type: connection.QueryTypes.SELECT })
        .then(players => {
            res.json(players)
        })
})


/**
 * player goals
 */
  router.get('/players/goals/', function (req, res, next) {
    const jersey_no = req.body.data.jersey_no
    const queryGoals = connection.query('SELECT * FROM goals WHERE j.jersey_no = :jersey_no',{ type: connection.QueryTypes.SELECT,
        replacements:{
            jersey_no: jersey_no
        }
    })
    .then(goals => {
        console.log(goals)
        res.json(goals)
    })
})

/**
 * add player 
 */
router.post('/players/add_player', bodyParser.json(), function (req, res, next) {
  const name = req.body.data.name;
  const jersey_no = req.body.data.jersey_no;
  const postition = req.body.data.postition;
  const ratings = req.body.data.ratings;
  const fouls = req.body.data.fouls;
  const goals = req.body.params.goals;
  const assists = req.body.data.assists;
  const team_id = req.body.data.team_id;

  const query =
        'INSERT INTO players_in_team(name, jersey_no, postition, ratings, fouls, goals, assists, team_id)' +
        'VALUES (:name, :jersey_no, :postition, :ratings, :fouls, :goals, :assists, :team_id);';
  connection.query(query,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {
        name: name,
        jersey_no: jersey_no,
        postition: postition,
        ratings: ratings,
        fouls: fouls,
        goals: goals,
        assists: assists,
        team_id: team_id,
      }
    })
    .then(result => {
      console.log(result);
      res.send('/players')
    })
    .catch((e) => {
      console.log(e);
      res.send('Unable to add your player');
    })
})

/**
 * update operation
 */
router.post('/player/update_player', bodyParser.json(), function (req, res, next) {
  const jersey_no = req.body.data.jersey_no
  const goals = req.body.params.goals

  const query =
        'UPDATE players_in_team SET goals = :goals WHERE jersey_no = :jersey_no;'
  connection.query(query,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        jersey_no: jersey_no,
        goals: goals
      }
    })
    .then(result => {
      res.send('/players')
    })
})

/**
 * delete player query
 */
router.post('/player/delete_player', bodyParser.json(), function (req, res, next) {
  const jersey_no = req.params.jersey_no
  const query = 'DELETE FROM players_in_team j WHERE j.jersey_no = :jersey_no;'
  connection.query(query,
    {
      type: connection.QueryTypes.DELETE,
      replacements: {
        jersey_no: jersey_no
      }
    })
    .then(result => {
      res.send('/player')
    })
})

export default router
