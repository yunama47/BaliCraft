<template>
  <div class="home">
    <Navbar />
    <div class="container">
      <Hero />
      <div class="row mt-4">
        <div class="col">
          <h2><hr /></h2>
        </div>
        <div class="col">
          <router-link to="/products" class="btn btn-success float-right">
            Lihat Semua Products
          </router-link>
        </div>
      </div>
      <hr>
      
      <div class="row mb-3">
        <div class="col-md-3 mt-4" v-for="product in products" :key="product.id">
          <CardProduct :product="product"/>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import Navbar from "@/components/Navbar.vue";
import Hero from "@/components/Hero.vue";
import CardProduct from "@/components/CardProduct.vue";
import axios from "axios";

export default {
  name: "HomeView",
  components: {
    Navbar,
    Hero,
    CardProduct,
  },
  data() {
    return {
      products: [],
    };
  },
  methods: {
    setProducts(data) {
      this.products = data;
    },
  },
  mounted() {
    axios
      .get("http://127.0.0.1:8000/api/barang")
      .then((response) => this.setProducts(response.data.barang.data))
      .catch((error) => console.log(error))
  },
};
</script>
