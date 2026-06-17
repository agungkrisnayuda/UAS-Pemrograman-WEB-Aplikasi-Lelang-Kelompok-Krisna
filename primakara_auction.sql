-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 17 Jun 2026 pada 13.15
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `primakara_auction`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auctions`
--

CREATE TABLE `auctions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `start_price` decimal(12,2) NOT NULL,
  `bid_increment` decimal(12,2) NOT NULL,
  `starts_at` datetime NOT NULL,
  `ends_at` datetime NOT NULL,
  `status` enum('scheduled','active','ended') NOT NULL DEFAULT 'scheduled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `winner_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `auctions`
--

INSERT INTO `auctions` (`id`, `user_id`, `title`, `description`, `image`, `start_price`, `bid_increment`, `starts_at`, `ends_at`, `status`, `created_at`, `updated_at`, `winner_id`) VALUES
(2, 4, 'iPhone 15 Pro Max 256GB', 'iPhone 15 Pro Max kondisi 95%, lengkap dengan box dan charger original. Tidak pernah servis, baterai masih sehat. Cocok untuk penggunaan sehari-hari.', 'auctions/FPRWyPD61zNL2awNbUpgo6nWX22vGJBxDoYuOjk7.jpg', '10000000.00', '500000.00', '2026-06-14 16:11:00', '2026-06-16 16:11:00', 'ended', '2026-06-14 00:11:51', '2026-06-16 23:25:02', 6),
(3, 4, 'mobil bekas', 'mobil bekas', 'auctions/vFMcH7ucWvMleThOkWmH5uiytpZlP6ny3rUvviOG.jpg', '150000000.00', '100000000.00', '2026-06-14 16:42:00', '2026-06-26 16:42:00', 'active', '2026-06-14 00:42:56', '2026-06-14 19:30:03', NULL),
(4, 4, 'Brownies Premium', 'Enak Banget kapan lagi bisa lelang jajan', 'auctions/11xCri39wVAii43jFjSzKYKKd3lf7mU7cVbGroCf.png', '200000.00', '20000.00', '2026-06-14 16:50:00', '2026-06-18 16:50:00', 'active', '2026-06-14 00:50:23', '2026-06-15 14:19:18', NULL),
(5, 1, 'Akun MLBB', 'FULL SKIN IMORTAL  1k', 'auctions/NZoJKQFfT0gPOPdfcpAF146AAGM0WNZzPNDrDoZu.webp', '2000000.00', '1900000.00', '2026-06-14 23:09:00', '2026-06-14 23:11:00', 'ended', '2026-06-14 07:09:36', '2026-06-14 19:30:03', 5),
(8, 1, 'AKUN MLBB', 'SULTAN', 'auctions/kv889zRZsrWTq7Ul0YOav4zQ3FHfWaC5bKqjvtNF.webp', '250000.00', '50000.00', '2026-06-15 11:38:00', '2026-06-15 11:42:00', 'ended', '2026-06-14 19:36:54', '2026-06-15 09:48:01', NULL),
(9, 1, 'AKUN MLBB', 'SULTAN', 'auctions/yF2GAlMTKcKu3qTXH1xKP9bIGplPSfrW86aIT61Y.webp', '150000.00', '50000.00', '2026-06-15 11:55:00', '2026-06-15 11:59:00', 'ended', '2026-06-14 19:53:53', '2026-06-15 09:48:01', 6),
(10, 6, 'AKUN MLBB', 'AKUN SULTAN', 'auctions/f6XXBVuXhiC3VJvZXQmReTsQNDT8aRQPbe5m5NiL.webp', '200000.00', '100000.00', '2026-06-15 17:54:00', '2026-06-15 17:59:00', 'ended', '2026-06-15 09:52:54', '2026-06-15 09:59:00', 4),
(17, 6, 'Mobil 2015 BUGATI ATLANTIC 8\"X10\"', 'tes', 'auctions/xMTooh3vlE5frO3wOF2U3U8zXw5d1wxwYHax62Lg.png', '5500000000.00', '5000000.00', '2026-06-15 22:51:00', '2026-06-15 22:59:00', 'ended', '2026-06-15 14:50:18', '2026-06-15 14:59:01', NULL),
(18, 5, 'Mobil Lamborghini Exclusive Tahun 2026', 'Lamborghini memang dikenal sebagai simbol kemewahan dan performa tinggi di dunia otomotif. Kamu penasaran berapa harga Lamborghini tahun 2025 ini?\r\n\r\nMobil keren asal Italia ini emang selalu jadi pusat perhatian, bukan cuma karena desainnya yang bikin ngiler, tapi juga karena performanya yang gila-gilaan. Yuk, langsung aja kita bahas satu per satu!', 'auctions/rr4dQWCXM9wmO5LogNbjlYTbAa4d8mhSkm00eWb7.webp', '1500000000.00', '500000000.00', '2026-06-15 22:51:00', '2026-06-16 15:31:00', 'ended', '2026-06-15 14:50:43', '2026-06-16 23:25:02', NULL),
(19, 5, 'Akun MLBB', 'AKUN SULTAN', 'auctions/yqJbj3y3JcSvZigs5KKn96DEujcSKVvzFDGKRVEd.webp', '10000.00', '5000.00', '2026-06-15 23:36:00', '2026-06-15 23:44:00', 'ended', '2026-06-15 15:35:33', '2026-06-15 15:44:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bids`
--

CREATE TABLE `bids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `auction_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bids`
--

INSERT INTO `bids` (`id`, `auction_id`, `user_id`, `amount`, `created_at`, `updated_at`) VALUES
(6, 2, 1, '10500000.00', '2026-06-14 01:17:25', '2026-06-14 01:17:25'),
(7, 2, 6, '11000000.00', '2026-06-14 07:05:58', '2026-06-14 07:05:58'),
(8, 2, 6, '11500000.00', '2026-06-14 07:06:19', '2026-06-14 07:06:19'),
(9, 3, 1, '250000000.00', '2026-06-14 07:11:58', '2026-06-14 07:11:58'),
(10, 5, 5, '30000000.00', '2026-06-14 07:13:26', '2026-06-14 07:13:26'),
(13, 9, 6, '200000.00', '2026-06-14 19:57:34', '2026-06-14 19:57:34'),
(14, 10, 1, '300000.00', '2026-06-15 09:55:32', '2026-06-15 09:55:32'),
(15, 10, 4, '400000.00', '2026-06-15 09:55:43', '2026-06-15 09:55:43'),
(16, 10, 1, '500000.00', '2026-06-15 09:55:54', '2026-06-15 09:55:54'),
(17, 10, 4, '600000.00', '2026-06-15 09:56:09', '2026-06-15 09:56:09'),
(18, 10, 1, '700000.00', '2026-06-15 09:56:20', '2026-06-15 09:56:20'),
(19, 10, 4, '800000.00', '2026-06-15 09:56:44', '2026-06-15 09:56:44'),
(26, 19, 6, '15000.00', '2026-06-15 15:36:03', '2026-06-15 15:36:03'),
(27, 19, 4, '20000.00', '2026-06-15 15:36:18', '2026-06-15 15:36:18'),
(28, 19, 1, '25000.00', '2026-06-15 15:36:34', '2026-06-15 15:36:34'),
(29, 19, 4, '30000.00', '2026-06-15 15:37:35', '2026-06-15 15:37:35'),
(30, 19, 6, '35000.00', '2026-06-15 15:37:51', '2026-06-15 15:37:51'),
(31, 19, 1, '40000.00', '2026-06-15 15:38:06', '2026-06-15 15:38:06'),
(32, 19, 4, '45000.00', '2026-06-15 15:43:50', '2026-06-15 15:43:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(5, 'default', '{\"uuid\":\"d40310e0-1451-44bd-b418-e56f737f339e\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781428645,\"delay\":null}', 0, NULL, 1781428645, 1781428645),
(6, 'default', '{\"uuid\":\"4724caf4-8ba9-4f2f-b5b8-e0c252bf3fb2\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:7;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781449558,\"delay\":null}', 0, NULL, 1781449558, 1781449558),
(7, 'default', '{\"uuid\":\"4ffbff80-a7b4-491a-8694-32df4d541dd2\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:8;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781449579,\"delay\":null}', 0, NULL, 1781449579, 1781449579),
(8, 'default', '{\"uuid\":\"d45ad711-907f-4150-a970-a1357a65edab\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:9;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781449918,\"delay\":null}', 0, NULL, 1781449918, 1781449918),
(9, 'default', '{\"uuid\":\"cc3bb1ef-4f19-4796-86d1-a6a7c3f34699\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:10;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781450006,\"delay\":null}', 0, NULL, 1781450006, 1781450006),
(10, 'default', '{\"uuid\":\"f9360eb6-74fd-4ccb-b884-09281aa966ed\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:11;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781450615,\"delay\":null}', 0, NULL, 1781450615, 1781450615),
(11, 'default', '{\"uuid\":\"060041fd-c560-4a13-b329-149c244948fe\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:12;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781450633,\"delay\":null}', 0, NULL, 1781450633, 1781450633),
(12, 'default', '{\"uuid\":\"c25b8052-dcf1-4f87-a87f-1dd92f7633d5\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:13;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781495854,\"delay\":null}', 0, NULL, 1781495855, 1781495855),
(13, 'default', '{\"uuid\":\"afb76abe-0ca4-4039-aa88-45c75715fdc3\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:14;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781517332,\"delay\":null}', 0, NULL, 1781517332, 1781517332),
(14, 'default', '{\"uuid\":\"76f5768c-d817-434b-9e00-9e1375978bdf\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:15;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781517343,\"delay\":null}', 0, NULL, 1781517343, 1781517343),
(15, 'default', '{\"uuid\":\"5f6de5e6-a055-470a-992f-508b9e40260a\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:16;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781517354,\"delay\":null}', 0, NULL, 1781517354, 1781517354),
(16, 'default', '{\"uuid\":\"10890b80-67d6-4e37-b705-fa312fd90470\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:17;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781517369,\"delay\":null}', 0, NULL, 1781517369, 1781517369),
(17, 'default', '{\"uuid\":\"2a6e4bae-5030-4145-a2e8-cce7c654b7da\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:18;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781517380,\"delay\":null}', 0, NULL, 1781517380, 1781517380),
(18, 'default', '{\"uuid\":\"c4a449fe-0552-4b9f-97c5-22b2b84929e2\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:19;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781517404,\"delay\":null}', 0, NULL, 1781517404, 1781517404),
(19, 'default', '{\"uuid\":\"14e12e5c-ad76-4699-bd62-02cb107fda14\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:20;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781518315,\"delay\":null}', 0, NULL, 1781518315, 1781518315),
(20, 'default', '{\"uuid\":\"2cea6079-33f4-48f4-a717-78a1b8b79ebc\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781518334,\"delay\":null}', 0, NULL, 1781518334, 1781518334),
(21, 'default', '{\"uuid\":\"a8d2c296-f7a7-432d-8302-7773791d9735\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:22;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781522123,\"delay\":null}', 0, NULL, 1781522123, 1781522123),
(22, 'default', '{\"uuid\":\"16ed4ca6-f6a4-4906-930c-a0c00d56ac3e\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:23;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781522134,\"delay\":null}', 0, NULL, 1781522134, 1781522134),
(23, 'default', '{\"uuid\":\"48f44fba-43e5-48b3-bb15-b97bed717105\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:24;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781522144,\"delay\":null}', 0, NULL, 1781522144, 1781522144),
(24, 'default', '{\"uuid\":\"b1853335-3e26-49fa-b4de-e5dff9ff34ac\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:25;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781522149,\"delay\":null}', 0, NULL, 1781522149, 1781522149),
(25, 'default', '{\"uuid\":\"937d58b8-5de5-4115-b622-1dc324f00a7f\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:26;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781537764,\"delay\":null}', 0, NULL, 1781537764, 1781537764),
(26, 'default', '{\"uuid\":\"05649c7b-8e27-4f2a-b70a-1079ffdbfe77\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:27;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781537778,\"delay\":null}', 0, NULL, 1781537778, 1781537778),
(27, 'default', '{\"uuid\":\"af2b8cbe-db45-4589-900e-e83e683c50c9\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:28;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781537794,\"delay\":null}', 0, NULL, 1781537794, 1781537794),
(28, 'default', '{\"uuid\":\"a04fb65b-bfc6-4a2e-a7c4-23bcf4ced5a8\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:29;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781537855,\"delay\":null}', 0, NULL, 1781537855, 1781537855),
(29, 'default', '{\"uuid\":\"03af6a82-a972-4b03-81cc-03817316367f\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:30;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781537871,\"delay\":null}', 0, NULL, 1781537871, 1781537871),
(30, 'default', '{\"uuid\":\"c5bea513-cb10-4d95-84d3-9ef8210098e3\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:31;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781537886,\"delay\":null}', 0, NULL, 1781537886, 1781537886),
(31, 'default', '{\"uuid\":\"0f9803e2-7be2-417a-8f7a-a28024d4bdf5\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:32;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781538230,\"delay\":null}', 0, NULL, 1781538230, 1781538230),
(32, 'default', '{\"uuid\":\"7037a883-62ca-468f-9d9b-1d13addf3d43\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:33;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781539414,\"delay\":null}', 0, NULL, 1781539414, 1781539414),
(33, 'default', '{\"uuid\":\"e48c37dc-e26d-4149-a2e0-d0d87c117795\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:34;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781539431,\"delay\":null}', 0, NULL, 1781539431, 1781539431),
(34, 'default', '{\"uuid\":\"c52182f2-acae-4ea7-959c-5b3ff184e347\",\"displayName\":\"App\\\\Events\\\\BidPlaced\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\",\"command\":\"O:38:\\\"Illuminate\\\\Broadcasting\\\\BroadcastEvent\\\":18:{s:5:\\\"event\\\";O:20:\\\"App\\\\Events\\\\BidPlaced\\\":1:{s:3:\\\"bid\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:14:\\\"App\\\\Models\\\\Bid\\\";s:2:\\\"id\\\";i:35;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:7:\\\"backoff\\\";N;s:13:\\\"maxExceptions\\\";N;s:23:\\\"deleteWhenMissingModels\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:13:\\\"debounceOwner\\\";s:0:\\\"\\\";s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1781539443,\"delay\":null}', 0, NULL, 1781539443, 1781539443);

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_06_12_021157_create_personal_access_tokens_table', 1),
(5, '2026_06_12_024744_create_auctions_table', 2),
(6, '2026_06_12_024752_create_bids_table', 2),
(7, '2026_06_13_121549_add_winner_to_auctions_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', '59d771584f06d69a658400b8f22a24bc79445fcaef51c4cc46c2d352cf9f39a5', '[\"*\"]', '2026-06-11 19:02:51', NULL, '2026-06-11 18:46:00', '2026-06-11 19:02:51'),
(2, 'App\\Models\\User', 1, 'auth_token', '67e28cc4eb6cdc3a38796aff60b69fa04f92706b7da4167e216875bc1c443c9b', '[\"*\"]', NULL, NULL, '2026-06-11 19:00:04', '2026-06-11 19:00:04'),
(3, 'App\\Models\\User', 2, 'auth_token', '14cbd309fc904547e05c62960dccb05e4a8ea5dad35ebad2e43dae94eeb58f96', '[\"*\"]', '2026-06-13 04:24:41', NULL, '2026-06-11 19:08:31', '2026-06-13 04:24:41'),
(4, 'App\\Models\\User', 2, 'auth_token', '693c35256f4b42a0c485524bd9a641dbc546817a865d9f76fd030a224aed0bf7', '[\"*\"]', NULL, NULL, '2026-06-11 19:09:19', '2026-06-11 19:09:19'),
(5, 'App\\Models\\User', 1, 'auth_token', '0c4898306f7b1f1e5bda030d65dfba8ea5bdcc93e2cc9dea564a78f0947a3835', '[\"*\"]', NULL, NULL, '2026-06-13 05:00:52', '2026-06-13 05:00:52'),
(6, 'App\\Models\\User', 1, 'auth_token', '22fcce11ab52251c6a8740fe8e2eb9189797155e5da84ec781b06249a135d441', '[\"*\"]', NULL, NULL, '2026-06-13 05:04:35', '2026-06-13 05:04:35'),
(7, 'App\\Models\\User', 1, 'auth_token', 'b7bfb4933c97ce9321bd23ed96dc878d5c2116552e391550cf351102ebc64ba7', '[\"*\"]', '2026-06-13 05:26:22', NULL, '2026-06-13 05:12:05', '2026-06-13 05:26:22'),
(8, 'App\\Models\\User', 2, 'auth_token', '577be5d9384f0e8f246b62e6941873874da7cb74cf0fa77a68687ce996d5396a', '[\"*\"]', '2026-06-13 08:44:36', NULL, '2026-06-13 05:26:39', '2026-06-13 08:44:36'),
(9, 'App\\Models\\User', 1, 'auth_token', 'bbacaf6ea9d58a02d9ee921583787891c1f693f2a3da665979764e9eaac84bbf', '[\"*\"]', '2026-06-13 22:48:35', NULL, '2026-06-13 22:48:33', '2026-06-13 22:48:35'),
(10, 'App\\Models\\User', 4, 'auth_token', '575f7d150f36c3f3972654fce0cc7bcd1be6d8f626bd4b341e0fd95add181cbb', '[\"*\"]', '2026-06-14 01:12:45', NULL, '2026-06-13 22:49:55', '2026-06-14 01:12:45'),
(11, 'App\\Models\\User', 1, 'auth_token', '792e90a48cef584e80d7f7b618efe0e80b96cbc96f3df581ce26a2f9e3c27b3c', '[\"*\"]', '2026-06-14 01:41:24', NULL, '2026-06-14 01:16:00', '2026-06-14 01:41:24'),
(12, 'App\\Models\\User', 2, 'auth_token', '84853e0a7ae3006d7506dbfaf0722b213ad0d1f441061381d0ad888a991a552e', '[\"*\"]', '2026-06-14 01:42:02', NULL, '2026-06-14 01:41:44', '2026-06-14 01:42:02'),
(13, 'App\\Models\\User', 4, 'auth_token', '4e0dfd8145ae5c51338a6f6a3eb13684b23df9e8d43363b506f6cb6d2c406cef', '[\"*\"]', '2026-06-14 07:00:28', NULL, '2026-06-14 01:42:17', '2026-06-14 07:00:28'),
(14, 'App\\Models\\User', 4, 'auth_token', '992d09718e2d3c2a515c81a6fd9f508d56a65dc598474945545524d79c27a1c9', '[\"*\"]', '2026-06-14 07:04:20', NULL, '2026-06-14 07:01:40', '2026-06-14 07:04:20'),
(15, 'App\\Models\\User', 6, 'auth_token', '09375dd197f213c8eced171ce2e34e6bfbcfd61ca4863ff731e307aa4c0457ab', '[\"*\"]', '2026-06-14 07:06:19', NULL, '2026-06-14 07:05:33', '2026-06-14 07:06:19'),
(16, 'App\\Models\\User', 1, 'auth_token', '3e9aabc791852f10252e20260d589a603ee9a85854023584e3eff82aae885806', '[\"*\"]', '2026-06-14 07:12:46', NULL, '2026-06-14 07:07:10', '2026-06-14 07:12:46'),
(17, 'App\\Models\\User', 5, 'auth_token', '8b740b373034b9aef61808b4b7d638a48b989ca1678b6c72ffcb1906fbf97d19', '[\"*\"]', '2026-06-14 07:16:40', NULL, '2026-06-14 07:13:06', '2026-06-14 07:16:40'),
(18, 'App\\Models\\User', 6, 'auth_token', '725212de0df54068fc517da556db9554518d633a573a858d13dcd203485f2c4a', '[\"*\"]', '2026-06-14 07:17:17', NULL, '2026-06-14 07:17:02', '2026-06-14 07:17:17'),
(19, 'App\\Models\\User', 4, 'auth_token', '1e38833eda4ef846d69084abe8406637cba18f6b061dd456b890da12ca29c8b5', '[\"*\"]', '2026-06-14 07:18:57', NULL, '2026-06-14 07:17:33', '2026-06-14 07:18:57'),
(20, 'App\\Models\\User', 5, 'auth_token', '48e552a625afc2b3cec3e28ecca9131d26d085695822fb67b4cf473f98cf010b', '[\"*\"]', '2026-06-14 07:22:22', NULL, '2026-06-14 07:20:36', '2026-06-14 07:22:22'),
(21, 'App\\Models\\User', 4, 'auth_token', 'dba20ffea155c62670a8855792c499da29f8595caa8f8d4c46b049c84e7d77c6', '[\"*\"]', '2026-06-14 07:23:54', NULL, '2026-06-14 07:22:41', '2026-06-14 07:23:54'),
(22, 'App\\Models\\User', 4, 'auth_token', 'dc3845348b661d9fb8d069f468a445af1b66ad0b63197e2fe72ad306d3e7e71a', '[\"*\"]', NULL, NULL, '2026-06-14 19:09:27', '2026-06-14 19:09:27'),
(23, 'App\\Models\\User', 4, 'auth_token', 'ee5ec4604ce1e6fce4e7bdf39ed0763405a71ab5daaafcac50279feedefe0ee0', '[\"*\"]', '2026-06-14 19:34:21', NULL, '2026-06-14 19:09:27', '2026-06-14 19:34:21'),
(24, 'App\\Models\\User', 1, 'auth_token', '0dbf45cab88680a4c911cde6a6f972ae0c7c32e71e047ef291bc8b1d09773324', '[\"*\"]', '2026-06-14 19:57:04', NULL, '2026-06-14 19:35:03', '2026-06-14 19:57:04'),
(25, 'App\\Models\\User', 6, 'auth_token', '9fd05b4bf51799a6f12d5a121a69ce678a79c3de3a10e10105696b454928990d', '[\"*\"]', '2026-06-14 19:57:35', NULL, '2026-06-14 19:57:22', '2026-06-14 19:57:35'),
(26, 'App\\Models\\User', 4, 'auth_token', 'c0023932d16926a51df8fcba58d097eec4d143c852e7f681f81ca013d14309dd', '[\"*\"]', '2026-06-15 12:32:01', NULL, '2026-06-14 20:13:42', '2026-06-15 12:32:01'),
(27, 'App\\Models\\User', 1, 'auth_token', 'dfd1e5c9d9e16e2e420e08ea0097f586f31da01372ef52921e2ad581441ba235', '[\"*\"]', NULL, NULL, '2026-06-14 20:14:01', '2026-06-14 20:14:01'),
(28, 'App\\Models\\User', 6, 'auth_token', '349fe08f548e06aeb2b34fb438a135f3c9033bb9b8445d921af41532903dc079', '[\"*\"]', NULL, NULL, '2026-06-14 20:14:46', '2026-06-14 20:14:46'),
(29, 'App\\Models\\User', 6, 'auth_token', '2bd3c2983094b79a35a432beaf513ada5a525b7a814d9e3e33ba28fad5af336d', '[\"*\"]', '2026-06-15 12:32:01', NULL, '2026-06-14 20:21:32', '2026-06-15 12:32:01'),
(30, 'App\\Models\\User', 1, 'auth_token', '46e9453dbbfbc2c61f10381bb9d129369f8d978a62bf4097ae8be098ef249a06', '[\"*\"]', '2026-06-15 12:32:01', NULL, '2026-06-14 20:22:10', '2026-06-15 12:32:01'),
(31, 'App\\Models\\User', 1, 'auth_token', '36d22bc07e5b4c4d34c079145f35468dac9397054880116719f3a19dca6709fd', '[\"*\"]', NULL, NULL, '2026-06-15 14:03:02', '2026-06-15 14:03:02'),
(32, 'App\\Models\\User', 1, 'auth_token', '6a38e0c108502dd5789c8e52ca19e8d14053acbdee485c3dd4a589a25340bf80', '[\"*\"]', '2026-06-15 15:06:14', NULL, '2026-06-15 14:03:03', '2026-06-15 15:06:14'),
(33, 'App\\Models\\User', 4, 'auth_token', 'fdf9f946fd0b4660f198bf55434d14e662e5b447c234da160e82a8f6859ffd40', '[\"*\"]', '2026-06-15 16:06:46', NULL, '2026-06-15 14:03:30', '2026-06-15 16:06:46'),
(34, 'App\\Models\\User', 6, 'auth_token', 'bf2a680538eee1c069226a14053fae0cbd7d5756137b19845c3e732ce78ad11e', '[\"*\"]', '2026-06-15 14:40:41', NULL, '2026-06-15 14:03:54', '2026-06-15 14:40:41'),
(35, 'App\\Models\\User', 6, 'auth_token', '64f85868374f793a36eee763d798f8ab346078926483a71b60faa17d7223085f', '[\"*\"]', '2026-06-17 11:14:41', NULL, '2026-06-15 14:41:04', '2026-06-17 11:14:41'),
(36, 'App\\Models\\User', 5, 'auth_token', 'd62deee48d5048eeea5fc7904c32617450108d72f866100ba57bfb0eafda67cd', '[\"*\"]', '2026-06-17 11:14:41', NULL, '2026-06-15 14:41:43', '2026-06-17 11:14:41'),
(37, 'App\\Models\\User', 1, 'auth_token', '88ec8c57a7ac46033b71d85e96f5366e1628317b769299069484c9f83e3a9a9f', '[\"*\"]', '2026-06-15 15:47:00', NULL, '2026-06-15 15:31:49', '2026-06-15 15:47:00'),
(38, 'App\\Models\\User', 7, 'auth_token', 'f1c336d0b88d9650e94b253fb910ab0cfbcd3452761a258e0a47affff1124f3b', '[\"*\"]', '2026-06-17 10:47:18', NULL, '2026-06-15 15:51:38', '2026-06-17 10:47:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('AD7xOsBICl3LXj4PEpjUTXD7wJrsKVdrwtJRHA2o', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.123.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', 'eyJfdG9rZW4iOiJzcEN1bTRpR1ZXa2RJMlgzelh4TEhjeTJqOVdndmtLT25nVkJZdnNiIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1781232027),
('mZ7YqqXHXDnxWCtVtESsWaGQdvkBv1SpOQqoUoMb', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiI5bFVPUFF0V0cwdVpic3VjM01YZFhib0dWRDhUNENZeXBBMGFtdzVUIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1781354774);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Arsel', 'arsel@gmail.com', NULL, '$2y$12$o3xOTOGaLJSXYE8uTdNU/./r4W/hF/UdCOL3xPggu8bzobDqXIBEy', NULL, '2026-06-11 18:41:59', '2026-06-11 18:41:59'),
(2, 'Budi', 'budi@gmail.com', NULL, '$2y$12$cnFmeDQCEaENQ7RJDKg5CefeADqZFmt96UvDiJ3HdhianImxo2xEy', NULL, '2026-06-11 19:08:11', '2026-06-11 19:08:11'),
(3, 'anjun', 'ajun@gmail.com', NULL, '$2y$12$hvc3HN/EM6YUPrgyX8WIIuv8O3YgYb.3zuG8jcGBUTCpjiaHlMhTK', NULL, '2026-06-13 22:41:40', '2026-06-13 22:41:40'),
(4, 'dewa', 'dewa@gmail.com', NULL, '$2y$12$aK4F9ot96hwi5BDOZ1F0buZAS9/D/npVCbLEG1an61/uyvgwV6z3G', NULL, '2026-06-13 22:49:03', '2026-06-13 22:49:03'),
(5, 'yuda', 'yuda@gmail.com', NULL, '$2y$12$0Aa.HCQVep2YHK.rfWK/ROfMg13iP7pbUYoqu8trIMUNKb31l3UQW', NULL, '2026-06-13 22:49:37', '2026-06-13 22:49:37'),
(6, 'anjun', 'anjun@gmail.com', NULL, '$2y$12$girGSVQcOpnTNYftXcrWo.jHeWLbLQ3sylvydyTJzsj/UORq9bPrm', NULL, '2026-06-14 07:05:19', '2026-06-14 07:05:19'),
(7, 'eka kurniawan', 'eka08@gmail.com', NULL, '$2y$12$6rftHPqJW48No7O/Pxk07..u.8E21grlzrVqPFbkKZxYEGNOEHf6G', NULL, '2026-06-15 15:51:04', '2026-06-15 15:51:04');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `auctions`
--
ALTER TABLE `auctions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auctions_user_id_foreign` (`user_id`),
  ADD KEY `auctions_winner_id_foreign` (`winner_id`);

--
-- Indeks untuk tabel `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bids_auction_id_foreign` (`auction_id`),
  ADD KEY `bids_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT untuk tabel `auctions`
--
ALTER TABLE `auctions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `bids`
--
ALTER TABLE `bids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `auctions`
--
ALTER TABLE `auctions`
  ADD CONSTRAINT `auctions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auctions_winner_id_foreign` FOREIGN KEY (`winner_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_auction_id_foreign` FOREIGN KEY (`auction_id`) REFERENCES `auctions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bids_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
