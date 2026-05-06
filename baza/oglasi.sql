-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Gostitelj: localhost
-- Čas nastanka: 06. maj 2026 ob 12.22
-- Različica strežnika: 5.6.20-log
-- Različica PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Zbirka podatkov: `oglasi`
--

-- --------------------------------------------------------

--
-- Struktura tabele `generiranje_oglasa`
--

CREATE TABLE IF NOT EXISTS `generiranje_oglasa` (
`id_oglasa` int(11) NOT NULL,
  `starostna_skupina` varchar(50) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `casovno_obdobje` varchar(50) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `razpolozenje_objave` varchar(50) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `opis_objave` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `id_uporabnika` int(11) DEFAULT NULL,
  `id_platforme` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabele `platforma`
--

CREATE TABLE IF NOT EXISTS `platforma` (
`id_platforme` int(11) NOT NULL,
  `ime_platforme` varchar(50) COLLATE utf8_slovenian_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabele `tecaji`
--

CREATE TABLE IF NOT EXISTS `tecaji` (
`id_tecaja` int(11) NOT NULL,
  `ime_tecaja` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `starostna_skupina` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `cena` int(11) DEFAULT NULL,
  `st_udelezencev` int(11) DEFAULT NULL,
  `stopnja` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabele `teme`
--

CREATE TABLE IF NOT EXISTS `teme` (
`id_teme` int(11) NOT NULL,
  `ime_teme` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabele `uporabnik`
--

CREATE TABLE IF NOT EXISTS `uporabnik` (
`id_uporabnika` int(11) NOT NULL,
  `ime` varchar(50) COLLATE utf8_slovenian_ci NOT NULL,
  `priimek` varchar(50) COLLATE utf8_slovenian_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_slovenian_ci NOT NULL,
  `geslo` varchar(255) COLLATE utf8_slovenian_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktura tabele `zgodovina_oglasov`
--

CREATE TABLE IF NOT EXISTS `zgodovina_oglasov` (
`id_zgodovina` int(11) NOT NULL,
  `doseg` int(11) DEFAULT NULL,
  `starostna_skupina` int(11) DEFAULT NULL,
  `vsebina` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `id_teme` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=1 ;

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `generiranje_oglasa`
--
ALTER TABLE `generiranje_oglasa`
 ADD PRIMARY KEY (`id_oglasa`), ADD KEY `id_uporabnika` (`id_uporabnika`), ADD KEY `id_platforme` (`id_platforme`);

--
-- Indeksi tabele `platforma`
--
ALTER TABLE `platforma`
 ADD PRIMARY KEY (`id_platforme`);

--
-- Indeksi tabele `tecaji`
--
ALTER TABLE `tecaji`
 ADD PRIMARY KEY (`id_tecaja`);

--
-- Indeksi tabele `teme`
--
ALTER TABLE `teme`
 ADD PRIMARY KEY (`id_teme`);

--
-- Indeksi tabele `uporabnik`
--
ALTER TABLE `uporabnik`
 ADD PRIMARY KEY (`id_uporabnika`), ADD UNIQUE KEY `email` (`email`,`geslo`);

--
-- Indeksi tabele `zgodovina_oglasov`
--
ALTER TABLE `zgodovina_oglasov`
 ADD PRIMARY KEY (`id_zgodovina`), ADD KEY `id_teme` (`id_teme`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `generiranje_oglasa`
--
ALTER TABLE `generiranje_oglasa`
MODIFY `id_oglasa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabele `platforma`
--
ALTER TABLE `platforma`
MODIFY `id_platforme` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabele `tecaji`
--
ALTER TABLE `tecaji`
MODIFY `id_tecaja` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabele `teme`
--
ALTER TABLE `teme`
MODIFY `id_teme` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabele `uporabnik`
--
ALTER TABLE `uporabnik`
MODIFY `id_uporabnika` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT tabele `zgodovina_oglasov`
--
ALTER TABLE `zgodovina_oglasov`
MODIFY `id_zgodovina` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
