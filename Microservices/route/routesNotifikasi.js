import express from "express"
import { getNotifs , getNotifsID, saveNotifs, readNotifs, delNotifs} from "../controller/controllerNotifikasi.js"

const router = express.Router()

router.get('/', getNotifs)
router.get('/:id', getNotifsID)
router.post('/', saveNotifs)
router.put('/:id', readNotifs)
router.delete('/:id', delNotifs)

export default router