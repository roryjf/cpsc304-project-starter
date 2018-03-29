import {Router} from 'express'

var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()



/**
 * add operation
 */
router.post('/queries/update_team', bodyParser.json(), function (req, res, next) {
  const team = Math.floor((Math.random() * 99999) + 11111);
  const name = req.body.
  const l_name = 
  const
  const
  const
  const
  const wins = req.body.params.wins

  const query =
        'INSERT INTO teams_in_league(team_id, name, l_name, l_country, draws, wins, losses, ratings, total_yellow_cards, total_red_cards, goals)' +
        'VALUES (:team_id, :name, :l_name, :l_country, :draws, :wins, :losses, :ratings, :total_yellow_cards, :total_red_cards, :goals);';
  connection.query(query,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {
        team: team_id,
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
      res.send('Team Added!')
    })
    .catch((e) => {
      console.log(e);
      res.send('Unable to add your team');
    })
})

/**
 * update operation
 */
router.post('/queries/update_team', bodyParser.json(), function (req, res, next) {
  const team = req.body.data.teamId
  const wins = req.body.params.wins

  const query =
        'UPDATE teamsInLeague SET wins = :wins WHERE teamId = :team;'
  connection.query(query,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        team: team,
        wins: wins
      }
    })
    .then(result => {
      res.send('/queries')
    })
})

/**
 * delete team query
 */
router.post('/queries/delete_team', bodyParser.json(), function (req, res, next) {
  const team = req.params.teamId
  const query = 'DELETE FROM teamsInLeague t WHERE t.teamId = :team;'
  connection.query(query,
    {
      type: connection.QueryTypes.DELETE,
      replacements: {
        team: team
      }
    })
    .then(result => {
      res.send('/queries')
    })
})

export default router