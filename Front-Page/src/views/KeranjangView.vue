<template>
  <div class="keranjang">
    <Navbar :updateKeranjang="keranjangs"/>
    <div class="container">
      <!--  breadcrumb -->
      <div class="row mt-4">
        <div class="col">
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item">
                <router-link to="/" class="text-dark">Home</router-link>
              </li>
              <li class="breadcrumb-item">
                <router-link to="/products" class="text-dark"
                  >Products</router-link
                >
              </li>
              <li class="breadcrumb-item active" aria-current="page">
                Keranjang
              </li>
            </ol>
          </nav>
        </div>
      </div>

      <div class="row">
        <div class="col">
          <h2><strong>Keranjang Kamu</strong></h2>
          <div class="table-responsive mt-3">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">No</th>
                  <th scope="col">Foto</th>
                  <th scope="col">Produk</th>
                  <!-- <th scope="col">Keterangan</th> -->
                  <th scope="col">Jumlah</th>
                  <th scope="col">Harga</th>
                  <th scope="col">Total Harga</th>
                  <th scope="col">Hapus</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(keranjang, index) in keranjangs" :key="keranjang._id">
                  <th>{{index+1}}</th>
                  <td><img :src=" keranjang.products.link_gambar" class="img-fluid" width="250"/></td>
                  <td><strong>{{ keranjang.products.nama_kerajinan }}</strong></td>
                  <!-- <td>{{ keranjang.keterangan ? keranjang.keterangan : "-"}}</td> -->
                  <td>{{ keranjang.jumlah }}</td>
                  <td>Rp. {{ keranjang.products.harga }}</td>
                  <td>Rp. {{ keranjang.products.harga*keranjang.jumlah_pemesanan }}</td>
                  <td class="text-danger">
                    <b-icon-trash @click="hapusKeranjang(keranjang._id)"></b-icon-trash>
                  </td>
                </tr>

                <tr>
                    <td colspan="6" align="right">
                        <strong>Total Harga: </strong>
                    </td>
                    <td>
                        <strong>Rp. {{ totalHarga }}</strong>
                    </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Navbar from "@/components/Navbar.vue";
import axios from 'axios';
export default {
  name: "KeranjangView",
  components: {
    Navbar,
  },
  data() {
    return {
        keranjangs: [],
    }
  },
  methods: {
    setKeranjangs() {
      axios
      .get("http://localhost:3000/keranjang")
      .then((response) => {
        this.keranjangs = response.data
        })
      .catch((error) => console.log(error));
    },
    
    hapusKeranjang(id) {
      axios
      .delete("http://localhost:3000/keranjang/"+id)
      .then(() => {
        alert("Keranjang telah dihapus");
        this.setKeranjangs()
      })
      .catch((error) => console.log(error));
    },
  },
  mounted() {
    this.setKeranjangs()
  },
  computed: {
    totalHarga(){
        return this.keranjangs.reduce(function(items, data) {
            return items+(data.products.harga*data.jumlah_pemesanan)
        }, 0)
    }
  }
};
</script>

<style>
</style>