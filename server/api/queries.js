import {Router} from 'express'

var connection = require('../configs/sequelize')
const bodyParser = require('body-parser')

const router = Router()

/** delete coach query
 *
 */
router.post('/queries/delete_coach', bodyParser.json(), function (req, res, next) {
  const coach = req.params.staffId
  const query = 'DELETE FROM coaches c WHERE c.staff_id = :coach;'
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
  const team = req.params.team_id
  const query = 'DELETE FROM teamsInLeague t WHERE t.team_id = :team;'
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
  const team = req.body.data.team_id
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
  console.log("Searching database...");
  let select = req.body.data.colsSelected;
  select = select.join(", ");
  const queryParams = req.body.params.t_name;
  const where = Object.keys(queryParams).map(function (x) {return x + ' = ' + queryParams[x]}).join(' AND ');
  const query = 
        'SELECT ' + select + ' ' +
        'FROM teamsInLeague ' +
        'WHERE ' + where + ';';     
  console.log(query);
  connection.query(query,
    {
      type: connection.QueryTypes.SELECT
    })
    .then(result => {
      res.send('/queries')
      console.log(result)
    })
    .catch(e => {
      res.status(400).send(e.message)
    })
})

export default router
