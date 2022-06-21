import mongoose from "mongoose";

const Notifikasi = mongoose.Schema({
    judul:{
        type: String,
        require: true
    },
    pesan:{
        type: String,
        require: true
    },
    id_keranjang:{
        type: String,
        require: true
    },
    read:{
        type: Boolean,
    }
},{
    timestamps: true
})

export default mongoose.model("Notifikasi",Notifikasi)