import {Router} from 'express'

var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/** delete coach query
 *
 */
router.post('/queries/delete_coach', bodyParser.json(), function (req, res, next) {
  const coach = req.params.staffId
  const query = 'DELETE FROM coaches c WHERE c.staffId = :coach;'
  connection.query(query,
    {
      type: connection.QueryTypes.DELETE,
      replacements: {
        coach: coach
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
 * selection and projection
 */

router.get('/queries/selection_projection', bodyParser.json(), function (req, res, next) {
  const team = req.body.params.tName

  const query = 'SELECT teamId FROM teamsInLeague t WHERE t.tName = :team'
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT,
      replacements: {
        team: team
      }
    })
    .then(result => {
      res.send('/queries')
    })
})

export default router
