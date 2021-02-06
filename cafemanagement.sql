-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2021 at 01:46 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafemanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `id_laporan` varchar(50) NOT NULL,
  `id_transaksi` varchar(50) NOT NULL,
  `tgl_transaksi` varchar(45) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `laporan`
--

INSERT INTO `laporan` (`id_laporan`, `id_transaksi`, `tgl_transaksi`, `status`) VALUES
('Bima04-08-2020', 'fcc42562-198a-4983-afa3-1873765560c4', '04-08-2020', 'LUNAS'),
('Dimas04-08-2020', '0655b546-7e47-47ae-9acd-d30ff31e8696', '04-08-2020', 'LUNAS'),
('Dimas07-08-2020', '283c4b16-b92e-4e6f-a0cb-447f64fe2578', '07-08-2020', 'LUNAS'),
('DimasN05-08-2020', '1bbed6a8-a4d0-4ab4-b5b8-862335c4316e', '05-08-2020', 'LUNAS'),
('DimasN06-08-2020', 'd0621063-e141-48c3-9c70-7e7cead8bff2', '06-08-2020', 'LUNAS');

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `id_meja` int(11) NOT NULL,
  `kapasitas` int(20) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`id_meja`, `kapasitas`, `status`) VALUES
(1, 4, 'kosong'),
(2, 2, 'kosong'),
(3, 6, 'kosong'),
(4, 6, 'kosong'),
(5, 4, 'kosong'),
(6, 6, 'kosong'),
(7, 2, 'penuh'),
(8, 8, 'penuh'),
(9, 2, 'penuh'),
(10, 4, 'kosong'),
(11, 4, 'kosong'),
(12, 6, 'kosong'),
(13, 4, 'kosong'),
(14, 6, 'kosong');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `jenis_menu` varchar(20) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `harga` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `jenis_menu`, `kategori`, `harga`) VALUES
(1, 'Air Mineral', 'Minuman', 'Utama', 4000),
(2, 'Kopi Susu', 'Minuman', 'Pembuka', 8000),
(3, 'French Fries', 'Makanan', 'Pembuka', 20000),
(4, 'Kopi', 'Minuman', 'Pembuka', 6000),
(5, 'Mie Goreng', 'Makanan', 'Utama', 15000),
(6, 'Es Teh', 'Minuman', 'Utama', 4000),
(7, 'Ayam Goreng', 'Makanan', 'Utama', 15000),
(8, 'Nasi Goreng', 'Makanan', 'Utama', 18000),
(9, 'Steak Daging', 'Makanan', 'Utama', 40000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(50) NOT NULL,
  `id_meja` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `harga` int(20) NOT NULL,
  `jml_pesan` int(20) NOT NULL,
  `hargatotal` int(20) NOT NULL,
  `customer` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `level`) VALUES
('kasir', 'kasir', 'kasir');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`id_meja`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `meja`
--
ALTER TABLE `meja`
  MODIFY `id_meja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
