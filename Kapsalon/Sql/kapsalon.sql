-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 18 nov 2024 om 14:51
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kapsalon`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `afspraken`
--

CREATE TABLE `afspraken` (
  `afspraak_id` int(11) NOT NULL,
  `klant_id` int(11) NOT NULL,
  `kapster_id` int(11) NOT NULL,
  `behandeling_id` int(11) NOT NULL,
  `afspraak_datum` date NOT NULL,
  `afspraak_tijd` time NOT NULL,
  `status` enum('ingepland','geannuleerd','afgerond') DEFAULT 'ingepland',
  `aangemaakt_op` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `afspraken`
--

INSERT INTO `afspraken` (`afspraak_id`, `klant_id`, `kapster_id`, `behandeling_id`, `afspraak_datum`, `afspraak_tijd`, `status`, `aangemaakt_op`) VALUES
(1, 1, 2, 1, '2024-11-20', '14:00:00', 'ingepland', '2024-11-18 10:33:36'),
(2, 1, 2, 2, '2024-11-21', '15:30:00', 'ingepland', '2024-11-18 10:33:36');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `behandelingen`
--

CREATE TABLE `behandelingen` (
  `behandeling_id` int(11) NOT NULL,
  `naam` varchar(100) NOT NULL,
  `beschrijving` text DEFAULT NULL,
  `duur` int(11) NOT NULL,
  `prijs` decimal(10,2) NOT NULL,
  `aangemaakt_op` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `behandelingen`
--

INSERT INTO `behandelingen` (`behandeling_id`, `naam`, `beschrijving`, `duur`, `prijs`, `aangemaakt_op`) VALUES
(1, 'Knippen', 'Inclusief wassen en drogen', 30, 25.00, '2024-11-18 10:33:35'),
(2, 'Kleuren', 'Haarkleuring naar keuze', 60, 50.00, '2024-11-18 10:33:35'),
(3, 'Stylen', 'Styling en föhnen', 45, 35.00, '2024-11-18 10:33:35');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `berichten`
--

CREATE TABLE `berichten` (
  `bericht_id` int(11) NOT NULL,
  `naam` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefoonnummer` varchar(20) DEFAULT NULL,
  `bericht` text NOT NULL,
  `verstuurd_op` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `bestellingen`
--

CREATE TABLE `bestellingen` (
  `bestelling_id` int(11) NOT NULL,
  `klant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `hoeveelheid` int(11) NOT NULL,
  `totaal_prijs` decimal(10,2) NOT NULL,
  `status` enum('in behandeling','verzonden','afgehaald','geannuleerd') DEFAULT 'in behandeling',
  `besteld_op` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gebruikers`
--

CREATE TABLE `gebruikers` (
  `gebruiker_id` int(11) NOT NULL,
  `gebruikersnaam` varchar(50) NOT NULL,
  `wachtwoord_hash` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `rol` enum('eigenaar','medewerker') NOT NULL,
  `aangemaakt_op` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `gebruikers`
--

INSERT INTO `gebruikers` (`gebruiker_id`, `gebruikersnaam`, `wachtwoord_hash`, `email`, `rol`, `aangemaakt_op`) VALUES
(1, 'admin', '$2a$12$LEeyxsx04Y7jljFX7jX5aOF1QSVMkvyfp2dzXR1/7.CXvoLLrKrJW', 'admin@example.com', 'eigenaar', '2024-11-18 10:33:35'),
(2, 'medewerker1', '$2a$12$LEeyxsx04Y7jljFX7jX5aOF1QSVMkvyfp2dzXR1/7.CXvoLLrKrJW', 'medewerker1@example.com', 'medewerker', '2024-11-18 10:33:35'),
(3, 'test', '$2y$10$RqQdf9vtfa9fUH5fERJOXONiJiiwl8War2f4Bht2hMjWVzBiscIXy', 'test@gmail.com', '', '2024-11-18 11:54:22'),
(4, 'testw', '$2y$10$PxTvIThf.Jb7.LFtrCjg1OwQb9K0BQbFXdFoe7WT/A8xQrmJK62wG', 'te1st@gmail.com', '', '2024-11-18 12:08:04'),
(5, 'test322', '$2y$10$FPQLTa9PZ7TOriHlHN9ea.afzIRN3ZPukCs3KmXHy6Gspt3ZkACMC', 'tes22t@gmail.com', '', '2024-11-18 12:10:52');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `producten`
--

CREATE TABLE `producten` (
  `product_id` int(11) NOT NULL,
  `naam` varchar(100) NOT NULL,
  `beschrijving` text DEFAULT NULL,
  `categorie` varchar(50) DEFAULT NULL,
  `prijs` decimal(10,2) NOT NULL,
  `afbeelding_url` varchar(255) DEFAULT NULL,
  `voorraad` int(11) DEFAULT 0,
  `aangemaakt_op` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `producten`
--

INSERT INTO `producten` (`product_id`, `naam`, `beschrijving`, `categorie`, `prijs`, `afbeelding_url`, `voorraad`, `aangemaakt_op`) VALUES
(1, 'Shampoo', 'Hydraterende shampoo voor dagelijks gebruik', 'Haarverzorging', 10.99, NULL, 50, '2024-11-18 10:33:36'),
(2, 'Conditioner', 'Voedende conditioner voor zacht haar', 'Haarverzorging', 12.99, NULL, 30, '2024-11-18 10:33:36'),
(3, 'Haarmasker', 'Intensief verzorgend masker', 'Haarverzorging', 15.99, NULL, 20, '2024-11-18 10:33:36');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `afspraken`
--
ALTER TABLE `afspraken`
  ADD PRIMARY KEY (`afspraak_id`),
  ADD KEY `klant_id` (`klant_id`),
  ADD KEY `kapster_id` (`kapster_id`),
  ADD KEY `behandeling_id` (`behandeling_id`);

--
-- Indexen voor tabel `behandelingen`
--
ALTER TABLE `behandelingen`
  ADD PRIMARY KEY (`behandeling_id`);

--
-- Indexen voor tabel `berichten`
--
ALTER TABLE `berichten`
  ADD PRIMARY KEY (`bericht_id`);

--
-- Indexen voor tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  ADD PRIMARY KEY (`bestelling_id`),
  ADD KEY `klant_id` (`klant_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexen voor tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  ADD PRIMARY KEY (`gebruiker_id`),
  ADD UNIQUE KEY `gebruikersnaam` (`gebruikersnaam`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexen voor tabel `producten`
--
ALTER TABLE `producten`
  ADD PRIMARY KEY (`product_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `afspraken`
--
ALTER TABLE `afspraken`
  MODIFY `afspraak_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `behandelingen`
--
ALTER TABLE `behandelingen`
  MODIFY `behandeling_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `berichten`
--
ALTER TABLE `berichten`
  MODIFY `bericht_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  MODIFY `bestelling_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  MODIFY `gebruiker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `producten`
--
ALTER TABLE `producten`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `afspraken`
--
ALTER TABLE `afspraken`
  ADD CONSTRAINT `afspraken_ibfk_1` FOREIGN KEY (`klant_id`) REFERENCES `gebruikers` (`gebruiker_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `afspraken_ibfk_2` FOREIGN KEY (`kapster_id`) REFERENCES `gebruikers` (`gebruiker_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `afspraken_ibfk_3` FOREIGN KEY (`behandeling_id`) REFERENCES `behandelingen` (`behandeling_id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `bestellingen`
--
ALTER TABLE `bestellingen`
  ADD CONSTRAINT `bestellingen_ibfk_1` FOREIGN KEY (`klant_id`) REFERENCES `gebruikers` (`gebruiker_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bestellingen_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `producten` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
