<template>
<div class="w-full ">
        <div>
            <p class="text-xl pb-3 flex items-center">
                <i class="fas fa-list mr-3"></i> Detail Pemesanan
            </p>
        </div>
        <div class="rounded-lg shadow-lg flex flex-col px-4 py-3 w-3/5">
            <p class="text-sm text-gray-500">id pemesanan : {{order._id}}</p>
            <div class="flex flex-row">
                <img @click="imageView()" class="shadow-md rounded mr-5" width="200" height="250" :src="order.products.link_gambar"/>
                <table>
                    <tbody>
                        <tr>
                            <td class="px-2">Barang</td>
                            <td class="px-2">: <strong>{{this.order.products.nama_kerajinan}}</strong></td>
                        </tr>
                        <tr>
                            <td class="px-2">Bahan Utama</td>
                            <td class="px-2">: <strong>{{this.order.products.bahan}}</strong></td>
                        </tr>
                        <tr>
                            <td class="px-2">Pengrajin</td>
                            <td class="px-2">: <strong>{{pengrajin}}</strong></td>
                        </tr>
                        <tr>
                            <td class="px-2">Harga</td>
                            <td class="px-2">: <strong>Rp. {{this.order.products.harga}}</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <table class="w-1/2">
                <tbody>
                    <tr>
                        <td class="px-1 py-3">Jumlah Dipesan</td>
                        <td class="px-1 py-3">: <strong>{{this.order.jumlah}}</strong></td>
                    </tr>
                    <tr>
                        <td class="px-1 py-3">Alamat Pembeli</td>
                        <td class="px-1 py-3">: <strong>{{this.order.alamat}}</strong></td>
                    </tr>
                    <tr>
                        <td class="px-1 py-3">Kontak Pembeli</td>
                        <td class="px-1 py-3">: <strong>{{this.order.no_telp}}</strong></td>
                    </tr>
                    <tr>
                        <td class="px-1 py-3"><strong>Total Harga</strong></td>
                        <td class="px-1 py-3">: <strong>Rp. {{this.order.jumlah * this.order.products.harga}}</strong></td>
                    </tr>
                </tbody>
            </table>
            <div class="flex flex-row">
                <router-link :to="{name:'dasbor'}" class="w-1/3 no-underline bg-blue-600 text-white font-semibold p-1 m-1 rounded-lg shadow-lg hover:shadow-xl hover:bg-gray-300 hover:text-black flex items-center justify-center">
                    Kembali
                </router-link>
                <button @click="alert()" class="w-1/3 no-underline bg-green-600 text-white font-semibold p-1 m-1 rounded-lg shadow-lg hover:shadow-xl hover:bg-gray-300 hover:text-black flex items-center justify-center">
                    Proses Pesanan
                </button>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data() {
    return {
        order:undefined,
        pengrajin:undefined   
    }
    },
    created() {
        this.getOrder()
    },
    methods: {
        getOrder(){
            this.axios.get('http://localhost:3000/keranjang/'+this.$route.params.id)
            .then((response)=>{
                this.order = response.data
                this.findPengrajins(response.data.products.id_peng)
            }).catch((error)=> console.log(error))
        },
        findPengrajins(id_peng){
            this.axios.get('http://127.0.0.1:8000/api/peng')
            .then((response)=>{
                let pengrajins = response.data.data
                for (const peng of pengrajins){
                    if(peng.id_peng == id_peng){
                        this.pengrajin = peng.nama_peng
                    }
                }
            }).catch((error)=> console.log(error))
        },
        imageView(){
            this.$swal.fire({
                title: 'Preview Gambar Barang',
                imageUrl: this.order.products.link_gambar,
                imageAlt: this.order.products.nama_kerajinan
            })
        },
        alert(){
            this.$swal
            .fire(
                {text: 'Fitur Belum Tersedia', timer: 1000}
            );
        }
    }
}
</script>