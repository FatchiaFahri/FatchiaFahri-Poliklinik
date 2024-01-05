-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2024 at 11:23 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poli`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_polis`
--

CREATE TABLE `daftar_polis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pasien` bigint(20) UNSIGNED NOT NULL,
  `id_jadwal` bigint(20) UNSIGNED NOT NULL,
  `keluhan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_antrian` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `daftar_polis`
--

INSERT INTO `daftar_polis` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Mual, muntah, sakit kepala, dan demam', 1, '2024-01-02 01:17:04', '2024-01-02 01:17:04'),
(2, 2, 2, 'Sakit pada gusi, gigi berlubang', 2, '2024-01-05 01:14:56', '2024-01-05 01:14:56'),
(3, 3, 3, 'Muntah - muntah dan demam', 3, '2024-01-05 01:23:49', '2024-01-05 01:23:49'),
(4, 4, 5, 'Mual, pusing pada trimester 1', 4, '2024-01-05 01:31:32', '2024-01-05 01:31:32');

-- --------------------------------------------------------

--
-- Table structure for table `detail_periksas`
--

CREATE TABLE `detail_periksas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_periksa` bigint(20) UNSIGNED NOT NULL,
  `id_obat` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_periksas`
--

INSERT INTO `detail_periksas` (`id`, `id_periksa`, `id_obat`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2024-01-05 01:40:29', '2024-01-05 01:40:29'),
(2, 1, 1, '2024-01-05 01:40:29', '2024-01-05 01:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `dokters`
--

CREATE TABLE `dokters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_poli` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dokters`
--

INSERT INTO `dokters` (`id`, `nama`, `alamat`, `no_hp`, `id_poli`, `created_at`, `updated_at`) VALUES
(1, 'dr. Saca Mulyana', 'Jl. Manahan No. 5', '085547684389', 1, NULL, NULL),
(2, 'drg. Yusika Insiwi', 'Jl. Mawar No. 30', '081851741258', 2, NULL, NULL),
(3, 'dr. M. Heru Muryawan SPA(K)', 'Jl. Kenanga No. 45', '085421542365', 3, NULL, NULL),
(4, 'DR.dr. Erwinanto, Sp.OG(K)', 'Jalan Gatot Subroto No. 52', '081478259635', 4, '2024-01-05 01:21:08', '2024-01-05 01:21:08');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwals`
--

CREATE TABLE `jadwals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_dokter` bigint(20) UNSIGNED NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwals`
--

INSERT INTO `jadwals` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`, `created_at`, `updated_at`) VALUES
(1, 1, 'Senin', '08:00:00', '12:00:00', NULL, NULL),
(2, 2, 'Selasa', '08:00:00', '12:00:00', NULL, NULL),
(3, 3, 'Rabu', '08:00:00', '12:00:00', NULL, NULL),
(5, 4, 'Rabu', '18:00:00', '21:00:00', '2024-01-05 01:27:55', '2024-01-05 01:27:55');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_28_133559_create_polis_table', 1),
(6, '2023_12_28_134237_create_pasiens_table', 1),
(7, '2023_12_28_135151_create_dokters_table', 1),
(8, '2023_12_28_135315_create_obats_table', 1),
(9, '2023_12_28_140538_create_jadwals_table', 1),
(10, '2023_12_28_141509_create_daftar_polis_table', 1),
(11, '2023_12_28_141609_create_periksas_table', 1),
(12, '2023_12_28_141638_create_detail_periksas_table', 1),
(13, '2023_12_29_161545_add_catatan_to_periksas', 1);

-- --------------------------------------------------------

--
-- Table structure for table `obats`
--

CREATE TABLE `obats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_obat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kemasan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `obats`
--

INSERT INTO `obats` (`id`, `nama_obat`, `kemasan`, `harga`, `created_at`, `updated_at`) VALUES
(1, 'Lansoprazole', 'Strip', 60000, NULL, NULL),
(2, 'Vocinti', 'Strip', 271000, NULL, NULL),
(3, 'Amitriptyline HCl', 'Strip', 150000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pasiens`
--

CREATE TABLE `pasiens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_ktp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pasiens`
--

INSERT INTO `pasiens` (`id`, `nama`, `alamat`, `no_ktp`, `no_hp`, `no_rm`, `created_at`, `updated_at`) VALUES
(1, 'Fatchia Fahri', 'Jl. Karonsih Utara No. 357', '3374255811020002', '085226920566', '2401-001', '2024-01-02 01:00:31', '2024-01-02 01:00:31'),
(2, 'Master Putra', 'Jalan Melati No.18', '3374355811021111', '08574596125', '2401-002', '2024-01-05 01:13:41', '2024-01-05 01:13:41'),
(3, 'Indah Sari', 'Jalan LIly No.15', '3374857711022222', '08874496129', '2401-003', '2024-01-05 01:17:41', '2024-01-05 01:17:41'),
(4, 'Arum Kembang', 'Jalan Sudirman No. 50', '3374555511112222', '081234567890', '2401-004', '2024-01-05 01:29:58', '2024-01-05 01:29:58');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `periksas`
--

CREATE TABLE `periksas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_daftar_poli` bigint(20) UNSIGNED NOT NULL,
  `tgl_periksa` date NOT NULL,
  `biaya` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `periksas`
--

INSERT INTO `periksas` (`id`, `id_daftar_poli`, `tgl_periksa`, `biaya`, `created_at`, `updated_at`, `catatan`) VALUES
(1, 1, '2024-01-04', 360000, '2024-01-05 01:40:29', '2024-01-05 01:40:29', 'Harus memperbanyak istirahat, memperhatikan asupan gizi makanan, memperbanyak minum air putih dan hindari makanan yang menyebabkan asam lambung naik.');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `polis`
--

CREATE TABLE `polis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_poli` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `polis`
--

INSERT INTO `polis` (`id`, `nama_poli`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Umum', 'Poli Umum', NULL, NULL),
(2, 'Gigi', 'Poli Gigi', NULL, NULL),
(3, 'Anak', 'Poli Anak', NULL, NULL),
(4, 'Kandungan', 'Poli Kandungan', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_pengguna` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_ktp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_pengguna`, `username`, `password`, `no_hp`, `no_ktp`, `alamat`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '$2y$10$/.8AxSe4dhzvsjk0/pS4le3IWVeDYL1fOm3T5jnz.R/Eq9imlxSO6', '087458789456', '337482515544123', 'Jl. Kembang No. 1', 'admin', NULL, NULL, NULL),
(2, 'dokter', 'dokter', '$2y$10$k19sCizldnOjCYjsB82A/OL17B09l2OiuBfilE4uLEWJIr9CCSY8K', '081234567890', '337458525566921', 'Jl. Karonsih Utara No. 19', 'dokter', NULL, NULL, '2024-01-01 22:04:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_polis`
--
ALTER TABLE `daftar_polis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daftar_polis_id_pasien_foreign` (`id_pasien`),
  ADD KEY `daftar_polis_id_jadwal_foreign` (`id_jadwal`);

--
-- Indexes for table `detail_periksas`
--
ALTER TABLE `detail_periksas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_periksas_id_periksa_foreign` (`id_periksa`),
  ADD KEY `detail_periksas_id_obat_foreign` (`id_obat`);

--
-- Indexes for table `dokters`
--
ALTER TABLE `dokters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokters_id_poli_foreign` (`id_poli`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jadwals`
--
ALTER TABLE `jadwals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwals_id_dokter_foreign` (`id_dokter`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `obats`
--
ALTER TABLE `obats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasiens`
--
ALTER TABLE `pasiens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pasiens_no_ktp_unique` (`no_ktp`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `periksas`
--
ALTER TABLE `periksas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `periksas_id_daftar_poli_foreign` (`id_daftar_poli`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `polis`
--
ALTER TABLE `polis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_polis`
--
ALTER TABLE `daftar_polis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `detail_periksas`
--
ALTER TABLE `detail_periksas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dokters`
--
ALTER TABLE `dokters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwals`
--
ALTER TABLE `jadwals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `obats`
--
ALTER TABLE `obats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pasiens`
--
ALTER TABLE `pasiens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `periksas`
--
ALTER TABLE `periksas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `polis`
--
ALTER TABLE `polis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_polis`
--
ALTER TABLE `daftar_polis`
  ADD CONSTRAINT `daftar_polis_id_jadwal_foreign` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `daftar_polis_id_pasien_foreign` FOREIGN KEY (`id_pasien`) REFERENCES `pasiens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `detail_periksas`
--
ALTER TABLE `detail_periksas`
  ADD CONSTRAINT `detail_periksas_id_obat_foreign` FOREIGN KEY (`id_obat`) REFERENCES `obats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `detail_periksas_id_periksa_foreign` FOREIGN KEY (`id_periksa`) REFERENCES `periksas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dokters`
--
ALTER TABLE `dokters`
  ADD CONSTRAINT `dokters_id_poli_foreign` FOREIGN KEY (`id_poli`) REFERENCES `polis` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jadwals`
--
ALTER TABLE `jadwals`
  ADD CONSTRAINT `jadwals_id_dokter_foreign` FOREIGN KEY (`id_dokter`) REFERENCES `dokters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `periksas`
--
ALTER TABLE `periksas`
  ADD CONSTRAINT `periksas_id_daftar_poli_foreign` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_polis` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
