<template>
  <div class="product-detail">
    <Navbar />
    <div class="container">
      <!-- breadcrumb -->
      <div class="row mt-5">
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
                Detail Product
              </li>
            </ol>
          </nav>
        </div>
      </div>

      <div class="row mt-3">
        <div class="col-md-6">
          <h2>
            <strong>{{ product.nama_kerajinan }}</strong>
          </h2>
          <hr />
          <div class="row mt-3">
            <img width="200" height="250"
              :src="product.link_gambar"
              class="img shadow"
            />
            <div class="col-md-6">
              <p>
                Harga : <strong>Rp. {{ product.harga }} </strong>
              </p>
              <p>
                Bahan Utama : <strong>{{ product.bahan }} </strong>
              </p>
              <p>Keterangan :</p>
              <div v-html="keterangan()"></div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <h4>
            <strong>Form Pemesanan</strong>
          </h4>
          <form class="mt-4" v-on:submit.prevent>
            <div class="form-group">
              <label for="jumlah_pemesanan">Jumlah</label>
              <input
                type="number"
                class="form-control"
                v-model="pesan.jumlah"
              />
            </div>
            <div class="form-group">
              <label for="alamat">Alamat</label>
              <textarea
                v-model="pesan.alamat"
                class="form-control"
                placeholder="Isikan alamat"
              ></textarea>
            </div>
            <div class="form-group">
              <label for="nomor">Nomor Telepon</label>
              <textarea
                v-model="pesan.no_telp"
                class="form-control"
                placeholder="Isikan nomor telepon"
              ></textarea>
            </div>

            <button type="submit" class="btn btn-success" @click="pemesanan">
              <b-icon-cart></b-icon-cart>Pesan
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Navbar from "@/components/Navbar.vue";
import axios from "axios";

export default {
  name: "ProductDetail",
  components: {
    Navbar,
  },
  data() {
    return {
      product: {},
      pesan: {},
    };
  },
  methods: {
    keterangan(){
      return `${this.product.keterangan}`
    },
    setProduct(data) {
      this.product = data;
    },
    pemesanan() {
      if(this.pesan.jumlah && this.pesan.alamat && this.pesan.no_telp){
        this.pesan.id_brg = this.product.id_brg;
        this.pesan.products = this.product
        axios
        .post("http://localhost:3000/keranjang/", this.pesan)
        .then(() => {
          this.$router.push({ path: "/products" })
          this.notifikasi()
          // this.$toast.success("Pesanan Anda Berhasil Ditambahkan",{
          //   type: 'success',
          //   position: 'top',
          //   duration: '5000',
          //   dismissible: true
          // });
        })
        .catch((err) => console.log(err))

      // //======================= sementara ==============================
      //   this.$router.push({ path: "/product" })
      //   this.$toast.success("Pesanan Anda Berhasil Ditambahkan",{
      //       type: 'success',
      //       position: 'top',
      //       duration: '5000',
      //       dismissible: true
      //   });
      //   this.notifikasi()
      // //===============================================================
      }else {
        // this.$toast.error("Maaf, Anda Belum Mengisi Inputan Pemesanan",{
        //     type: 'error',
        //     position: 'top',
        //     duration: '5000',
        //     dismissible: true
        //   });
        alert("Maaf, Anda Belum Mengisi Inputan Pemesanan")
      }      
    },
    notifikasi(){
        const notif = {
          "judul": 'Pemesanan baru dari pembeli' ,
          "pesan": `Barang " ${this.product.nama_kerajinan} " dipesan sebanyak ${this.pesan.jumlah}`,
          "link_ref": `http://www.google.com`,
          "read":false
        }
        axios.post('http://localhost:3000/notifikasi/',notif,{
          headers:{'content-type':'application/json','accept':'application/json'}
          })
          .then(()=> {
            // handle success
            console.log("Notifikasi Berhasil");
          })
          .catch(function (error) {
            // handle error
            console.log(error);
          })
          .then(function () {
            // always executed
          });
    }
  },
  mounted() {
    axios
      .get("http://127.0.0.1:8000/api/barang/"+ this.$route.params.id+"/edit")
      .then((response) => this.setProduct(response.data.barang))
      .catch((error) => console.log(error));
  },
};
</script>

<style>
</style>