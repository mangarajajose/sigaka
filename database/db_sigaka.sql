-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2023 at 11:57 AM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sigaka`
--

-- --------------------------------------------------------

--
-- Table structure for table `sigaka_absen`
--

CREATE TABLE `sigaka_absen` (
  `absen_id` varchar(20) NOT NULL,
  `absen_karyawan_id` varchar(20) NOT NULL,
  `absen_hari` varchar(10) NOT NULL,
  `absen_status` enum('lembur','normal') NOT NULL DEFAULT 'normal',
  `absen_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sigaka_absen`
--

INSERT INTO `sigaka_absen` (`absen_id`, `absen_karyawan_id`, `absen_hari`, `absen_status`, `absen_date_created`) VALUES
('ABS-45434', 'PEG-76226', 'Sabtu', 'normal', '2019-08-03 22:17:14'),
('ABS-50060', 'PEG-74722', 'Senin', 'normal', '2023-05-29 15:47:40'),
('ABS-52761', 'PEG-52693', 'Senin', 'normal', '2023-05-29 16:32:41'),
('ABS-52782', 'PEG-52576', 'Senin', 'normal', '2023-05-29 16:33:02'),
('ABS-52805', 'PEG-52435', 'Senin', 'normal', '2023-05-29 16:33:25'),
('ABS-52818', 'PEG-52288', 'Senin', 'lembur', '2023-05-29 16:33:38'),
('ABS-52829', 'PEG-52112', 'Senin', 'normal', '2023-05-29 16:33:49'),
('ABS-52843', 'PEG-51938', 'Senin', 'normal', '2023-05-29 16:34:04'),
('ABS-74757', 'PEG-74722', 'Senin', 'lembur', '2019-07-15 14:12:37'),
('ABS-76293', 'PEG-76226', 'Senin', 'lembur', '2019-07-15 14:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `sigaka_gaji`
--

CREATE TABLE `sigaka_gaji` (
  `gaji_id` varchar(20) NOT NULL,
  `gaji_karyawan_id` varchar(20) NOT NULL,
  `gaji_lembur` int(20) DEFAULT '0',
  `gaji_total` int(20) NOT NULL,
  `gaji_bayar_pinjaman` int(20) NOT NULL,
  `gaji_tanggal` date DEFAULT NULL,
  `gaji_bulan_ke` int(11) DEFAULT NULL,
  `gaji_status` enum('sudah','belum') NOT NULL DEFAULT 'belum',
  `gaji_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sigaka_gaji`
--

INSERT INTO `sigaka_gaji` (`gaji_id`, `gaji_karyawan_id`, `gaji_lembur`, `gaji_total`, `gaji_bayar_pinjaman`, `gaji_tanggal`, `gaji_bulan_ke`, `gaji_status`, `gaji_date_created`) VALUES
('GJI-52761', 'PEG-52693', 0, 100000, 0, '2023-05-29', 1, 'belum', '2023-05-29 16:32:41'),
('GJI-52782', 'PEG-52576', 0, 90000, 0, '2023-05-29', 1, 'belum', '2023-05-29 16:33:02'),
('GJI-52805', 'PEG-52435', 0, 90000, 0, '2023-05-29', 1, 'belum', '2023-05-29 16:33:25'),
('GJI-52818', 'PEG-52288', 100000, 100000, 0, '2023-05-29', 1, 'belum', '2023-05-29 16:33:38'),
('GJI-52829', 'PEG-52112', 0, 85000, 0, '2023-05-29', 1, 'belum', '2023-05-29 16:33:49'),
('GJI-52843', 'PEG-51938', 0, 100000, 0, '2023-05-29', 1, 'belum', '2023-05-29 16:34:03'),
('GJI-74757', 'PEG-74722', 35000, 70000, 0, '2023-05-29', 1, 'sudah', '2019-07-15 14:12:37'),
('GJI-76293', 'PEG-76226', 35000, 70000, 30000, '2019-08-03', 1, 'sudah', '2019-07-15 14:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `sigaka_jabatan`
--

CREATE TABLE `sigaka_jabatan` (
  `jabatan_id` varchar(20) NOT NULL,
  `jabatan_nama` varchar(255) DEFAULT NULL,
  `jabatan_gaji` int(20) DEFAULT NULL,
  `jabatan_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sigaka_jabatan`
--

INSERT INTO `sigaka_jabatan` (`jabatan_id`, `jabatan_nama`, `jabatan_gaji`, `jabatan_date_created`) VALUES
('JAB-51354', 'QC', 100000, '2023-05-29 16:09:14'),
('JAB-51384', 'Operator', 90000, '2023-05-29 16:09:44'),
('JAB-51544', 'Koordinator Regu', 90000, '2023-05-29 16:12:24'),
('JAB-51567', 'Kepala Bagian', 100000, '2023-05-29 16:12:47'),
('JAB-51584', 'Staff', 85000, '2023-05-29 16:13:04'),
('JAB-51606', 'Supervisor', 100000, '2023-05-29 16:13:26');

-- --------------------------------------------------------

--
-- Table structure for table `sigaka_karyawan`
--

CREATE TABLE `sigaka_karyawan` (
  `karyawan_id` varchar(20) NOT NULL,
  `karyawan_jabatan_id` varchar(20) DEFAULT NULL,
  `karyawan_nama` varchar(255) DEFAULT NULL,
  `karyawan_tempat_lahir` varchar(255) DEFAULT NULL,
  `karyawan_tanggal_lahir` date DEFAULT NULL,
  `karyawan_alamat` text,
  `karyawan_tanggal_gabung` date DEFAULT NULL,
  `karyawan_nomor_hp` varchar(20) DEFAULT NULL,
  `karyawan_no_rekening` varchar(30) DEFAULT NULL,
  `karyawan_date_created` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sigaka_karyawan`
--

INSERT INTO `sigaka_karyawan` (`karyawan_id`, `karyawan_jabatan_id`, `karyawan_nama`, `karyawan_tempat_lahir`, `karyawan_tanggal_lahir`, `karyawan_alamat`, `karyawan_tanggal_gabung`, `karyawan_nomor_hp`, `karyawan_no_rekening`, `karyawan_date_created`) VALUES
('PEG-51938', 'JAB-51606', 'Suprih Ayuningsih', 'Pati', '1988-01-01', '-', '2009-08-11', '087831732209', '', '2023-05-29 16:18:58'),
('PEG-52112', 'JAB-51584', 'Agus Wijanarko', 'Pati', '2009-08-19', '-', '2009-08-10', '085727793200', '', '2023-05-29 16:21:52'),
('PEG-52288', 'JAB-51567', 'Susetyo', 'Kudus', '2010-08-18', '-', '2010-02-18', '085225279388', '', '2023-05-29 16:24:48'),
('PEG-52435', 'JAB-51544', 'Kristianto', 'Pati', '1989-07-22', '-', '2010-07-12', '0895396258495', '', '2023-05-29 16:27:15'),
('PEG-52576', 'JAB-51384', 'Suprapto ', 'Pati', '1981-07-06', '-', '2010-12-01', '089672099900', '', '2023-05-29 16:29:36'),
('PEG-52693', 'JAB-51354', 'Haryanti ', 'Pati', '1988-09-08', '-', '2011-01-31', '089633895448', '', '2023-05-29 16:31:33');

-- --------------------------------------------------------

--
-- Table structure for table `sigaka_pengguna`
--

CREATE TABLE `sigaka_pengguna` (
  `pengguna_id` int(20) NOT NULL,
  `pengguna_username` varchar(255) DEFAULT NULL,
  `pengguna_password` varchar(255) DEFAULT NULL,
  `pengguna_nama` varchar(255) DEFAULT NULL,
  `pengguna_foto` text,
  `pengguna_hak_akses` enum('manajer','owner') DEFAULT NULL,
  `pengguna_date_created` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sigaka_pengguna`
--

INSERT INTO `sigaka_pengguna` (`pengguna_id`, `pengguna_username`, `pengguna_password`, `pengguna_nama`, `pengguna_foto`, `pengguna_hak_akses`, `pengguna_date_created`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', NULL, 'manajer', '2019-06-28 21:06:43'),
(2, 'owner', '72122ce96bfec66e2396d2e25225d70a', 'Owner', NULL, 'owner', '2019-07-15 12:27:55');

-- --------------------------------------------------------

--
-- Table structure for table `sigaka_pinjam`
--

CREATE TABLE `sigaka_pinjam` (
  `pinjam_id` varchar(20) NOT NULL,
  `pinjam_karyawan_id` varchar(20) NOT NULL,
  `pinjam_jumlah` int(20) NOT NULL,
  `pinjam_bayar` int(20) NOT NULL DEFAULT '0',
  `pinjam_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sigaka_pinjam`
--

INSERT INTO `sigaka_pinjam` (`pinjam_id`, `pinjam_karyawan_id`, `pinjam_jumlah`, `pinjam_bayar`, `pinjam_date_created`) VALUES
('PJM-44503', 'PEG-76226', 30000, 30000, '2019-08-03 22:01:43'),
('PJM-53979', 'PEG-52693', 50000, 0, '2023-05-29 16:52:59'),
('PJM-74863', 'PEG-74722', 50000, 50000, '2019-07-15 14:14:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sigaka_absen`
--
ALTER TABLE `sigaka_absen`
  ADD PRIMARY KEY (`absen_id`);

--
-- Indexes for table `sigaka_gaji`
--
ALTER TABLE `sigaka_gaji`
  ADD PRIMARY KEY (`gaji_id`);

--
-- Indexes for table `sigaka_jabatan`
--
ALTER TABLE `sigaka_jabatan`
  ADD PRIMARY KEY (`jabatan_id`);

--
-- Indexes for table `sigaka_karyawan`
--
ALTER TABLE `sigaka_karyawan`
  ADD PRIMARY KEY (`karyawan_id`);

--
-- Indexes for table `sigaka_pengguna`
--
ALTER TABLE `sigaka_pengguna`
  ADD PRIMARY KEY (`pengguna_id`);

--
-- Indexes for table `sigaka_pinjam`
--
ALTER TABLE `sigaka_pinjam`
  ADD PRIMARY KEY (`pinjam_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sigaka_pengguna`
--
ALTER TABLE `sigaka_pengguna`
  MODIFY `pengguna_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
