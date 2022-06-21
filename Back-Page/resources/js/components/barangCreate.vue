<template>
<div class="w-full ">
        <div>
            <p class="text-xl pb-3 flex items-center">
                <i class="fas fa-list mr-3"></i> {{judul}}
            </p>
        </div>
        <form enctype='multipart/form-data'  @submit.prevent="saveData">
            <div class="w-full my-3 pr-0 lg:pr-2">
                <div class="flex flex-row p-2 bg-white rounded shadow-xl">
                    <div class=" w-1/2 flex flex-col">
                        <!-- nama barang -->
                        <div class=" w-auto mt-2 mr-2">
                            <label class=" text-sm text-gray-800" >Nama Kerajinan</label>
                            <input class="placeholder:italic placeholder:text-gray-400 w-full py-1 text-gray-700 bg-white rounded" v-model="nama_barang" type="text" required placeholder="contoh : Patung-Arjuna">
                            <span v-if="allerros.nama_kerajinan" class="text-sm text-red-600">{{ allerros.nama_kerajinan[0] }}</span>

                        </div>
                        <div class=" w-auto mt-2 mr-2">
                            <label class=" text-sm text-gray-800" >Harga</label>
                            <input class="placeholder:italic placeholder:text-gray-400 w-full py-1 text-gray-700 bg-white rounded" v-model="harga" type="text" required placeholder="max: 999999">
                            <span v-if="allerros.harga" class="text-sm text-red-600">{{ allerros.harga[0] }}</span>
                        </div>
                        <div class=" w-auto mt-2 mr-2">
                            <!-- nama pengrajin -->
                            <label class=" text-sm text-gray-800" >Nama Pengrajin</label>
                            <select class="w-full py-1 text-gray-700 bg-white rounded" v-model="id_peng">
                                <option value="">Pilih Pengrajin</option>
                                <option v-for='p in pengrajins' :value='p.id_peng'>
                                    {{p.nama_peng}}
                                </option>
                            </select>
                        </div>
                        <div class="w-auto mt-2">
                            <label class="block text-sm text-gray-800" for="message">Deskripsi</label>
                            <ckeditor class="placeholder:italic placeholder:text-gray-400" v-model='keterangan' :config='editorConfig' placeholder="kerajinan ini adalah..."></ckeditor>
                        </div>
                    </div>
                    <!-- bagian kanan -->
                    <div class="ml-2 w-1/2 flex flex-col">
                        <div class=" w-auto mt-2 mr-2">
                            <label class=" text-sm text-gray-800" >Bahan Utama</label>
                            <input class="w-full py-1 text-gray-700 bg-white rounded" v-model="bahan" type="text" placeholder="contoh : Kayu">
                            <div class="mt-2 flex flex-row items-center">
                            <p class="text-sm text-gray-800" >Atau pilih bahan</p>
                            <select class="mx-2 py-1 w-auto text-gray-700 bg-white rounded" v-model="bahan" >
                                <option value="">Pilih Bahan</option>
                                <option v-for='b in list_bahan' :value='b'>
                                    {{b}}
                                </option>
                            </select>
                            </div>
                            <span v-if="allerros.bahan" class="text-sm text-red-600">{{ allerros.bahan[0] }}</span>
                        </div>
                        <div class="flex flex-col w-auto mt-2">
                            <!--gambar-->
                            <label class=" text-sm text-gray-800" >Gambar Kerajinan</label>
                            <input class="w-full py-1 text-gray-700 bg-white rounded" v-on:change="onFileChange" type="file">
                            <span v-if="allerros.gambar" class="text-sm text-red-600">{{ allerros.gambar[0] }}</span>
                            <div v-if="link_gambar" class="flex flex-col">
                                <p>Gambar saat ini :</p>
                                <img @click="imageView(link_gambar,nama_barang)" class="shadow-md rounded ml-5" width="200" height="250" :src="link_gambar"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-6 flex">
                    <button class=" px-4 py-1 text-white font-light tracking-wider bg-gray-900 rounded shadow-lg hover:shadow-lg" type="submit">Submit</button>
                    <router-link :to="{name:'barang'}" class="no-underline w-20 ml-3 bg-red-600 font-semibold text-white rounded shadow-lg hover:shadow-lg flex items-center justify-center">
                        Cancel
                    </router-link>
                </div>
            </div>
        </form>
    </div>
</template>
<script>
export default {
    data() {
    return {
        judul:'',
        errors: [],
        allerros: [],
        success: false,
        message: '',
        pengrajins:{},
        nama_barang:'',
        bahan:'',
        harga:'',
        keterangan:'',
        id_peng:'',
        id_brg:'',
        gambar:'',
        link_gambar:'',
        list_bahan:[],
        editorConfig: {
            toolbarGroups: [{
                "name": "basicstyles",
                "groups": ["basicstyles"]
                },
                {
                "name": "links",
                "groups": ["links"]
                },
                {
                "name": "paragraph",
                "groups": ["list", "blocks"]
                },
                {
                "name": "document",
                "groups": ["mode"]
                },
                {
                "name": "insert",
                "groups": ["insert"]
                },
                {
                "name": "styles",
                "groups": ["styles"]
                },
                {
                "name": "about",
                "groups": ["about"]
                }
            ],
            // Remove the redundant buttons from toolbar groups defined above.
            removeButtons: 'Underline,Strike,Subscript,Superscript,Anchor,Styles,Specialchar,PasteFromWord'
    }
        }
    },
    created() {
        this
        .axios
        .get('/api/barang')
        .then(response => {
            this.pengrajins = response.data.pengrajin;
            var barangs = response.data.all_brg;
            var bahan = []
            for (let x = 0; x < barangs.length; x++){
                bahan[x] = barangs[x].bahan
            }
            this.list_bahan = [... new Set(bahan)] // unique bahan only
        });

        if (this.$route.params.id) {
            this.axios
            .get('/api/barang/'+this.$route.params.id+'/edit')
            .then((response) => {
                this.judul = 'Edit data '+response.data.barang.nama_kerajinan;
                this.nama_barang = response.data.barang.nama_kerajinan;
                this.bahan = response.data.barang.bahan;
                this.harga = response.data.barang.harga;
                this.keterangan = response.data.barang.keterangan;
                this.id_peng = response.data.barang.id_peng;
                this.id_brg = response.data.barang.id_brg;
                this.gambar = response.data.barang.gambar;
                this.link_gambar = response.data.barang.link_gambar;
            });
        }else{
            this.judul = 'Tambah data';
        }
    },
    methods: {
        onFileChange(e) {
            //if(this.gambar!=''){
                this.gambar = e
                .target
                .files[0];
            // }else{
            // }
        },
        imageView(link,alt){
            this.$swal.fire({
                title: 'Preview Gambar Barang',
                imageUrl: link,
                imageAlt: alt
            })
        },
        saveData(e) {
            e.preventDefault();
            let formData = new FormData();
            formData.append('nama_kerajinan', this.nama_barang);
            formData.append('bahan', this.bahan);
            formData.append('harga', this.harga);
            formData.append('keterangan', this.keterangan);
            formData.append('id_peng', this.id_peng);
            formData.append('gambar', this.gambar);
            formData.append('link_gambar', this.link_gambar);
            this.$swal.showLoading()
            // edit data 
            if (this.$route.params.id) {
                formData.append('id_brg',this.id_brg)
                this.axios.post('/api/barang/'+this.$route.params.id, formData,{
                    headers: {
                        'content-type': 'multipart/form-data'
                    }})
                .then(response => {
                    this
                        .$swal
                        .fire(
                            {title: 'Success!', text: response.data.message, icon: 'success', timer: 1000}
                        );
                    this
                        .$router
                        .push({name:'barang'});
                })
                .catch((error) => {
                    console.log(error);
                    this.allerros = error.response.data.errors;
                    this.success = false;
                })
                .finally(() => {
                    this.loading = false
                    this.$swal.hideLoading()
                });
            }
            // membuat data baru 
            else {
                this.axios.post('/api/barang', formData,{
                    headers: {
                        'content-type': 'multipart/form-data'
                    }})
                .then(response => {
                    this
                    .$swal
                    .fire(
                        {title: 'Success!', text: response.data.message, icon: 'success', timer: 1000}
                    );
                    this.$router.push({name:'barang'}) 
                })
                .catch((error) => {
                    console.log(error);
                    this.allerros = error.response.data.errors;
                    this.success = false;
                })
                .finally(() =>{ this.loading = false
                this.$swal.hideLoading()});
            }
        }
    }
}
</script>