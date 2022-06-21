<template>
  <div class="card card-product">
    <img :src="product.link_gambar" class="card-img-top" alt="..." width="200" height="250"/>
    <div class="card-body">
      <h5 class="card-title">{{ product.nama_kerajinan }}</h5>
      <p class="card-text">
        Harga : Rp. {{ product.harga }}
      </p>
      <router-link class="btn btn-success" :to="'/products/'+product.id_brg"><b-icon-cart></b-icon-cart>Pesan</router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "CardProduct",
  props: ["product"],
};
</script>

<style>
</style>