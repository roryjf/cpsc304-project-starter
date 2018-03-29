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



export default router
