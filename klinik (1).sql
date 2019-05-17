-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Bulan Mei 2019 pada 10.03
-- Versi server: 10.1.35-MariaDB
-- Versi PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klinik`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` varchar(15) NOT NULL,
  `nama_dokter` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`) VALUES
('dk_003', 'Dino Ganteng'),
('d_001', 'Ahmad Auzan'),
('d_002', 'Dino'),
('d_005', 'Dinos'),
('d_007', 'Putirs'),
('d_009', 'lala'),
('d_010', 'auzann');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id_obat` varchar(15) NOT NULL,
  `merk_obat` varchar(20) NOT NULL,
  `fungsi_obat` varchar(20) NOT NULL,
  `tgl_kadaluarsa` date NOT NULL,
  `jumlah` int(10) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id_obat`, `merk_obat`, `fungsi_obat`, `tgl_kadaluarsa`, `jumlah`, `harga`) VALUES
('o_001', 'fungiderm', 'gatal', '2020-08-07', 300, 25000),
('o_002', 'panadol', 'gk tau', '2222-09-09', 2300, 2211000),
('o_003', 'oskadon', 'ok', '2210-09-09', 98, 89000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` varchar(15) NOT NULL,
  `nama_pasien` varchar(25) NOT NULL,
  `berat_badan` varchar(10) NOT NULL,
  `tinggi_badan` varchar(100) NOT NULL,
  `riwayat_penyakit` text NOT NULL,
  `gol_darah` varchar(2) NOT NULL,
  `umur` int(3) NOT NULL,
  `alergi_obat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `berat_badan`, `tinggi_badan`, `riwayat_penyakit`, `gol_darah`, `umur`, `alergi_obat`) VALUES
('p_001', 'Haidar', '45', '122', 'dasdas', 'A', 24, 'fsdfsd'),
('p_007', 'auzan', '98', '1190', 'ada', 'O', 22, '45'),
('p_009', 'humairah', '55', '163', 'asma', 'A', 20, 'tidak ada');

-- --------------------------------------------------------

--
-- Struktur dari tabel `racikan`
--

CREATE TABLE `racikan` (
  `id_racikan` int(10) NOT NULL,
  `id_dokter` varchar(10) NOT NULL,
  `id_obat` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `racikan`
--

INSERT INTO `racikan` (`id_racikan`, `id_dokter`, `id_obat`) VALUES
(1, 'd_001', 'o_001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekam medis`
--

CREATE TABLE `rekam medis` (
  `id_rekam_medis` varchar(20) NOT NULL,
  `id_pasien` varchar(20) NOT NULL,
  `id_racikan` int(10) NOT NULL,
  `hasil_diagnosis` varchar(50) NOT NULL,
  `waktu` date NOT NULL,
  `total_harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rekam medis`
--

INSERT INTO `rekam medis` (`id_rekam_medis`, `id_pasien`, `id_racikan`, `hasil_diagnosis`, `waktu`, `total_harga`) VALUES
('rm_001', 'p_001', 1, 'kronis', '2019-09-14', 25000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indeks untuk tabel `racikan`
--
ALTER TABLE `racikan`
  ADD PRIMARY KEY (`id_racikan`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_obat` (`id_obat`);

--
-- Indeks untuk tabel `rekam medis`
--
ALTER TABLE `rekam medis`
  ADD PRIMARY KEY (`id_rekam_medis`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_racikan` (`id_racikan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `racikan`
--
ALTER TABLE `racikan`
  MODIFY `id_racikan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `racikan`
--
ALTER TABLE `racikan`
  ADD CONSTRAINT `racikan_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `racikan_ibfk_2` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`);

--
-- Ketidakleluasaan untuk tabel `rekam medis`
--
ALTER TABLE `rekam medis`
  ADD CONSTRAINT `rekam medis_ibfk_1` FOREIGN KEY (`id_racikan`) REFERENCES `racikan` (`id_racikan`),
  ADD CONSTRAINT `rekam medis_ibfk_2` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
