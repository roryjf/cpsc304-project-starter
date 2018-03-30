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
 * get team sorted by least goals
 */

 router.get('/players/most_goal', function (req, res, next) {
    const query = 'SELECT *, (SELECT COUNT(*) FROM goals WHERE jersey_no = :jersey_no) as count FROM goals ORDER BY count;'
    connection.query(query, { type: connection.QueryTypes.SELECT })
        .then(players => {
            res.json(players)
        })
})


/**
 * player goals
 */
  router.get('/players/goals/', function (req, res, next) {
    const team_id = req.body.data.team_id
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

name, Jersey#, position, ratings, fouls, onGoal%, goals, assists, teamID
/**
 * add team 
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
        'INSERT INTO teams_in_league(name, jersey_no, postition, ratings, fouls, goals, assists, team_id)' +
        'VALUES (:name, :jersey_no, :postition, :ratings, :fouls, :goals, :assists, :team_id);';
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

/* GET users listing. */
router.get('/users', function (req, res, next) {
  const query = 'SELECT * FROM Users;'
  connection.query(query, { type: connection.QueryTypes.SELECT })
    .then(users => {
      console.log(users)
      res.json(users)
    })
})

/* GET user by ID. */
router.get('/users/:username', function (req, res, next) {
  const username = req.params.username
  const query = 'SELECT * FROM Users WHERE username = :username ;'
  connection.query(query, 
    { 
      type: connection.QueryTypes.SELECT,
      replacements: {
        username: username
      }
    })
    .then(user => {
      if (user.length === 1 ) {
        res.json(user[0])
      } else {
        res.status(404).json({})
      }
    })
})

router.post('/users/update', bodyParser.json(), function (req, res, next) {
  const userid = req.body.data.userid
  const username = req.body.data.username
  const password = req.body.data.password

  const query = 'UPDATE Users SET username = :username, password = :password WHERE userid = :userid ;'
  connection.query(query,
    {
      type: connection.QueryTypes.UPDATE,
      replacements: {
        username: username,
        password: password,
        userid: userid
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/users')
    })
})

router.post('/users/add', bodyParser.json(), function (req, res, next) {
  const userid = req.body.data.userid
  const username = req.body.data.username
  const password = req.body.data.password

  const query = 'INSERT INTO Users (username, password) VALUES (:username, :password) ;'
  connection.query(query,
    {
      type: connection.QueryTypes.INSERT,
      replacements: {
        username: username,
        password: password
      }
    })
    .then(result => {
      // result[1] is the number of rows changed
      res.send('/users')
    })
})

export default router
