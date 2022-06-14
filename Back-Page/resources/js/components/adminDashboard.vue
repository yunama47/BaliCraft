<template>
<div class="w-full ">
        <p class="text-xl pb-3 flex items-center">
            <i class="fas fa-compass mr-3"></i> Selamat Datang di Halaman Admin
        </p>
    <div class="w-full flex flex-row ">
        <div class="flex flex-col mr-2">
            <div class="px-2 max-w-sm mx-auto bg-white rounded-xl shadow-lg flex items-center space-x-4">
                <div class="shrink-0">
                    <i class="fas fa-palette"></i>
                </div>
                <div>
                    <div class="font-medium text-black">Jumlah Barang Saat ini</div>
                    <p class="text-gray-500 text-xl">{{jumlah.jBrg}}</p>
                </div>
            </div>
            <router-link :to="{name:'barang.create'}" class="flex no-underline items-center py-4">
               <button class="w-full bg-green-600 text-white font-semibold py-2 mr-1 rounded-lg shadow-lg hover:shadow-xl hover:bg-gray-300 hover:text-black flex items-center justify-center">
                    <i class="fas fa-plus mr-3"></i> Tambah Data Barang
                </button>
            </router-link>
        </div>
        <div class="flex flex-col">
            <div class="px-2 max-w-sm mx-auto bg-white rounded-xl shadow-lg flex items-center space-x-4">
                <div class="shrink-0">
                    <i class="fas fa-users"></i>
                </div>
                <div>
                    <div class=" font-medium text-black">Jumlah Pengrajin Saat ini</div>
                    <p class="text-gray-500 text-xl" >{{jumlah.jPeng}}</p>
                </div>
            </div>
            <router-link :to="{name:'pengrajin.create'}" class="flex no-underline items-center py-4">
               <button class="w-full bg-green-600 text-white font-semibold py-2 ml-1 rounded-lg shadow-lg hover:shadow-xl hover:bg-gray-300 hover:text-black flex items-center justify-center">
                    <i class="fas fa-plus mr-3"></i> Tambah Data Pengrajin
                </button>
            </router-link>
        </div>
        <div class="flex w-1/2 flex-col p-2 ml-10 rounded-lg shadow-lg">
            <!-- notifikasi -->
            <h3>Notifikasi</h3>
            <hr>
            <span v-show="!err_notif.status" v-for="x in notifikasi" class="bg-blue-600 hover:bg-blue-400 mx-2 my-1 pt-1 pl-3 rounded-lg shadow-lg ">
                <a :href="x.link_ref" target="_blank" @click="bacaNotif(x._id)" class="text-white no-underline">
                    <h4>{{x.judul}}</h4> 
                    <p>{{x.pesan}} </p>
                </a>
                <span v-if="x.read" class="rounded-lg px-3 bg-green-600 "><i class="fas fa-check-circle"></i></span>
                <button @click="delNotif(x._id)" class="float-right rounded-lg px-3 bg-red-600 hover:bg-red-400"><i class="fas fa-minus-circle"></i></button>   
            </span>
            <span v-show="err_notif.status" class="mx-2 my-1 py-1 px-3 ">
                <h4>SISTEM NOTIFIKASI ERROR</h4> 
                <p>{{err_notif}}</p>
            </span>
            <span v-show="no_notif" class="mx-2 my-1 py-1 px-3 ">
                <p>tidak ada notifikasi</p>
            </span>
        </div>
    </div>
</div>
</template>
<script>
export default {
    data() {
        return {
            jumlah:{},
            notifikasi:{},
            no_notif: false,
            err_notif:{
                status:false,
                message:''
            },
            // read_span_class: 'bg-blue-400 hover:bg-blue-300',
            // unnread_span_class: 'bg-blue-600 hover:bg-blue-400',
            // read_a_class: 'text-black',
            // unnread_a_class: 'text-white',
        }
    },
    created() {
        this.axios.get('/api/dasbor')
        .then(response => {
            this.jumlah = response.data;
        });
       this.getNotif()
    },
    methods:{
        getNotif(){
            this.axios.get('http://localhost:3000/notifikasi/')
            .then( response => {
                if (JSON.stringify(response.data) === '[]'){
                    this.notifikasi = response.data
                    this.no_notif = true
                }else{
                    this.notifikasi = response.data
                    this.no_notif = false
                }
            })
            .catch( error => {
                console.log(error);
                this.err_notif.status = true
                this.err_notif.message = error.message
            });
        },
        bacaNotif(id){
            let url = `http://localhost:3000/notifikasi/${id}`;
            this.axios.put(url)
            .then(response => {
                this.getNotif()
            });
        },
        delNotif(id){
            this
            .$swal
            .fire({
                title: 'Hapus Notifikasi',
                text: "Jika kamu hapus, maka tidak akan kembali lagi.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Delete',
                cancelButtonText: 'Batal'
            })
            .then((result) => {
                if (result.value) {
                let url = `http://localhost:3000/notifikasi/${id}`;
                this
                .axios
                .delete(url)
                .then(response => {
                    this
                    .$swal
                    .fire(
                        {title: 'Success!', text: 'Notifikasi terhapus', icon: 'success', timer: 1000}
                    );
                    this.getNotif()
                });
                }
            })
        }
    },
}
</script>