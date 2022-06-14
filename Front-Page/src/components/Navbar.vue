<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
      <a class="navbar-brand" href="/">B A L I  C R A F T</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
              <router-link class="nav-link" to="/">Home</router-link>
          </li>
          <li class="nav-item">
              <router-link class="nav-link" to="/product">Product</router-link>
          </li>
          <!-- <li class="nav-item">
              <router-link class="nav-link" to="#">About</router-link>
          </li>
          <li class="nav-item">
              <router-link class="nav-link" to="#">Help</router-link>
          </li> -->
        </ul>

        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
              <a href="http://127.0.0.1:8000/login" class="nav-link" to="#">
              Sign In
              </a>
          </li>
          <li class="nav-item">
              <a href="http://127.0.0.1:8000/register" class="nav-link" to="#">
              Sign Up
              </a>
          </li>
          <li class="nav-item">
              <router-link class="nav-link" to="#">
              YourBag
              <b-icon-bag></b-icon-bag>
              <span class="badge badge-success ml-2">{{ jumlah_pesanans.length }}</span>
              </router-link>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>

<script>
import axios from "axios";

export default {
  name: "Navbar",
  data(){
    return {
      jumlah_pesanans: []
    }
  },
  methods: {
    setJumlah(data) {
      this.jumlah_pesanans = data
    }
  },
  mounted() {
    axios
      .get("http://127.0.0.1:8000/api/keranjang")
      .then((response) => this.setJumlah(response.data.keranjang))
      .catch((error) => console.log(error))
  }
};
</script>

<style>
</style>