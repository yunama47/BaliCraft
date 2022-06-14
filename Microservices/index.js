import express from "express"
import routeNotif from "./route/routesNotifikasi.js"
import routeCart from "./route/routesKeranjang.js"
import mongoose from "mongoose"
import cors from 'cors'

const app = express()
const port = 3000

//database mongoDB
mongoose.connect("mongodb+srv://express:LGKZM1NpimG7fVkE@mycluster.pnxlz.mongodb.net/express_api?retryWrites=true&w=majority",{
  useNewUrlParser: true,
  useUnifiedTopology: true
})
const db = mongoose.connection
db.on('error',(error)=>console.log(error))
db.once('open',()=>console.log("Database terhubung"))
  
//aplikasi
app.use(cors())
app.use(express.json())
app.use(express.static('view'))
app.get('/', (req, res) => {
  res.sendFile('./index.html')
})
app.use("/notifikasi",routeNotif)
app.use("/keranjang",routeCart)

app.listen(port, () => {
  console.log(`aplikasi berjalan di port ${port} ( localhost:${port} )`)
})
