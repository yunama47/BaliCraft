# Tugas UAS Sistem Terdistribusi : Sistem informasi terintegrasi berbasis web.
---
## Anggota Kelompok
* Gede Wahyu Purnama (2015101014)
* I Kadek Nicko Ananda (2015101007) 
* Kelas : ILKOM 4A
---
## Konsep Sistem Terdistribusi yang diterapkan
* **Replikasi Database / Database Terdistribusi** | Menggunakan replikasi database satu arah (master to slave) ,dimana database master digunakan sebagai database write dan database slave digunakan sebagai database read.
* **Arsitektur Terdistribusi** | Database untuk microservice menggunakan mongodb cloud region cluster GCP / Jakarta (asia-southeast2). Sistem file menggunakan google api untuk mengupload file gambar ke google drive.
* **Microservice** | Sistem notifikasi dan keranjang belanja terpisah dari aplikasi laravel dan dibuat dengan expressjs.
---
## Pembagian Tugas Kelompok
* Wahyu : Membuat Aplikasi Back-Page dan notifikasi
* Nicko : Membuat Aplikasi Front-Page dan keranjang belanja
---
## Catatan untuk menjalankan sistem
download : php ,nodejs, composer dan xampp
### Back-Page
* `cd Back-Page`
* `composer install`
* `npm install && npm run dev`
* *setting database*
* `php artisan serve`
### Front-Page
* `cd Front-Page`
* `npm install`
* `npm run serve`
### Microservice
* `cd Microservice`
* `npm install`
* `npx nodemon index`
