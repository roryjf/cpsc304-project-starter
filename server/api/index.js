impoimport { Router } from 'express'

import matches from './matches'
import team from './team'
import players from './players'
import users from './users'
import league from './league'

const router = Router()

router.use(matches)
router.use(team)
router.use(players)
router.use(users)
router.use(league)

export default router
