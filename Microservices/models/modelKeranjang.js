import mongoose from "mongoose";

const Keranjang = mongoose.Schema({
    id_brg:{
        type: Number,
        require: true
    },
    jumlah:{
        type: Number,
        require: true
    },
    alamat:{
        type: String,
        require: true
    },
    no_telp:{
        type: String,
        require: true
    },
    products:{
        type : Object,
        require: true
    }
},{
    timestamps: true
})

export default mongoose.model("Keranjang",Keranjang)