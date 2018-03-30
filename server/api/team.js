import {Router} from 'express'

var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()


router.get('/team/get_teams', function (req, res, next) {
    const query = 'SELECT * FROM teams_in_league;'
    connection.query(query, { type: connection.QueryTypes.SELECT })
        .then(team => {
            console.log(team)
            res.json(team)
        })
})

/**
 * get team sorted by least goals
 */

 router.get('/team/least_goal', function (req, res, next) {
    const query = 'SELECT *, (SELECT COUNT(*) FROM goals WHERE team_id = :team_id) as count FROM goals ORDER BY count;'
    connection.query(query, { type: connection.QueryTypes.SELECT })
        .then(teams => {
            res.json(teams)
        })
})

/**
 * get goals
 */

 router.get('/team/goals/', function (req, res, next) {
    const team_id = req.body.data.team_id
    const queryGoals = connection.query('SELECT * FROM goals WHERE t.team_id = :team_id',{ type: connection.QueryTypes.SELECT,
        replacements:{
            team_id: team_id
        }
    })
    .then(goals => {
        console.log(goals)
        res.json(goals)
    })
})

/**
 * add team 
 */
router.post('/team/add_team', bodyParser.json(), function (req, res, next) {
  const team_id = Math.floor((Math.random() * 99999) + 10000);
  const name = req.body.data.name;
  const l_name = req.body.data.l_name;
  const l_country = req.body.data.l_country;
  const draws = req.body.data.draws;
  const wins = req.body.data.wins;
  const losses = req.body.data.losses;
  const ratings = req.body.params.ratings;
  const total_yellow_cards = req.body.data.total_yellow_cards;
  const total_red_cards = req.body.data.total_red_cards;
  const goals = req.body.data.goals;

  const query =
        'INSERT INTO teams_in_league(team_id, name, l_name, l_country, draws, wins, losses, ratings, total_yellow_cards, total_red_cards, goals)' +
        'VALUES (:team_id, :name, :l_name, :l_country, :draws, :wins, :losses, :ratings, :total_yellow_cards, :total_red_cards, :goals);';
  connection.query(query,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {
        team_id: team_id,
        name: name,
        wins: wins,
        l_name: l_name,
        l_country: l_country,
        draws: draws,
        losses: losses,
        ratings: ratings,
        total_red_cards: total_red_cards,
        total_yellow_cards: total_yellow_cards,
        goals: goals
      }
    })
    .then(result => {
      console.log(result);
      res.send('/team')
    })
    .catch((e) => {
      console.log(e);
      res.send('Unable to add your team');
    })
})

/**
 * update operation
 */
router.post('/team/update_team', bodyParser.json(), function (req, res, next) {
  const team_id = req.body.data.teamId
  const goals = req.body.params.goals

  const query =
        'UPDATE teams_in_league SET goals = :goals WHERE team_id = :team_id;'
  connection.query(query,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        team: team,
        goals: goals
      }
    })
    .then(result => {
      res.send('/team')
    })
})

/**
 * delete team query
 */
router.post('/team/delete_team', bodyParser.json(), function (req, res, next) {
  const team = req.params.teamId
  const query = 'DELETE FROM teams_in_league t WHERE t.team_id = :team_id;'
  connection.query(query,
    {
      type: connection.QueryTypes.DELETE,
      replacements: {
        team_id: team_id
      }
    })
    .then(result => {
      res.send('/team')
    })
})

export default router