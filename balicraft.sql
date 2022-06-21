-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jun 2022 pada 07.17
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `balicraft`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_10_20_150653_create_model_barangs_table', 1),
(6, '2021_10_20_152034_create_model_pengrajins_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_barangs`
--

CREATE TABLE `model_barangs` (
  `id_brg` bigint(20) UNSIGNED NOT NULL,
  `id_peng` bigint(20) UNSIGNED NOT NULL,
  `nama_kerajinan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bahan` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keterangan` text COLLATE utf8_unicode_ci NOT NULL,
  `harga` bigint(255) NOT NULL,
  `gambar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link_gambar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `model_barangs`
--

INSERT INTO `model_barangs` (`id_brg`, `id_peng`, `nama_kerajinan`, `bahan`, `keterangan`, `harga`, `gambar`, `link_gambar`, `created_at`, `updated_at`) VALUES
(6, 1, 'Tas Rotan', 'Rotan', '<p>ini tas terbuat dari rotan</p>', 30000, '1P94_btdkPwwcmLLZbj2EF5fZgdmShn_R', 'https://drive.google.com/uc?id=1P94_btdkPwwcmLLZbj2EF5fZgdmShn_R&export=download', '2022-06-21 09:58:58', '2022-06-21 09:58:58'),
(7, 1, 'Topeng', 'Kayu', '<p>Topeng khas bali</p>', 30000, '1-jyt2Rp8l2ILq_1MriDNkjmwucAnQdTj', 'https://drive.google.com/uc?id=1-jyt2Rp8l2ILq_1MriDNkjmwucAnQdTj&export=download', '2022-06-13 21:08:43', '2022-06-13 21:08:43'),
(8, 1, 'Kain Bali', 'Kain', '<p>Kain berkualitas</p>', 50000, '19WBvXX7wll5JaoNL42pMcj7x2MXPWGRX', 'https://drive.google.com/uc?id=19WBvXX7wll5JaoNL42pMcj7x2MXPWGRX&export=download', '2022-06-13 21:10:14', '2022-06-13 21:10:14'),
(9, 1, 'Ember Aluminium', 'Aluminium', '<p>tinggi 10 cm</p>', 50000, '1Pw2T_puPF_6DGMYV6uvrPu4j3KIIEifG', 'https://drive.google.com/uc?id=1Pw2T_puPF_6DGMYV6uvrPu4j3KIIEifG&export=download', '2022-06-13 21:11:24', '2022-06-13 21:11:24'),
(10, 1, 'Kotak-kotak Aluminium', 'Aluminium', '<p>Total kotak = 3</p>', 70000, '1ff5iOR5kb6mGq5acE9E7gbhbaV84maUY', 'https://drive.google.com/uc?id=1ff5iOR5kb6mGq5acE9E7gbhbaV84maUY&export=download', '2022-06-13 21:12:24', '2022-06-13 21:12:24'),
(11, 1, 'Kotak-kotak Aluminium', 'Aluminium', '<p>total = 6</p>', 100000, '1gPCnf9U0ivVxaBVMlF5FLcdgr1dzI_VF', 'https://drive.google.com/uc?id=1gPCnf9U0ivVxaBVMlF5FLcdgr1dzI_VF&export=download', '2022-06-13 21:13:10', '2022-06-13 21:13:10'),
(13, 1, 'Box Cat Hias', 'Aluminium', '<p>dengan stiker bunga-bunga</p>', 50000, '1RKnn6spJyjf20xRjrobo5NsnZZG0HdJs', 'https://drive.google.com/uc?id=1RKnn6spJyjf20xRjrobo5NsnZZG0HdJs&export=download', '2022-06-15 10:15:56', '2022-06-15 10:15:56'),
(14, 1, 'Asbak Kayu', 'Kayu', '<p>ini asbak kayu</p>', 20000, '18_auitg1cPYaghA20XZQ3L6PcQpPhQxA', 'https://drive.google.com/uc?id=18_auitg1cPYaghA20XZQ3L6PcQpPhQxA&export=media', '2022-06-15 10:47:23', '2022-06-15 10:47:23'),
(15, 1, 'Penanda Buku', 'Aluminium', '<p>penanda buku atau <em>bookmark</em></p>', 10000, '1MWVQqLjDyVGguAtWPOKU5XvMjY0HgZZ4', 'https://drive.google.com/uc?id=1MWVQqLjDyVGguAtWPOKU5XvMjY0HgZZ4&export=media', '2022-06-15 10:48:42', '2022-06-15 10:48:42'),
(16, 1, 'Cermin Bulat', 'Aluminium', '<p>Cermin bulat</p>', 50000, '1P4SOtVgezH4J4OaUye5ND0GOnvSvdfnJ', 'https://drive.google.com/uc?id=1P4SOtVgezH4J4OaUye5ND0GOnvSvdfnJ&export=media', '2022-06-15 12:01:30', '2022-06-15 12:01:30'),
(18, 1, 'Cermin Kotak', 'Aluminium', '<blockquote>\r\n<p><em><strong>Cermin kotak</strong></em></p>\r\n</blockquote>', 40000, '1ZC3db8Xe7xlvci3wDNp2zT6q4WBc-l4C', 'https://drive.google.com/uc?id=1ZC3db8Xe7xlvci3wDNp2zT6q4WBc-l4C&export=media', '2022-06-21 09:58:18', '2022-06-21 09:58:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_pengrajins`
--

CREATE TABLE `model_pengrajins` (
  `id_peng` bigint(20) UNSIGNED NOT NULL,
  `nama_peng` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `model_pengrajins`
--

INSERT INTO `model_pengrajins` (`id_peng`, `nama_peng`, `alamat`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Wahyu Purnama', 'Denpasar Utara', 'wahyu.purnama@undiksha.ac.id', '2022-06-13 20:41:01', '2022-06-15 10:33:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Gede Wahyu Purnama', 'gede@denpasar.bali', NULL, '$2y$10$hbY8Oeds4r2PZ2wXjBNEaeyDxMWt8i1kjb52tAUx26oeuswD35Fia', NULL, '2022-06-13 20:37:59', '2022-06-13 20:37:59');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_barangs`
--
ALTER TABLE `model_barangs`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indeks untuk tabel `model_pengrajins`
--
ALTER TABLE `model_pengrajins`
  ADD PRIMARY KEY (`id_peng`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `model_barangs`
--
ALTER TABLE `model_barangs`
  MODIFY `id_brg` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `model_pengrajins`
--
ALTER TABLE `model_pengrajins`
  MODIFY `id_peng` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
