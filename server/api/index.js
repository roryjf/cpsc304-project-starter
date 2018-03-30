impoimport { Router } from 'express'

import matches from './matches'
import team from './team'
import players from './players'
import users from './users'
<<<<<<< HEAD
import league from './league'
=======
import queries from './queries'
>>>>>>> origin/master

const router = Router()

router.use(matches)
router.use(team)
router.use(players)
router.use(users)
<<<<<<< HEAD
router.use(league)
=======
router.use(queries)
>>>>>>> origin/master

export default router
