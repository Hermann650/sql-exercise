-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 02 Agu 2026 pada 09.21
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `chef`
--

CREATE TABLE `chef` (
  `id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `fullname` varchar(75) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `chef`
--

INSERT INTO `chef` (`id`, `manager_id`, `fullname`, `phone`, `email`, `salary`) VALUES
(1, 1, 'Daniel Hartono', '081311110001', 'daniel.hartono@restaurant.com', 4500000),
(2, 1, 'Kevin Pratama', '081311110002', 'kevin.pratama@restaurant.com', 5200000),
(3, 2, 'Michelle Tan', '081311110003', 'michelle.tan@restaurant.com', 6800000),
(4, 2, 'Christopher Wijaya', '081311110004', 'christopher.wijaya@restaurant.com', 7500000),
(5, 3, 'Stefani Kusuma', '081311110005', 'stefani.kusuma@restaurant.com', 6100000),
(6, 3, 'Adrian Saputra', '081311110006', 'adrian.saputra@restaurant.com', 8800000),
(7, 4, 'Felicia Gunawan', '081311110007', 'felicia.gunawan@restaurant.com', 5700000),
(8, 4, 'Ricky Setiawan', '081311110008', 'ricky.setiawan@restaurant.com', 9300000),
(9, 5, 'Jonathan Lim', '081311110009', 'jonathan.lim@restaurant.com', 8200000),
(10, 5, 'Olivia Nathania', '081311110010', 'olivia.nathania@restaurant.com', 9900000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `drink`
--

CREATE TABLE `drink` (
  `id` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category` varchar(36) NOT NULL,
  `photo_url` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `is_cold` tinyint(1) NOT NULL DEFAULT 1,
  `is_halal` tinyint(1) NOT NULL DEFAULT 1,
  `is_recommended` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `drink`
--

INSERT INTO `drink` (`id`, `name`, `description`, `category`, `photo_url`, `price`, `is_cold`, `is_halal`, `is_recommended`) VALUES
(1, 'Mineral Water', NULL, 'Water', NULL, 10000, 1, 1, 0),
(2, 'Iced Tea', 'Fresh brewed sweet tea', 'Tea', NULL, 18000, 1, 1, 1),
(3, 'Hot Tea', NULL, 'Tea', NULL, 16000, 0, 1, 0),
(4, 'Lemon Tea', 'Tea with fresh lime', 'Tea', 'https://example.com/drinks/lemon_tea.jpg', 22000, 1, 1, 1),
(5, 'Thai Tea', NULL, 'Tea', NULL, 28000, 1, 1, 1),
(6, 'Matcha Latte', 'Japanese matcha latte', 'Coffee', NULL, 35000, 1, 1, 1),
(7, 'Cappuccino', NULL, 'Coffee', 'https://example.com/drinks/cappuccino.jpg', 32000, 0, 1, 0),
(8, 'Cafe Latte', NULL, 'Coffee', NULL, 33000, 1, 1, 0),
(9, 'Americano', NULL, 'Coffee', NULL, 28000, 0, 1, 0),
(10, 'Espresso', NULL, 'Coffee', NULL, 24000, 0, 1, 0),
(11, 'Chocolate Milk', 'Rich chocolate drink', 'Chocolate', NULL, 30000, 1, 1, 1),
(12, 'Vanilla Milkshake', NULL, 'Milkshake', 'https://example.com/drinks/vanilla.jpg', 38000, 1, 1, 1),
(13, 'Strawberry Milkshake', NULL, 'Milkshake', NULL, 38000, 1, 1, 0),
(14, 'Mango Juice', NULL, 'Juice', NULL, 30000, 1, 1, 1),
(15, 'Orange Juice', 'Fresh orange juice', 'Juice', NULL, 28000, 1, 1, 0),
(16, 'Avocado Juice', NULL, 'Juice', 'https://example.com/drinks/avocado.jpg', 34000, 1, 1, 1),
(17, 'Apple Juice', NULL, 'Juice', NULL, 30000, 1, 1, 0),
(18, 'Lychee Tea', NULL, 'Tea', NULL, 28000, 1, 1, 0),
(19, 'Peach Tea', NULL, 'Tea', NULL, 28000, 1, 1, 0),
(20, 'Iced Coffee', NULL, 'Coffee', NULL, 32000, 1, 1, 1),
(21, 'Mocha', NULL, 'Coffee', NULL, 36000, 0, 1, 1),
(22, 'Caramel Latte', NULL, 'Coffee', 'https://example.com/drinks/caramel.jpg', 38000, 1, 1, 1),
(23, 'Green Tea', NULL, 'Tea', NULL, 24000, 0, 1, 0),
(24, 'Sparkling Lime', NULL, 'Mocktail', NULL, 32000, 1, 1, 1),
(25, 'Honey Lemon', NULL, 'Healthy Drink', NULL, 30000, 0, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `drink_cooking_history`
--

CREATE TABLE `drink_cooking_history` (
  `id` int(11) NOT NULL,
  `chef_id` int(11) NOT NULL,
  `drink_id` int(11) NOT NULL,
  `note` varchar(144) DEFAULT NULL,
  `record_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `drink_cooking_history`
--

INSERT INTO `drink_cooking_history` (`id`, `chef_id`, `drink_id`, `note`, `record_at`) VALUES
(1, 1, 1, NULL, '2025-01-03 08:20:00'),
(2, 2, 2, 'Less Sugar', '2025-01-03 12:15:00'),
(3, 3, 3, NULL, '2025-01-04 09:45:00'),
(4, 4, 4, 'Extra Ice', '2025-01-04 14:20:00'),
(5, 5, 5, NULL, '2025-01-05 13:35:00'),
(6, 6, 6, 'No Sugar', '2025-01-05 18:15:00'),
(7, 7, 7, NULL, '2025-01-06 10:40:00'),
(8, 8, 8, 'Take Away', '2025-01-06 16:10:00'),
(9, 9, 9, NULL, '2025-01-07 11:30:00'),
(10, 10, 10, 'Double Shot', '2025-01-07 19:20:00'),
(11, 1, 11, NULL, '2025-01-08 09:50:00'),
(12, 2, 12, 'Extra Vanilla', '2025-01-08 15:15:00'),
(13, 3, 13, NULL, '2025-01-09 12:40:00'),
(14, 4, 14, 'No Ice', '2025-01-09 17:35:00'),
(15, 5, 15, NULL, '2025-01-10 11:10:00'),
(16, 6, 16, 'Less Sugar', '2025-01-10 18:45:00'),
(17, 7, 17, NULL, '2025-01-11 13:25:00'),
(18, 8, 18, 'Extra Lychee', '2025-01-11 19:10:00'),
(19, 9, 19, NULL, '2025-01-12 10:55:00'),
(20, 10, 20, 'Large Size', '2025-01-12 20:15:00'),
(21, 1, 21, NULL, '2025-01-13 08:40:00'),
(22, 2, 22, 'Extra Caramel', '2025-01-13 14:05:00'),
(23, 3, 23, NULL, '2025-01-14 09:20:00'),
(24, 4, 24, 'Fresh Lime', '2025-01-14 16:30:00'),
(25, 5, 25, NULL, '2025-01-15 18:05:00'),
(26, 6, 1, 'Cold Bottle', '2025-01-16 11:25:00'),
(27, 7, 2, NULL, '2025-01-16 15:40:00'),
(28, 8, 3, 'Hot Refill', '2025-01-17 09:10:00'),
(29, 9, 4, NULL, '2025-01-17 13:55:00'),
(30, 10, 5, 'Less Ice', '2025-01-18 18:20:00'),
(31, 1, 6, NULL, '2025-01-18 10:45:00'),
(32, 2, 7, 'Extra Foam', '2025-01-19 16:50:00'),
(33, 3, 8, NULL, '2025-01-19 12:15:00'),
(34, 4, 9, 'No Sugar', '2025-01-20 09:35:00'),
(35, 5, 10, NULL, '2025-01-20 19:30:00'),
(36, 6, 11, 'Kids Menu', '2025-01-21 14:20:00'),
(37, 7, 12, NULL, '2025-01-21 18:10:00'),
(38, 8, 13, 'Extra Strawberry', '2025-01-22 15:25:00'),
(39, 9, 14, NULL, '2025-01-22 11:40:00'),
(40, 10, 15, 'Fresh Orange', '2025-01-23 13:10:00'),
(41, 1, 16, NULL, '2025-01-23 18:45:00'),
(42, 2, 17, 'No Ice', '2025-01-24 12:35:00'),
(43, 3, 18, NULL, '2025-01-24 16:05:00'),
(44, 4, 19, 'Take Away', '2025-01-25 14:50:00'),
(45, 5, 20, NULL, '2025-01-25 19:15:00'),
(46, 6, 21, 'Extra Chocolate', '2025-01-26 17:40:00'),
(47, 7, 22, NULL, '2025-01-26 15:30:00'),
(48, 8, 23, 'Hot Drink', '2025-01-27 08:55:00'),
(49, 9, 24, NULL, '2025-01-27 18:25:00'),
(50, 10, 25, 'Add Honey', '2025-01-28 20:05:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `drink_ingredient`
--

CREATE TABLE `drink_ingredient` (
  `id` int(11) NOT NULL,
  `drink_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `description` varchar(144) DEFAULT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `drink_ingredient`
--

INSERT INTO `drink_ingredient` (`id`, `drink_id`, `ingredient_id`, `description`, `qty`) VALUES
(1, 1, 50, NULL, 1),
(2, 2, 45, 'Sugar', 10),
(3, 2, 50, 'Ice', 150),
(4, 3, 45, NULL, 8),
(5, 4, 50, 'Lime', 1),
(6, 4, 45, NULL, 10),
(7, 5, 10, 'Milk', 150),
(8, 5, 45, NULL, 15),
(9, 6, 10, NULL, 180),
(10, 6, 45, NULL, 10),
(11, 7, 10, NULL, 120),
(12, 8, 10, NULL, 180),
(13, 9, 10, NULL, 30),
(14, 10, 10, NULL, 15),
(15, 11, 10, NULL, 200),
(16, 11, 45, NULL, 20),
(17, 12, 10, NULL, 220),
(18, 12, 45, NULL, 18),
(19, 13, 10, NULL, 220),
(20, 13, 45, NULL, 18),
(21, 14, 45, NULL, 12),
(22, 15, 50, 'Orange', 2),
(23, 16, 10, NULL, 120),
(24, 16, 45, NULL, 15),
(25, 17, 45, NULL, 10),
(26, 18, 45, NULL, 12),
(27, 19, 45, NULL, 12),
(28, 20, 10, NULL, 100),
(29, 21, 10, NULL, 120),
(30, 21, 45, NULL, 15),
(31, 22, 10, NULL, 180),
(32, 22, 45, NULL, 18),
(33, 23, 45, NULL, 8),
(34, 24, 50, 'Lime', 2),
(35, 24, 45, NULL, 12),
(36, 25, 50, 'Lime', 1),
(37, 25, 45, 'Honey', 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category` varchar(36) NOT NULL,
  `photo_url` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `is_spicy` tinyint(1) NOT NULL DEFAULT 0,
  `is_halal` tinyint(1) NOT NULL DEFAULT 1,
  `is_recommended` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `food`
--

INSERT INTO `food` (`id`, `name`, `description`, `category`, `photo_url`, `price`, `is_spicy`, `is_halal`, `is_recommended`) VALUES
(1, 'Chicken Fried Rice', 'Classic Indonesian fried rice with chicken', 'Main Course', NULL, 35000, 1, 1, 1),
(2, 'Beef Fried Rice', 'Fried rice with sliced beef', 'Main Course', NULL, 42000, 1, 1, 1),
(3, 'Chicken Satay', 'Grilled chicken skewers with peanut sauce', 'Main Course', 'https://example.com/foods/chicken_satay.jpg', 45000, 0, 1, 1),
(4, 'Beef Rendang', 'Slow cooked spicy beef', 'Main Course', 'https://example.com/foods/rendang.jpg', 55000, 1, 1, 1),
(5, 'Chicken Curry', NULL, 'Main Course', NULL, 48000, 1, 1, 0),
(6, 'Grilled Salmon', 'Served with vegetables', 'Main Course', 'https://example.com/foods/salmon.jpg', 75000, 0, 1, 1),
(7, 'Fish and Chips', NULL, 'Main Course', NULL, 60000, 0, 1, 0),
(8, 'Chicken Katsu', 'Japanese style fried chicken', 'Main Course', 'https://example.com/foods/katsu.jpg', 52000, 0, 1, 1),
(9, 'Beef Burger', 'Beef burger with cheese', 'Fast Food', 'https://example.com/foods/burger.jpg', 58000, 0, 1, 1),
(10, 'Spaghetti Bolognese', NULL, 'Pasta', NULL, 50000, 0, 1, 0),
(11, 'Chicken Carbonara', 'Creamy carbonara pasta', 'Pasta', NULL, 52000, 0, 1, 1),
(12, 'Mushroom Soup', NULL, 'Soup', NULL, 32000, 0, 1, 0),
(13, 'Corn Soup', 'Sweet corn soup', 'Soup', NULL, 30000, 0, 1, 0),
(14, 'Chicken Sandwich', NULL, 'Snack', NULL, 35000, 0, 1, 0),
(15, 'French Fries', 'Crispy fries', 'Snack', NULL, 25000, 0, 1, 1),
(16, 'Chicken Wings', 'Spicy grilled wings', 'Snack', 'https://example.com/foods/wings.jpg', 42000, 1, 1, 1),
(17, 'Shrimp Tempura', NULL, 'Japanese', 'https://example.com/foods/tempura.jpg', 55000, 0, 1, 1),
(18, 'Vegetable Salad', 'Fresh mixed vegetables', 'Salad', NULL, 30000, 0, 1, 0),
(19, 'Caesar Salad', NULL, 'Salad', NULL, 38000, 0, 1, 0),
(20, 'Beef Steak', 'Grilled sirloin steak', 'Western', 'https://example.com/foods/steak.jpg', 98000, 0, 1, 1),
(21, 'Chicken Steak', NULL, 'Western', NULL, 68000, 0, 1, 0),
(22, 'Fried Chicken', 'Crispy fried chicken', 'Main Course', NULL, 40000, 1, 1, 1),
(23, 'Chicken Noodles', NULL, 'Noodle', NULL, 32000, 0, 1, 0),
(24, 'Beef Noodles', 'Noodles with sliced beef', 'Noodle', NULL, 42000, 0, 1, 1),
(25, 'Seafood Fried Rice', 'Fried rice with shrimp and squid', 'Main Course', 'https://example.com/foods/seafood_fried_rice.jpg', 52000, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `food_cooking_history`
--

CREATE TABLE `food_cooking_history` (
  `id` int(11) NOT NULL,
  `chef_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `note` varchar(144) DEFAULT NULL,
  `record_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `food_cooking_history`
--

INSERT INTO `food_cooking_history` (`id`, `chef_id`, `food_id`, `note`, `record_at`) VALUES
(1, 1, 1, 'Breakfast Order', '2025-01-03 08:15:00'),
(2, 2, 2, NULL, '2025-01-03 12:40:00'),
(3, 3, 3, 'VIP Customer', '2025-01-04 18:10:00'),
(4, 4, 4, NULL, '2025-01-04 19:30:00'),
(5, 5, 5, 'Extra Spicy', '2025-01-05 13:20:00'),
(6, 6, 6, NULL, '2025-01-05 17:10:00'),
(7, 7, 7, 'Take Away', '2025-01-06 11:50:00'),
(8, 8, 8, NULL, '2025-01-06 18:25:00'),
(9, 9, 9, 'No Onion', '2025-01-07 14:45:00'),
(10, 10, 10, NULL, '2025-01-07 20:10:00'),
(11, 1, 11, NULL, '2025-01-08 09:05:00'),
(12, 2, 12, 'Less Salt', '2025-01-08 12:35:00'),
(13, 3, 13, NULL, '2025-01-09 18:20:00'),
(14, 4, 14, 'Employee Meal', '2025-01-09 15:45:00'),
(15, 5, 15, NULL, '2025-01-10 16:30:00'),
(16, 6, 16, 'Extra Sauce', '2025-01-10 19:15:00'),
(17, 7, 17, NULL, '2025-01-11 13:55:00'),
(18, 8, 18, 'Healthy Menu', '2025-01-11 11:40:00'),
(19, 9, 19, NULL, '2025-01-12 18:45:00'),
(20, 10, 20, 'Medium Rare', '2025-01-12 20:25:00'),
(21, 1, 21, NULL, '2025-01-13 12:15:00'),
(22, 2, 22, 'Family Order', '2025-01-13 18:35:00'),
(23, 3, 23, NULL, '2025-01-14 10:20:00'),
(24, 4, 24, 'No Garlic', '2025-01-14 14:50:00'),
(25, 5, 25, NULL, '2025-01-15 19:05:00'),
(26, 6, 1, 'Lunch Set', '2025-01-16 12:40:00'),
(27, 7, 2, NULL, '2025-01-16 18:10:00'),
(28, 8, 3, 'Birthday Event', '2025-01-17 19:30:00'),
(29, 9, 4, NULL, '2025-01-17 20:05:00'),
(30, 10, 5, 'Extra Chili', '2025-01-18 13:15:00'),
(31, 1, 6, NULL, '2025-01-18 17:50:00'),
(32, 2, 7, 'Take Away', '2025-01-19 11:10:00'),
(33, 3, 8, NULL, '2025-01-19 18:25:00'),
(34, 4, 9, 'Less Cheese', '2025-01-20 15:40:00'),
(35, 5, 10, NULL, '2025-01-20 19:55:00'),
(36, 6, 11, 'VIP Table', '2025-01-21 18:05:00'),
(37, 7, 12, NULL, '2025-01-21 12:25:00'),
(38, 8, 13, 'Lunch Promo', '2025-01-22 13:30:00'),
(39, 9, 14, NULL, '2025-01-22 17:45:00'),
(40, 10, 15, 'Kids Menu', '2025-01-23 16:20:00'),
(41, 1, 16, NULL, '2025-01-23 19:15:00'),
(42, 2, 17, 'No Pepper', '2025-01-24 18:35:00'),
(43, 3, 18, NULL, '2025-01-24 11:40:00'),
(44, 4, 19, 'Fresh Salad', '2025-01-25 13:05:00'),
(45, 5, 20, NULL, '2025-01-25 20:10:00'),
(46, 6, 21, 'Dinner Order', '2025-01-26 19:20:00'),
(47, 7, 22, NULL, '2025-01-26 18:45:00'),
(48, 8, 23, 'Extra Chicken', '2025-01-27 12:30:00'),
(49, 9, 24, NULL, '2025-01-27 14:10:00'),
(50, 10, 25, 'Large Portion', '2025-01-28 20:30:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `food_ingredient`
--

CREATE TABLE `food_ingredient` (
  `id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `description` varchar(144) DEFAULT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `food_ingredient`
--

INSERT INTO `food_ingredient` (`id`, `food_id`, `ingredient_id`, `description`, `qty`) VALUES
(1, 1, 1, NULL, 200),
(2, 1, 2, 'Diced', 120),
(3, 1, 9, NULL, 1),
(4, 1, 19, 'Minced', 10),
(5, 1, 20, 'Sliced', 10),
(6, 1, 40, NULL, 20),
(7, 2, 1, NULL, 200),
(8, 2, 4, 'Sliced', 120),
(9, 2, 9, NULL, 1),
(10, 2, 21, NULL, 15),
(11, 2, 40, NULL, 20),
(12, 2, 46, NULL, 3),
(13, 3, 2, 'Cubed', 180),
(14, 3, 19, NULL, 8),
(15, 3, 41, NULL, 20),
(16, 3, 17, NULL, 15),
(17, 4, 4, NULL, 200),
(18, 4, 23, NULL, 10),
(19, 4, 24, NULL, 10),
(20, 4, 25, NULL, 8),
(21, 4, 49, NULL, 80),
(22, 4, 26, NULL, 10),
(23, 5, 2, NULL, 180),
(24, 5, 48, NULL, 8),
(25, 5, 49, NULL, 100),
(26, 5, 19, NULL, 8),
(27, 5, 20, NULL, 8),
(28, 6, 6, NULL, 180),
(29, 6, 18, NULL, 10),
(30, 6, 46, NULL, 3),
(31, 6, 44, NULL, 2),
(32, 6, 32, NULL, 80),
(33, 7, 6, NULL, 180),
(34, 7, 14, NULL, 50),
(35, 7, 16, NULL, 30),
(36, 7, 31, NULL, 150),
(37, 8, 2, NULL, 180),
(38, 8, 14, NULL, 40),
(39, 8, 16, NULL, 25),
(40, 8, 17, NULL, 30),
(41, 9, 5, NULL, 150),
(42, 9, 12, NULL, 25),
(43, 9, 21, NULL, 15),
(44, 9, 19, NULL, 8),
(45, 10, 5, NULL, 120),
(46, 10, 14, NULL, 120),
(47, 10, 28, NULL, 80),
(48, 10, 21, NULL, 20),
(49, 11, 2, NULL, 120),
(50, 11, 14, NULL, 120),
(51, 11, 10, NULL, 80),
(52, 11, 12, NULL, 25),
(53, 12, 36, NULL, 150),
(54, 12, 10, NULL, 100),
(55, 12, 11, NULL, 15),
(56, 12, 21, NULL, 20),
(57, 13, 39, NULL, 180),
(58, 13, 10, NULL, 80),
(59, 13, 11, NULL, 10),
(60, 13, 37, NULL, 5),
(61, 14, 2, NULL, 120),
(62, 14, 34, NULL, 30),
(63, 14, 12, NULL, 20),
(64, 14, 19, NULL, 5),
(65, 15, 31, NULL, 250),
(66, 15, 17, NULL, 40),
(67, 15, 44, NULL, 3),
(68, 16, 2, NULL, 200),
(69, 16, 26, NULL, 12),
(70, 16, 41, NULL, 20),
(71, 16, 46, NULL, 2),
(72, 17, 7, NULL, 180),
(73, 17, 14, NULL, 50),
(74, 17, 16, NULL, 30),
(75, 17, 17, NULL, 30),
(76, 18, 34, NULL, 80),
(77, 18, 29, NULL, 40),
(78, 18, 28, NULL, 30),
(79, 18, 18, NULL, 10),
(80, 19, 34, NULL, 80),
(81, 19, 12, NULL, 20),
(82, 19, 28, NULL, 30),
(83, 19, 18, NULL, 10),
(84, 20, 4, NULL, 250),
(85, 20, 11, NULL, 20),
(86, 20, 46, NULL, 4),
(87, 20, 44, NULL, 3),
(88, 21, 2, NULL, 220),
(89, 21, 11, NULL, 20),
(90, 21, 46, NULL, 3),
(91, 21, 44, NULL, 3),
(92, 22, 2, NULL, 200),
(93, 22, 14, NULL, 60),
(94, 22, 16, NULL, 40),
(95, 22, 17, NULL, 30),
(96, 23, 2, NULL, 120),
(97, 23, 19, NULL, 8),
(98, 23, 37, NULL, 8),
(99, 23, 40, NULL, 20),
(100, 24, 4, NULL, 120),
(101, 24, 19, NULL, 8),
(102, 24, 37, NULL, 8),
(103, 24, 40, NULL, 20),
(104, 25, 1, NULL, 200),
(105, 25, 7, NULL, 80),
(106, 25, 8, NULL, 60),
(107, 25, 9, NULL, 1),
(108, 25, 19, NULL, 8),
(109, 25, 40, NULL, 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `unit` varchar(20) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `ingredient`
--

INSERT INTO `ingredient` (`id`, `name`, `description`, `unit`, `stock`) VALUES
(1, 'Rice', 'Premium white rice', 'kg', 150),
(2, 'Chicken Breast', 'Fresh boneless chicken breast', 'kg', 85),
(3, 'Chicken Thigh', NULL, 'kg', 72),
(4, 'Beef Sirloin', 'Australian beef', 'kg', 55),
(5, 'Ground Beef', NULL, 'kg', 40),
(6, 'Salmon', 'Fresh salmon fillet', 'kg', 30),
(7, 'Shrimp', 'Medium size shrimp', 'kg', 45),
(8, 'Squid', NULL, 'kg', 28),
(9, 'Egg', 'Chicken egg', 'pcs', 300),
(10, 'Milk', 'Fresh whole milk', 'liter', 60),
(11, 'Butter', NULL, 'kg', 20),
(12, 'Cheddar Cheese', NULL, 'kg', 18),
(13, 'Mozzarella Cheese', NULL, 'kg', 20),
(14, 'Flour', 'All purpose flour', 'kg', 120),
(15, 'Corn Starch', NULL, 'kg', 40),
(16, 'Bread Crumbs', NULL, 'kg', 35),
(17, 'Cooking Oil', NULL, 'liter', 100),
(18, 'Olive Oil', NULL, 'liter', 30),
(19, 'Garlic', NULL, 'kg', 25),
(20, 'Shallot', NULL, 'kg', 20),
(21, 'Onion', NULL, 'kg', 40),
(22, 'Ginger', NULL, 'kg', 18),
(23, 'Turmeric', NULL, 'kg', 15),
(24, 'Galangal', NULL, 'kg', 15),
(25, 'Lemongrass', NULL, 'kg', 12),
(26, 'Chili', 'Red chili', 'kg', 22),
(27, 'Bird Eye Chili', NULL, 'kg', 18),
(28, 'Tomato', NULL, 'kg', 35),
(29, 'Cucumber', NULL, 'kg', 30),
(30, 'Carrot', NULL, 'kg', 30),
(31, 'Potato', NULL, 'kg', 60),
(32, 'Broccoli', NULL, 'kg', 20),
(33, 'Spinach', NULL, 'kg', 18),
(34, 'Lettuce', NULL, 'kg', 20),
(35, 'Cabbage', NULL, 'kg', 25),
(36, 'Mushroom', 'Button mushroom', 'kg', 18),
(37, 'Spring Onion', NULL, 'kg', 10),
(38, 'Celery', NULL, 'kg', 10),
(39, 'Sweet Corn', NULL, 'kg', 25),
(40, 'Soy Sauce', NULL, 'liter', 40),
(41, 'Sweet Soy Sauce', NULL, 'liter', 35),
(42, 'Oyster Sauce', NULL, 'liter', 25),
(43, 'Fish Sauce', NULL, 'liter', 15),
(44, 'Salt', NULL, 'kg', 60),
(45, 'Sugar', NULL, 'kg', 70),
(46, 'Black Pepper', NULL, 'kg', 15),
(47, 'White Pepper', NULL, 'kg', 15),
(48, 'Curry Powder', NULL, 'kg', 10),
(49, 'Coconut Milk', NULL, 'liter', 30),
(50, 'Lime', NULL, 'kg', 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `manager`
--

CREATE TABLE `manager` (
  `id` int(11) NOT NULL,
  `fullname` varchar(75) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `manager`
--

INSERT INTO `manager` (`id`, `fullname`, `phone`, `email`) VALUES
(1, 'John Anderson', '081211110001', 'john.anderson@restaurant.com'),
(2, 'Michael Johnson', '081211110002', 'michael.johnson@restaurant.com'),
(3, 'Sarah Williams', '081211110003', 'sarah.williams@restaurant.com'),
(4, 'Emily Brown', '081211110004', 'emily.brown@restaurant.com'),
(5, 'David Miller', '081211110005', 'david.miller@restaurant.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `schedule`
--

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `chef_id` int(11) NOT NULL,
  `day_name` char(3) NOT NULL,
  `hour_start` char(5) NOT NULL,
  `hour_end` char(5) NOT NULL,
  `note` varchar(144) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `schedule`
--

INSERT INTO `schedule` (`id`, `chef_id`, `day_name`, `hour_start`, `hour_end`, `note`) VALUES
(1, 1, 'MON', '08:00', '16:00', 'Morning Shift'),
(2, 1, 'WED', '08:00', '16:00', NULL),
(3, 1, 'FRI', '12:00', '20:00', 'Dinner Preparation'),
(4, 1, 'SUN', '10:00', '18:00', NULL),
(5, 2, 'TUE', '09:00', '17:00', NULL),
(6, 2, 'THU', '09:00', '17:00', 'Kitchen Duty'),
(7, 2, 'SAT', '13:00', '21:00', NULL),
(8, 3, 'MON', '07:30', '15:30', 'Breakfast Shift'),
(9, 3, 'WED', '07:30', '15:30', NULL),
(10, 3, 'FRI', '15:00', '23:00', 'Closing Shift'),
(11, 3, 'SAT', '11:00', '19:00', NULL),
(12, 4, 'TUE', '08:30', '16:30', NULL),
(13, 4, 'THU', '08:30', '16:30', NULL),
(14, 4, 'SUN', '12:00', '20:00', 'Weekend Shift'),
(15, 5, 'MON', '10:00', '18:00', NULL),
(16, 5, 'THU', '10:00', '18:00', 'Main Kitchen'),
(17, 5, 'SAT', '14:00', '22:00', NULL),
(18, 6, 'TUE', '06:30', '14:30', 'Opening Shift'),
(19, 6, 'WED', '06:30', '14:30', NULL),
(20, 6, 'FRI', '14:30', '22:30', NULL),
(21, 6, 'SUN', '09:00', '17:00', 'Weekend'),
(22, 7, 'MON', '11:00', '19:00', NULL),
(23, 7, 'THU', '11:00', '19:00', NULL),
(24, 7, 'SAT', '15:00', '23:00', 'Late Shift'),
(25, 8, 'TUE', '08:00', '16:00', NULL),
(26, 8, 'WED', '08:00', '16:00', 'Preparation'),
(27, 8, 'FRI', '12:30', '20:30', NULL),
(28, 8, 'SUN', '10:30', '18:30', NULL),
(29, 9, 'MON', '09:30', '17:30', NULL),
(30, 9, 'TUE', '09:30', '17:30', 'Kitchen Cleaning'),
(31, 9, 'THU', '13:30', '21:30', NULL),
(32, 9, 'SAT', '13:30', '21:30', 'Dinner Shift'),
(33, 10, 'WED', '08:30', '16:30', NULL),
(34, 10, 'THU', '08:30', '16:30', NULL),
(35, 10, 'FRI', '16:00', '23:30', 'Closing'),
(36, 10, 'SAT', '16:00', '23:30', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indeks untuk tabel `drink`
--
ALTER TABLE `drink`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `drink_cooking_history`
--
ALTER TABLE `drink_cooking_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chef_id` (`chef_id`),
  ADD KEY `drink_id` (`drink_id`);

--
-- Indeks untuk tabel `drink_ingredient`
--
ALTER TABLE `drink_ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `drink_id` (`drink_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indeks untuk tabel `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `food_cooking_history`
--
ALTER TABLE `food_cooking_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chef_id` (`chef_id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indeks untuk tabel `food_ingredient`
--
ALTER TABLE `food_ingredient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indeks untuk tabel `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chef_id` (`chef_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `chef`
--
ALTER TABLE `chef`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `drink`
--
ALTER TABLE `drink`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `drink_cooking_history`
--
ALTER TABLE `drink_cooking_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `drink_ingredient`
--
ALTER TABLE `drink_ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `food_cooking_history`
--
ALTER TABLE `food_cooking_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `food_ingredient`
--
ALTER TABLE `food_ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT untuk tabel `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `manager`
--
ALTER TABLE `manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `chef`
--
ALTER TABLE `chef`
  ADD CONSTRAINT `chef_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`id`);

--
-- Ketidakleluasaan untuk tabel `drink_cooking_history`
--
ALTER TABLE `drink_cooking_history`
  ADD CONSTRAINT `drink_cooking_history_ibfk_1` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`id`),
  ADD CONSTRAINT `drink_cooking_history_ibfk_2` FOREIGN KEY (`drink_id`) REFERENCES `drink` (`id`);

--
-- Ketidakleluasaan untuk tabel `drink_ingredient`
--
ALTER TABLE `drink_ingredient`
  ADD CONSTRAINT `drink_ingredient_ibfk_1` FOREIGN KEY (`drink_id`) REFERENCES `drink` (`id`),
  ADD CONSTRAINT `drink_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`);

--
-- Ketidakleluasaan untuk tabel `food_cooking_history`
--
ALTER TABLE `food_cooking_history`
  ADD CONSTRAINT `food_cooking_history_ibfk_1` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`id`),
  ADD CONSTRAINT `food_cooking_history_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`);

--
-- Ketidakleluasaan untuk tabel `food_ingredient`
--
ALTER TABLE `food_ingredient`
  ADD CONSTRAINT `food_ingredient_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`),
  ADD CONSTRAINT `food_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`);

--
-- Ketidakleluasaan untuk tabel `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`chef_id`) REFERENCES `chef` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SELECT name,price from food where price > 50000 LIMIT 5; /*no 1*/
SELECT name,category,price FROM drink where category = 'Tea' OR category = 'Coffee' order by category asc, price desc;
SELECT name, price, case when price >= 70000 then 'Premium' when price >= 50000 then 'Standard' else 'Budget' end as price_category from food where is_halal = 1;
SELECT ROUND(AVG(salary),2) AS average_salary FROM chef where salary > 6000000;
SELECT CONCAT('Chef', ': ', fullname) AS chef_information, salary from chef where salary > 7000000 order by salary desc;
SELECT CONCAT(name, ' - ', category) AS drink_information, case when is_cold = 1 then 'Cold Drink' else 'Hot Drink' end as drink_type, price from drink where price > 30000 AND is_recommended = 1 LIMIT 5;