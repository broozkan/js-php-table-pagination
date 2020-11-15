-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 17 Nis 2019, 23:30:23
-- Sunucu sürümü: 5.7.24
-- PHP Sürümü: 7.0.33-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `barista_pos_brosoft`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_adisyonlar`
--

CREATE TABLE `tbl_adisyonlar` (
  `id` int(11) NOT NULL,
  `adisyon_masa_idsi` varchar(50) NOT NULL,
  `adisyon_acilis_saati` time NOT NULL,
  `adisyon_odeme_durumu` tinyint(4) NOT NULL,
  `adisyon_notu` varchar(500) NOT NULL,
  `adisyon_tutari` float(10,2) NOT NULL,
  `adisyon_musteri_idsi` int(11) DEFAULT NULL,
  `adisyon_calisan_idsi` int(11) DEFAULT NULL,
  `adisyon_odenmis_tutar` float(10,2) NOT NULL,
  `adisyon_indirim_turu` tinyint(4) NOT NULL,
  `adisyon_indirim_miktari` tinyint(4) NOT NULL,
  `adisyon_indirim_yapan_kisi_idsi` int(11) NOT NULL,
  `adisyon_yola_cikti_mi` tinyint(4) NOT NULL DEFAULT '0',
  `adisyon_kurye_idsi` int(11) NOT NULL DEFAULT '0',
  `adisyon_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_adisyonlar`
--

INSERT INTO `tbl_adisyonlar` (`id`, `adisyon_masa_idsi`, `adisyon_acilis_saati`, `adisyon_odeme_durumu`, `adisyon_notu`, `adisyon_tutari`, `adisyon_musteri_idsi`, `adisyon_calisan_idsi`, `adisyon_odenmis_tutar`, `adisyon_indirim_turu`, `adisyon_indirim_miktari`, `adisyon_indirim_yapan_kisi_idsi`, `adisyon_yola_cikti_mi`, `adisyon_kurye_idsi`, `adisyon_tarihi`) VALUES
(15, '108', '09:32:00', 1, '', 21.00, NULL, NULL, 0.00, 0, 0, 0, 0, 0, '2019-04-17 10:41:10'),
(19, '111', '09:13:18', 1, '', 306.00, 5, NULL, 260.10, 0, 15, 0, 0, 0, '2019-04-17 10:41:10'),
(27, 'HS', '14:47:03', 1, '', 102.00, NULL, NULL, 102.00, 0, 0, 0, 0, 0, '2019-04-17 10:41:10'),
(28, 'HS', '15:51:08', 1, '', 6.00, NULL, NULL, 6.00, 0, 0, 0, 0, 0, '2019-04-17 10:41:10'),
(32, 'PS', '18:46:00', 0, '', 13.00, 5, NULL, 0.00, 0, 0, 0, 1, 10, '2019-04-17 10:41:10'),
(33, 'PS', '18:52:30', 1, '', 198.00, 7, NULL, 198.00, 0, 0, 0, 1, 10, '2019-04-17 10:41:10'),
(37, 'PS', '19:15:53', 0, '', 300.00, 3, NULL, 0.00, 0, 0, 0, 0, 0, '2019-04-17 10:41:10'),
(39, 'PS', '19:28:17', 0, '', 10.00, 2, NULL, 0.00, 0, 0, 0, 0, 0, '2019-04-17 10:41:10'),
(40, '111', '17:01:12', 1, '', 9.00, NULL, NULL, 9.00, 0, 0, 0, 0, 0, '2019-04-17 10:41:10'),
(41, '111', '17:04:09', 1, '', 3.00, NULL, NULL, 3.00, 0, 0, 0, 0, 0, '2019-04-17 10:41:10'),
(42, '111', '17:32:11', 1, '', 313.00, NULL, NULL, 313.00, 0, 0, 0, 0, 0, '2019-04-17 10:41:10'),
(43, '111', '17:32:12', 0, '', 9.00, NULL, NULL, 0.00, 0, 0, 0, 0, 0, '2019-04-17 10:41:10');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_adisyon_odemeleri`
--

CREATE TABLE `tbl_adisyon_odemeleri` (
  `id` int(11) NOT NULL,
  `adisyon_odemesi_adisyon_idsi` int(11) NOT NULL,
  `adisyon_odemesi_odeme_metodu_idsi` int(11) NOT NULL,
  `adisyon_odemesi_odeme_miktari` float(10,2) NOT NULL,
  `adisyon_odemesi_odemeyi_alan_kisi_idsi` int(11) NOT NULL,
  `adisyon_odemesi_odeme_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_adisyon_odemeleri`
--

INSERT INTO `tbl_adisyon_odemeleri` (`id`, `adisyon_odemesi_adisyon_idsi`, `adisyon_odemesi_odeme_metodu_idsi`, `adisyon_odemesi_odeme_miktari`, `adisyon_odemesi_odemeyi_alan_kisi_idsi`, `adisyon_odemesi_odeme_tarihi`) VALUES
(4, 27, 1, 102.00, 8, '2019-04-08 11:47:53'),
(5, 28, 2, 6.00, 8, '2019-04-08 12:51:30'),
(6, 33, 1, 198.00, 8, '2019-04-09 12:54:28'),
(7, 19, 1, 260.10, 8, '2019-04-15 13:24:49'),
(8, 40, 2, 9.00, 8, '2019-04-15 14:02:12'),
(9, 41, 1, 3.00, 8, '2019-04-15 14:04:18'),
(10, 42, 2, 313.00, 8, '2019-04-15 14:34:54');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_adisyon_urunleri`
--

CREATE TABLE `tbl_adisyon_urunleri` (
  `id` int(11) NOT NULL,
  `adisyon_urunleri_adisyon_idsi` int(11) NOT NULL,
  `adisyon_urunleri_urun_idsi` int(11) NOT NULL,
  `adisyon_urunleri_urun_tablo_adi` varchar(75) NOT NULL,
  `adisyon_urunleri_urun_adedi` int(11) NOT NULL,
  `adisyon_urunleri_urun_grami` float DEFAULT NULL,
  `adisyon_urunleri_urun_odenmis_urun_adedi` int(11) NOT NULL,
  `adisyon_urunleri_urun_birim_fiyati` float(10,2) NOT NULL,
  `adisyon_urunleri_urun_toplam_fiyati` float(10,2) NOT NULL,
  `adisyon_urunleri_urun_vergi_miktari` float(10,2) NOT NULL,
  `adisyon_urunleri_urun_teslim_durumu_idsi` int(11) DEFAULT NULL,
  `adisyon_urunleri_urun_ozel_durumu_idsi` int(11) DEFAULT NULL,
  `adisyon_urunleri_urun_notu` varchar(255) NOT NULL,
  `adisyon_urunleri_urun_calisan_idsi` int(11) NOT NULL,
  `adisyon_urunleri_urun_siparis_saati` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_adisyon_urunleri`
--

INSERT INTO `tbl_adisyon_urunleri` (`id`, `adisyon_urunleri_adisyon_idsi`, `adisyon_urunleri_urun_idsi`, `adisyon_urunleri_urun_tablo_adi`, `adisyon_urunleri_urun_adedi`, `adisyon_urunleri_urun_grami`, `adisyon_urunleri_urun_odenmis_urun_adedi`, `adisyon_urunleri_urun_birim_fiyati`, `adisyon_urunleri_urun_toplam_fiyati`, `adisyon_urunleri_urun_vergi_miktari`, `adisyon_urunleri_urun_teslim_durumu_idsi`, `adisyon_urunleri_urun_ozel_durumu_idsi`, `adisyon_urunleri_urun_notu`, `adisyon_urunleri_urun_calisan_idsi`, `adisyon_urunleri_urun_siparis_saati`) VALUES
(37, 15, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 1, 0, '', 0, '2019-04-01 14:18:27'),
(66, 19, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 2, 0, '', 11, '2019-04-03 14:13:18'),
(67, 15, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 2, 0, '', 10, '2019-04-03 14:23:49'),
(68, 15, 31, 'tbl_urunler', 3, NULL, 0, 3.00, 9.00, 1.62, NULL, 0, '', 0, '2019-04-03 14:24:38'),
(73, 19, 8, 'tbl_menuler', 1, NULL, 0, 300.00, 300.00, 58.86, 1, 0, 'deneme', 0, '2019-04-04 13:18:00'),
(74, 19, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 2, 0, '', 0, '2019-04-04 13:53:31'),
(76, 19, 8, 'tbl_menuler', 1, NULL, 0, 300.00, 300.00, 58.86, 1, 2, '', 0, '2019-04-04 15:38:27'),
(77, 19, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 4, 2, '', 0, '2019-04-05 13:55:55'),
(80, 15, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 4, 0, '', 0, '2019-04-08 10:57:25'),
(88, 27, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, NULL, 0, '', 0, '2019-04-08 11:47:03'),
(89, 27, 36, 'tbl_urunler', 1, NULL, 0, 99.00, 99.00, 17.82, NULL, 1, '', 10, '2019-04-08 11:47:48'),
(90, 28, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, NULL, 0, '', 0, '2019-04-08 12:51:08'),
(91, 28, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 2, 0, '', 11, '2019-04-08 12:51:13'),
(95, 31, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 2, 0, 'cahnge', 0, '2019-04-08 15:44:30'),
(96, 32, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 2, 0, 'bir', 0, '2019-04-08 15:46:00'),
(97, 32, 18, 'tbl_alt_urunler', 1, NULL, 0, 10.00, 10.00, 1.80, NULL, 0, '', 0, '2019-04-08 15:48:10'),
(98, 33, 36, 'tbl_urunler', 2, NULL, 0, 99.00, 198.00, 35.64, 1, 0, '', 0, '2019-04-08 15:52:30'),
(102, 37, 8, 'tbl_menuler', 1, NULL, 0, 300.00, 300.00, 58.86, NULL, 0, '', 12, '2019-04-08 16:15:53'),
(103, 39, 19, 'tbl_alt_urunler', 1, NULL, 0, 10.00, 10.00, 1.80, NULL, 0, '', 11, '2019-04-08 16:28:17'),
(114, 33, 36, 'tbl_urunler', 2, NULL, 0, 99.00, 198.00, 35.64, 2, 0, 'notlu pilav', 10, '2019-04-08 15:52:30'),
(115, 15, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 2, 0, 'gell', 0, '2019-04-11 14:06:05'),
(116, 40, 31, 'tbl_urunler', 2, NULL, 0, 3.00, 6.00, 1.08, 2, 0, '', 8, '2019-04-15 14:01:12'),
(117, 40, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 4, 0, '', 8, '2019-04-15 14:02:01'),
(118, 41, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 2, 0, '', 8, '2019-04-15 14:04:09'),
(119, 42, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 1, 0, '', 8, '2019-04-15 14:32:11'),
(120, 42, 22, 'tbl_alt_urunler', 1, NULL, 0, 10.00, 10.00, 1.80, 0, 0, '', 8, '2019-04-15 14:34:40'),
(121, 42, 8, 'tbl_menuler', 1, NULL, 0, 300.00, 300.00, 58.86, 0, 0, '', 8, '2019-04-15 14:34:43'),
(122, 43, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 4, 0, '', 8, '2019-04-15 14:41:24'),
(124, 43, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 1, 0, '', 8, '2019-04-15 15:39:03'),
(129, 43, 31, 'tbl_urunler', 1, NULL, 0, 3.00, 3.00, 0.54, 1, 0, '', 8, '2019-04-17 19:49:19');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_alacaklar`
--

CREATE TABLE `tbl_alacaklar` (
  `id` int(11) NOT NULL,
  `alacak_kodu` varchar(120) NOT NULL,
  `alacak_cari_idsi` int(11) NOT NULL,
  `alacak_tutari` float(10,2) NOT NULL,
  `alacak_kasa_idsi` int(11) NOT NULL,
  `alacak_aciklamasi` varchar(500) DEFAULT NULL,
  `alacak_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_alacaklar`
--

INSERT INTO `tbl_alacaklar` (`id`, `alacak_kodu`, `alacak_cari_idsi`, `alacak_tutari`, `alacak_kasa_idsi`, `alacak_aciklamasi`, `alacak_tarihi`) VALUES
(1, 'ALACAK-100', 10, 150.00, 1, 'DEneme\r\n', '2019-04-17 11:48:04');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_alis_faturalari`
--

CREATE TABLE `tbl_alis_faturalari` (
  `id` int(11) NOT NULL,
  `alis_faturasi_kodu` varchar(120) NOT NULL,
  `alis_faturasi_seri_numarasi` varchar(255) DEFAULT NULL,
  `alis_faturasi_vade_tarihi` varchar(255) NOT NULL,
  `alis_faturasi_cari_idsi` int(11) NOT NULL,
  `alis_faturasi_ara_toplami` float(10,2) NOT NULL,
  `alis_faturasi_iskonto` float(10,2) NOT NULL,
  `alis_faturasi_vergi_miktari` float(10,2) NOT NULL,
  `alis_faturasi_tutari` float(10,2) NOT NULL,
  `alis_faturasi_kasa_idsi` int(11) NOT NULL DEFAULT '0',
  `alis_faturasi_odenmis_miktar` float(10,2) NOT NULL,
  `alis_faturasi_aciklamasi` varchar(500) NOT NULL,
  `alis_faturasi_kesen_kullanici_idsi` int(11) NOT NULL,
  `alis_faturasi_kur_idsi` int(11) NOT NULL,
  `alis_faturasi_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_alis_faturalari`
--

INSERT INTO `tbl_alis_faturalari` (`id`, `alis_faturasi_kodu`, `alis_faturasi_seri_numarasi`, `alis_faturasi_vade_tarihi`, `alis_faturasi_cari_idsi`, `alis_faturasi_ara_toplami`, `alis_faturasi_iskonto`, `alis_faturasi_vergi_miktari`, `alis_faturasi_tutari`, `alis_faturasi_kasa_idsi`, `alis_faturasi_odenmis_miktar`, `alis_faturasi_aciklamasi`, `alis_faturasi_kesen_kullanici_idsi`, `alis_faturasi_kur_idsi`, `alis_faturasi_tarihi`) VALUES
(18, 'fat-002', '', '2019-03-20', 3, 90.00, 0.00, 10.20, 90.00, 0, 0.00, 'İlk Fatura', 8, 1, '2019-03-20 12:30:07'),
(19, 'fat-003', '', '2019-03-21', 2, 45.00, 0.00, 4.05, 45.00, 0, 0.00, 'Dolar bazlı', 8, 2, '2019-03-21 10:53:31'),
(20, 'Fat-004', '', '2019-04-19', 3, 80.00, 10.00, 6.40, 72.00, 0, 0.00, 'En güzeli', 8, 1, '2019-04-17 12:27:30'),
(21, 'fat-005', '', '2019-03-30', 3, 30.00, 10.00, 0.30, 27.00, 0, 0.00, '', 8, 2, '2019-04-19 14:22:51'),
(22, 'fat-005', '', '2019-03-30', 3, 30.00, 10.00, 5.40, 27.00, 0, 0.00, '', 8, 2, '2019-03-21 14:24:51'),
(23, 'fat-005', '', '2019-03-30', 3, 30.00, 10.00, 5.40, 27.00, 0, 0.00, '', 8, 2, '2019-03-21 14:26:32'),
(24, 'fat-006', '', '2019-03-21', 4, 30.00, 10.00, 5.40, 27.00, 0, 0.00, '', 8, 3, '2019-03-21 14:38:47'),
(25, 'fat-006', '', '2019-03-21', 4, 50.00, 10.00, 9.00, 45.00, 0, 0.00, '', 8, 3, '2019-03-21 14:40:24'),
(26, 'fat-007', '', '2019-03-19', 2, 50.00, 10.00, 7.00, 45.00, 0, 0.00, '2 vergi gruplu', 8, 1, '2019-03-21 14:41:50'),
(27, 'fat-008', 'XCVF84812741', '2019-03-21', 3, 25.00, 10.00, 3.50, 22.50, 3, 22.50, '', 8, 2, '2019-03-21 14:50:50'),
(29, 'fat-009', 'u192041897', '2019-03-22', 2, 20.00, 0.00, 3.60, 20.00, 1, 20.00, 'Deneme', 8, 1, '2019-03-22 10:33:59'),
(33, 'FAT-010', 'serii', '2019-03-25', 2, 12.00, 10.00, 1.96, 10.80, 1, 0.00, 'açıklama', 8, 1, '2019-03-25 15:20:09'),
(36, 'FAT-012', 'SERİİ', '2019-03-25', 2, 20.00, 10.00, 2.60, 18.00, 1, 17.00, 'asd', 8, 1, '2019-03-25 15:22:24'),
(37, 'fat-013', '', '2019-03-26', 3, 10.00, 0.00, 1.80, 10.00, 1, 10.00, '', 8, 1, '2019-03-26 10:12:18');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_alis_faturasi_urunleri`
--

CREATE TABLE `tbl_alis_faturasi_urunleri` (
  `id` int(11) NOT NULL,
  `alis_faturasi_idsi` int(11) NOT NULL,
  `alis_faturasi_urun_adi` varchar(255) NOT NULL,
  `alis_faturasi_urun_adedi` int(11) NOT NULL,
  `alis_faturasi_urun_birimi` varchar(120) NOT NULL,
  `alis_faturasi_urun_alis_fiyati` float(10,2) NOT NULL,
  `alis_faturasi_urun_vergi_idsi` int(11) NOT NULL,
  `alis_faturasi_urun_vergi_miktari` float(10,2) NOT NULL,
  `alis_faturasi_urun_tutari` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_alis_faturasi_urunleri`
--

INSERT INTO `tbl_alis_faturasi_urunleri` (`id`, `alis_faturasi_idsi`, `alis_faturasi_urun_adi`, `alis_faturasi_urun_adedi`, `alis_faturasi_urun_birimi`, `alis_faturasi_urun_alis_fiyati`, `alis_faturasi_urun_vergi_idsi`, `alis_faturasi_urun_vergi_miktari`, `alis_faturasi_urun_tutari`) VALUES
(9, 18, 'Brosoft Barista Pos', 12, 'Adet', 5.00, 8, 0.00, 0.00),
(10, 18, 'Latte', 10, 'Adet', 3.00, 18, 0.00, 0.00),
(11, 19, 'Brosoft Barista Pos', 15, 'Kg', 3.00, 9, 0.00, 0.00),
(12, 20, 'Latte', 20, 'Adet', 4.00, 8, 0.00, 80.00),
(13, 21, 'Brosoft Barista Pos', 10, 'Adet', 3.00, 1, 0.00, 30.00),
(14, 22, 'Brosoft Barista Pos', 10, 'Adet', 3.00, 1, 0.00, 30.00),
(15, 23, 'Brosoft Barista Pos', 10, 'Adet', 3.00, 18, 0.00, 30.00),
(16, 24, 'Brosoft Barista Pos', 10, 'Adet', 3.00, 1, 0.00, 30.00),
(17, 25, 'Brosoft Barista Pos', 10, 'Adet', 3.00, 1, 0.00, 30.00),
(18, 25, 'Latte', 10, 'Adet', 2.00, 1, 0.00, 20.00),
(19, 26, 'Latte', 10, 'Adet', 2.00, 2, 0.00, 20.00),
(20, 26, 'Brosoft Barista Pos', 10, 'Adet', 3.00, 1, 0.00, 30.00),
(21, 27, 'Brosoft Barista Pos', 5, 'Adet', 3.00, 1, 1.80, 15.00),
(22, 27, 'Latte', 5, 'Adet', 2.00, 2, 0.80, 10.00),
(25, 29, 'Brosoft Barista Pos', 10, 'Adet', 2.00, 1, 3.60, 20.00),
(26, 33, '1', 1, 'Adet', 10.00, 1, 1.80, 10.00),
(27, 33, '1', 1, 'Adet', 2.00, 2, 0.16, 2.00),
(42, 36, 'Brosoft Barista Pos', 1, 'Adet', 10.00, 1, 1.80, 10.00),
(43, 36, 'Latte', 5, 'Adet', 2.00, 2, 0.80, 10.00),
(44, 37, 'Brosoft Barista Pos', 1, 'Adet', 10.00, 1, 1.80, 10.00),
(45, 37, '', 1, 'Adet', 0.00, 1, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_alt_urunler`
--

CREATE TABLE `tbl_alt_urunler` (
  `id` int(11) NOT NULL,
  `ust_urun_id` int(11) NOT NULL,
  `alt_urun_kodu` varchar(255) DEFAULT NULL,
  `alt_urun_barkodu` varchar(255) DEFAULT NULL,
  `alt_urun_adi` varchar(255) NOT NULL,
  `alt_urun_birim_idsi` int(11) NOT NULL,
  `alt_urun_adedi` int(100) NOT NULL,
  `alt_urun_rengi` varchar(255) DEFAULT NULL,
  `alt_urun_kategori_idsi` int(11) NOT NULL,
  `alt_urun_gorseli` varchar(255) DEFAULT NULL,
  `alt_urun_alt_uyari_degeri` varchar(255) NOT NULL,
  `alt_urun_kur_idsi` int(11) NOT NULL,
  `alt_urun_kg_fiyati` float(10,2) NOT NULL,
  `alt_urun_alis_fiyati` float(10,2) NOT NULL,
  `alt_urun_satis_fiyati` float(10,2) NOT NULL,
  `alt_urun_alis_vergi_idsi` int(11) NOT NULL,
  `alt_urun_satis_vergi_idsi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_alt_urunler`
--

INSERT INTO `tbl_alt_urunler` (`id`, `ust_urun_id`, `alt_urun_kodu`, `alt_urun_barkodu`, `alt_urun_adi`, `alt_urun_birim_idsi`, `alt_urun_adedi`, `alt_urun_rengi`, `alt_urun_kategori_idsi`, `alt_urun_gorseli`, `alt_urun_alt_uyari_degeri`, `alt_urun_kur_idsi`, `alt_urun_kg_fiyati`, `alt_urun_alis_fiyati`, `alt_urun_satis_fiyati`, `alt_urun_alis_vergi_idsi`, `alt_urun_satis_vergi_idsi`) VALUES
(2, 27, 'urun-108-1', '41276417264871', 'Brosoft Cari - Premium', 1, 100000, '', 46, '[\"brosoftCari_faturaListesi.jpg\",\"brosoftCari_gelirAnalizleri.jpg\",\"brosoftCari_Giris.jpg\"]', '10', 0, 0.00, 0.00, 2500.00, 0, 18),
(12, 49, 'gd', '46363', 'döiziad', 1, 8, '8', 41, '[]', '8', 1, 8.00, 88.00, 8.00, 2, 2),
(15, 54, '', '', 'alttt', 1, 8, '8', 41, '[]', '8', 1, 8.00, 12.00, 19.00, 1, 1),
(21, 35, 'URUN-110-1', '53276578263', 'Pumpkin Spice Latte', 1, 100000, '', 52, '[\"latte.jpg\"]', '100', 1, 15.00, 2.00, 10.00, 1, 1),
(22, 35, 'URUN-110-1', '53276578263', 'Chocolate Latte', 1, 100000, '', 52, '[\"latte.jpg\"]', '100', 1, 15.00, 2.00, 10.00, 1, 1),
(23, 35, 'URUN-110-1', '53276578263', 'Vanilla Latte', 1, 100000, '', 52, '[\"latte.jpg\"]', '100', 1, 15.00, 2.00, 10.00, 1, 1),
(24, 57, 'URUN-112-1', '765756756', 'Özel Baklava', 2, 20, '', 47, '[\"baklava.jpg\"]', '5', 1, 80.00, 30.00, 80.00, 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_birimler`
--

CREATE TABLE `tbl_birimler` (
  `id` int(11) NOT NULL,
  `birim_adi` varchar(120) NOT NULL,
  `birim_kisaltmasi` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_birimler`
--

INSERT INTO `tbl_birimler` (`id`, `birim_adi`, `birim_kisaltmasi`) VALUES
(1, 'Adet', 'Adet'),
(2, 'Kilogram', 'Kg'),
(3, 'Gram', 'G'),
(4, 'Palet', 'Pl\r\n'),
(5, 'Torba', 'Trba');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_calisanlar`
--

CREATE TABLE `tbl_calisanlar` (
  `id` int(11) NOT NULL,
  `calisan_adi_soyadi` varchar(255) NOT NULL,
  `calisan_adresi` varchar(500) DEFAULT NULL,
  `calisan_dogum_tarihi` varchar(255) DEFAULT NULL,
  `calisan_telefon_numarasi` varchar(255) DEFAULT NULL,
  `calisan_eposta_adresi` varchar(255) DEFAULT NULL,
  `calisan_profil_fotosu` varchar(255) DEFAULT NULL,
  `calisan_statu_idsi` int(11) NOT NULL DEFAULT '0',
  `calisan_kullanici_adi` varchar(255) NOT NULL,
  `calisan_parolasi` varchar(255) NOT NULL,
  `calisan_pini` varchar(255) NOT NULL,
  `calisan_hizli_notlari` varchar(255) NOT NULL,
  `calisan_indirim_turu` tinyint(4) NOT NULL DEFAULT '0',
  `calisan_indirim_miktari` float(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_calisanlar`
--

INSERT INTO `tbl_calisanlar` (`id`, `calisan_adi_soyadi`, `calisan_adresi`, `calisan_dogum_tarihi`, `calisan_telefon_numarasi`, `calisan_eposta_adresi`, `calisan_profil_fotosu`, `calisan_statu_idsi`, `calisan_kullanici_adi`, `calisan_parolasi`, `calisan_pini`, `calisan_hizli_notlari`, `calisan_indirim_turu`, `calisan_indirim_miktari`) VALUES
(8, 'Burhan Özkan', 'Aydoğan Mah.', '2019-03-16', '+90 (532) 695-59-68', 'burhan.ozkan@live.com', 'profile.png', 5, 'broozkan__', '1c19469d688bac4a495f35dce03d3782', '1234', '[\"deneme\",\"bir\",\"Yeni eklendi\"]', 0, 10.00),
(10, 'Burak Özkan', 'Aydoğan', '2019-03-13', '+90 (532) 131-57-79', 'burakozkan58@gmail.com', 'profile.png', 3, 'arquitecto', 'broozkan58.', '1234', '[]', 0, 0.00),
(11, 'Hamdi Tanpınar', '', '2019-03-29', '', '', 'Array', 3, 'hamdi58', 'hamdi58', '1234', 'null', 0, 10.00),
(12, 'Alperen Gülsoy', 'Ankara', '2019-03-29', '+90 (534) 339-48-60', 'burhan.ozkan@live.com', 'profile.png', 2, 'alpgulsoy', 'adc85cebe039376235b99b84eda89866', '81dc9bdb52d04dc20036dbd8313ed055', '[]', 1, 20.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_depolar`
--

CREATE TABLE `tbl_depolar` (
  `id` int(11) NOT NULL,
  `depo_adi` varchar(255) NOT NULL,
  `depo_adresi` varchar(255) NOT NULL,
  `depo_telefon_numarasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_depolar`
--

INSERT INTO `tbl_depolar` (`id`, `depo_adi`, `depo_adresi`, `depo_telefon_numarasi`) VALUES
(1, 'Toptancılar Depo', 'Toptancılar Sit.', '+90 (346) 225-45-45'),
(2, 'Yerel Depo', 'Dükkan', ''),
(4, 'Deneme Depo', '', ''),
(5, 'Son Depo', '', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_kasalar`
--

CREATE TABLE `tbl_kasalar` (
  `id` int(11) NOT NULL,
  `kasa_adi` varchar(255) NOT NULL,
  `kasa_acilis_bakiyesi` float(10,2) NOT NULL,
  `kasa_birincil_kasa_mi` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_kasalar`
--

INSERT INTO `tbl_kasalar` (`id`, `kasa_adi`, `kasa_acilis_bakiyesi`, `kasa_birincil_kasa_mi`) VALUES
(1, 'Varsayılan Kasa', 0.00, 1),
(2, 'İkincil Kasa', 0.00, 0),
(3, 'Üçüncü Kasa', 0.00, 0),
(4, 'Dördüncü Kasa', 0.00, 0),
(5, 'Beşinci Kasa', 0.00, 0),
(6, 'Altıncı Kasa', 10.00, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_kategoriler`
--

CREATE TABLE `tbl_kategoriler` (
  `id` int(11) NOT NULL,
  `kategori_adi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_kategoriler`
--

INSERT INTO `tbl_kategoriler` (`id`, `kategori_adi`) VALUES
(41, 'Satış'),
(42, 'Yönetimsel'),
(43, 'Hukuk'),
(44, 'Üretim'),
(45, 'Boş'),
(46, 'Hammadde'),
(47, 'Tatlılar'),
(48, 'Yardımcı Materyal'),
(49, 'Kahveler'),
(50, 'Espresso Kahveler'),
(51, 'Soğuk İçecekler'),
(52, 'Sıcak İçecekler');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_kurlar`
--

CREATE TABLE `tbl_kurlar` (
  `id` int(11) NOT NULL,
  `kur_adi` varchar(255) NOT NULL,
  `kur_isareti` varchar(10) DEFAULT NULL,
  `kur_kisaltmasi` varchar(50) NOT NULL,
  `kur_aktif_mi` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_kurlar`
--

INSERT INTO `tbl_kurlar` (`id`, `kur_adi`, `kur_isareti`, `kur_kisaltmasi`, `kur_aktif_mi`) VALUES
(1, 'Türk Lirası', '₺', 'TRY', 1),
(3, 'Euro', '€', 'EURO', 0),
(4, 'Arap Riyali', 'R', 'RYL', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_lokasyonlar`
--

CREATE TABLE `tbl_lokasyonlar` (
  `id` int(11) NOT NULL,
  `lokasyon_adi` varchar(255) NOT NULL,
  `lokasyon_kati` int(11) NOT NULL,
  `lokasyon_krokisi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_lokasyonlar`
--

INSERT INTO `tbl_lokasyonlar` (`id`, `lokasyon_adi`, `lokasyon_kati`, `lokasyon_krokisi`) VALUES
(6, 'GİRİŞ', 1, 'img (1).png'),
(7, 'ALT KAT', -1, 'zemin.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_masalar`
--

CREATE TABLE `tbl_masalar` (
  `id` int(11) NOT NULL,
  `masa_adi` varchar(255) NOT NULL,
  `masa_durumu` tinyint(4) NOT NULL,
  `masa_lokasyon_idsi` int(11) NOT NULL,
  `masa_gorselleri` varchar(255) NOT NULL,
  `masa_rezerve_eden_kisi_idsi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_masalar`
--

INSERT INTO `tbl_masalar` (`id`, `masa_adi`, `masa_durumu`, `masa_lokasyon_idsi`, `masa_gorselleri`, `masa_rezerve_eden_kisi_idsi`) VALUES
(107, 'G01', 0, 6, '[]', 0),
(108, 'G02', 0, 6, '[]', 0),
(109, 'A01', 0, 7, '[]', 0),
(110, 'A02', 2, 7, '[]', 0),
(111, 'A03', 1, 7, '[]', 0),
(112, 'A04', 3, 7, '[]', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_menuler`
--

CREATE TABLE `tbl_menuler` (
  `id` int(11) NOT NULL,
  `menu_adi` varchar(255) NOT NULL,
  `menu_gorselleri` varchar(255) DEFAULT NULL,
  `menu_toplam_fiyati` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_menuler`
--

INSERT INTO `tbl_menuler` (`id`, `menu_adi`, `menu_gorselleri`, `menu_toplam_fiyati`) VALUES
(8, 'Ramazan Menüsü', '[\"3.jpg\"]', 300.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_menu_urunleri`
--

CREATE TABLE `tbl_menu_urunleri` (
  `id` int(11) NOT NULL,
  `menu_urunleri_menu_idsi` int(11) NOT NULL,
  `menu_urunleri_urun_idsi` int(11) NOT NULL,
  `menu_urunleri_urun_adedi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_menu_urunleri`
--

INSERT INTO `tbl_menu_urunleri` (`id`, `menu_urunleri_menu_idsi`, `menu_urunleri_urun_idsi`, `menu_urunleri_urun_adedi`) VALUES
(12, 8, 35, 3),
(13, 8, 36, 2),
(14, 8, 36, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_musteriler`
--

CREATE TABLE `tbl_musteriler` (
  `id` int(11) NOT NULL,
  `musteri_adi_soyadi` varchar(255) NOT NULL,
  `musteri_adresi` varchar(255) DEFAULT NULL,
  `musteri_telefon_numarasi` varchar(255) DEFAULT NULL,
  `musteri_eposta_adresi` varchar(255) DEFAULT NULL,
  `musteri_notlari` varchar(500) DEFAULT NULL,
  `musteri_indirim_turu` tinyint(4) NOT NULL,
  `musteri_indirim_miktari` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_musteriler`
--

INSERT INTO `tbl_musteriler` (`id`, `musteri_adi_soyadi`, `musteri_adresi`, `musteri_telefon_numarasi`, `musteri_eposta_adresi`, `musteri_notlari`, `musteri_indirim_turu`, `musteri_indirim_miktari`) VALUES
(2, 'Sedat Özkan', 'Sivas', '+90 (532) 695-59-68', 'burhan.ozkan@live.com', 'Çayı demli içer\nSinirlidir', 0, 0.00),
(3, 'Burhan Özkan', 'Aydoğan Mah. Şehit Metin Cad. ', '+90 (532) 695-59-68', 'burhan.ozkan@live.com', 'İyidir\n', 0, 0.00),
(4, 'Burak Özkan', '', '', '', '', 0, 0.00),
(5, 'Osmen', 'Mehmet Akif Ersoy Mah.', '+90 (554) 665 54 87', '', '', 0, 15.00),
(6, 'Batuhan Temel', 'Bursa', '+90 (532) 695-59-68', 'burhan.ozkan@live.com', '', 1, 20.00),
(7, 'Nursel Arısoy', 'Yenimahalle', '+90 (532) 695-59-68', '', '', 0, 0.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_mutfaklar`
--

CREATE TABLE `tbl_mutfaklar` (
  `id` int(11) NOT NULL,
  `mutfak_adi` varchar(255) NOT NULL,
  `mutfak_yazici_idsi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_mutfaklar`
--

INSERT INTO `tbl_mutfaklar` (`id`, `mutfak_adi`, `mutfak_yazici_idsi`) VALUES
(1, 'Yemek Mutfağı', 2),
(2, 'İçecek Mutfağı', 1),
(6, 'Tatlı Mutfağı', 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_odemeler`
--

CREATE TABLE `tbl_odemeler` (
  `id` int(11) NOT NULL,
  `odeme_kodu` varchar(120) NOT NULL,
  `odeme_cari_idsi` int(11) NOT NULL,
  `odeme_tutari` float(10,2) NOT NULL,
  `odeme_kasa_idsi` int(11) NOT NULL,
  `odeme_aciklamasi` varchar(500) DEFAULT NULL,
  `odeme_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_odemeler`
--

INSERT INTO `tbl_odemeler` (`id`, `odeme_kodu`, `odeme_cari_idsi`, `odeme_tutari`, `odeme_kasa_idsi`, `odeme_aciklamasi`, `odeme_tarihi`) VALUES
(1, 'ODEMe-100', 2, 36.00, 1, 'Ödeme Açıklaması', '2019-03-20 13:39:12'),
(2, 'odeme-101', 4, 50.00, 1, '', '2019-03-20 14:36:57'),
(3, 'ODEME-102', 3, 140.00, 1, 'Deneme', '2019-03-22 14:36:59'),
(4, 'ODEME-103', 4, 12.00, 1, '', '2019-04-17 14:54:10'),
(5, 'odeme-104', 2, 10.00, 1, '', '2019-03-22 14:54:46'),
(6, 'VERECEK-ODEME-105', 4, 75.00, 1, '', '2019-03-25 10:56:11'),
(7, 'VERECEK-ODEME-105-2', 4, 75.00, 1, '', '2019-03-25 10:56:35');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_odeme_metodlari`
--

CREATE TABLE `tbl_odeme_metodlari` (
  `id` int(11) NOT NULL,
  `odeme_metod_adi` varchar(255) NOT NULL,
  `odeme_metod_siralamasi` int(11) NOT NULL,
  `odeme_metod_aktif_mi` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_odeme_metodlari`
--

INSERT INTO `tbl_odeme_metodlari` (`id`, `odeme_metod_adi`, `odeme_metod_siralamasi`, `odeme_metod_aktif_mi`) VALUES
(1, 'Nakit', 0, 1),
(2, 'Kredi Kartı', 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_paket_siparisler`
--

CREATE TABLE `tbl_paket_siparisler` (
  `id` int(11) NOT NULL,
  `paket_siparis_acilis_saati` time NOT NULL,
  `paket_siparis_notu` varchar(500) NOT NULL,
  `paket_siparis_tutari` float(10,2) NOT NULL,
  `paket_siparis_musteri_idsi` int(11) DEFAULT NULL,
  `paket_siparis_indirim_turu` tinyint(4) NOT NULL,
  `paket_siparis_indirim_miktari` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_paket_siparisler`
--

INSERT INTO `tbl_paket_siparisler` (`id`, `paket_siparis_acilis_saati`, `paket_siparis_notu`, `paket_siparis_tutari`, `paket_siparis_musteri_idsi`, `paket_siparis_indirim_turu`, `paket_siparis_indirim_miktari`) VALUES
(15, '09:32:00', '', 18.00, NULL, 0, 0),
(19, '09:13:18', '', 609.00, 5, 0, 15),
(27, '14:47:03', '', 102.00, NULL, 0, 0),
(28, '15:51:08', '', 6.00, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_paket_siparis_urunleri`
--

CREATE TABLE `tbl_paket_siparis_urunleri` (
  `id` int(11) NOT NULL,
  `paket_siparis_urunleri_paket_siparis_idsi` int(11) NOT NULL,
  `paket_siparis_urunleri_urun_idsi` int(11) NOT NULL,
  `paket_siparis_urunleri_urun_tablo_adi` varchar(75) NOT NULL,
  `paket_siparis_urunleri_urun_adedi` int(11) NOT NULL,
  `paket_siparis_urunleri_urun_birim_fiyati` float(10,2) NOT NULL,
  `paket_siparis_urunleri_urun_toplam_fiyati` float(10,2) NOT NULL,
  `paket_siparis_urunleri_urun_vergi_miktari` float(10,2) NOT NULL,
  `paket_siparis_urunleri_urun_ozel_durumu_idsi` int(11) DEFAULT NULL,
  `paket_siparis_urunleri_urun_notu` varchar(255) NOT NULL,
  `paket_siparis_urunleri_urun_siparis_saati` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_paket_siparis_urunleri`
--

INSERT INTO `tbl_paket_siparis_urunleri` (`id`, `paket_siparis_urunleri_paket_siparis_idsi`, `paket_siparis_urunleri_urun_idsi`, `paket_siparis_urunleri_urun_tablo_adi`, `paket_siparis_urunleri_urun_adedi`, `paket_siparis_urunleri_urun_birim_fiyati`, `paket_siparis_urunleri_urun_toplam_fiyati`, `paket_siparis_urunleri_urun_vergi_miktari`, `paket_siparis_urunleri_urun_ozel_durumu_idsi`, `paket_siparis_urunleri_urun_notu`, `paket_siparis_urunleri_urun_siparis_saati`) VALUES
(37, 15, 31, 'tbl_urunler', 1, 3.00, 3.00, 0.54, 0, '', '2019-04-01 14:18:27'),
(66, 19, 31, 'tbl_urunler', 1, 3.00, 3.00, 0.54, 0, '', '2019-04-03 14:13:18'),
(67, 15, 31, 'tbl_urunler', 1, 3.00, 3.00, 0.54, 0, '', '2019-04-03 14:23:49'),
(68, 15, 31, 'tbl_urunler', 3, 3.00, 9.00, 1.62, 0, '', '2019-04-03 14:24:38'),
(73, 19, 8, 'tbl_menuler', 1, 300.00, 300.00, 58.86, 0, 'deneme', '2019-04-04 13:18:00'),
(74, 19, 31, 'tbl_urunler', 1, 3.00, 3.00, 0.54, 0, '', '2019-04-04 13:53:31'),
(76, 19, 8, 'tbl_menuler', 1, 300.00, 300.00, 58.86, 0, '', '2019-04-04 15:38:27'),
(77, 19, 31, 'tbl_urunler', 1, 3.00, 3.00, 0.54, 0, '', '2019-04-05 13:55:55'),
(80, 15, 31, 'tbl_urunler', 1, 3.00, 3.00, 0.54, 0, '', '2019-04-08 10:57:25'),
(88, 27, 31, 'tbl_urunler', 1, 3.00, 3.00, 0.54, 0, '', '2019-04-08 11:47:03'),
(89, 27, 36, 'tbl_urunler', 1, 99.00, 99.00, 17.82, 0, '', '2019-04-08 11:47:48'),
(90, 28, 31, 'tbl_urunler', 1, 3.00, 3.00, 0.54, 0, '', '2019-04-08 12:51:08'),
(91, 28, 31, 'tbl_urunler', 1, 3.00, 3.00, 0.54, 0, '', '2019-04-08 12:51:13');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_satis_faturalari`
--

CREATE TABLE `tbl_satis_faturalari` (
  `id` int(11) NOT NULL,
  `satis_faturasi_kodu` varchar(120) NOT NULL,
  `satis_faturasi_seri_numarasi` varchar(255) DEFAULT NULL,
  `satis_faturasi_vade_tarihi` varchar(255) NOT NULL,
  `satis_faturasi_cari_idsi` int(11) NOT NULL,
  `satis_faturasi_ara_toplami` float(10,2) NOT NULL,
  `satis_faturasi_iskonto` float(10,2) NOT NULL,
  `satis_faturasi_vergi_miktari` float(10,2) NOT NULL,
  `satis_faturasi_tutari` float(10,2) NOT NULL,
  `satis_faturasi_kasa_idsi` int(11) NOT NULL DEFAULT '0',
  `satis_faturasi_odenmis_miktar` float(10,2) NOT NULL,
  `satis_faturasi_aciklamasi` varchar(500) NOT NULL,
  `satis_faturasi_kesen_kullanici_idsi` int(11) NOT NULL,
  `satis_faturasi_kur_idsi` int(11) NOT NULL,
  `satis_faturasi_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_satis_faturalari`
--

INSERT INTO `tbl_satis_faturalari` (`id`, `satis_faturasi_kodu`, `satis_faturasi_seri_numarasi`, `satis_faturasi_vade_tarihi`, `satis_faturasi_cari_idsi`, `satis_faturasi_ara_toplami`, `satis_faturasi_iskonto`, `satis_faturasi_vergi_miktari`, `satis_faturasi_tutari`, `satis_faturasi_kasa_idsi`, `satis_faturasi_odenmis_miktar`, `satis_faturasi_aciklamasi`, `satis_faturasi_kesen_kullanici_idsi`, `satis_faturasi_kur_idsi`, `satis_faturasi_tarihi`) VALUES
(42, 'FAT-100', '', '2019-04-19', 3, 2500.00, 0.00, 450.80, 2510.00, 1, 0.00, 'Satış faturası', 8, 2, '2019-04-17 10:39:55');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_satis_faturasi_urunleri`
--

CREATE TABLE `tbl_satis_faturasi_urunleri` (
  `id` int(11) NOT NULL,
  `satis_faturasi_idsi` int(11) NOT NULL,
  `satis_faturasi_urun_adi` varchar(255) NOT NULL,
  `satis_faturasi_urun_adedi` int(11) NOT NULL,
  `satis_faturasi_urun_birimi` varchar(120) NOT NULL,
  `satis_faturasi_urun_satis_fiyati` float(10,2) NOT NULL,
  `satis_faturasi_urun_vergi_idsi` int(11) NOT NULL,
  `satis_faturasi_urun_vergi_miktari` float(10,2) NOT NULL,
  `satis_faturasi_urun_tutari` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_satis_faturasi_urunleri`
--

INSERT INTO `tbl_satis_faturasi_urunleri` (`id`, `satis_faturasi_idsi`, `satis_faturasi_urun_adi`, `satis_faturasi_urun_adedi`, `satis_faturasi_urun_birimi`, `satis_faturasi_urun_satis_fiyati`, `satis_faturasi_urun_vergi_idsi`, `satis_faturasi_urun_vergi_miktari`, `satis_faturasi_urun_tutari`) VALUES
(54, 42, 'Brosoft Barista Pos', 1, 'Adet', 2500.00, 1, 450.00, 2500.00),
(55, 42, 'Latte', 1, 'Adet', 10.00, 2, 0.00, 10.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_sirket`
--

CREATE TABLE `tbl_sirket` (
  `id` int(11) NOT NULL,
  `sirket_adi` varchar(255) NOT NULL,
  `sirket_adresi` varchar(255) NOT NULL,
  `sirket_eposta_adresi` varchar(255) NOT NULL,
  `sirket_telefonu` varchar(255) NOT NULL,
  `sirket_vergi_numarasi` varchar(255) NOT NULL,
  `sirket_logosu` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_sirket`
--

INSERT INTO `tbl_sirket` (`id`, `sirket_adi`, `sirket_adresi`, `sirket_eposta_adresi`, `sirket_telefonu`, `sirket_vergi_numarasi`, `sirket_logosu`) VALUES
(1, 'Brosoft Yazılım', 'Yenişehir Mah. Kardeşler Cad. No:5 Cumhuriyet Teknokent', 'iletisim@brosoft.com.tr', '+90 (532) 695-59-68', '28381849766', 'img.png');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_sirket_carileri`
--

CREATE TABLE `tbl_sirket_carileri` (
  `id` int(11) NOT NULL,
  `cari_adi` varchar(255) NOT NULL,
  `cari_eposta_adresi` varchar(255) NOT NULL,
  `cari_telefon_numarasi` varchar(255) NOT NULL,
  `cari_adresi` varchar(255) NOT NULL,
  `cari_kategorisi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_sirket_carileri`
--

INSERT INTO `tbl_sirket_carileri` (`id`, `cari_adi`, `cari_eposta_adresi`, `cari_telefon_numarasi`, `cari_adresi`, `cari_kategorisi`) VALUES
(1, 'Semtes Isı ve Mekanik Tesisat', 'burhan.ozkan@live.com', '05326955968', 'Ankara', 'Dış Ticaret'),
(3, 'Köşe Grup', 'iletisim@brosof.tcom', '+56 (116) 516-51-16', 'Sivas', 'Kategori'),
(4, 'Brosoft Yazılım', 'iletisim@brosoft.com.tr', '', '', 'Kategori'),
(5, 'Burhan Özkan', '', '', '', 'Kategori'),
(6, 'Sedat Özkan', '', '', '', 'Kategori'),
(7, 'Hamiyet Özkan', '', '', '', 'Kategori'),
(8, 'Doğan Birlik Perde', '', '', 'Bankalar Caddesi', 'Kategori'),
(9, 'Bakalım olacak mı', 'rnetk@saf.cpm', '+16 (515) 165-16-51', '', 'Kategori'),
(10, 'Bu son', 'burhan.ozkan@live.com', '+51 (616) 216-21-51', 'Sivas', 'Kategori'),
(11, 'hadi inş', '', '', '', '28'),
(12, 'Burak Özkan', 'burakozkan58@gmail.com', '+90 (532) 695-59-68', 'Sivas', '31'),
(13, 'Osman Arslan', 'burhan.ozkan@live.com', '+90 (532) 695-59-68', 'Sivas', '33'),
(14, 'Zekiye Hasbek', 'burhan.ozkan@live.com', '+90 (532) 695-59-68', 'Sivas', '34'),
(15, 'broozkan', 'burhan.ozkan@live.com', '+12 (412) 891-75-19', '', '38'),
(16, 'Kürşat Ünal', 'burhan.ozkan@live.com', '+90 (532) 695-59-68', '', '45');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_statuler`
--

CREATE TABLE `tbl_statuler` (
  `id` int(11) NOT NULL,
  `statu_adi` varchar(255) NOT NULL,
  `statu_yetkileri` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_statuler`
--

INSERT INTO `tbl_statuler` (`id`, `statu_adi`, `statu_yetkileri`) VALUES
(1, 'Barista', '[{\"cboxTumYetkiler\":false},{\"txtSiparisAlabilir\":true},{\"txtOdemeAlabilir\":true},{\"txtUrunEkleyebilir\":true},{\"txtCalisanEkleyebilir\":false},{\"txtYaziciEkleyebilir\":true},{\"txtMutfakEkleyebilir\":true},{\"txtMasaEkleyebilir\":true},{\"txtKategoriEkleyebilir\":true},{\"txtLokasyonEkleyebilir\":true},{\"txtAyarlaraGirebilir\":false},{\"txtMutfakGoruntuleyebilir\":true},{\"txtRaporGoruntuleyebilir\":false},{\"txtStokDuzenleyebilir\":true},{\"txtMuhasebeKullanabilir\":false},{\"txtPaketServisKullanabilir\":false}]'),
(2, 'Yönetici', '[{\"cboxTumYetkiler\":true},{\"txtSiparisAlabilir\":true},{\"txtOdemeAlabilir\":true},{\"txtUrunEkleyebilir\":true},{\"txtCalisanEkleyebilir\":true},{\"txtYaziciEkleyebilir\":true},{\"txtMutfakEkleyebilir\":true},{\"txtMasaEkleyebilir\":true},{\"txtKategoriEkleyebilir\":true},{\"txtLokasyonEkleyebilir\":true},{\"txtAyarlaraGirebilir\":true},{\"txtMutfakGoruntuleyebilir\":true},{\"txtRaporGoruntuleyebilir\":true},{\"txtStokDuzenleyebilir\":true},{\"txtMuhasebeKullanabilir\":true},{\"txtPaketServisKullanabilir\":true}]'),
(3, 'Garson', '[{\"cboxTumYetkiler\":false},{\"txtSiparisAlabilir\":true},{\"txtOdemeAlabilir\":true},{\"txtUrunEkleyebilir\":true},{\"txtCalisanEkleyebilir\":false},{\"txtYaziciEkleyebilir\":true},{\"txtMutfakEkleyebilir\":true},{\"txtMasaEkleyebilir\":true},{\"txtKategoriEkleyebilir\":true},{\"txtLokasyonEkleyebilir\":true},{\"txtAyarlaraGirebilir\":false},{\"txtMutfakGoruntuleyebilir\":true},{\"txtRaporGoruntuleyebilir\":false},{\"txtStokDuzenleyebilir\":true},{\"txtMuhasebeKullanabilir\":false},{\"txtPaketServisKullanabilir\":false}]'),
(4, 'Aşçı', '[{\"cboxTumYetkiler\":false},{\"txtSiparisAlabilir\":false},{\"txtOdemeAlabilir\":false},{\"txtUrunEkleyebilir\":true},{\"txtCalisanEkleyebilir\":false},{\"txtYaziciEkleyebilir\":true},{\"txtMutfakEkleyebilir\":true},{\"txtMasaEkleyebilir\":true},{\"txtKategoriEkleyebilir\":true},{\"txtLokasyonEkleyebilir\":true},{\"txtAyarlaraGirebilir\":false},{\"txtMutfakGoruntuleyebilir\":true},{\"txtRaporGoruntuleyebilir\":false},{\"txtStokDuzenleyebilir\":true},{\"txtMuhasebeKullanabilir\":false},{\"txtPaketServisKullanabilir\":true}]'),
(5, 'Müdür', '[{\"cboxTumYetkiler\":true},{\"cboxYonetimTumYetkiler\":true},{\"txtSiparisAlabilir\":true},{\"txtOdemeAlabilir\":true},{\"txtHizliSatisYapabilir\":true},{\"txtPaketServisYonetebilir\":true},{\"txtMutfakEkranlarinaGirebilir\":true},{\"cboxMerkezTumYetkiler\":false},{\"txtStokMerkezineGirebilir\":false},{\"txtMuhasebeMerkezineGirebilir\":false},{\"txtRaporMerkezineGirebilir\":false},{\"cboxBirimTumYetkiler\":true},{\"txtKasaEkleyebilir\":true},{\"txtYaziciEkleyebilir\":true},{\"txtMutfakEkleyebilir\":true},{\"txtLokasyonEkleyebilir\":true},{\"txtMasaEkleyebilir\":true},{\"txtTeslimDurumuEkleyebilir\":true},{\"txtStatuEkleyebilir\":false},{\"txtCalisanEkleyebilir\":true},{\"txtDepoEkleyebilir\":true},{\"txtVergiEkleyebilir\":true},{\"txtKategoriEkleyebilir\":true},{\"txtBirimEkleyebilir\":true},{\"txtUrunEkleyebilir\":true},{\"txtMenuEkleyebilir\":true},{\"txtMusteriEkleyebilir\":true},{\"txtKurEkleyebilir\":true},{\"txtOdemeMetoduEkleyebilir\":true}]');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_stok_dusme_bilgileri`
--

CREATE TABLE `tbl_stok_dusme_bilgileri` (
  `id` int(11) NOT NULL,
  `ait_urun_idsi` int(11) NOT NULL,
  `stoktan_dusulecek_urun_idsi` int(11) NOT NULL,
  `stoktan_dusum_miktari` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_stok_dusme_bilgileri`
--

INSERT INTO `tbl_stok_dusme_bilgileri` (`id`, `ait_urun_idsi`, `stoktan_dusulecek_urun_idsi`, `stoktan_dusum_miktari`) VALUES
(1, 36, 39, '0.100'),
(2, 36, 37, '0.50'),
(3, 31, 38, '10');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_tahsilatlar`
--

CREATE TABLE `tbl_tahsilatlar` (
  `id` int(11) NOT NULL,
  `tahsilat_kodu` varchar(120) NOT NULL,
  `tahsilat_cari_idsi` int(11) NOT NULL,
  `tahsilat_tutari` float(10,2) NOT NULL,
  `tahsilat_kasa_idsi` int(11) NOT NULL,
  `tahsilat_aciklamasi` varchar(500) DEFAULT NULL,
  `tahsilat_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_tahsilatlar`
--

INSERT INTO `tbl_tahsilatlar` (`id`, `tahsilat_kodu`, `tahsilat_cari_idsi`, `tahsilat_tutari`, `tahsilat_kasa_idsi`, `tahsilat_aciklamasi`, `tahsilat_tarihi`) VALUES
(8, 'ALACAK-TAHSİLAT-100', 3, 25.00, 2, 'Yarısını alabildik', '2019-03-25 10:22:08'),
(9, 'ALACAK-TAHSİLAT-100-2', 3, 25.00, 2, 'Borç kalmadı', '2019-04-17 10:26:20'),
(13, 'ALACAK-TAHSİLAT-101', 3, 150.00, 1, '', '2019-03-25 10:40:43');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_teslim_durumlari`
--

CREATE TABLE `tbl_teslim_durumlari` (
  `id` int(11) NOT NULL,
  `teslim_durumu_adi` varchar(255) NOT NULL,
  `teslim_durumu_rengi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_teslim_durumlari`
--

INSERT INTO `tbl_teslim_durumlari` (`id`, `teslim_durumu_adi`, `teslim_durumu_rengi`) VALUES
(1, 'Hazırlanıyor', '#ffff00'),
(2, 'Hazır', '#00ff00'),
(4, 'Teslim Edildi', '#408080');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_urunler`
--

CREATE TABLE `tbl_urunler` (
  `id` int(11) NOT NULL,
  `urun_kodu` varchar(255) DEFAULT NULL,
  `urun_barkodu` varchar(255) DEFAULT NULL,
  `urun_adi` varchar(255) NOT NULL,
  `urun_birim_idsi` int(11) NOT NULL,
  `urun_adedi` float(10,2) NOT NULL,
  `urun_rengi` varchar(255) DEFAULT NULL,
  `urun_kategori_idsi` int(11) NOT NULL,
  `urun_mutfak_idleri` varchar(255) NOT NULL,
  `urun_gorseli` varchar(255) DEFAULT NULL,
  `urun_alt_uyari_degeri` varchar(255) NOT NULL,
  `urun_kur_idsi` int(11) NOT NULL,
  `urun_kg_fiyati` float(10,2) NOT NULL,
  `urun_alis_fiyati` float(10,2) NOT NULL,
  `urun_satis_fiyati` float(10,2) NOT NULL,
  `urun_alis_vergi_idsi` int(11) NOT NULL,
  `urun_satis_vergi_idsi` int(11) NOT NULL,
  `urun_stok_urunu_mu` tinyint(4) NOT NULL DEFAULT '0',
  `urun_depo_idsi` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_urunler`
--

INSERT INTO `tbl_urunler` (`id`, `urun_kodu`, `urun_barkodu`, `urun_adi`, `urun_birim_idsi`, `urun_adedi`, `urun_rengi`, `urun_kategori_idsi`, `urun_mutfak_idleri`, `urun_gorseli`, `urun_alt_uyari_degeri`, `urun_kur_idsi`, `urun_kg_fiyati`, `urun_alis_fiyati`, `urun_satis_fiyati`, `urun_alis_vergi_idsi`, `urun_satis_vergi_idsi`, `urun_stok_urunu_mu`, `urun_depo_idsi`) VALUES
(12, 'URUN-106', '123456789', 'Brosoft Barista Pos', 1, 739.00, '', 46, '0', '[\"brosoftCari_ayarlar.jpg\",\"brosoftCari_faturaGoruntule.jpg\"]', '1', 0, 0.00, 10.00, 2500.00, 1, 18, 0, 0),
(15, 'URUN-107', '1489172498172', 'Brosoft Smart Process', 1, 1000000.00, '', 46, '0', '[\"brosoftCari_alacakVerecek.jpg\",\"brosoftCari_faturaListesi.jpg\"]', '10', 0, 0.00, 20.00, 20000.00, 0, 18, 0, 0),
(27, 'URUN-108', '1422141', 'Brosoft Cari', 1, 100000.00, '', 46, '0', '[\"brosoftCari_faturaListesi.jpg\",\"brosoftCari_gelirAnalizleri.jpg\",\"brosoftCari_Giris.jpg\"]', '10', 0, 0.00, 30.00, 1500.00, 0, 1, 0, 0),
(31, 'urun-109', '381765', 'Çay', 1, 1000000.00, '', 52, '[\"1\",\"2\"]', '[\"cay.jpg\"]', '9', 1, 0.00, 0.00, 3.00, 1, 1, 0, 0),
(32, '', '', 'safasf', 1, 9.00, '9', 41, '[\"1\",\"2\",\"6\"]', '[]', '9', 0, 0.00, 9.00, 9.00, 9, 9, 0, 0),
(35, 'urun-110', '8325982', 'Latte', 1, 100090.00, '', 52, '[\"2\"]', '[\"latte.jpg\"]', '100', 1, 10.00, 2.00, 10.00, 1, 1, 0, 0),
(36, 'urun-111', '', 'Ankara Döneri', 1, 9999.00, '', 41, '[\"1\"]', '[]', '9', 1, 9.00, 9.00, 99.00, 1, 1, 0, 0),
(37, 'STOK-100', '0000000000000', 'Tereyağ', 2, 350.00, '', 46, '[]', '[]', '10', 0, 0.00, 25.00, 0.00, 2, 0, 1, 5),
(38, 'STOK-101', '', 'Toz Çay', 1, 12670.00, '9', 41, '[]', '[]', '9', 0, 0.00, 9.00, 0.00, 9, 0, 1, 1),
(39, 'STOK-102', '', 'Kırmızı Et', 2, 200.00, '', 46, '[]', '[]', '10', 1, 0.00, 10.00, 0.00, 1, 0, 1, 1),
(41, 'denem', '898', 'burhan', 5, 7.00, '7', 41, '[]', '[]', '7', 0, 0.00, 7.00, 0.00, 7, 0, 1, 1),
(49, 'döviz', '', 'dövizliiiii', 1, 9.00, '9', 41, '[\"6\"]', '[]', '3', 3, 5.00, 6.00, 0.00, 8, 9, 0, 0),
(52, '', '', 'asdsadasd', 1, 7.00, '7', 41, '[\"2\"]', '[]', '7', 1, 7.00, 7.00, 7.00, 1, 1, 0, 0),
(53, '', '', 'asdsadasd', 1, 7.00, '7', 41, '[\"2\"]', '[]', '7', 1, 7.00, 7.00, 7.00, 1, 1, 0, 0),
(54, '', '', 'asdsadasd', 1, 7.00, '7', 41, '[\"2\"]', '[]', '7', 1, 7.00, 7.00, 7.00, 1, 1, 0, 0),
(55, '', '', 'kurlu', 1, 8.00, '', 41, '[]', '[]', '29', 1, 0.00, 42.00, 0.00, 1, 0, 1, 1),
(57, 'URUN-112', '352875982359823', 'Baklava', 2, 20.00, '', 47, '[\"6\"]', '[\"baklava.jpg\"]', '5', 1, 60.00, 20.00, 60.00, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_verecekler`
--

CREATE TABLE `tbl_verecekler` (
  `id` int(11) NOT NULL,
  `verecek_kodu` varchar(120) NOT NULL,
  `verecek_cari_idsi` int(11) NOT NULL,
  `verecek_tutari` float(10,2) NOT NULL,
  `verecek_kasa_idsi` int(11) NOT NULL,
  `verecek_aciklamasi` varchar(500) DEFAULT NULL,
  `verecek_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_verecekler`
--

INSERT INTO `tbl_verecekler` (`id`, `verecek_kodu`, `verecek_cari_idsi`, `verecek_tutari`, `verecek_kasa_idsi`, `verecek_aciklamasi`, `verecek_tarihi`) VALUES
(1, 'VERECEK-100', 10, 100.00, 1, 'DEAs', '2019-04-17 11:48:23');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_vergiler`
--

CREATE TABLE `tbl_vergiler` (
  `id` int(11) NOT NULL,
  `vergi_adi` varchar(255) NOT NULL,
  `vergi_yuzdesi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_vergiler`
--

INSERT INTO `tbl_vergiler` (`id`, `vergi_adi`, `vergi_yuzdesi`) VALUES
(1, 'KDV18', 18),
(2, 'KDV8', 8),
(3, 'KDV15', 15);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tbl_yazicilar`
--

CREATE TABLE `tbl_yazicilar` (
  `id` int(11) NOT NULL,
  `yazici_adi` varchar(255) NOT NULL,
  `yazici_ip_adresi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tbl_yazicilar`
--

INSERT INTO `tbl_yazicilar` (`id`, `yazici_adi`, `yazici_ip_adresi`) VALUES
(1, 'denemeYazicisi', '192.168.1.20\r\n'),
(2, 'İçecek Yazıcısı', '192.168.1.21'),
(3, 'Adisyon Yazıcısı', '192.168.1.22'),
(4, 'a4Yazicisi', '192.168.1.45');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `tbl_adisyonlar`
--
ALTER TABLE `tbl_adisyonlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_adisyon_odemeleri`
--
ALTER TABLE `tbl_adisyon_odemeleri`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_adisyon_urunleri`
--
ALTER TABLE `tbl_adisyon_urunleri`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_alacaklar`
--
ALTER TABLE `tbl_alacaklar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_alis_faturalari`
--
ALTER TABLE `tbl_alis_faturalari`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_alis_faturasi_urunleri`
--
ALTER TABLE `tbl_alis_faturasi_urunleri`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_alt_urunler`
--
ALTER TABLE `tbl_alt_urunler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_birimler`
--
ALTER TABLE `tbl_birimler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_calisanlar`
--
ALTER TABLE `tbl_calisanlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_depolar`
--
ALTER TABLE `tbl_depolar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_kasalar`
--
ALTER TABLE `tbl_kasalar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_kategoriler`
--
ALTER TABLE `tbl_kategoriler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_kurlar`
--
ALTER TABLE `tbl_kurlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_lokasyonlar`
--
ALTER TABLE `tbl_lokasyonlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_masalar`
--
ALTER TABLE `tbl_masalar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_menuler`
--
ALTER TABLE `tbl_menuler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_menu_urunleri`
--
ALTER TABLE `tbl_menu_urunleri`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_musteriler`
--
ALTER TABLE `tbl_musteriler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_mutfaklar`
--
ALTER TABLE `tbl_mutfaklar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_odemeler`
--
ALTER TABLE `tbl_odemeler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_odeme_metodlari`
--
ALTER TABLE `tbl_odeme_metodlari`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_paket_siparisler`
--
ALTER TABLE `tbl_paket_siparisler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_paket_siparis_urunleri`
--
ALTER TABLE `tbl_paket_siparis_urunleri`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_satis_faturalari`
--
ALTER TABLE `tbl_satis_faturalari`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_satis_faturasi_urunleri`
--
ALTER TABLE `tbl_satis_faturasi_urunleri`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_sirket`
--
ALTER TABLE `tbl_sirket`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_sirket_carileri`
--
ALTER TABLE `tbl_sirket_carileri`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_statuler`
--
ALTER TABLE `tbl_statuler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_stok_dusme_bilgileri`
--
ALTER TABLE `tbl_stok_dusme_bilgileri`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_tahsilatlar`
--
ALTER TABLE `tbl_tahsilatlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_teslim_durumlari`
--
ALTER TABLE `tbl_teslim_durumlari`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_urunler`
--
ALTER TABLE `tbl_urunler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_verecekler`
--
ALTER TABLE `tbl_verecekler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_vergiler`
--
ALTER TABLE `tbl_vergiler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tbl_yazicilar`
--
ALTER TABLE `tbl_yazicilar`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `tbl_adisyonlar`
--
ALTER TABLE `tbl_adisyonlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_adisyon_odemeleri`
--
ALTER TABLE `tbl_adisyon_odemeleri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_adisyon_urunleri`
--
ALTER TABLE `tbl_adisyon_urunleri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_alacaklar`
--
ALTER TABLE `tbl_alacaklar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_alis_faturalari`
--
ALTER TABLE `tbl_alis_faturalari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_alis_faturasi_urunleri`
--
ALTER TABLE `tbl_alis_faturasi_urunleri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_alt_urunler`
--
ALTER TABLE `tbl_alt_urunler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_birimler`
--
ALTER TABLE `tbl_birimler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_calisanlar`
--
ALTER TABLE `tbl_calisanlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_depolar`
--
ALTER TABLE `tbl_depolar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_kasalar`
--
ALTER TABLE `tbl_kasalar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_kategoriler`
--
ALTER TABLE `tbl_kategoriler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_kurlar`
--
ALTER TABLE `tbl_kurlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_lokasyonlar`
--
ALTER TABLE `tbl_lokasyonlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_masalar`
--
ALTER TABLE `tbl_masalar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_menuler`
--
ALTER TABLE `tbl_menuler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_menu_urunleri`
--
ALTER TABLE `tbl_menu_urunleri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_musteriler`
--
ALTER TABLE `tbl_musteriler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_mutfaklar`
--
ALTER TABLE `tbl_mutfaklar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_odemeler`
--
ALTER TABLE `tbl_odemeler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_odeme_metodlari`
--
ALTER TABLE `tbl_odeme_metodlari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_paket_siparisler`
--
ALTER TABLE `tbl_paket_siparisler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_paket_siparis_urunleri`
--
ALTER TABLE `tbl_paket_siparis_urunleri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_satis_faturalari`
--
ALTER TABLE `tbl_satis_faturalari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_satis_faturasi_urunleri`
--
ALTER TABLE `tbl_satis_faturasi_urunleri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_sirket`
--
ALTER TABLE `tbl_sirket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_sirket_carileri`
--
ALTER TABLE `tbl_sirket_carileri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_statuler`
--
ALTER TABLE `tbl_statuler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_stok_dusme_bilgileri`
--
ALTER TABLE `tbl_stok_dusme_bilgileri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_tahsilatlar`
--
ALTER TABLE `tbl_tahsilatlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_teslim_durumlari`
--
ALTER TABLE `tbl_teslim_durumlari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_urunler`
--
ALTER TABLE `tbl_urunler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_verecekler`
--
ALTER TABLE `tbl_verecekler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_vergiler`
--
ALTER TABLE `tbl_vergiler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Tablo için AUTO_INCREMENT değeri `tbl_yazicilar`
--
ALTER TABLE `tbl_yazicilar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
