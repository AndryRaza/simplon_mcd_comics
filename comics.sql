-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 24 août 2022 à 08:08
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `test`
--

-- --------------------------------------------------------

--
-- Structure de la table `assoc_award_comic`
--

CREATE TABLE `assoc_award_comic` (
  `id` int(11) NOT NULL,
  `comics_id` int(11) NOT NULL,
  `award_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `assoc_person_comics`
--

CREATE TABLE `assoc_person_comics` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `comics_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `assoc_writer_comic`
--

CREATE TABLE `assoc_writer_comic` (
  `id` int(11) NOT NULL,
  `comics_id` int(11) NOT NULL,
  `writer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `award`
--

CREATE TABLE `award` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `year_receipt` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `collection`
--

CREATE TABLE `collection` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `prestige` varchar(255) NOT NULL,
  `date_release` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `comics`
--

CREATE TABLE `comics` (
  `id` int(11) NOT NULL,
  `ISBN` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `resume` text NOT NULL,
  `date_release` datetime NOT NULL,
  `number_pages` int(11) NOT NULL,
  `epoque_id` int(11) NOT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `serie_id` int(11) DEFAULT NULL,
  `universe_id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `comic_book_artist`
--

CREATE TABLE `comic_book_artist` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `epoque`
--

CREATE TABLE `epoque` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `years` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `first_appearance` datetime NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `publisher`
--

CREATE TABLE `publisher` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `serie`
--

CREATE TABLE `serie` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `volume_number` int(11) NOT NULL,
  `descriptif` text NOT NULL,
  `release_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `universe`
--

CREATE TABLE `universe` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `writer`
--

CREATE TABLE `writer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `assoc_award_comic`
--
ALTER TABLE `assoc_award_comic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comics` (`comics_id`),
  ADD KEY `award` (`award_id`);

--
-- Index pour la table `assoc_person_comics`
--
ALTER TABLE `assoc_person_comics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person` (`person_id`),
  ADD KEY `comics` (`comics_id`);

--
-- Index pour la table `assoc_writer_comic`
--
ALTER TABLE `assoc_writer_comic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comics` (`comics_id`),
  ADD KEY `writer` (`writer_id`);

--
-- Index pour la table `award`
--
ALTER TABLE `award`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `collection`
--
ALTER TABLE `collection`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comics`
--
ALTER TABLE `comics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ISBN` (`ISBN`),
  ADD KEY `epoque` (`epoque_id`),
  ADD KEY `collection` (`collection_id`),
  ADD KEY `serie` (`serie_id`),
  ADD KEY `universe` (`universe_id`),
  ADD KEY `publisher` (`publisher_id`),
  ADD KEY `comics_book_artist` (`artist_id`);

--
-- Index pour la table `comic_book_artist`
--
ALTER TABLE `comic_book_artist`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `epoque`
--
ALTER TABLE `epoque`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `universe`
--
ALTER TABLE `universe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `writer`
--
ALTER TABLE `writer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `assoc_award_comic`
--
ALTER TABLE `assoc_award_comic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `assoc_person_comics`
--
ALTER TABLE `assoc_person_comics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `assoc_writer_comic`
--
ALTER TABLE `assoc_writer_comic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `award`
--
ALTER TABLE `award`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `collection`
--
ALTER TABLE `collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comics`
--
ALTER TABLE `comics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comic_book_artist`
--
ALTER TABLE `comic_book_artist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `epoque`
--
ALTER TABLE `epoque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `serie`
--
ALTER TABLE `serie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `universe`
--
ALTER TABLE `universe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `writer`
--
ALTER TABLE `writer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `assoc_award_comic`
--
ALTER TABLE `assoc_award_comic`
  ADD CONSTRAINT `assoc_award_comic_ibfk_1` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assoc_award_comic_ibfk_2` FOREIGN KEY (`comics_id`) REFERENCES `comics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `assoc_person_comics`
--
ALTER TABLE `assoc_person_comics`
  ADD CONSTRAINT `assoc_person_comics_ibfk_1` FOREIGN KEY (`comics_id`) REFERENCES `comics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assoc_person_comics_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Contraintes pour la table `assoc_writer_comic`
--
ALTER TABLE `assoc_writer_comic`
  ADD CONSTRAINT `assoc_writer_comic_ibfk_1` FOREIGN KEY (`comics_id`) REFERENCES `comics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assoc_writer_comic_ibfk_2` FOREIGN KEY (`writer_id`) REFERENCES `writer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `comics`
--
ALTER TABLE `comics`
  ADD CONSTRAINT `comics_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comics_ibfk_2` FOREIGN KEY (`epoque_id`) REFERENCES `epoque` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comics_ibfk_3` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comics_ibfk_4` FOREIGN KEY (`serie_id`) REFERENCES `serie` (`id`),
  ADD CONSTRAINT `comics_ibfk_5` FOREIGN KEY (`universe_id`) REFERENCES `universe` (`id`),
  ADD CONSTRAINT `comics_ibfk_6` FOREIGN KEY (`artist_id`) REFERENCES `comic_book_artist` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
