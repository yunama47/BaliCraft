<template>
  <div>
    <Navbar />
    <div class="container">
      <div class="row mt-4">
        <div class="col">
          <h2>Daftar Products</h2>
        </div>
      </div>

      <div class="row mt-3">
        <div class="col">
          <div class="input-group mb-3">
            
            <input style="margin-left: 500px;"
              v-model="search"
              type="text"
              class="form-control"
              placeholder="Ketikan nama barang yang ingin kamu cari :D"
              aria-label="Cari"
              aria-describedby="basic-addon1"
              @keyup="searchProduct"
            />

            <span class="input-group-text" id="basic-addon1"><b-icon-search></b-icon-search></span>

          </div>
        </div>
      </div>

      <div class="row mb-3">
        <div
          class="col-md-3 mt-4"
          v-for="product in products"
          :key="product.id"
        >
          <CardProduct :product="product" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import Navbar from "@/components/Navbar.vue";
import CardProduct from "@/components/CardProduct.vue";
import axios from "axios";

export default {
  name: "ProductsView",
  components: {
    Navbar,
    CardProduct,
  },
  data() {
    return {
      products: [],
      search: '',
    };
  },
  methods: {
    setProducts(data) {
      this.products = data;
    },
    searchProduct() {
      axios
      .get("http://127.0.0.1:8000/api/barang?s="+this.search)
      .then((response) => this.setProducts(response.data.all_brg))
      .catch((error) => console.log(error));
    }
  },
  mounted() {
    axios
      .get("http://127.0.0.1:8000/api/barang")
      .then((response) => this.setProducts(response.data.all_brg))
      .catch((error) => console.log(error));
  },
};
</script>

<style>
</style>