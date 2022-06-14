import keranjang from "../models/modelKeranjang.js";

export const getCart = async (req,res) =>{
    try{
        const cart = await keranjang.find()
        res.status(200).json(cart)
    }catch (error){
        res.status(400).json({message:error.message})
    }
}
export const getCartID = async(req,res) =>{
    try{
        const cart = await keranjang.findById(req.params.id)
        res.status(200).json(cart)
    }catch (error){
        res.status(400).json({message:error.message})
    }
}
export const saveCart = async(req,res) =>{
    const cart = new keranjang(req.body)
    try{
        const status = await cart.save()
        res.status(201).json(status)
    }catch (error){
        res.status(400).json({message:error.message})
    }
}
export const editCart = async(req,res) =>{
    var notifID = await keranjang.findById(req.params.id)
    // const request = {
    //     judul: notifID.judul,
    //     pesan: notifID.pesan,
    //     link_ref: notifID.link_ref,
    //     read:true
    // }
    try{
        const update = await keranjang.updateOne({_id:req.params.id},{$set:req.body})
        // const update = await keranjang.updateOne({_id:req.params.id},{$set:request})
        res.status(200).json(update)
    }catch (error){
        res.status(400).json({message:error.message})
    }
}
export const delCart = async(req,res) =>{
    try{
        const del = await keranjang.deleteOne({_id:req.params.id})
        res.status(200).json(del)
    }catch (error){
        res.status(400).json({message:error.message})
    }
}