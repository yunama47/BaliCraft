<template>
  <div>
    <Navbar />
    <div class="container">
      <div class="row mt-4">
        <div class="col">
          <h2>Daftar <strong>Product</strong></h2>
        </div>
      </div>

      <div class="row mt-3">
        <div class="col">
          <div class="input-group mb-3" style="padding-left: 400px; padding-right: 400px">
           
            <input
            v-model="search"
              
              type="text"
              class="form-control"
              placeholder="Cari Product"
              aria-label="Cari Product"
              aria-describedby="basic-addon1"
              @keyup="searchProduct"
            />

             <div class="input-group-prepend">
              <span class="input-group-text" id="basic-addon1">
                <b-icon-search></b-icon-search>
              </span>
            </div>
          </div>
        </div>
      </div>

      <div class="row mb-4">
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
  name: "Product",
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
Navbar;
</script>
<style>
</style>