import express from "express"
import { getCart , getCartID, saveCart, editCart, delCart} from "../controller/controllerKeranjang.js"

const router = express.Router()

router.get('/', getCart)
router.get('/:id', getCartID)
router.post('/', saveCart)
router.put('/:id', editCart)
router.delete('/:id', delCart)

export default router