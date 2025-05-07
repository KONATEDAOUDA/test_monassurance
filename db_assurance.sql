-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 08 mai 2025 à 01:24
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_assurance`
--

-- --------------------------------------------------------

--
-- Structure de la table `assurance_auto_infos`
--

CREATE TABLE `assurance_auto_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `guarante` varchar(255) NOT NULL,
  `releasedate` date NOT NULL,
  `periode` int(11) NOT NULL,
  `subscription_type` varchar(255) NOT NULL,
  `reduction_commerciale` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `assurance_voyage_infos`
--

CREATE TABLE `assurance_voyage_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `destination_country` int(11) NOT NULL,
  `current_addr` varchar(255) NOT NULL,
  `destination_addr` varchar(255) NOT NULL,
  `departure_date` date NOT NULL,
  `arrival_date` date NOT NULL,
  `nationality_id` int(11) NOT NULL,
  `passport_num` varchar(255) NOT NULL,
  `date_expire_passport` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `attestations`
--

CREATE TABLE `attestations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auto_categories`
--

CREATE TABLE `auto_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `usage` varchar(255) NOT NULL,
  `qualite_proprietaire` varchar(255) NOT NULL,
  `longdesc` text NOT NULL,
  `shortdesc` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `auto_categories`
--

INSERT INTO `auto_categories` (`id`, `categorie`, `genre`, `usage`, `qualite_proprietaire`, `longdesc`, `shortdesc`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 'Catégorie 1', 'VP', 'Privé', 'Personne physique', 'Personne physique', 'Privé', 1, NULL, NULL),
(2, 'Catégorie 2', 'Camion, Camionnette, Autocar, Tracteur routier, Tracteur agricole', 'Privé', 'Personne physique et morale', 'Personne physique et morale', 'Privé', 1, NULL, NULL),
(3, 'Catégorie 3', 'Camion, Camionnette, Autocar, Tracteur routier, Tracteur agricole', 'Public', 'Personne physique et morale', 'Personne physique et morale', 'Public', 1, NULL, NULL),
(4, 'Catégorie 4', 'TPV TAXIS, TRANSPORT PUBLIC', 'TRANSPORT PUBLIC', 'TRANSPORT PUBLIC', 'TRANSPORT PUBLIC', 'TRANSPORT PUBLIC', 1, NULL, NULL),
(5, 'Catégorie 5', '2 ROUES', 'Personne physique et morale', 'Personne physique et morale', 'Personne physique et morale', 'Personne physique et morale', 1, NULL, NULL),
(6, 'Catégorie 6', 'Toute sorte de véhicule', 'Véhicules appartenant ou confiés aux garagistes et professionnels de la vente, et de la réparation pour les essais ou la mise au point.', 'Personne morale / Société de garage automobile', 'éhicules appartenant ou confiés aux garagistes et professionnels de la vente, et de la réparation pour les essais ou la mise au point.', 'Personne morale / Société de garage automobile', 1, NULL, NULL),
(7, 'Catégorie 7', 'Toute sorte de véhicule', 'Véhicules destinés à l\'enseignement de la conduite automobile (auto école) à commande double et simple', 'Personne morale / Société d\'auto école', 'Véhicules destinés à l\'enseignement de la conduite automobile (auto école) à commande double et simple', 'Personne morale / Société d\'auto école', 1, NULL, NULL),
(8, 'Catégorie 8', 'VP', 'Location', 'Personne morale / Société de location de véhicule', 'Personne morale / Société de location de véhicule', 'Location', 1, NULL, NULL),
(9, 'Catégorie 9', 'ENGIN DE CHANTIER', 'Caterpillar', 'Personne physique et morale', 'Personne physique et moral', 'Caterpillar, Bulldozer, Chariot Elévateur', 0, NULL, NULL),
(10, 'Catégorie 10', 'AMBULANCE', 'AMBULANCE', 'Personne physique et morale', 'Ambulance, corbillard, etc', 'Ambulance', 0, NULL, NULL),
(11, 'Catégorie 12', 'VP', 'Privé', 'Personne morale', 'Personne morale', 'Privé', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `auto_company`
--

CREATE TABLE `auto_company` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `compname` varchar(100) NOT NULL,
  `compdesc` text NOT NULL,
  `complocation` text NOT NULL,
  `compphone` varchar(100) NOT NULL,
  `complogo` varchar(255) NOT NULL,
  `baseguar` longtext NOT NULL,
  `tsimple` longtext NOT NULL,
  `tcomplet` longtext NOT NULL,
  `tcol` longtext NOT NULL,
  `toutrisque` longtext NOT NULL,
  `accessory_free` longtext NOT NULL,
  `road_safety_guarantee` longtext NOT NULL,
  `company_discount` longtext NOT NULL,
  `bns_custom` longtext NOT NULL,
  `com_custom` longtext NOT NULL,
  `fractionnement_guar` longtext NOT NULL,
  `enabled` int(11) NOT NULL,
  `has_foresight` int(11) NOT NULL,
  `has_home` int(11) NOT NULL,
  `has_travel` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `auto_company`
--

INSERT INTO `auto_company` (`id`, `compname`, `compdesc`, `complocation`, `compphone`, `complogo`, `baseguar`, `tsimple`, `tcomplet`, `tcol`, `toutrisque`, `accessory_free`, `road_safety_guarantee`, `company_discount`, `bns_custom`, `com_custom`, `fractionnement_guar`, `enabled`, `has_foresight`, `has_home`, `has_travel`, `created_at`, `updated_at`) VALUES
(1, 'GNA ASSURANCES', '', '', '', 'gna.jpg', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}}', '{\"auto\": {\"tcol\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 5000, \"12\": 10000}}, \"tsimple\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 5000, \"12\": 10000}}, \"tcomplet\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 5000, \"12\": 10000}}, \"toutrisque\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 5000, \"12\": 10000}}}, \"moto\": {\"tcol\": {\"facteur\": \"temp\", \"periode\": {\"1\": 500, \"3\": 500, \"6\": 500, \"12\": 500}}, \"tsimple\": {\"facteur\": \"temp\", \"periode\": {\"1\": 500, \"3\": 500, \"6\": 500, \"12\": 500}}, \"tcomplet\": {\"facteur\": \"temp\", \"periode\": {\"1\": 500, \"3\": 500, \"6\": 500, \"12\": 500}}, \"toutrisque\": {\"facteur\": \"temp\", \"periode\": {\"1\": 500, \"3\": 500, \"6\": 500, \"12\": 500}}}}', '{\"cat1\": [5595, 5595, 5595, 6725, 7934, 9247, 10687, 12263, 14002], \"cat2\": [5595, 5595, 5595, 6725, 7934, 9247, 10687, 12263, 14002], \"cat3\": [5595, 5595, 5595, 6725, 7934, 9247, 10687, 12263, 14002], \"cat5\": [0, 0, 0, 0, 0, 0, 0, 0, 0], \"cat8\": [5595, 5595, 5595, 6725, 7934, 9247, 10687, 12263, 14002], \"cat12\": [5595, 5595, 5595, 6725, 7934, 9247, 10687, 12263, 14002], \"cat9\": [3, 4500, 1500], \"cat10\": [3, 4500, 1500], \"cat13\": [3, 4500, 1500], \"cat14\": [3, 4500, 1500]}', '{\"discount\": {\"bns\": [\"RC\", \"BG\", \"IC\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"DR\", \"RA\"], \"com\": [\"BG\", \"IC\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"RA\"], \"model\": 3, \"permis\": [\"RC\"], \"socpro\": [\"RC\"]}}', '', '{\"formule\":{\"tcol\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0}},\"tsimple\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0}},\"tcomplet\":{\"periode\":{\"1\":0.2,\"3\":0.2,\"6\":0.2,\"12\":0.25}},\"toutrisque\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0.3}}}}', '{\"periode\": {\"RC\": {\"1\": 0.1, \"3\": 0.28, \"6\": 0.53, \"12\": 1}, \"OTHER\": {\"1\": 0.1, \"3\": 0.28, \"6\": 0.53, \"12\": 1}}}', 1, 0, 0, 1, '2017-10-02 11:17:39', '2017-10-02 11:17:39'),
(2, 'AFRICAINE DES ASSURANCES', '', '', '', 'safa.jpg', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}}', '{\"auto\": {\"tcol\": {\"facteur\": \"temp\", \"periode\": {\"1\": 750, \"3\": 2000, \"6\": 3000, \"12\": 5000}}, \"tsimple\": {\"facteur\": \"temp\", \"periode\": {\"1\": 750, \"3\": 2000, \"6\": 3000, \"12\": 5000}}, \"tcomplet\": {\"facteur\": \"temp\", \"periode\": {\"1\": 750, \"3\": 2000, \"6\": 3000, \"12\": 5000}}, \"toutrisque\": {\"facteur\": \"temp\", \"periode\": {\"1\": 750, \"3\": 2000, \"6\": 3000, \"12\": 5000}}}, \"moto\": {\"tcol\": {\"facteur\": \"temp\", \"periode\": {\"1\": 750, \"3\": 2000, \"6\": 3000, \"12\": 5000}}, \"tsimple\": {\"facteur\": \"temp\", \"periode\": {\"1\": 750, \"3\": 2000, \"6\": 3000, \"12\": 5000}}, \"tcomplet\": {\"facteur\": \"temp\", \"periode\": {\"1\": 750, \"3\": 2000, \"6\": 3000, \"12\": 5000}}, \"toutrisque\": {\"facteur\": \"temp\", \"periode\": {\"1\": 750, \"3\": 2000, \"6\": 3000, \"12\": 5000}}}}', '{\"cat1\": [1, 15000, 0], \"cat2\": [1, 12000, 0], \"cat3\": [1, 15000, 0], \"cat5\": [1, 15000, 0], \"cat8\": [1, 15000, 0], \"cat12\": [1, 15000, 0], \"cat9\": [3, 4500, 1500], \"cat10\": [3, 4500, 1500], \"cat13\": [3, 4500, 1500], \"cat14\": [3, 4500, 1500]}', '{\"discount\": {\"bns\": [\"RC\", \"BG\", \"IC\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"DR\", \"RA\", \"SECU_ROU\"], \"com\": [\"BG\", \"IC\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\"], \"model\": 3, \"permis\": [\"RC\", \"BG\", \"IC\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"DR\", \"RA\", \"SECU_ROU\"], \"socpro\": [\"RC\", \"BG\", \"IC\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"DR\", \"RA\", \"SECU_ROU\"]}}', '', '{\"formule\":{\"tcol\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0}},\"tsimple\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0}},\"tcomplet\":{\"periode\":{\"1\":0.2,\"3\":0.2,\"6\":0.2,\"12\":0.25}},\"toutrisque\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0.3}}}}', '{\"periode\": {\"RC\": {\"1\": 0.1, \"3\": 0.28, \"6\": 0.53, \"12\": 1}, \"OTHER\": {\"1\": 0.1, \"3\": 0.28, \"6\": 0.53, \"12\": 1}}}', 1, 0, 0, 0, '2017-10-29 22:30:45', '2017-10-29 22:30:45'),
(3, 'ATLANTA', '', '', '', 'atlanta.jpg', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}}', '{\"auto\":{\"tsimple\":{\"facteur\":\"prime\",\"montant\":{\"pallier\":[{\"min\":0,\"max\":30000,\"amount\":1000},{\"min\":30000,\"max\":100000,\"amount\":3000},{\"min\":100000,\"max\":500000,\"amount\":5000},{\"min\":500000,\"max\":1000000,\"amount\":10000},{\"min\":1000000,\"max\":1500000,\"amount\":20000},{\"min\":1500000,\"max\":10000000000,\"amount\":30000}]}},\"tcomplet\":{\"facteur\":\"prime\",\"montant\":{\"pallier\":[{\"min\":0,\"max\":30000,\"amount\":1000},{\"min\":30000,\"max\":100000,\"amount\":3000},{\"min\":100000,\"max\":500000,\"amount\":5000},{\"min\":500000,\"max\":1000000,\"amount\":10000},{\"min\":1000000,\"max\":1500000,\"amount\":20000},{\"min\":1500000,\"max\":10000000000,\"amount\":30000}]}},\"tcol\":{\"facteur\":\"prime\",\"montant\":{\"pallier\":[{\"min\":0,\"max\":30000,\"amount\":1000},{\"min\":30000,\"max\":100000,\"amount\":3000},{\"min\":100000,\"max\":500000,\"amount\":5000},{\"min\":500000,\"max\":1000000,\"amount\":10000},{\"min\":1000000,\"max\":1500000,\"amount\":20000},{\"min\":1500000,\"max\":10000000000,\"amount\":30000}]}},\"toutrisque\":{\"facteur\":\"prime\",\"montant\":{\"pallier\":[{\"min\":0,\"max\":30000,\"amount\":1000},{\"min\":30000,\"max\":100000,\"amount\":3000},{\"min\":100000,\"max\":500000,\"amount\":5000},{\"min\":500000,\"max\":1000000,\"amount\":10000},{\"min\":1000000,\"max\":1500000,\"amount\":20000},{\"min\":1500000,\"max\":10000000000,\"amount\":30000}]}}},\"moto\":{\"tsimple\":{\"facteur\":\"temp\",\"periode\":{\"1\":1000,\"3\":1000,\"6\":1000,\"12\":1000}},\"tcomplet\":{\"facteur\":\"temp\",\"periode\":{\"1\":1000,\"3\":1000,\"6\":1000,\"12\":1000}},\"tcol\":{\"facteur\":\"temp\",\"periode\":{\"1\":1000,\"3\":1000,\"6\":1000,\"12\":1000}},\"toutrisque\":{\"facteur\":\"temp\",\"periode\":{\"1\":1000,\"3\":1000,\"6\":1000,\"12\":1000}}}}', '{\"cat1\": [1, 2100, 600], \"cat2\": [1, 2100, 600], \"cat3\": [1, 2100, 600], \"cat5\": [1, 2100, 600], \"cat8\": [1, 2100, 600], \"cat12\": [1, 2100, 600], \"cat9\": [3, 4500, 1500], \"cat10\": [3, 4500, 1500], \"cat13\": [3, 4500, 1500], \"cat14\": [3, 4500, 1500]}', '{\"discount\": {\"bns\": [\"RC\", \"BG\", \"IC\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"DR\", \"RA\"], \"com\": [\"BG\", \"IC\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"RA\"], \"model\": 2, \"permis\": [\"RC\", \"BG\", \"IC\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"DR\", \"RA\"], \"socpro\": [\"RC\", \"BG\", \"IC\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"DR\", \"RA\"]}}', '', '{\"formule\":{\"tcol\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0}},\"tsimple\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0}},\"tcomplet\":{\"periode\":{\"1\":0.2,\"3\":0.2,\"6\":0.2,\"12\":0.25}},\"toutrisque\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0.3}}}}', '{\"periode\": {\"RC\": {\"1\": 0.1, \"3\": 0.28, \"6\": 0.53, \"12\": 1}, \"OTHER\": {\"1\": 0.08333, \"3\": 0.25, \"6\": 0.5, \"12\": 1}}}', 1, 0, 0, 0, '2017-10-30 09:15:46', '2017-10-30 09:15:46'),
(4, 'SONAM', '', '', '', 'sonam.png', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOLACC,RA]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}}', '{\"auto\": {\"tcol\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 5000, \"12\": 10000}}, \"tsimple\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 5000, \"12\": 10000}}, \"tcomplet\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 5000, \"12\": 10000}}, \"toutrisque\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 5000, \"12\": 10000}}}, \"moto\": {\"tcol\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 1000, \"6\": 1000, \"12\": 1000}}, \"tsimple\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 1000, \"6\": 1000, \"12\": 1000}}, \"tcomplet\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 1000, \"6\": 1000, \"12\": 1000}}, \"toutrisque\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 1000, \"6\": 1000, \"12\": 1000}}}}', '{\"cat1\": [3, 8400, 1800], \"cat2\": [3, 8400, 1800], \"cat3\": [3, 8400, 1800], \"cat5\": [3, 8400, 1800], \"cat8\": [3, 8400, 1800], \"cat12\": [3, 8400, 1800], \"cat9\": [3, 4500, 1500], \"cat10\": [3, 4500, 1500], \"cat13\": [3, 4500, 1500], \"cat14\": [3, 4500, 1500]}', '{\"discount\": {\"bns\": [\"RC\", \"BG\", \"IC\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"DR\", \"RA\"], \"com\": [\"BG\", \"IC\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"DR\", \"RA\"], \"model\": 3, \"permis\": [\"RC\"], \"socpro\": [\"RC\"]}}', '', '{\"formule\":{\"tcol\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0}},\"tsimple\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0}},\"tcomplet\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0.15,\"12\":0.25}},\"toutrisque\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0.3}}}}', '{\"periode\": {\"RC\": {\"1\": 0.1, \"3\": 0.28, \"6\": 0.53, \"12\": 1}, \"OTHER\": {\"1\": 0.1, \"3\": 0.28, \"6\": 0.53, \"12\": 1}}}', 1, 0, 0, 0, '2017-11-10 23:10:10', '2017-11-10 23:10:10'),
(5, 'ATLAS', '', '', '', 'atlas.jpg', '{\"cat1\": {\"garanties\": \"[RC,DR,IC]\"}, \"cat2\": {\"garanties\": \"[RC,DR,IC]\"}, \"cat3\": {\"garanties\": \"[RC,DR,IC]\"}, \"cat5\": {\"garanties\": \"[RC,DR,IC]\"}, \"cat8\": {\"garanties\": \"[RC,DR,IC]\"}, \"cat12\": {\"garanties\": \"[RC,DR,IC]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,IC]\"}, \"cat2\": {\"garanties\": \"[RC,DR,IC]\"}, \"cat3\": {\"garanties\": \"[RC,DR,IC]\"}, \"cat5\": {\"garanties\": \"[RC,DR,IC]\"}, \"cat8\": {\"garanties\": \"[RC,DR,IC]\"}, \"cat12\": {\"garanties\": \"[RC,DR,IC]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat2\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat3\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat5\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat8\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat12\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat2\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat3\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat5\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat8\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat12\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat2\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat3\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat5\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat8\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat12\": {\"garanties\": \"[RC,DR,IC,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}}', '{\"auto\": {\"tcol\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 3000, \"12\": 5000}}, \"tsimple\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 3000, \"12\": 5000}}, \"tcomplet\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 3000, \"12\": 5000}}, \"toutrisque\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 3000, \"12\": 5000}}}, \"moto\": {\"tcol\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 1000, \"6\": 1000, \"12\": 1000}}, \"tsimple\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 1000, \"6\": 1000, \"12\": 1000}}, \"tcomplet\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 1000, \"6\": 1000, \"12\": 1000}}, \"toutrisque\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 1000, \"6\": 1000, \"12\": 1000}}}}', '{\"cat1\": [3, 8400, 1800], \"cat2\": [3, 8400, 1800], \"cat3\": [3, 8400, 1800], \"cat5\": [3, 8400, 1800], \"cat8\": [3, 8400, 1800], \"cat12\": [3, 8400, 1800], \"cat9\": [3, 4500, 1500], \"cat10\": [3, 4500, 1500], \"cat13\": [3, 4500, 1500], \"cat14\": [3, 4500, 1500]}', '{\"discount\": {\"bns\": [\"RC\", \"BG\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"DR\", \"RA\", \"SECU_ROU\"], \"com\": [\"BG\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"RA\"], \"model\": 3, \"permis\": [\"RC\", \"BG\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"DR\", \"RA\", \"SECU_ROU\"], \"socpro\": [\"RC\", \"BG\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"DR\", \"RA\", \"SECU_ROU\"]}}', '', '{\"formule\":{\"tcol\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0}},\"tsimple\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0}},\"tcomplet\":{\"periode\":{\"1\":0.2,\"3\":0.2,\"6\":0.2,\"12\":0.25}},\"toutrisque\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0.3}}}}', '{\"periode\": {\"RC\": {\"1\": 0.1, \"3\": 0.28, \"6\": 0.53, \"12\": 1}, \"OTHER\": {\"1\": 0.1, \"3\": 0.28, \"6\": 0.53, \"12\": 1}}}', 1, 0, 0, 0, '2017-11-11 13:01:12', '2017-11-11 13:01:12'),
(6, 'ATLANTIQUE', '', '', '', 'atlantique.jpg', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}}', '{\"auto\":{\"tsimple\":{\"facteur\":\"prime\",\"montant\":{\"pallier\":[{\"min\":0,\"max\":15000,\"amount\":1000},{\"min\":15000,\"max\":30000,\"amount\":4000},{\"min\":30000,\"max\":100000,\"amount\":6000},{\"min\":100000,\"max\":500000,\"amount\":8000},{\"min\":500000,\"max\":1000000,\"amount\":10000},{\"min\":1000000,\"max\":1500000,\"amount\":20000},{\"min\":1500000,\"max\":10000000000,\"amount\":30000}]}},\"tcomplet\":{\"facteur\":\"prime\",\"montant\":{\"pallier\":[{\"min\":0,\"max\":15000,\"amount\":1000},{\"min\":15000,\"max\":30000,\"amount\":4000},{\"min\":30000,\"max\":100000,\"amount\":6000},{\"min\":100000,\"max\":500000,\"amount\":8000},{\"min\":500000,\"max\":1000000,\"amount\":10000},{\"min\":1000000,\"max\":1500000,\"amount\":20000},{\"min\":1500000,\"max\":10000000000,\"amount\":30000}]}},\"tcol\":{\"facteur\":\"prime\",\"montant\":{\"pallier\":[{\"min\":0,\"max\":30000,\"amount\":1000},{\"min\":30000,\"max\":100000,\"amount\":3000},{\"min\":100000,\"max\":500000,\"amount\":5000},{\"min\":500000,\"max\":1000000,\"amount\":10000},{\"min\":1000000,\"max\":1500000,\"amount\":20000},{\"min\":1500000,\"max\":10000000000,\"amount\":30000}]}},\"toutrisque\":{\"facteur\":\"prime\",\"montant\":{\"pallier\":[{\"min\":0,\"max\":15000,\"amount\":1000},{\"min\":15000,\"max\":30000,\"amount\":4000},{\"min\":30000,\"max\":100000,\"amount\":6000},{\"min\":100000,\"max\":500000,\"amount\":8000},{\"min\":500000,\"max\":1000000,\"amount\":10000},{\"min\":1000000,\"max\":1500000,\"amount\":20000},{\"min\":1500000,\"max\":10000000000,\"amount\":30000}]}}},\"moto\":{\"tsimple\":{\"facteur\":\"temp\",\"periode\":{\"1\":1000,\"3\":1000,\"6\":1000,\"12\":1000}},\"tcomplet\":{\"facteur\":\"temp\",\"periode\":{\"1\":1000,\"3\":1000,\"6\":1000,\"12\":1000}},\"tcol\":{\"facteur\":\"temp\",\"periode\":{\"1\":1000,\"3\":1000,\"6\":1000,\"12\":1000}},\"toutrisque\":{\"facteur\":\"temp\",\"periode\":{\"1\":1000,\"3\":1000,\"6\":1000,\"12\":1000}}}}', '{\"cat1\": [3, 4500, 1500], \"cat2\": [3, 4500, 1500], \"cat3\": [3, 4500, 1500], \"cat5\": [3, 4500, 1500], \"cat8\": [3, 4500, 1500], \"cat10\": [3, 4500, 1500], \"cat12\": [3, 4500, 1500], \"cat9\": [3, 4500, 1500], \"cat13\": [3, 4500, 1500], \"cat14\": [3, 4500, 1500]}', '{\r\n  \"discount\": {\r\n    \"bns\": [\r\n      \"RC\",\r\n      \"BG\",\r\n      \"IC\",\r\n      \"INC\",\r\n      \"VAND\",\r\n      \"DOMVEH\",\r\n      \"DOMCOL\",\r\n      \"VOL\",\r\n      \"VAG\",\r\n      \"VOLACC\",\r\n      \"DR\",\r\n      \"SECU_ROU\"\r\n    ],\r\n    \"com\": [\r\n      \"BG\",\r\n      \"IC\",\r\n      \"INC\",\r\n      \"VAND\",\r\n      \"DOMVEH\",\r\n      \"DOMCOL\",\r\n      \"VOL\",\r\n      \"VAG\",\r\n      \"VOLACC\",\r\n      \"SECU_ROU\"\r\n    ],\r\n    \"model\": 1,\r\n    \"permis\": [\r\n      \"RC\",\r\n      \"DR\"\r\n    ],\r\n    \"socpro\": [\r\n      \"RC\",\r\n      \"DR\"\r\n    ]\r\n  }\r\n}', '', '{\"formule\":{\"tcol\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0}},\"tsimple\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0}},\"tcomplet\":{\"periode\":{\"1\":0.2,\"3\":0.2,\"6\":0.2,\"12\":0.25}},\"toutrisque\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0.3}}}}', '{   \"periode\": {     \"RC\": {       \"1\": 0.1,       \"3\": 0.28,       \"6\": 0.53,       \"12\": 1     },     \"OTHER\": {       \"1\": 0.1,       \"3\": 0.28,       \"6\": 0.53,       \"12\": 1     }   } }', 1, 0, 0, 0, '2017-11-26 13:34:05', '2017-11-26 13:34:05'),
(7, 'MASAVI ASSURANCE', '', '', '', 'masavi.png', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMCOL]\"}}', '{\"cat1\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat2\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat3\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat5\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat8\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat12\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat9\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat10\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat13\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}, \"cat14\": {\"garanties\": \"[RC,DR,SECU_ROU,INC,BG,VOL,VAG,VOLACC,RA,DOMVEH]\"}}', '{\"auto\": {\"tcol\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 5000, \"12\": 10000}}, \"tsimple\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 5000, \"12\": 10000}}, \"tcomplet\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 5000, \"12\": 10000}}, \"toutrisque\": {\"facteur\": \"temp\", \"periode\": {\"1\": 1000, \"3\": 3000, \"6\": 5000, \"12\": 10000}}}, \"moto\": {\"tcol\": {\"facteur\": \"temp\", \"periode\": {\"1\": 500, \"3\": 500, \"6\": 500, \"12\": 500}}, \"tsimple\": {\"facteur\": \"temp\", \"periode\": {\"1\": 500, \"3\": 500, \"6\": 500, \"12\": 500}}, \"tcomplet\": {\"facteur\": \"temp\", \"periode\": {\"1\": 500, \"3\": 500, \"6\": 500, \"12\": 500}}, \"toutrisque\": {\"facteur\": \"temp\", \"periode\": {\"1\": 500, \"3\": 500, \"6\": 500, \"12\": 500}}}}', '{\"cat1\": [5595, 5595, 5595, 6725, 7934, 9247, 10687, 12263, 14002], \"cat2\": [5595, 5595, 5595, 6725, 7934, 9247, 10687, 12263, 14002], \"cat3\": [5595, 5595, 5595, 6725, 7934, 9247, 10687, 12263, 14002], \"cat5\": [0, 0, 0, 0, 0, 0, 0, 0, 0], \"cat8\": [5595, 5595, 5595, 6725, 7934, 9247, 10687, 12263, 14002], \"cat12\": [5595, 5595, 5595, 6725, 7934, 9247, 10687, 12263, 14002], \"cat9\": [3, 4500, 1500], \"cat10\": [3, 4500, 1500], \"cat13\": [3, 4500, 1500], \"cat14\": [3, 4500, 1500]}', '{\"discount\": {\"bns\": [\"RC\", \"BG\", \"IC\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"DR\", \"RA\"], \"com\": [\"BG\", \"IC\", \"INC\", \"VAND\", \"DOMVEH\", \"DOMCOL\", \"VOL\", \"VAG\", \"VOLACC\", \"RA\"], \"model\": 3, \"permis\": [\"RC\"], \"socpro\": [\"RC\"]}}', '', '{\"formule\":{\"tcol\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0}},\"tsimple\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0}},\"tcomplet\":{\"periode\":{\"1\":0.2,\"3\":0.2,\"6\":0.2,\"12\":0.25}},\"toutrisque\":{\"periode\":{\"1\":0,\"3\":0,\"6\":0,\"12\":0.3}}}}', '{\"periode\": {\"RC\": {\"1\": 0.1, \"3\": 0.28, \"6\": 0.53, \"12\": 1}, \"OTHER\": {\"1\": 0.1, \"3\": 0.28, \"6\": 0.53, \"12\": 1}}}', 0, 0, 0, 1, '2018-02-26 17:47:14', '2018-02-26 17:47:14');

-- --------------------------------------------------------

--
-- Structure de la table `auto_companyquotation`
--

CREATE TABLE `auto_companyquotation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_assurance` int(11) NOT NULL,
  `companyid` int(11) NOT NULL,
  `formules` text NOT NULL,
  `files` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `auto_companyquotation`
--

INSERT INTO `auto_companyquotation` (`id`, `type_assurance`, `companyid`, `formules`, `files`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '{\"BG\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat3\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}}, \"DR\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-1000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"IC\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"RA\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-10500\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"INC\": {\"cat1\": {\"formule\": [\"NAN:VV,0.35-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VV,0.4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"VV,0-4000001:VV,0-52516\", \"VV,4000000-6000001:VV,0-87528\", \"VV,6000000-10000001:VV,0-140049\", \"VV,10000000-16000001:VV,0-227577\", \"VV,16000000-10000000000:VV,0-350117\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat8\": {\"formule\": [\"NAN:VV,0.65-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"NAN:VV,0.6-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VAG\": {\"cat1\": {\"formule\": [\"VV,0-10000001:VV,0.375-0\", \"VV,10000000-10000000000:VV,0.75-0\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"VV,0-10000001:VV,0.375-0\", \"VV,10000000-10000000000:VV,0.75-0\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"VV,0-4000001:NAN,0-19030\", \"VV,4000000-6000001:NAN,0-32225\", \"VV,6000000-10000001:NAN,0-51555\", \"VV,100000000-16000001:NAN,0-83769\", \"VV,16000000-10000000000:NAN,0-107205\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:VV,3.15-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat8\": {\"formule\": [\"NAN:VV,1.05-0\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"VV,0-10000001:VV,0.75-0\", \"VV,10000000-10000000000:VV,1.5-0\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}}, \"VOL\": {\"cat1\": {\"formule\": [\"VV,0-10000001:VV,0.375-0\", \"VV,10000000-10000000000:VV,0.75-0\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"VV,0-10000001:VV,0.375-0\", \"VV,10000000-10000000000:VV,0.75-0\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"VV,0-4000001:NAN,0-19030\", \"VV,4000000-6000001:NAN,0-32225\", \"VV,6000000-10000001:NAN,0-51555\", \"VV,100000000-16000001:NAN,0-83769\", \"VV,16000000-10000000000:NAN,0-107205\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:VV,3.15-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat8\": {\"formule\": [\"NAN:VV,1.05-0\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"VV,0-10000001:VV,0.75-0\", \"VV,10000000-10000000000:VV,1.5-0\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}}, \"VAND\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-12600\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-12600\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-12600\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-12600\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-12600\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-12600\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"DOMCOL\": {\"cat1\": {\"formule\": [\"NAN:VN,3.75-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat2\": {\"formule\": [\"NAN:VN,4.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat3\": {\"formule\": [\"NAN:VN,5.78-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat8\": {\"formule\": [\"NAN:VN,10.02-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat12\": {\"formule\": [\"NAN:VN,4.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}}, \"DOMVEH\": {\"cat1\": {\"formule\": [\"NAN:VN,5.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VN,6.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VN,10.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"NEANT\", \"sommegarantie\": \"NEANT\"}, \"cat8\": {\"formule\": [\"NAN:VN,16.75-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"NAN:VN,7.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VOLACC\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-25000\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"250.000\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-25000\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"250.000\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-3000\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"250.000\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"250.000\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-15750\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-15750\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"-T\"}}}', '', '2017-10-02 11:21:08', NULL),
(3, 3, 1, '{\"voyage\":[{\"zone\":{\"cima\":{\"formule\":[\"DUREE,0-8:NAN,0-18210\",\"DUREE,7-16:NAN,0-23467\",\"DUREE,15-32:NAN,0-41210\",\"DUREE,31-63:NAN,0-59987\",\"DUREE,62-93:NAN,0-79231\",\"DUREE,92-184:NAN,0-90497\",\"DUREE,183-366:NAN,0-126264\"]},\"monde\":{\"formule\":[\"DUREE,0-8:NAN,0-18210\",\"DUREE,7-16:NAN,0-23467\",\"DUREE,15-32:NAN,0-41210\",\"DUREE,31-63:NAN,0-59987\",\"DUREE,62-93:NAN,0-79231\",\"DUREE,92-184:NAN,0-90497\",\"DUREE,183-366:NAN,0-126264\"]},\"schenghen\":{\"formule\":[\"DUREE,0-8:NAN,0-18210\",\"DUREE,7-16:NAN,0-23467\",\"DUREE,15-32:NAN,0-41210\",\"DUREE,31-63:NAN,0-59987\",\"DUREE,62-93:NAN,0-79231\",\"DUREE,92-184:NAN,0-90497\",\"DUREE,183-366:NAN,0-126264\"]}},\"agemax\":75,\"agemin\":1}]}', '', '2017-10-21 22:34:16', NULL),
(4, 1, 2, '{\"BG\": {\"cat1\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat2\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat3\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat8\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat12\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}}, \"DR\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:RC,10-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-1000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"IC\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"RA\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-10000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-10000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-10000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-10000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-10000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"INC\": {\"cat1\": {\"formule\": [\"NAN:VV,1.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VV,1.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VV,1.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat8\": {\"formule\": [\"NAN:VV,1.22-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"NAN:VV,1.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VAG\": {\"cat1\": {\"formule\": [\"NAN:VV,0.45-0\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VV,0.45-0\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VV,0.45-0\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat8\": {\"formule\": [\"NAN:VV,0.34-0\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"NAN:VV,0.45-0\"], \"franchise\": \"10% min 200.000FCFA\", \"sommegarantie\": \"Valeur vénale\"}}, \"VOL\": {\"cat1\": {\"formule\": [\"NAN:VV,0.4-0\"], \"franchise\": \"10% min\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VV,0.4-0\"], \"franchise\": \"10% min\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VV,0.4-0\"], \"franchise\": \"10% min\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat8\": {\"formule\": [\"NAN:VV,0.34-0\"], \"franchise\": \"10% min\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"NAN:VV,0.4-0\"], \"franchise\": \"10% min 200,000FCFA\", \"sommegarantie\": \"Valeur vénale\"}}, \"VAND\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"DOMCOL\": {\"cat1\": {\"formule\": [\"NAN:VN,4.25-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat2\": {\"formule\": [\"NAN:VN,4.25-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat3\": {\"formule\": [\"NAN:VN,4.25-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:VN,4.25-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat12\": {\"formule\": [\"NAN:VN,4.25-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}}, \"DOMVEH\": {\"cat1\": {\"formule\": [\"NAN:VN,11.4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VN,11.4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VN,11.4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:VN,11.4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"NAN:VN,11.4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VOLACC\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-25000\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"250.000\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-25000\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"250.000\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-25000\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"250.000\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-25000\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-25000\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"-T\"}}}', '', '2017-10-29 23:00:09', NULL),
(5, 1, 3, '{\"BG\": {\"cat1\": {\"formule\": [\"NAN:VN,0.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat2\": {\"formule\": [\"NAN:VN,0.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat3\": {\"formule\": [\"NAN:VN,0.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat8\": {\"formule\": [\"NAN:VN,0.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat12\": {\"formule\": [\"NAN:VN,0.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}}, \"DR\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:RC,10-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-1000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"IC\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"RA\": {\"cat1\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"INC\": {\"cat1\": {\"formule\": [\"NAN:VV,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VV,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VV,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:VV,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat8\": {\"formule\": [\"NAN:VV,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"NAN:VV,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VAG\": {\"cat1\": {\"formule\": [\"VV,0-15000000:VV,0.425-0\", \"VV,14999999-10000000000:VV,0.625-0\"], \"franchise\": \"10% min\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"VV,0-15000000:VV,0.425-0\", \"VV,14999999-10000000000:VV,0.625-0\"], \"franchise\": \"10% min\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"VV,0-15000000:VV,0.425-0\", \"VV,14999999-10000000000:VV,0.625-0\"], \"franchise\": \"10% min\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"VV,0-15000000:VV,0.425-0\", \"VV,14999999-10000000000:VV,0.625-0\"], \"franchise\": \"10% min\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"VV,0-15000000:VV,0.425-0\", \"VV,14999999-10000000000:VV,0.625-0\"], \"franchise\": \"10% min 200,000FCFA\", \"sommegarantie\": \"Valeur vénale\"}}, \"VOL\": {\"cat1\": {\"formule\": [\"VV,0-15000000:VV,0.425-0\", \"VV,14999999-10000000000:VV,0.625-0\"], \"franchise\": \"10% min\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"VV,0-15000000:VV,0.425-0\", \"VV,14999999-10000000000:VV,0.625-0\"], \"franchise\": \"10% min\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"VV,0-15000000:VV,0.425-0\", \"VV,14999999-10000000000:VV,0.625-0\"], \"franchise\": \"10% min\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"VV,0-15000000:VV,0.425-0\", \"VV,14999999-10000000000:VV,0.625-0\"], \"franchise\": \"10% min\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"VV,0-15000000:VV,0.425-0\", \"VV,14999999-10000000000:VV,0.625-0\"], \"franchise\": \"10% min 200,000FCFA\", \"sommegarantie\": \"Valeur vénale\"}}, \"VAND\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"DOMCOL\": {\"cat1\": {\"formule\": [\"NAN:VN,4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat2\": {\"formule\": [\"NAN:VN,4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat3\": {\"formule\": [\"NAN:VN,4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:VN,4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat12\": {\"formule\": [\"NAN:VN,4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}}, \"DOMVEH\": {\"cat1\": {\"formule\": [\"NAN:VN,4.25-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VN,4.25-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VN,4.25-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:VN,4.25-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"NAN:VN,4.25-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VOLACC\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-10000\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"250.000\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-10000\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"250.000\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-10000\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"250.000\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-10000\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-10000\"], \"franchise\": \"10% min 20.000FCFA\", \"sommegarantie\": \"-T\"}}}', '', '2017-10-30 09:18:51', NULL),
(6, 1, 4, '{\"BG\": {\"cat1\": {\"formule\": [\"NAN:VN,0.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat2\": {\"formule\": [\"NAN:VN,0.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat3\": {\"formule\": [\"NAN:VN,0.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat5\": {\"formule\": [\"NAN:VN,0.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat8\": {\"formule\": [\"NAN:VN,0.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat12\": {\"formule\": [\"NAN:VN,0.2-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}}, \"DR\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-13350\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-1145\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"IC\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"RA\": {\"cat1\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-10000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"INC\": {\"cat1\": {\"formule\": [\"NAN:VV,0.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VV,0.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VV,0.65-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat8\": {\"formule\": [\"NAN:VV,0.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"NAN:VV,0.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VAG\": {\"cat1\": {\"formule\": [\"VV,0-5000001:VV,0.4-0\", \"VV,5000000-10000001:VV,0.5-0\", \"VV,10000000-15000001:VV,0.75-0\", \"VV,15000000-10000000000:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"VV,0-5000001:VV,0.4-0\", \"VV,5000000-10000001:VV,0.5-0\", \"VV,10000000-15000001:VV,0.75-0\", \"VV,15000000-10000000000:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"VV,0-5000001:VV,0.4-0\", \"VV,5000000-10000001:VV,0.5-0\", \"VV,10000000-15000001:VV,0.75-0\", \"VV,15000000-10000000000:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"VV,0-5000001:VV,0.4-0\", \"VV,5000000-10000001:VV,0.5-0\", \"VV,10000000-15000001:VV,0.75-0\", \"VV,15000000-10000000000:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat8\": {\"formule\": [\"VV,0-5000001:VV,0.4-0\", \"VV,5000000-10000001:VV,0.5-0\", \"VV,10000000-15000001:VV,0.75-0\", \"VV,15000000-10000000000:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"VV,0-5000001:VV,0.4-0\", \"VV,5000000-10000001:VV,0.5-0\", \"VV,10000000-15000001:VV,0.75-0\", \"VV,15000000-10000000000:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VOL\": {\"cat1\": {\"formule\": [\"VV,0-5000001:VV,0.4-0\", \"VV,5000000-10000001:VV,0.5-0\", \"VV,10000000-15000001:VV,0.75-0\", \"VV,15000000-10000000000:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"VV,0-5000001:VV,0.4-0\", \"VV,5000000-10000001:VV,0.5-0\", \"VV,10000000-15000001:VV,0.75-0\", \"VV,15000000-10000000000:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"VV,0-5000001:VV,0.4-0\", \"VV,5000000-10000001:VV,0.5-0\", \"VV,10000000-15000001:VV,0.75-0\", \"VV,15000000-10000000000:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"VV,0-5000001:VV,0.4-0\", \"VV,5000000-10000001:VV,0.5-0\", \"VV,10000000-15000001:VV,0.75-0\", \"VV,15000000-10000000000:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat8\": {\"formule\": [\"VV,0-5000001:VV,0.4-0\", \"VV,5000000-10000001:VV,0.5-0\", \"VV,10000000-15000001:VV,0.75-0\", \"VV,15000000-10000000000:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"VV,0-5000001:VV,0.4-0\", \"VV,5000000-10000001:VV,0.5-0\", \"VV,10000000-15000001:VV,0.75-0\", \"VV,15000000-10000000000:VV,1-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VAND\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-12600\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-12600\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-12600\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-12600\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-12600\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-12600\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"DOMCOL\": {\"cat1\": {\"formule\": [\"NAN:VN,3.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat2\": {\"formule\": [\"NAN:VN,3.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat3\": {\"formule\": [\"NAN:VN,3.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat8\": {\"formule\": [\"NAN:VN,5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat12\": {\"formule\": [\"NAN:VN,4.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}}, \"DOMVEH\": {\"cat1\": {\"formule\": [\"NAN:VV,5.4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VN,5.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VN,5.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"NEANT\", \"sommegarantie\": \"NEANT\"}, \"cat8\": {\"formule\": [\"NAN:VV,5.4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"NAN:VN,4.86-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VOLACC\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}}', '', '2017-11-10 23:37:25', NULL),
(7, 1, 5, '{\"BG\": {\"cat1\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat2\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat3\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}}, \"DR\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:RC,10-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-750\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-7950\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"IC\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-13100\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-13100\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-13100\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-13100\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-13100\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-13100\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"RA\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-12000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-12000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-12000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-12000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-12000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"INC\": {\"cat1\": {\"formule\": [\"NAN:VV,1.22-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VV,1.67-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VV,1.67-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:VV,3.561-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"NAN:VV,1.22-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VAG\": {\"cat1\": {\"formule\": [\"NAN:VV,0.525-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VV,0.525-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VV,0.525-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:VV,0.96075-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"NAN:VV,0.525-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VOL\": {\"cat1\": {\"formule\": [\"NAN:VV,0.525-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VV,0.525-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VV,0.525-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:VV,0.96075-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"NAN:VV,0.525-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VAND\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"DOMCOL\": {\"cat1\": {\"formule\": [\"NAN:VN,6-0\"], \"franchise\": \"50 000\", \"sommegarantie\": \"Valeur venale\"}, \"cat2\": {\"formule\": [\"NAN:VN,9.8832-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat3\": {\"formule\": [\"NAN:VN,60-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat12\": {\"formule\": [\"NAN:VN,60-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}}, \"DOMVEH\": {\"cat1\": {\"formule\": [\"NAN:VN,10-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VN,16.472-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VN,16.472-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:VN,60-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VOLACC\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-25000\"], \"franchise\": \"25000\", \"sommegarantie\": \"250 000\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-25000\"], \"franchise\": \"25000\", \"sommegarantie\": \"250 000\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-25000\"], \"franchise\": \"25000\", \"sommegarantie\": \"250 000\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-25000\"], \"franchise\": \"25000\", \"sommegarantie\": \"250 000\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-25000\"], \"franchise\": \"25000\", \"sommegarantie\": \"250 000\"}}}', '', '2017-11-11 13:06:11', NULL),
(8, 1, 6, '{\"BG\": {\"cat1\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat2\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat3\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat8\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}, \"cat12\": {\"formule\": [\"NAN:VN,0.3-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur de remplacement\"}}, \"DR\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-7500\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-7500\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-7500\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:RC,9.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-7500\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-7500\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"IC\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"RA\": {\"cat1\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-10500\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"FORMULE_INT,3-5:NAN,0-0\", \"NAN:NAN,0-15000\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"INC\": {\"cat1\": {\"formule\": [\"NAN:VV,0.4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VV,0.4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VV,0.4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat8\": {\"formule\": [\"NAN:VV,0.7-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"NAN:VV,0.4-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VAG\": {\"cat1\": {\"formule\": [\"VV,0-20000001:VV,0.375-0\", \"VV,20000000-10000000000:VV,0.625-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"VV,0-20000001:VV,0.375-0\", \"VV,20000000-10000000000:VV,0.625-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"VV,0-20000001:VV,0.375-0\", \"VV,20000000-10000000000:VV,0.625-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"VV,0-15000001:VV,0.7-0\", \"VV,15000000-10000000000:VV,1.25-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"VV,0-20000001:VV,0.375-0\", \"VV,20000000-10000000000:VV,0.625-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VOL\": {\"cat1\": {\"formule\": [\"VV,0-20000001:VV,0.375-0\", \"VV,20000000-10000000000:VV,0.625-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"VV,0-20000001:VV,0.375-0\", \"VV,20000000-10000000000:VV,0.625-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"VV,0-20000001:VV,0.375-0\", \"VV,20000000-10000000000:VV,0.625-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"VV,0-15000001:VV,0.7-0\", \"VV,15000000-10000000000:VV,1.25-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"VV,0-20000001:VV,0.375-0\", \"VV,20000000-10000000000:VV,0.625-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VAND\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"-\"}}, \"DOMCOL\": {\"cat1\": {\"formule\": [\"NAN:VN,3.75-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat2\": {\"formule\": [\"NAN:VN,4.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat3\": {\"formule\": [\"NAN:VN,5.78-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat8\": {\"formule\": [\"NAN:VN,10.02-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}, \"cat12\": {\"formule\": [\"NAN:VN,4.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur venale\"}}, \"DOMVEH\": {\"cat1\": {\"formule\": [\"VN,0-25000001:VN,6.25-0\", \"VN,2500000-10000000000:VN,7-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat2\": {\"formule\": [\"NAN:VN,7.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat3\": {\"formule\": [\"NAN:VN,7.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"NEANT\", \"sommegarantie\": \"NEANT\"}, \"cat8\": {\"formule\": [\"NAN:VN,7.5-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}, \"cat12\": {\"formule\": [\"VN,0-25000001:VN,6.25-0\", \"VN,2500000-10000000000:VN,7-0\"], \"franchise\": \"-\", \"sommegarantie\": \"Valeur vénale\"}}, \"VOLACC\": {\"cat1\": {\"formule\": [\"NAN:NAN,0-20000\"], \"franchise\": \"\", \"sommegarantie\": \"\"}, \"cat2\": {\"formule\": [\"NAN:NAN,0-20000\"], \"franchise\": \"\", \"sommegarantie\": \"\"}, \"cat3\": {\"formule\": [\"NAN:NAN,0-20000\"], \"franchise\": \"\", \"sommegarantie\": \"\"}, \"cat5\": {\"formule\": [\"NAN:NAN,0-0\"], \"franchise\": \"\", \"sommegarantie\": \"\"}, \"cat8\": {\"formule\": [\"NAN:NAN,0-20000\"], \"franchise\": \"\", \"sommegarantie\": \"-\"}, \"cat12\": {\"formule\": [\"NAN:NAN,0-20000\"], \"franchise\": \"\", \"sommegarantie\": \"-\"}}}', '', '2017-11-26 13:24:14', NULL),
(9, 3, 7, '{\"voyage\":[{\"agemin\":0,\"agemax\":70,\"zone\":{\"schenghen\":{\"formule\":[\"DUREE,0-8:NAN,0-16780\",\"DUREE,7-16:NAN,0-23325\",\"DUREE,15-32:NAN,0-30236\",\"DUREE,31-63:NAN,0-43327\",\"DUREE,62-93:NAN,0-53837\",\"DUREE,92-185:NAN,0-67863\",\"DUREE,184-366:NAN,0-80955\"]},\"cima\":{\"formule\":[\"DUREE,0-8:NAN,0-16780\",\"DUREE,7-16:NAN,0-23325\",\"DUREE,15-32:NAN,0-30236\",\"DUREE,31-63:NAN,0-43327\",\"DUREE,62-93:NAN,0-53837\",\"DUREE,92-185:NAN,0-67863\",\"DUREE,184-366:NAN,0-80955\"]},\"monde\":{\"formule\":[\"DUREE,0-8:NAN,0-16780\",\"DUREE,7-16:NAN,0-23325\",\"DUREE,15-32:NAN,0-30236\",\"DUREE,31-63:NAN,0-43327\",\"DUREE,62-93:NAN,0-53837\",\"DUREE,92-185:NAN,0-67863\",\"DUREE,184-366:NAN,0-80955\"]},\"except\":{\"pays\":[\"us\",\"ca\",\"jp\",\"au\",\"ch\"],\"duree\":[\"DUREE,0-8:NAN,0-24331\",\"DUREE,7-16:NAN,0-34547\",\"DUREE,15-32:NAN,0-43327\",\"DUREE,31-63:NAN,0-66039\",\"DUREE,62-93:NAN,0-77436\",\"DUREE,92-185:NAN,0-92831\",\"DUREE,184-366:NAN,0-118724\"]}}}]}', '', '2018-02-26 17:48:07', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `auto_guarantee`
--

CREATE TABLE `auto_guarantee` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codeguar` varchar(255) NOT NULL,
  `titleguar` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `isdeprecated` int(11) NOT NULL,
  `type_assurance` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `auto_guarantee`
--

INSERT INTO `auto_guarantee` (`id`, `codeguar`, `titleguar`, `description`, `isdeprecated`, `type_assurance`, `created_at`, `updated_at`) VALUES
(1, 'RC', 'Responsabilité Civile', 'La responsabilité civile est la garantie minimum obligatoire comprise dans tous les contrats d’assurance auto. En cas de sinistre responsable, elle se substitue à l’assuré pour indemniser les dommages causés à la victime.', 0, 0, NULL, '2024-12-16 15:22:12'),
(2, 'DR', 'Défense et Recours', '', 0, 0, NULL, '2024-10-01 16:32:51'),
(3, 'RA', 'Recours Anticipé', '', 0, 0, NULL, NULL),
(4, 'IC', 'Individuel Conducteur', '', 0, 0, NULL, NULL),
(5, 'VAND', 'Vandalisme', '', 0, 0, NULL, NULL),
(6, 'INC', 'Incendie', '', 0, 0, NULL, NULL),
(7, 'BG', 'Bris de Glace', '', 0, 0, NULL, NULL),
(9, 'VOL', 'Vol', '', 0, 0, NULL, NULL),
(10, 'VOLACC', 'Vol accessoires', '', 0, 0, NULL, NULL),
(11, 'VAG', 'Vol par Agression', '', 0, 0, NULL, NULL),
(12, 'DOMCOL', 'Dommage et Collision', '', 0, 0, NULL, NULL),
(13, 'DOMVEH', 'Dommages aux Véhicule', '', 0, 0, NULL, NULL),
(14, 'SECU_ROU', 'Sécurité routière', '', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `auto_infos`
--

CREATE TABLE `auto_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matriculation` varchar(255) NOT NULL,
  `proprio_veh` varchar(255) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `manager_name` varchar(255) DEFAULT NULL,
  `name_cg` varchar(255) NOT NULL,
  `make_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `power` varchar(25) NOT NULL,
  `energy` char(2) NOT NULL,
  `charge_utile` int(11) NOT NULL,
  `cylindree` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `firstrelease` date NOT NULL,
  `placesnumber` int(11) NOT NULL,
  `parkingzone` int(11) NOT NULL,
  `color` int(11) NOT NULL,
  `vneuve` double NOT NULL,
  `vvenale` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auto_reglementarycost`
--

CREATE TABLE `auto_reglementarycost` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `placecost` int(11) NOT NULL,
  `autotaux` double NOT NULL,
  `fga` double NOT NULL,
  `cedeao` double NOT NULL,
  `drecours` text NOT NULL,
  `ranticipe` text NOT NULL,
  `rcivile` text NOT NULL,
  `default_redcom` double NOT NULL,
  `bns_rate` text NOT NULL,
  `has_custom_bns` varchar(255) NOT NULL,
  `fg_annuel` double NOT NULL,
  `fraisaroli` double NOT NULL,
  `active_max_discount` int(11) DEFAULT NULL,
  `enable_circulaire` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `auto_reglementarycost`
--

INSERT INTO `auto_reglementarycost` (`id`, `placecost`, `autotaux`, `fga`, `cedeao`, `drecours`, `ranticipe`, `rcivile`, `default_redcom`, `bns_rate`, `has_custom_bns`, `fg_annuel`, `fraisaroli`, `active_max_discount`, `enable_circulaire`, `created_at`, `updated_at`) VALUES
(1, 2500, 0.145, 0.02, 1000, '{\"norm\": 7950, \"execpt\": 4240}', '{\"norm\": 12000, \"execpt\": 15000}', '{\"rcivile\": {\"categorie\": {\"cat1\": {\"zone1\": {\"D\": {\"1\": 58675, \"2\": 66885, \"3\": 66885, \"4\": 66885, \"5\": 73415, \"6\": 73415, \"7\": 114693, \"8\": 114693, \"9\": 129058, \"10\": 129058, \"11\": 129058, \"12\": 129058, \"13\": 129058}, \"E\": {\"1\": 58675, \"2\": 58675, \"3\": 66885, \"4\": 66885, \"5\": 66885, \"6\": 66885, \"7\": 73415, \"8\": 73415, \"9\": 73415, \"10\": 114693, \"11\": 114693, \"12\": 129058, \"13\": 129058}}, \"zone2\": {\"D\": {\"1\": 55741, \"2\": 63541, \"3\": 63541, \"4\": 63541, \"5\": 69744, \"6\": 69744, \"7\": 108958, \"8\": 108958, \"9\": 122605, \"10\": 122605, \"11\": 122605, \"12\": 122605, \"13\": 122605}, \"E\": {\"1\": 55541, \"2\": 55541, \"3\": 63541, \"4\": 63541, \"5\": 63541, \"6\": 63541, \"7\": 69744, \"8\": 69744, \"9\": 69744, \"10\": 108958, \"11\": 108958, \"12\": 122605, \"13\": 122605}}, \"zone3\": {\"D\": {\"1\": 52808, \"2\": 60197, \"3\": 60197, \"4\": 60197, \"5\": 66074, \"6\": 66074, \"7\": 103224, \"8\": 103224, \"9\": 116152, \"10\": 116152, \"11\": 116152, \"12\": 116152, \"13\": 116152}, \"E\": {\"1\": 52808, \"2\": 52808, \"3\": 60197, \"4\": 60197, \"5\": 60197, \"6\": 60197, \"7\": 66074, \"8\": 66074, \"9\": 66074, \"10\": 103224, \"11\": 103224, \"12\": 116152, \"13\": 116152}}}, \"cat2\": {\"zone1\": {\"1\": 118965, \"2\": 155190, \"3\": 155190, \"4\": 189715, \"5\": 189715, \"6\": 244617, \"7\": 244617, \"8\": 244617, \"9\": 260925, \"10\": 260925, \"11\": 260925, \"12\": 273407, \"13\": 273407, \"14\": 329405, \"15\": 329405, \"16\": 431327, \"17\": 463925}, \"zone2\": {\"1\": 113017, \"2\": 147431, \"3\": 147431, \"4\": 180229, \"5\": 180229, \"6\": 232386, \"7\": 232386, \"8\": 232386, \"9\": 247879, \"10\": 247879, \"11\": 247879, \"12\": 259737, \"13\": 259737, \"14\": 312935, \"15\": 312935, \"16\": 409761, \"17\": 440729}, \"zone3\": {\"1\": 107069, \"2\": 139671, \"3\": 139671, \"4\": 170744, \"5\": 170744, \"6\": 220155, \"7\": 220155, \"8\": 220155, \"9\": 134833, \"10\": 134833, \"11\": 134833, \"12\": 246066, \"13\": 246066, \"14\": 296465, \"15\": 296465, \"16\": 388194, \"17\": 418692}}, \"cat3\": {\"zone1\": {\"1\": 133500, \"2\": 171300, \"3\": 171300, \"4\": 215000, \"5\": 215000, \"6\": 269700, \"7\": 269700, \"8\": 269700, \"9\": 269700, \"10\": 339400, \"11\": 339400, \"12\": 339400, \"13\": 444500, \"14\": 444500, \"15\": 444500, \"16\": 489000, \"17\": 489000}, \"zone2\": {\"1\": 126825, \"2\": 162735, \"3\": 162735, \"4\": 204250, \"5\": 204250, \"6\": 256215, \"7\": 256215, \"8\": 256215, \"9\": 256215, \"10\": 322460, \"11\": 322460, \"12\": 322460, \"13\": 422275, \"14\": 422275, \"15\": 422275, \"16\": 464550, \"17\": 464550}, \"zone3\": {\"1\": 120150, \"2\": 154170, \"3\": 154170, \"4\": 193500, \"5\": 193500, \"6\": 242730, \"7\": 242730, \"8\": 242730, \"9\": 242730, \"10\": 305460, \"11\": 305460, \"12\": 305460, \"13\": 400050, \"14\": 400050, \"15\": 400050, \"16\": 440100, \"17\": 440100}}, \"cat5\": {\"zone1\": {\"1\": 11642, \"2\": 19058, \"3\": 27891, \"4\": 35858, \"5\": 47814}, \"zone2\": {\"1\": 11060, \"2\": 18105, \"3\": 26496, \"4\": 34065, \"5\": 45423}, \"zone3\": {\"1\": 10478, \"2\": 17152, \"3\": 25102, \"4\": 32272, \"5\": 45033}}, \"cat8\": {\"1\": {\"zone1\": {\"D\": {\"1\": 121603, \"2\": 121603, \"3\": 121603, \"4\": 121603, \"5\": 133481, \"6\": 133481, \"7\": 208525, \"8\": 208525, \"9\": 234644, \"10\": 234644, \"11\": 234644, \"12\": 234644, \"13\": 234644}, \"E\": {\"1\": 106675, \"2\": 106675, \"3\": 121603, \"4\": 121603, \"5\": 121603, \"6\": 121603, \"7\": 133481, \"8\": 133481, \"9\": 133481, \"10\": 208525, \"11\": 208525, \"12\": 234644, \"13\": 234644}}, \"zone2\": {\"D\": {\"1\": 115523, \"2\": 115523, \"3\": 115523, \"4\": 115523, \"5\": 126807, \"6\": 126807, \"7\": 198099, \"8\": 198099, \"9\": 222912, \"10\": 222912, \"11\": 222912, \"12\": 222912, \"13\": 222912}, \"E\": {\"1\": 101341, \"2\": 101341, \"3\": 115523, \"4\": 115523, \"5\": 115523, \"6\": 115523, \"7\": 126807, \"8\": 126807, \"9\": 126807, \"10\": 198099, \"11\": 198099, \"12\": 222912, \"13\": 222912}}, \"zone3\": {\"D\": {\"1\": 109443, \"2\": 109443, \"3\": 109443, \"4\": 109443, \"5\": 120133, \"6\": 120133, \"7\": 187673, \"8\": 187673, \"9\": 211180, \"10\": 211180, \"11\": 211180, \"12\": 211180, \"13\": 211180}, \"E\": {\"1\": 96008, \"2\": 96008, \"3\": 109443, \"4\": 109443, \"5\": 109443, \"6\": 109443, \"7\": 120133, \"8\": 120133, \"9\": 120133, \"10\": 187673, \"11\": 187673, \"12\": 211180, \"13\": 211180}}}, \"2\": {\"zone1\": {\"D\": {\"1\": 121603, \"2\": 121603, \"3\": 121603, \"4\": 121603, \"5\": 133481, \"6\": 133481, \"7\": 208525, \"8\": 208525, \"9\": 234644, \"10\": 234644, \"11\": 234644, \"12\": 234644, \"13\": 234644}, \"E\": {\"1\": 106675, \"2\": 106675, \"3\": 121603, \"4\": 121603, \"5\": 121603, \"6\": 121603, \"7\": 133481, \"8\": 133481, \"9\": 133481, \"10\": 208525, \"11\": 208525, \"12\": 234644, \"13\": 234644}}, \"zone2\": {\"D\": {\"1\": 115523, \"2\": 115523, \"3\": 115523, \"4\": 115523, \"5\": 126807, \"6\": 126807, \"7\": 198099, \"8\": 198099, \"9\": 222912, \"10\": 222912, \"11\": 222912, \"12\": 222912, \"13\": 222912}, \"E\": {\"1\": 101341, \"2\": 101341, \"3\": 115523, \"4\": 115523, \"5\": 115523, \"6\": 115523, \"7\": 126807, \"8\": 126807, \"9\": 126807, \"10\": 198099, \"11\": 198099, \"12\": 222912, \"13\": 222912}}, \"zone3\": {\"D\": {\"1\": 109443, \"2\": 109443, \"3\": 109443, \"4\": 109443, \"5\": 120133, \"6\": 120133, \"7\": 187673, \"8\": 187673, \"9\": 211180, \"10\": 211180, \"11\": 211180, \"12\": 211180, \"13\": 211180}, \"E\": {\"1\": 96008, \"2\": 96008, \"3\": 109443, \"4\": 109443, \"5\": 109443, \"6\": 109443, \"7\": 120133, \"8\": 120133, \"9\": 120133, \"10\": 187673, \"11\": 187673, \"12\": 211180, \"13\": 211180}}}, \"3\": {\"zone1\": {\"1\": 237930, \"2\": 310380, \"3\": 310380, \"4\": 379431, \"5\": 379431, \"6\": 489234, \"7\": 489234, \"8\": 489234, \"9\": 521853, \"10\": 521853, \"11\": 521853, \"12\": 546813, \"13\": 546813, \"14\": 658812, \"15\": 658812, \"16\": 862654, \"17\": 927850}, \"zone2\": {\"1\": 226034, \"2\": 294861, \"3\": 294861, \"4\": 360459, \"5\": 360459, \"6\": 464772, \"7\": 464772, \"8\": 464772, \"9\": 495760, \"10\": 495760, \"11\": 495760, \"12\": 519475, \"13\": 519475, \"14\": 625871, \"15\": 625871, \"16\": 819521, \"17\": 881458}, \"zone3\": {\"1\": 214137, \"2\": 279342, \"3\": 279342, \"4\": 341488, \"5\": 341488, \"6\": 440311, \"7\": 440311, \"8\": 440311, \"9\": 469668, \"10\": 469668, \"11\": 469668, \"12\": 492134, \"13\": 492134, \"14\": 592931, \"15\": 592931, \"16\": 776389, \"17\": 835065}}, \"4\": {\"zone1\": {\"1\": 237930, \"2\": 310380, \"3\": 310380, \"4\": 379431, \"5\": 379431, \"6\": 489234, \"7\": 489234, \"8\": 489234, \"9\": 521853, \"10\": 521853, \"11\": 521853, \"12\": 546813, \"13\": 546813, \"14\": 658812, \"15\": 658812, \"16\": 862654, \"17\": 927850}, \"zone2\": {\"1\": 226034, \"2\": 294861, \"3\": 294861, \"4\": 360459, \"5\": 360459, \"6\": 464772, \"7\": 464772, \"8\": 464772, \"9\": 495760, \"10\": 495760, \"11\": 495760, \"12\": 519475, \"13\": 519475, \"14\": 625871, \"15\": 625871, \"16\": 819521, \"17\": 881458}, \"zone3\": {\"1\": 214137, \"2\": 279342, \"3\": 279342, \"4\": 341488, \"5\": 341488, \"6\": 440311, \"7\": 440311, \"8\": 440311, \"9\": 469668, \"10\": 469668, \"11\": 469668, \"12\": 492134, \"13\": 492134, \"14\": 592931, \"15\": 592931, \"16\": 776389, \"17\": 835065}}, \"5\": {\"zone1\": {\"1\": 237930, \"2\": 310380, \"3\": 310380, \"4\": 379431, \"5\": 379431, \"6\": 489234, \"7\": 489234, \"8\": 489234, \"9\": 521853, \"10\": 521853, \"11\": 521853, \"12\": 546813, \"13\": 546813, \"14\": 658812, \"15\": 658812, \"16\": 862654, \"17\": 927850}, \"zone2\": {\"1\": 226034, \"2\": 294861, \"3\": 294861, \"4\": 360459, \"5\": 360459, \"6\": 464772, \"7\": 464772, \"8\": 464772, \"9\": 495760, \"10\": 495760, \"11\": 495760, \"12\": 519475, \"13\": 519475, \"14\": 625871, \"15\": 625871, \"16\": 819521, \"17\": 881458}, \"zone3\": {\"1\": 214137, \"2\": 279342, \"3\": 279342, \"4\": 341488, \"5\": 341488, \"6\": 440311, \"7\": 440311, \"8\": 440311, \"9\": 469668, \"10\": 469668, \"11\": 469668, \"12\": 492134, \"13\": 492134, \"14\": 592931, \"15\": 592931, \"16\": 776389, \"17\": 835065}}, \"6\": {\"zone1\": {\"1\": 237930, \"2\": 310380, \"3\": 310380, \"4\": 379431, \"5\": 379431, \"6\": 489234, \"7\": 489234, \"8\": 489234, \"9\": 521853, \"10\": 521853, \"11\": 521853, \"12\": 546813, \"13\": 546813, \"14\": 658812, \"15\": 658812, \"16\": 862654, \"17\": 927850}, \"zone2\": {\"1\": 226034, \"2\": 294861, \"3\": 294861, \"4\": 360459, \"5\": 360459, \"6\": 464772, \"7\": 464772, \"8\": 464772, \"9\": 495760, \"10\": 495760, \"11\": 495760, \"12\": 519475, \"13\": 519475, \"14\": 625871, \"15\": 625871, \"16\": 819521, \"17\": 881458}, \"zone3\": {\"1\": 214137, \"2\": 279342, \"3\": 279342, \"4\": 341488, \"5\": 341488, \"6\": 440311, \"7\": 440311, \"8\": 440311, \"9\": 469668, \"10\": 469668, \"11\": 469668, \"12\": 492134, \"13\": 492134, \"14\": 592931, \"15\": 592931, \"16\": 776389, \"17\": 835065}}}, \"cat12\": {\"zone1\": {\"D\": {\"1\": 61609, \"2\": 70229, \"3\": 70229, \"4\": 70229, \"5\": 77086, \"6\": 77086, \"7\": 120428, \"8\": 120428, \"9\": 135511, \"10\": 135511, \"11\": 135511, \"12\": 135511, \"13\": 135511}, \"E\": {\"1\": 61609, \"2\": 61609, \"3\": 70229, \"4\": 70229, \"5\": 70229, \"6\": 70229, \"7\": 77086, \"8\": 77086, \"9\": 77086, \"10\": 120428, \"11\": 120428, \"12\": 135511, \"13\": 135511}}, \"zone2\": {\"D\": {\"1\": 58529, \"2\": 66718, \"3\": 66718, \"4\": 66718, \"5\": 73232, \"6\": 73232, \"7\": 114407, \"8\": 114407, \"9\": 135511, \"10\": 135511, \"11\": 135511, \"12\": 135511, \"13\": 135511}, \"E\": {\"1\": 58529, \"2\": 58529, \"3\": 66718, \"4\": 66718, \"5\": 66718, \"6\": 66718, \"7\": 73232, \"8\": 73232, \"9\": 73232, \"10\": 114407, \"11\": 114407, \"12\": 128735, \"13\": 128735}}, \"zone3\": {\"D\": {\"1\": 55448, \"2\": 63206, \"3\": 63206, \"4\": 63206, \"5\": 69377, \"6\": 69377, \"7\": 108358, \"8\": 108358, \"9\": 121960, \"10\": 121960, \"11\": 121960, \"12\": 121960, \"13\": 121960}, \"E\": {\"1\": 55448, \"2\": 55448, \"3\": 63206, \"4\": 63206, \"5\": 63206, \"6\": 63206, \"7\": 69377, \"8\": 69377, \"9\": 69377, \"10\": 108385, \"11\": 108385, \"12\": 121960, \"13\": 121960}}}}}}', 0, '{\"bns\":{\"periode\":{\"1\":0.1,\"3\":0.1,\"6\":0.2,\"12\":0.2}}}', '[5]', 15000, 2000, 0, 0, NULL, '2024-12-16 16:01:25');

-- --------------------------------------------------------

--
-- Structure de la table `callme_log`
--

CREATE TABLE `callme_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `call_id` int(11) NOT NULL,
  `call_name` varchar(255) NOT NULL,
  `call_phone` varchar(255) NOT NULL,
  `call_motif` int(11) NOT NULL,
  `advisor_conclusion` int(11) NOT NULL,
  `reason` text DEFAULT NULL,
  `date_relance` date DEFAULT NULL,
  `advisor_user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `car_type`
--

CREATE TABLE `car_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_type` int(11) NOT NULL,
  `car_type_code` varchar(255) NOT NULL,
  `car_type_desc` varchar(255) NOT NULL,
  `car_type_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `car_type`
--

INSERT INTO `car_type` (`id`, `id_type`, `car_type_code`, `car_type_desc`, `car_type_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'VP', 'Véhicule_Particulier', 1, NULL, NULL),
(2, 2, 'AUTOCAR', 'Autocar', 1, NULL, NULL),
(3, 3, 'CAMION', 'Camion', 1, NULL, NULL),
(4, 4, 'CAMIONNETTE', 'Camionnette', 1, NULL, NULL),
(5, 5, 'TRACTEUR', 'Tracteur_Routier', 1, NULL, NULL),
(6, 6, 'ENGIN', 'Engins_de_Chantier', -1, NULL, NULL),
(7, 7, 'MOTO', 'Moto', 0, NULL, NULL),
(8, 8, 'TRACTEUR', 'Tracteur_Agricole', 1, NULL, NULL),
(9, 9, 'AMBULANCE', 'Ambulance', -1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

CREATE TABLE `city` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city` varchar(255) NOT NULL,
  `zone` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `city`
--

INSERT INTO `city` (`id`, `city`, `zone`, `created_at`, `updated_at`) VALUES
(1, 'Abidjan', 1, NULL, NULL),
(2, 'Anyama', 1, NULL, NULL),
(3, 'Songon', 1, NULL, NULL),
(4, 'Bingerville', 1, NULL, NULL),
(5, 'Yamoussokro', 1, NULL, NULL),
(6, 'Didiévi', 1, NULL, NULL),
(7, 'Tié N\'Diékro', 1, NULL, NULL),
(9, 'Dabou', 1, NULL, NULL),
(10, 'Bassam', 1, NULL, NULL),
(11, 'San Pedro', 1, NULL, NULL),
(12, 'Soubre', 1, NULL, NULL),
(13, 'Bouake', 1, NULL, NULL),
(14, 'Divo', 1, NULL, NULL),
(15, 'Toumodi', 1, NULL, NULL),
(16, 'Lakota', 1, NULL, NULL),
(17, 'Gagnoa', 1, NULL, NULL),
(18, 'Tiassalé', 1, NULL, NULL),
(19, 'Tiébissou', 1, NULL, NULL),
(20, 'Abengourou', 2, NULL, NULL),
(21, 'Bondoukou', 2, NULL, NULL),
(22, 'Daloa', 2, NULL, NULL),
(23, 'Ferkéssedougou', 2, NULL, NULL),
(24, 'Korogho', 2, NULL, NULL),
(25, 'Man', 2, NULL, NULL),
(26, 'Autres villes ou départements', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `commune`
--

CREATE TABLE `commune` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ville` varchar(255) NOT NULL,
  `commune` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `commune`
--

INSERT INTO `commune` (`id`, `ville`, `commune`, `created_at`, `updated_at`) VALUES
(1, 'Abidjan', 'Abobo', '2017-08-27 23:38:30', '2017-08-27 23:38:30'),
(2, 'Abidjan', 'Koumassi', '2017-08-27 23:40:02', '2017-08-27 23:40:02'),
(3, 'Abidjan', 'Cocody', '2017-08-27 23:40:02', '2017-08-27 23:40:02'),
(4, 'Abidjan', 'Port Bouet', '2017-08-27 23:40:02', '2017-08-27 23:40:02'),
(5, 'Abidjan', 'Marcory', '2017-08-27 23:40:02', '2017-08-27 23:40:02'),
(6, 'Abidjan', 'Yopougon', '2017-08-27 23:40:02', '2017-08-27 23:40:02'),
(7, 'Abidjan', 'Adjame', '2017-08-27 23:40:02', '2017-08-27 23:40:02'),
(8, 'Abidjan', 'Plateau', '2017-08-27 23:40:02', '2017-08-27 23:40:02'),
(9, 'Abidjan', 'Attécoubé', '2017-08-27 23:40:02', '2017-08-27 23:40:02'),
(10, 'Abidjan', 'Bingerville', '2017-08-27 23:40:02', '2017-08-27 23:40:02'),
(11, 'Abidjan', 'Treichville', '2017-12-28 00:00:00', '2017-12-28 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `delivery_order`
--

CREATE TABLE `delivery_order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quote_id` int(11) NOT NULL,
  `phone_client` varchar(255) NOT NULL,
  `delivery_location` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `delivery_signature`
--

CREATE TABLE `delivery_signature` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_sign` int(11) NOT NULL,
  `id_deliveryman` int(11) NOT NULL,
  `id_financial` int(11) NOT NULL,
  `id_operation` int(11) NOT NULL,
  `id_tour` int(11) NOT NULL,
  `amount_inbox` double NOT NULL,
  `sign_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `delivery_tour`
--

CREATE TABLE `delivery_tour` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `tour_number` varchar(255) NOT NULL,
  `tour_start_date` date NOT NULL,
  `deliveryman_id` int(11) NOT NULL,
  `delivery_tour_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `delivery_tour_order`
--

CREATE TABLE `delivery_tour_order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_tour_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `delivery_status` int(11) NOT NULL,
  `observation` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `delivery_tour_route`
--

CREATE TABLE `delivery_tour_route` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_tour_id` int(11) NOT NULL,
  `commune_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `espace_perso_account`
--

CREATE TABLE `espace_perso_account` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `remember_token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jobtitle` varchar(255) NOT NULL,
  `discount` double NOT NULL,
  `enabled` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`id`, `jobtitle`, `discount`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 'Non defini', 0.05, 1, NULL, NULL),
(2, 'Salarié', 0.05, 1, NULL, NULL),
(3, 'Artisan', 0.05, 1, NULL, NULL),
(4, 'Réligieux', 0.1, 1, NULL, NULL),
(5, 'Retraité', 0.1, 1, NULL, NULL),
(6, 'Conjoin au foyer', 0.1, 1, NULL, NULL),
(7, 'Sans emploi', 0.1, 1, NULL, NULL),
(8, 'Agent de recouvrement', 0, 1, NULL, NULL),
(9, 'VRP', 0, 1, NULL, NULL),
(10, 'Agent commercial', 0, 1, NULL, NULL),
(11, 'Etudiant', 0, 1, NULL, NULL),
(12, 'Salarié Aroli Courtage', 0, 0, NULL, NULL),
(13, 'Entreprise', 0, 0, NULL, NULL),
(14, 'N/A', 0, 0, NULL, NULL),
(15, 'Non defini', 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `log`
--

CREATE TABLE `log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_action` varchar(255) NOT NULL,
  `log_description` text NOT NULL,
  `createdAt` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `made_quote`
--

CREATE TABLE `made_quote` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quote_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `make`
--

CREATE TABLE `make` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `isMoto` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `make`
--

INSERT INTO `make` (`id`, `code`, `title`, `isMoto`, `created_at`, `updated_at`) VALUES
(1, 'ACURA', 'Acura', 0, NULL, NULL),
(2, 'ALFA', 'Alfa Romeo', 0, NULL, NULL),
(3, 'AMC', 'AMC', 0, NULL, NULL),
(4, 'ASTON', 'Aston Martin', 0, NULL, NULL),
(5, 'AUDI', 'Audi', 0, NULL, NULL),
(6, 'AVANTI', 'Avanti', 0, NULL, NULL),
(7, 'BENTL', 'Bentley', 0, NULL, NULL),
(8, 'BMW', 'BMW', 0, NULL, NULL),
(9, 'BUICK', 'Buick', 0, NULL, NULL),
(10, 'CAD', 'Cadillac', 0, NULL, NULL),
(11, 'CHEV', 'Chevrolet', 0, NULL, NULL),
(12, 'CHRY', 'Chrysler', 0, NULL, NULL),
(13, 'DAEW', 'Daewoo', 0, NULL, NULL),
(14, 'DAIHAT', 'Daihatsu', 0, NULL, NULL),
(15, 'DATSUN', 'Datsun', 0, NULL, NULL),
(16, 'DELOREAN', 'DeLorean', 0, NULL, NULL),
(17, 'DODGE', 'Dodge', 0, NULL, NULL),
(18, 'EAGLE', 'Eagle', 0, NULL, NULL),
(19, 'FER', 'Ferrari', 0, NULL, NULL),
(20, 'FIAT', 'FIAT', 0, NULL, NULL),
(21, 'FISK', 'Fisker', 0, NULL, NULL),
(22, 'FORD', 'Ford', 0, NULL, NULL),
(23, 'FREIGHT', 'Freightliner', 0, NULL, NULL),
(24, 'GEO', 'Geo', 0, NULL, NULL),
(25, 'GMC', 'GMC', 0, NULL, NULL),
(26, 'HONDA', 'Honda', 0, NULL, NULL),
(27, 'AMGEN', 'HUMMER', 0, NULL, NULL),
(28, 'HYUND', 'Hyundai', 0, NULL, NULL),
(29, 'INFIN', 'Infiniti', 0, NULL, NULL),
(30, 'ISU', 'Isuzu', 0, NULL, NULL),
(31, 'JAG', 'Jaguar', 0, NULL, NULL),
(32, 'JEEP', 'Jeep', 0, NULL, NULL),
(33, 'KIA', 'Kia', 0, NULL, NULL),
(34, 'LAM', 'Lamborghini', 0, NULL, NULL),
(35, 'LAN', 'Lancia', 0, NULL, NULL),
(36, 'ROV', 'Land Rover', 0, NULL, NULL),
(37, 'LEXUS', 'Lexus', 0, NULL, NULL),
(38, 'LINC', 'Lincoln', 0, NULL, NULL),
(39, 'LOTUS', 'Lotus', 0, NULL, NULL),
(40, 'MAS', 'Maserati', 0, NULL, NULL),
(41, 'MAYBACH', 'Maybach', 0, NULL, NULL),
(42, 'MAZDA', 'Mazda', 0, NULL, NULL),
(43, 'MCLAREN', 'McLaren', 0, NULL, NULL),
(44, 'MB', 'Mercedes-Benz', 0, NULL, NULL),
(45, 'MERC', 'Mercury', 0, NULL, NULL),
(46, 'MERKUR', 'Merkur', 0, NULL, NULL),
(47, 'MINI', 'MINI', 0, NULL, NULL),
(48, 'MIT', 'Mitsubishi', 0, NULL, NULL),
(49, 'NISSAN', 'Nissan', 0, NULL, NULL),
(50, 'OLDS', 'Oldsmobile', 0, NULL, NULL),
(51, 'PEUG', 'Peugeot', 0, NULL, NULL),
(52, 'PLYM', 'Plymouth', 0, NULL, NULL),
(53, 'PONT', 'Pontiac', 0, NULL, NULL),
(54, 'POR', 'Porsche', 0, NULL, NULL),
(55, 'RAM', 'RAM', 0, NULL, NULL),
(56, 'REN', 'Renault', 0, NULL, NULL),
(57, 'RR', 'Rolls-Royce', 0, NULL, NULL),
(58, 'SAAB', 'Saab', 0, NULL, NULL),
(59, 'SATURN', 'Saturn', 0, NULL, NULL),
(60, 'SCION', 'Scion', 0, NULL, NULL),
(61, 'SMART', 'smart', 0, NULL, NULL),
(62, 'SRT', 'SRT', 0, NULL, NULL),
(63, 'STERL', 'Sterling', 0, NULL, NULL),
(64, 'SUB', 'Subaru', 0, NULL, NULL),
(65, 'SUZUKI', 'Suzuki', 0, NULL, NULL),
(66, 'TESLA', 'Tesla', 0, NULL, NULL),
(67, 'TOYOTA', 'Toyota', 0, NULL, NULL),
(68, 'TRI', 'Triumph', 0, NULL, NULL),
(69, 'VOLKS', 'Volkswagen', 0, NULL, NULL),
(70, 'VOLVO', 'Volvo', 0, NULL, NULL),
(71, 'YUGO', 'Yugo', 0, NULL, NULL),
(72, 'KJLM', 'kjlm', 0, NULL, NULL),
(73, 'LKKKK', 'lkkkk', 0, NULL, NULL),
(74, 'LKLLM', 'lkllm', 0, NULL, NULL),
(75, 'RENAULT CLIO', 'RENAULT CLIO', 0, NULL, NULL),
(76, 'JK', 'JK', 1, NULL, NULL),
(77, 'JK', 'JK', 1, NULL, NULL),
(78, 'JK', 'JK', 1, NULL, NULL),
(79, 'KJL', 'KJL', 1, NULL, NULL),
(80, 'MLKJ', 'MLKJ', 1, NULL, NULL),
(81, '556', '556', 1, NULL, NULL),
(82, 'JKLM', 'JKLM', 1, NULL, NULL),
(83, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(84, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(85, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(86, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(87, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(88, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(89, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(90, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(91, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(92, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(93, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(94, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(95, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(96, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(97, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(98, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(99, 'MAZDA', 'MAZDA', 1, NULL, NULL),
(100, 'TAQ', 'TAQ', 0, NULL, NULL),
(101, 'TAQ', 'TAQ', 0, NULL, NULL),
(102, 'SKML', 'skml', 0, NULL, NULL),
(103, 'AZER', 'AZER', 0, NULL, NULL),
(104, 'AAA', 'aaa', 0, NULL, NULL),
(105, 'TATA', 'TATA', 0, NULL, NULL),
(106, 'DFAC', 'DFAC', 0, NULL, NULL),
(107, 'GEELY', 'GEELY', 0, NULL, NULL),
(108, 'HUNDA', 'HUNDA', 0, NULL, NULL),
(109, 'BMW', 'BMW', 0, NULL, NULL),
(110, 'SERIE 5', 'serie 5', 0, NULL, NULL),
(111, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(112, 'TATATINE', 'TATATINE', 0, NULL, NULL),
(113, 'LEONIDAS', 'LEONIDAS', 1, NULL, NULL),
(114, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(115, 'BMW', 'BMW', 1, NULL, NULL),
(116, 'CITROEN', 'Citroen', 0, NULL, NULL),
(117, 'FORD FOCUS', 'Ford Focus', 0, NULL, NULL),
(118, 'OPEL', 'opel', 0, NULL, NULL),
(119, 'SKODA', 'SKODA', 0, NULL, NULL),
(120, 'KTM', 'KTM', 1, NULL, NULL),
(121, 'KTM', 'KTM', 1, NULL, NULL),
(122, 'KTM', 'KTM', 1, NULL, NULL),
(123, 'RANGE ROVER', 'RANGE ROVER', 0, NULL, NULL),
(124, 'RENAULT LAGUNA', 'renault laguna', 0, NULL, NULL),
(125, 'TOYOTA', 'toyota', 0, NULL, NULL),
(126, 'SUZUKI', 'SUZUKI', 1, NULL, NULL),
(127, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(128, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(129, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(130, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(131, 'GREAT WALL', 'great wall', 0, NULL, NULL),
(132, 'KTM', 'KTM', 1, NULL, NULL),
(133, 'KYMCO', 'KYMCO', 1, NULL, NULL),
(134, 'HONDA', 'Honda', 0, NULL, NULL),
(135, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(136, 'KTM', 'KTM', 1, NULL, NULL),
(137, 'CHERY', 'CHERY', 0, NULL, NULL),
(138, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(139, 'RENAULT SCENIC', 'renault scenic', 0, NULL, NULL),
(140, 'KYMCO', 'KYMCO', 1, NULL, NULL),
(141, 'KYMCO', 'KYMCO', 1, NULL, NULL),
(142, 'KYMCO', 'KYMCO', 1, NULL, NULL),
(143, 'KYMCO', 'KYMCO', 1, NULL, NULL),
(144, 'SUZUKI', 'SUZUKI', 1, NULL, NULL),
(145, 'RENAULT LOGAN', 'Renault Logan', 0, NULL, NULL),
(146, 'APACHE', 'APACHE', 1, NULL, NULL),
(147, 'APACHE', 'APACHE', 1, NULL, NULL),
(148, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(149, 'DAF', 'DAF', 0, NULL, NULL),
(150, 'RATO', 'RATO', 1, NULL, NULL),
(151, 'RATO', 'RATO', 1, NULL, NULL),
(152, 'ROTA', 'ROTA', 1, NULL, NULL),
(153, 'RATO', 'RATO', 1, NULL, NULL),
(154, 'RATO', 'RATO', 1, NULL, NULL),
(155, 'RATO', 'RATO', 1, NULL, NULL),
(156, 'RATO', 'RATO', 1, NULL, NULL),
(157, 'YAMAYA', 'YAMAYA', 1, NULL, NULL),
(158, 'FORD FIESTA', 'Ford Fiesta', 0, NULL, NULL),
(159, 'FORD FIESTA', 'ford fiesta', 0, NULL, NULL),
(160, 'SANYA 125', 'SANYA 125', 1, NULL, NULL),
(161, 'JAABOUK', 'JAABOUK', 1, NULL, NULL),
(162, 'XXXX', 'XXXX', 1, NULL, NULL),
(163, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(164, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(165, 'NJHBN', 'NJHBN', 1, NULL, NULL),
(166, 'QWERGH', 'QWERGH', 1, NULL, NULL),
(167, 'LECITRAL', 'LECITRAL', 0, NULL, NULL),
(168, 'PEUGEOT PARTNER', 'Peugeot partner', 0, NULL, NULL),
(169, 'HAOJUE', 'HAOJUE', 0, NULL, NULL),
(170, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(171, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(172, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(173, 'MITSHIBICHI', 'mitshibichi', 0, NULL, NULL),
(174, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(175, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(176, 'MERCEDEZ BENZ', 'mercedez benz', 0, NULL, NULL),
(177, 'KTM', 'KTM', 1, NULL, NULL),
(178, 'KTM', 'KTM', 1, NULL, NULL),
(179, 'MASDA', 'masda', 0, NULL, NULL),
(180, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(181, 'SUZIKI', 'SUZIKI', 1, NULL, NULL),
(182, 'RENAULT KAPTUR', 'renault kaptur', 0, NULL, NULL),
(183, 'RENAULT KAPTUR', 'renault kaptur', 0, NULL, NULL),
(184, 'KTM', 'KTM', 1, NULL, NULL),
(185, 'KTM', 'KTM', 1, NULL, NULL),
(186, 'KTM 50', 'KTM 50', 1, NULL, NULL),
(187, 'KTM 50', 'KTM 50', 1, NULL, NULL),
(188, 'KTM X1', 'KTM X1', 1, NULL, NULL),
(189, 'KTM', 'KTM', 1, NULL, NULL),
(190, 'PEUGEOT 607', 'Peugeot 607', 0, NULL, NULL),
(191, 'DACIA', 'Dacia', 0, NULL, NULL),
(192, 'MERCEDES C220', 'MERCEDES C220', 0, NULL, NULL),
(193, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(194, 'IVECO', 'Iveco', 0, NULL, NULL),
(195, 'IVECO', 'iveco', 0, NULL, NULL),
(196, 'KTM', 'KTM', 1, NULL, NULL),
(197, 'KTM', 'KTM', 1, NULL, NULL),
(198, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(199, 'TVS ROCKZ', 'TVS ROCKZ', 1, NULL, NULL),
(200, 'SCANIA', 'Scania', 0, NULL, NULL),
(201, 'KTM 50', 'KTM 50', 1, NULL, NULL),
(202, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(203, 'KTM', 'KTM', 1, NULL, NULL),
(204, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(205, 'NX50CC', 'NX50CC', 1, NULL, NULL),
(206, 'SSANGYONG', 'SSANGYONG', 0, NULL, NULL),
(207, 'TVS', 'TVS', 1, NULL, NULL),
(208, 'DSDS', 'DSDS', 1, NULL, NULL),
(209, 'PEUGEOT 308', 'PEUGEOT 308', 0, NULL, NULL),
(210, 'PEUGEOT 406', 'peugeot 406', 0, NULL, NULL),
(211, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(212, 'KTM', 'KTM', 1, NULL, NULL),
(213, 'KTM', 'KTM', 1, NULL, NULL),
(214, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(215, 'DAYANG', 'DAYANG', 1, NULL, NULL),
(216, 'HAVAL H6', 'haval h6', 0, NULL, NULL),
(217, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(218, 'FORD RANGER', 'Ford ranger', 0, NULL, NULL),
(219, 'BMW', 'BMW', 1, NULL, NULL),
(220, 'HONDA', 'Honda', 0, NULL, NULL),
(221, 'NISSAN QASHQAI', 'nissan qashqai', 0, NULL, NULL),
(222, 'DONG FENG', 'dong feng', 0, NULL, NULL),
(223, 'MITSUBISHI COLT', 'MITSUBISHI COLT', 0, NULL, NULL),
(224, 'PIAGGIO', 'PIAGGIO', 1, NULL, NULL),
(225, 'KTM', 'KTM', 1, NULL, NULL),
(226, 'SUZUKI', 'SUZUKI', 1, NULL, NULL),
(227, 'NISSAN KICKS', 'nissan kicks', 0, NULL, NULL),
(228, 'KTM', 'KTM', 1, NULL, NULL),
(229, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(230, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(231, 'KTM', 'KTM', 1, NULL, NULL),
(232, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(233, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(234, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(235, 'KTM X1', 'KTM X1', 1, NULL, NULL),
(236, 'PEUGEOT 307', 'peugeot 307', 0, NULL, NULL),
(237, 'NISSAN PRIMERA 97', 'nissan primera 97', 0, NULL, NULL),
(238, 'KTM', 'KTM', 1, NULL, NULL),
(239, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(240, 'SAGNA', 'SAGNA', 1, NULL, NULL),
(241, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(242, 'SANYA', 'SANYA', 1, NULL, NULL),
(243, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(244, 'BMW', 'BMW', 1, NULL, NULL),
(245, 'CAN AM', 'CAN AM', 1, NULL, NULL),
(246, 'KAWASAKI', 'KAWASAKI', 1, NULL, NULL),
(247, 'SUZUKI DEZIRE', 'suzuki dezire', 0, NULL, NULL),
(248, 'BMW X3', 'BMW X3', 0, NULL, NULL),
(249, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(250, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(251, 'RENAULT MEGANE', 'RENAULT MEGANE', 0, NULL, NULL),
(252, 'FVDFVDFV', 'FVDFVDFV', 1, NULL, NULL),
(253, 'KTM', 'KTM', 1, NULL, NULL),
(254, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(255, 'RENAULT PREMIUM', 'Renault premium', 0, NULL, NULL),
(256, 'HUNDAY', 'HUNDAY', 1, NULL, NULL),
(257, 'BMW', 'BMW', 1, NULL, NULL),
(258, 'TVS', 'TVS', 1, NULL, NULL),
(259, 'SUZUKI', 'SUZUKI', 1, NULL, NULL),
(260, 'KTM', 'KTM', 1, NULL, NULL),
(261, 'UU', 'uu', 0, NULL, NULL),
(262, 'KTM', 'KTM', 1, NULL, NULL),
(263, 'TOYOTA YARIS', 'toyota yaris', 0, NULL, NULL),
(264, 'ROYAL MOTOR', 'ROYAL MOTOR', 1, NULL, NULL),
(265, 'KTM', 'KTM', 1, NULL, NULL),
(266, 'KTM', 'KTM', 1, NULL, NULL),
(267, 'YAMAHA T MAX XP 500', 'YAMAHA T MAX XP 500', 1, NULL, NULL),
(268, 'YAMAMOTO', 'YAMAMOTO', 1, NULL, NULL),
(269, 'SANIA', 'SANIA', 1, NULL, NULL),
(270, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(271, 'KTM', 'KTM', 1, NULL, NULL),
(272, 'HUNDAY SANTAFE', 'Hunday santafe', 0, NULL, NULL),
(273, 'C-CLASS 2000', 'C-class 2000', 0, NULL, NULL),
(274, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(275, 'FORD PUMA', 'FORD PUMA', 0, NULL, NULL),
(276, 'KTM', 'KTM', 1, NULL, NULL),
(277, 'JO', 'JO', 1, NULL, NULL),
(278, 'JO', 'JO', 1, NULL, NULL),
(279, 'HONDA', 'HONDA', 1, NULL, NULL),
(280, 'XXXX', 'XXXX', 1, NULL, NULL),
(281, 'XXXX', 'XXXX', 1, NULL, NULL),
(282, 'FFFF', 'FFFF', 1, NULL, NULL),
(283, 'XXXX', 'XXXX', 1, NULL, NULL),
(284, 'SSSS', 'SSSS', 1, NULL, NULL),
(285, 'XXXX', 'XXXX', 1, NULL, NULL),
(286, 'SUPER NUMéRO 1', 'SUPER NUMéRO 1', 1, NULL, NULL),
(287, 'SCOOTER', 'SCOOTER', 1, NULL, NULL),
(288, 'MERCEDES C180', 'MERCEDES C180', 0, NULL, NULL),
(289, 'KTM', 'KTM', 1, NULL, NULL),
(290, 'KTM', 'KTM', 1, NULL, NULL),
(291, 'KTM', 'KTM', 1, NULL, NULL),
(292, 'KTM', 'KTM', 1, NULL, NULL),
(293, 'TVS', 'TVS', 1, NULL, NULL),
(294, 'TVS', 'TVS', 1, NULL, NULL),
(295, 'TVS', 'TVS', 1, NULL, NULL),
(296, 'HONDA', 'HONDA', 1, NULL, NULL),
(297, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(298, 'MITSUBISHI AS2AW', 'MITSUBISHI AS2AW', 0, NULL, NULL),
(299, 'FORD KUGA', 'ford kuga', 0, NULL, NULL),
(300, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(301, 'HUYNDAI', 'huyndai', 0, NULL, NULL),
(302, 'KTM', 'KTM', 1, NULL, NULL),
(303, 'KTM', 'KTM', 1, NULL, NULL),
(304, 'KTM', 'KTM', 1, NULL, NULL),
(305, 'NISSAN', 'NISSAN', 1, NULL, NULL),
(306, 'KTM', 'KTM', 1, NULL, NULL),
(307, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(308, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(309, 'TOYOTA AVENSIS', 'toyota avensis', 0, NULL, NULL),
(310, 'HONDA', 'Honda', 0, NULL, NULL),
(311, 'RATO', 'RATO', 1, NULL, NULL),
(312, 'TVS', 'TVS', 1, NULL, NULL),
(313, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(314, 'FORD FUSION', 'Ford fusion', 0, NULL, NULL),
(315, 'JIALING', 'JIALING', 1, NULL, NULL),
(316, 'TVS', 'TVS', 1, NULL, NULL),
(317, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(318, 'KTM', 'KTM', 1, NULL, NULL),
(319, 'KTM', 'KTM', 1, NULL, NULL),
(320, 'KTM', 'KTM', 1, NULL, NULL),
(321, 'KTM', 'KTM', 1, NULL, NULL),
(322, 'APSONIC', 'apsonic', 0, NULL, NULL),
(323, 'APSONIC', 'apsonic', 0, NULL, NULL),
(324, 'KTM', 'KTM', 1, NULL, NULL),
(325, 'YAMAHA 125 RDX', 'YAMAHA 125 RDX', 1, NULL, NULL),
(326, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(327, 'TVS', 'TVS', 1, NULL, NULL),
(328, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(329, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(330, 'CITROEN', 'Citroen', 0, NULL, NULL),
(331, 'KTM', 'KTM', 1, NULL, NULL),
(332, 'SANILI', 'SANILI', 1, NULL, NULL),
(333, 'SANILI', 'SANILI', 1, NULL, NULL),
(334, 'KTM', 'KTM', 1, NULL, NULL),
(335, 'DEFAULT', 'default', 0, NULL, NULL),
(336, 'DEFAULT', 'default', 0, NULL, NULL),
(337, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(338, 'JAC', 'JAC', 0, NULL, NULL),
(339, 'CITROEN', 'citroen', 0, NULL, NULL),
(340, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(341, 'KTM', 'KTM', 1, NULL, NULL),
(342, 'TVS', 'TVS', 1, NULL, NULL),
(343, 'SUZUKI VITARA', 'suzuki vitara', 0, NULL, NULL),
(344, 'TVS', 'TVS', 1, NULL, NULL),
(345, 'VESPAS', 'VESPAS', 1, NULL, NULL),
(346, 'TOYOTA YARIS VERSO', 'toyota yaris verso', 0, NULL, NULL),
(347, 'TOYOTA YARIS VERSO', 'toyota yaris verso', 0, NULL, NULL),
(348, 'KTM', 'KTM', 1, NULL, NULL),
(349, 'KTM X1', 'KTM X1', 1, NULL, NULL),
(350, 'SYM', 'SYM', 1, NULL, NULL),
(351, 'SYM', 'SYM', 1, NULL, NULL),
(352, 'SYM', 'SYM', 1, NULL, NULL),
(353, 'SAFARI', 'SAFARI', 1, NULL, NULL),
(354, 'KTM', 'KTM', 1, NULL, NULL),
(355, 'PIAGGIO', 'PIAGGIO', 1, NULL, NULL),
(356, 'KIA MOTORS', 'KIA MOTORS', 0, NULL, NULL),
(357, 'KTM', 'KTM', 1, NULL, NULL),
(358, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(359, 'KTM', 'KTM', 1, NULL, NULL),
(360, 'BMW', 'BMW', 1, NULL, NULL),
(361, 'TOYOTA CAMRI', 'TOYOTA CAMRI', 1, NULL, NULL),
(362, 'KTM', 'KTM', 1, NULL, NULL),
(363, 'MOTO', 'MOTO', 1, NULL, NULL),
(364, 'SUZUKI', 'SUZUKI', 1, NULL, NULL),
(365, 'KTM', 'KTM', 1, NULL, NULL),
(366, 'MOTO KTM', 'MOTO KTM', 1, NULL, NULL),
(367, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(368, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(369, 'SHANGAN', 'Shangan', 0, NULL, NULL),
(370, 'KTM', 'KTM', 1, NULL, NULL),
(371, 'TOYOTA RAV4', 'TOYOTA RAV4', 0, NULL, NULL),
(372, 'TVS', 'TVS', 1, NULL, NULL),
(373, 'TVS', 'TVS', 1, NULL, NULL),
(374, 'SAFARI', 'SAFARI', 1, NULL, NULL),
(375, 'KTM', 'KTM', 1, NULL, NULL),
(376, 'KTM', 'KTM', 1, NULL, NULL),
(377, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(378, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(379, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(380, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(381, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(382, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(383, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(384, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(385, 'KTM', 'KTM', 1, NULL, NULL),
(386, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(387, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(388, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(389, 'KTM X1', 'KTM X1', 1, NULL, NULL),
(390, 'KTM', 'KTM', 1, NULL, NULL),
(391, 'KAWASAKI', 'KAWASAKI', 1, NULL, NULL),
(392, 'KAWASAKI', 'KAWASAKI', 1, NULL, NULL),
(393, 'KAWASAKI', 'KAWASAKI', 1, NULL, NULL),
(394, 'KAWASAKI', 'KAWASAKI', 1, NULL, NULL),
(395, 'KAWASAKI', 'KAWASAKI', 1, NULL, NULL),
(396, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(397, 'KTM', 'KTM', 1, NULL, NULL),
(398, 'KTM', 'KTM', 1, NULL, NULL),
(399, 'KTM', 'KTM', 1, NULL, NULL),
(400, 'YAMAHA', 'yamaha', 0, NULL, NULL),
(401, 'TOYOTA TUBOX', 'TOYOTA TUBOX', 0, NULL, NULL),
(402, 'KAWASAKI', 'KAWASAKI', 1, NULL, NULL),
(403, 'KAWASAKI', 'KAWASAKI', 1, NULL, NULL),
(404, 'KAWASAKI', 'KAWASAKI', 1, NULL, NULL),
(405, 'KAWASAKI', 'KAWASAKI', 1, NULL, NULL),
(406, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(407, 'SUZUKI', 'SUZUKI', 1, NULL, NULL),
(408, 'YAMAHA YBR 125G', 'YAMAHA YBR 125G', 1, NULL, NULL),
(409, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(410, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(411, 'HUSQVARNA', 'HUSQVARNA', 1, NULL, NULL),
(412, 'SANYA', 'SANYA', 1, NULL, NULL),
(413, 'CAMICO', 'CAMICO', 1, NULL, NULL),
(414, 'KTM', 'KTM', 1, NULL, NULL),
(415, 'KTM', 'KTM', 1, NULL, NULL),
(416, 'KTM', 'KTM', 1, NULL, NULL),
(417, 'KTM', 'KTM', 1, NULL, NULL),
(418, 'KTM', 'KTM', 1, NULL, NULL),
(419, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(420, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(421, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(422, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(423, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(424, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(425, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(426, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(427, 'NISSAN ALMERA TINO', 'Nissan Almera Tino', 0, NULL, NULL),
(428, 'BMW', 'BMW', 1, NULL, NULL),
(429, 'CONSECTETUR A EU TE', 'CONSECTETUR A EU TE', 1, NULL, NULL),
(430, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(431, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(432, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(433, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(434, 'SAFARI', 'SAFARI', 1, NULL, NULL),
(435, 'BMW', 'BMW', 1, NULL, NULL),
(436, 'KTM', 'KTM', 1, NULL, NULL),
(437, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(438, 'QLINK KEEWAY', 'QLINK KEEWAY', 1, NULL, NULL),
(439, 'KTM', 'KTM', 1, NULL, NULL),
(440, 'KTM', 'KTM', 1, NULL, NULL),
(441, 'KTM', 'KTM', 1, NULL, NULL),
(442, 'KTM', 'KTM', 1, NULL, NULL),
(443, 'MOTOCYCLETTE PEUGEOT', 'MOTOCYCLETTE PEUGEOT', 1, NULL, NULL),
(444, 'MOTOCYCLETTE PEUGEOT', 'MOTOCYCLETTE PEUGEOT', 1, NULL, NULL),
(445, 'KTM', 'KTM', 1, NULL, NULL),
(446, 'R1200', 'R1200', 1, NULL, NULL),
(447, 'HYNDAI ACCENT', 'HYNDAI ACCENT', 0, NULL, NULL),
(448, 'KTM', 'KTM', 1, NULL, NULL),
(449, 'KTM', 'KTM', 1, NULL, NULL),
(450, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(451, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(452, 'KTM', 'KTM', 1, NULL, NULL),
(453, 'KTM', 'KTM', 1, NULL, NULL),
(454, 'APPSONICK', 'APPSONICK', 1, NULL, NULL),
(455, 'KTM', 'KTM', 1, NULL, NULL),
(456, 'PART', 'PART', 1, NULL, NULL),
(457, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(458, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(459, 'KTM', 'KTM', 1, NULL, NULL),
(460, 'KTM', 'KTM', 1, NULL, NULL),
(461, 'SONLINK', 'SONLINK', 1, NULL, NULL),
(462, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(463, 'KTM', 'KTM', 1, NULL, NULL),
(464, 'KTM', 'KTM', 1, NULL, NULL),
(465, 'SUZUKI BALENO', 'suzuki baleno', 0, NULL, NULL),
(466, 'RENAULT', 'RENAULT', 1, NULL, NULL),
(467, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(468, 'SOWMOTOR', 'SOWMOTOR', 1, NULL, NULL),
(469, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(470, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(471, 'KTM 50', 'KTM 50', 1, NULL, NULL),
(472, 'KTM', 'KTM', 1, NULL, NULL),
(473, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(474, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(475, 'KTM', 'KTM', 1, NULL, NULL),
(476, 'KTM X1', 'KTM X1', 1, NULL, NULL),
(477, 'MOTO', 'MOTO', 1, NULL, NULL),
(478, 'YAMAHA YBR 125', 'YAMAHA YBR 125', 1, NULL, NULL),
(479, 'YAMAHA YBR 125', 'YAMAHA YBR 125', 1, NULL, NULL),
(480, 'YAMAHA YBR 125', 'YAMAHA YBR 125', 1, NULL, NULL),
(481, 'CAMICO CITY', 'CAMICO CITY', 1, NULL, NULL),
(482, 'RATO WINGER GTR', 'RATO WINGER GTR', 1, NULL, NULL),
(483, 'ROTO', 'ROTO', 1, NULL, NULL),
(484, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(485, 'PHOUPHOUET DONATIEN', 'PHOUPHOUET DONATIEN', 1, NULL, NULL),
(486, 'SUZUKI', 'SUZUKI', 1, NULL, NULL),
(487, 'KTM', 'KTM', 1, NULL, NULL),
(488, 'KTM', 'KTM', 1, NULL, NULL),
(489, 'SONLINK', 'SONLINK', 1, NULL, NULL),
(490, 'KTM', 'KTM', 1, NULL, NULL),
(491, 'TVS', 'TVS', 1, NULL, NULL),
(492, 'PART', 'PART', 1, NULL, NULL),
(493, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(494, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(495, 'LION MOTO', 'LION MOTO', 1, NULL, NULL),
(496, 'V', 'V', 1, NULL, NULL),
(497, 'SAC', 'SAC', 1, NULL, NULL),
(498, 'KTM', 'KTM', 1, NULL, NULL),
(499, 'HUANGHE', 'HUANGHE', 1, NULL, NULL),
(500, 'HARLEY-DAVIDSON', 'HARLEY-DAVIDSON', 1, NULL, NULL),
(501, 'KTM', 'KTM', 1, NULL, NULL),
(502, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(503, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(504, 'APSONIC 170 Z-ONE', 'APSONIC 170 Z-ONE', 1, NULL, NULL),
(505, 'TEST', 'TEST', 1, NULL, NULL),
(506, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(507, 'TOYOTA AVENSIS VERSO', 'toyota avensis verso', 0, NULL, NULL),
(508, 'KTM', 'KTM', 1, NULL, NULL),
(509, 'KTM', 'KTM', 1, NULL, NULL),
(510, 'RATO', 'RATO', 1, NULL, NULL),
(511, 'RATO', 'RATO', 1, NULL, NULL),
(512, 'RATO', 'RATO', 1, NULL, NULL),
(513, 'RATO', 'RATO', 1, NULL, NULL),
(514, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(515, 'MG', 'mg', 0, NULL, NULL),
(516, 'KTM', 'KTM', 1, NULL, NULL),
(517, 'KTM', 'KTM', 1, NULL, NULL),
(518, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(519, 'KTM POWERK', 'KTM POWERK', 1, NULL, NULL),
(520, 'KTM', 'KTM', 1, NULL, NULL),
(521, 'KTM', 'KTM', 1, NULL, NULL),
(522, 'KTM', 'KTM', 1, NULL, NULL),
(523, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(524, 'FDDFDFDFDFDF', 'FDDFDFDFDFDF', 1, NULL, NULL),
(525, 'FDDFDFDFDFDF', 'FDDFDFDFDFDF', 1, NULL, NULL),
(526, 'DFDFFDDF', 'DFDFFDDF', 1, NULL, NULL),
(527, 'BMW', 'BMW', 1, NULL, NULL),
(528, 'BMW', 'BMW', 1, NULL, NULL),
(529, 'MEYLUN', 'MEYLUN', 1, NULL, NULL),
(530, 'MAZDA', 'MAZDA', 1, NULL, NULL),
(531, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(532, 'TVS', 'TVS', 1, NULL, NULL),
(533, 'TVS', 'TVS', 1, NULL, NULL),
(534, 'BMW', 'BMW', 1, NULL, NULL),
(535, 'CHANGAN', 'changan', 0, NULL, NULL),
(536, 'YAM', 'YAM', 1, NULL, NULL),
(537, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(538, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(539, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(540, 'KTM', 'KTM', 1, NULL, NULL),
(541, 'TOYOTA PAJERO', 'Toyota Pajero', 0, NULL, NULL),
(542, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(543, 'KTM', 'KTM', 1, NULL, NULL),
(544, 'KTM', 'KTM', 1, NULL, NULL),
(545, 'KTM', 'KTM', 1, NULL, NULL),
(546, 'KTM', 'KTM', 1, NULL, NULL),
(547, 'KTM', 'KTM', 1, NULL, NULL),
(548, 'KTM', 'KTM', 1, NULL, NULL),
(549, 'KTM', 'KTM', 1, NULL, NULL),
(550, 'KTM', 'KTM', 1, NULL, NULL),
(551, 'KTM', 'KTM', 1, NULL, NULL),
(552, 'KTM', 'KTM', 1, NULL, NULL),
(553, 'KTM', 'KTM', 1, NULL, NULL),
(554, 'JETOUR X70', 'jetour x70', 0, NULL, NULL),
(555, 'SUZUKI', 'SUZUKI', 1, NULL, NULL),
(556, 'CATERPILLAR', 'CATERPILLAR', 0, NULL, NULL),
(557, 'PEUGEOT 407', 'peugeot 407', 0, NULL, NULL),
(558, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(559, 'KTM', 'KTM', 1, NULL, NULL),
(560, 'PEUGEOT 306', 'Peugeot 306', 0, NULL, NULL),
(561, 'QASKI 125-30', 'QASKI 125-30', 1, NULL, NULL),
(562, 'QASKI 125-30', 'QASKI 125-30', 1, NULL, NULL),
(563, 'QASKI 125-30', 'QASKI 125-30', 1, NULL, NULL),
(564, 'MITSUBISHI MONTERO', 'mitsubishi montero', 0, NULL, NULL),
(565, 'KTM', 'KTM', 1, NULL, NULL),
(566, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(567, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(568, 'BMW', 'BMW', 1, NULL, NULL),
(569, 'HONDA', 'HONDA', 1, NULL, NULL),
(570, 'FORD MONDEO', 'ford mondeo', 0, NULL, NULL),
(571, 'SANYA', 'SANYA', 1, NULL, NULL),
(572, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(573, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(574, 'GAC', 'GAC', 0, NULL, NULL),
(575, 'TOYOTA VERSO', 'toyota verso', 0, NULL, NULL),
(576, 'KTM', 'KTM', 1, NULL, NULL),
(577, 'KTM POWER K', 'KTM POWER K', 1, NULL, NULL),
(578, 'KTM', 'KTM', 1, NULL, NULL),
(579, 'KTM', 'KTM', 1, NULL, NULL),
(580, 'KTM', 'KTM', 1, NULL, NULL),
(581, 'SAFARI', 'SAFARI', 1, NULL, NULL),
(582, 'SAFARI', 'SAFARI', 1, NULL, NULL),
(583, 'SAFARI', 'SAFARI', 1, NULL, NULL),
(584, 'SAFARI', 'SAFARI', 1, NULL, NULL),
(585, 'SAFARI', 'SAFARI', 1, NULL, NULL),
(586, 'SAFARI', 'SAFARI', 1, NULL, NULL),
(587, 'NISSAN PICK UP', 'NISSAN PICK UP', 0, NULL, NULL),
(588, 'ORIGINAL SKF', 'ORIGINAL SKF', 1, NULL, NULL),
(589, 'SUZUKI ALTO', 'suzuki alto', 0, NULL, NULL),
(590, 'KTM', 'KTM', 1, NULL, NULL),
(591, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(592, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(593, '123456', '123456', 0, NULL, NULL),
(594, '123456\nEXPR 837984501 + 963302534', '123456\nexpr 837984501 + 963302534', 0, NULL, NULL),
(595, '123456', '123456', 0, NULL, NULL),
(596, '${@VAR_DUMP(MD5(730322271))};', '${@var_dump(md5(730322271))};', 0, NULL, NULL),
(597, '123456', '123456', 0, NULL, NULL),
(598, '123456|EXPR 806107212 + 838518727', '123456|expr 806107212 + 838518727', 0, NULL, NULL),
(599, '123456', '123456', 0, NULL, NULL),
(600, '/*1*/{{873287870+968942152}}', '/*1*/{{873287870+968942152}}', 0, NULL, NULL),
(601, '\'-VAR_DUMP(MD5(638086688))-\'', '\'-var_dump(md5(638086688))-\'', 0, NULL, NULL),
(602, '123456', '123456', 0, NULL, NULL),
(603, '123456', '123456', 0, NULL, NULL),
(604, '123456$(EXPR 850430087 + 822761597)', '123456$(expr 850430087 + 822761597)', 0, NULL, NULL),
(605, '123456', '123456', 0, NULL, NULL),
(606, '${859425996+932632514}', '${859425996+932632514}', 0, NULL, NULL),
(607, '${929052510+846453147}', '${929052510+846453147}', 0, NULL, NULL),
(608, '123456', '123456', 0, NULL, NULL),
(609, '123456', '123456', 0, NULL, NULL),
(610, '123456&SET /A 905024245+964331901', '123456&set /A 905024245+964331901', 0, NULL, NULL),
(611, '123456\'AND/**/EXTRACTVALUE(1,CONCAT(CHAR(126),MD5(', '123456\'and/**/extractvalue(1,concat(char(126),md5(1879133394)))and\'', 0, NULL, NULL),
(612, '${(861943309+995014708)?C}', '${(861943309+995014708)?c}', 0, NULL, NULL),
(613, '123456', '123456', 0, NULL, NULL),
(614, '123456', '123456', 0, NULL, NULL),
(615, 'EXPR 818421866 + 867992591', 'expr 818421866 + 867992591', 0, NULL, NULL),
(616, '123456\"AND/**/EXTRACTVALUE(1,CONCAT(CHAR(126),MD5(', '123456\"and/**/extractvalue(1,concat(char(126),md5(1045686825)))and\"', 0, NULL, NULL),
(617, '#SET($C=932825685+854562094)${C}$C', '#set($c=932825685+854562094)${c}$c', 0, NULL, NULL),
(618, '123456', '123456', 0, NULL, NULL),
(619, '123456', '123456', 0, NULL, NULL),
(620, 'EXTRACTVALUE(1,CONCAT(CHAR(126),MD5(1371884490)))', 'extractvalue(1,concat(char(126),md5(1371884490)))', 0, NULL, NULL),
(621, '123456', '123456', 0, NULL, NULL),
(622, '123456', '123456', 0, NULL, NULL),
(623, '123456\'AND(SELECT\'1\'FROM/**/CAST(MD5(1442812732)AS', '123456\'and(select\'1\'from/**/cast(md5(1442812732)as/**/int))>\'0', 0, NULL, NULL),
(624, '123456', '123456', 0, NULL, NULL),
(625, '<%- 898803022+917489939 %>', '<%- 898803022+917489939 %>', 0, NULL, NULL),
(626, '123456/**/AND/**/CAST(MD5(\'1129785804\')AS/**/INT)>', '123456/**/and/**/cast(md5(\'1129785804\')as/**/int)>0', 0, NULL, NULL),
(627, '123456', '123456', 0, NULL, NULL),
(628, 'CONVERT(INT,SYS.FN_SQLVARBASETOSTR(HASHBYTES(\'MD5\'', 'convert(int,sys.fn_sqlvarbasetostr(HashBytes(\'MD5\',\'1637466589\')))', 0, NULL, NULL),
(629, '123456', '123456', 0, NULL, NULL),
(630, '123456\'AND/**/CONVERT(INT,SYS.FN_SQLVARBASETOSTR(H', '123456\'and/**/convert(int,sys.fn_sqlvarbasetostr(HashBytes(\'MD5\',\'1362528943\')))>\'0', 0, NULL, NULL),
(631, '123456', '123456', 0, NULL, NULL),
(632, '123456鎈\'\"\\(', '123456鎈\'\"\\(', 0, NULL, NULL),
(633, '123456', '123456', 0, NULL, NULL),
(634, '123456\'\"\\(', '123456\'\"\\(', 0, NULL, NULL),
(635, '123456', '123456', 0, NULL, NULL),
(636, '123456', '123456', 0, NULL, NULL),
(637, '(SELECT*FROM(SELECT+SLEEP(0)UNION/**/SELECT+1)A)', '(select*from(select+sleep(0)union/**/select+1)a)', 0, NULL, NULL),
(638, '(SELECT*FROM(SELECT+SLEEP(2)UNION/**/SELECT+1)A)', '(select*from(select+sleep(2)union/**/select+1)a)', 0, NULL, NULL),
(639, '123456\'AND(SELECT*FROM(SELECT+SLEEP(0))A/**/UNION/', '123456\'and(select*from(select+sleep(0))a/**/union/**/select+1)=\'', 0, NULL, NULL),
(640, '123456\'AND(SELECT*FROM(SELECT+SLEEP(2))A/**/UNION/', '123456\'and(select*from(select+sleep(2))a/**/union/**/select+1)=\'', 0, NULL, NULL),
(641, '123456\"AND(SELECT*FROM(SELECT+SLEEP(0))A/**/UNION/', '123456\"and(select*from(select+sleep(0))a/**/union/**/select+1)=\"', 0, NULL, NULL),
(642, '123456\"AND(SELECT*FROM(SELECT+SLEEP(2))A/**/UNION/', '123456\"and(select*from(select+sleep(2))a/**/union/**/select+1)=\"', 0, NULL, NULL),
(643, '123456/**/AND(SELECT+1/**/FROM/**/PG_SLEEP(0))>0/*', '123456/**/and(select+1/**/from/**/pg_sleep(0))>0/**/', 0, NULL, NULL),
(644, '123456/**/AND(SELECT+1/**/FROM/**/PG_SLEEP(2))>0/*', '123456/**/and(select+1/**/from/**/pg_sleep(2))>0/**/', 0, NULL, NULL),
(645, '123456\'/**/AND(SELECT\'1\'FROM/**/PG_SLEEP(0))::TEXT', '123456\'/**/and(select\'1\'from/**/pg_sleep(0))::text>\'0', 0, NULL, NULL),
(646, '123456\'/**/AND(SELECT\'1\'FROM/**/PG_SLEEP(2))::TEXT', '123456\'/**/and(select\'1\'from/**/pg_sleep(2))::text>\'0', 0, NULL, NULL),
(647, '123456/**/AND(SELECT+1)>0WAITFOR/**/DELAY\'0:0:0\'/*', '123456/**/and(select+1)>0waitfor/**/delay\'0:0:0\'/**/', 0, NULL, NULL),
(648, '123456/**/AND(SELECT+1)>0WAITFOR/**/DELAY\'0:0:2\'/*', '123456/**/and(select+1)>0waitfor/**/delay\'0:0:2\'/**/', 0, NULL, NULL),
(649, '123456\'AND(SELECT+1)>0WAITFOR/**/DELAY\'0:0:0', '123456\'and(select+1)>0waitfor/**/delay\'0:0:0', 0, NULL, NULL),
(650, '123456\'AND(SELECT+1)>0WAITFOR/**/DELAY\'0:0:2', '123456\'and(select+1)>0waitfor/**/delay\'0:0:2', 0, NULL, NULL),
(651, '123456/**/AND/**/4=DBMS_PIPE.RECEIVE_MESSAGE(\'A\',0', '123456/**/and/**/4=DBMS_PIPE.RECEIVE_MESSAGE(\'a\',0)', 0, NULL, NULL),
(652, '123456/**/AND/**/4=DBMS_PIPE.RECEIVE_MESSAGE(\'M\',2', '123456/**/and/**/4=DBMS_PIPE.RECEIVE_MESSAGE(\'m\',2)', 0, NULL, NULL),
(653, '123456\'/**/AND/**/DBMS_PIPE.RECEIVE_MESSAGE(\'T\',0)', '123456\'/**/and/**/DBMS_PIPE.RECEIVE_MESSAGE(\'t\',0)=\'t', 0, NULL, NULL),
(654, '123456\'/**/AND/**/DBMS_PIPE.RECEIVE_MESSAGE(\'W\',2)', '123456\'/**/and/**/DBMS_PIPE.RECEIVE_MESSAGE(\'w\',2)=\'w', 0, NULL, NULL),
(655, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(656, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(657, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(658, 'QASKI', 'QASKI', 1, NULL, NULL),
(659, 'RANGE ROVER AUTOBIOGRAPHY', 'Range Rover Autobiography', 0, NULL, NULL),
(660, 'FRUEHAUF', 'FRUEHAUF', 0, NULL, NULL),
(661, 'TOYOTA COROLLA', 'Toyota Corolla', 0, NULL, NULL),
(662, 'TOYOTA COROLLA', 'Toyota Corolla', 0, NULL, NULL),
(663, 'SPORTAGE', 'sportage', 0, NULL, NULL),
(664, 'MOTOCYCLETTE', 'MOTOCYCLETTE', 1, NULL, NULL),
(665, 'KTM', 'KTM', 1, NULL, NULL),
(666, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(667, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(668, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(669, 'TVS', 'TVS', 1, NULL, NULL),
(670, 'KIAMOTORS', 'kiamotors', 0, NULL, NULL),
(671, 'HONDA', 'HONDA', 1, NULL, NULL),
(672, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(673, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(674, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(675, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(676, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(677, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(678, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(679, 'XXXXXXXXX', 'XXXXXXXXX', 1, NULL, NULL),
(680, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(681, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(682, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(683, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(684, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(685, 'HAOHUE', 'HAOHUE', 1, NULL, NULL),
(686, '1', '1', 0, NULL, NULL),
(687, '1', '1', 0, NULL, NULL),
(688, '1\'\"', '1\'\"', 0, NULL, NULL),
(689, '1', '1', 0, NULL, NULL),
(690, '\\', '\\', 0, NULL, NULL),
(691, '-1 OR 2+190-190-1=0+0+0+1 --', '-1 OR 2+190-190-1=0+0+0+1 --', 0, NULL, NULL),
(692, '1\0????', '1\0????', 0, NULL, NULL),
(693, '-1 OR 3+190-190-1=0+0+0+1 --', '-1 OR 3+190-190-1=0+0+0+1 --', 0, NULL, NULL),
(694, '@@PA62Z', '@@pA62Z', 0, NULL, NULL),
(695, '-1 OR 3*2<(0+5+190-190) --', '-1 OR 3*2<(0+5+190-190) --', 0, NULL, NULL),
(696, 'JYI=', 'JyI=', 0, NULL, NULL),
(697, '-1 OR 3*2>(0+5+190-190) --', '-1 OR 3*2>(0+5+190-190) --', 0, NULL, NULL),
(698, '?\'?\"', '?\'?\"', 0, NULL, NULL),
(699, '-1 OR 2+157-157-1=0+0+0+1', '-1 OR 2+157-157-1=0+0+0+1', 0, NULL, NULL),
(700, '?\'\'?\"\"', '?\'\'?\"\"', 0, NULL, NULL),
(701, '-1 OR 3+157-157-1=0+0+0+1', '-1 OR 3+157-157-1=0+0+0+1', 0, NULL, NULL),
(702, '(SELECT CONVERT(INT,CHAR(65)))', '(select convert(int,CHAR(65)))', 0, NULL, NULL),
(703, '-1 OR 3*2<(0+5+157-157)', '-1 OR 3*2<(0+5+157-157)', 0, NULL, NULL),
(704, '-1 OR 3*2>(0+5+157-157)', '-1 OR 3*2>(0+5+157-157)', 0, NULL, NULL),
(705, '-1\' OR 2+48-48-1=0+0+0+1 --', '-1\' OR 2+48-48-1=0+0+0+1 --', 0, NULL, NULL),
(706, '-1\' OR 3+48-48-1=0+0+0+1 --', '-1\' OR 3+48-48-1=0+0+0+1 --', 0, NULL, NULL),
(707, '-1\' OR 3*2<(0+5+48-48) --', '-1\' OR 3*2<(0+5+48-48) --', 0, NULL, NULL),
(708, '-1\' OR 3*2>(0+5+48-48) --', '-1\' OR 3*2>(0+5+48-48) --', 0, NULL, NULL),
(709, '-1\' OR 2+68-68-1=0+0+0+1 OR \'COPEAMFR\'=\'', '-1\' OR 2+68-68-1=0+0+0+1 or \'CoPEaMFR\'=\'', 0, NULL, NULL),
(710, '-1\' OR 3+68-68-1=0+0+0+1 OR \'COPEAMFR\'=\'', '-1\' OR 3+68-68-1=0+0+0+1 or \'CoPEaMFR\'=\'', 0, NULL, NULL),
(711, '-1\' OR 3*2<(0+5+68-68) OR \'COPEAMFR\'=\'', '-1\' OR 3*2<(0+5+68-68) or \'CoPEaMFR\'=\'', 0, NULL, NULL),
(712, '-1\' OR 3*2>(0+5+68-68) OR \'COPEAMFR\'=\'', '-1\' OR 3*2>(0+5+68-68) or \'CoPEaMFR\'=\'', 0, NULL, NULL),
(713, '-1\" OR 2+41-41-1=0+0+0+1 --', '-1\" OR 2+41-41-1=0+0+0+1 --', 0, NULL, NULL),
(714, '-1\" OR 3+41-41-1=0+0+0+1 --', '-1\" OR 3+41-41-1=0+0+0+1 --', 0, NULL, NULL),
(715, '-1\" OR 3*2<(0+5+41-41) --', '-1\" OR 3*2<(0+5+41-41) --', 0, NULL, NULL),
(716, '-1\" OR 3*2>(0+5+41-41) --', '-1\" OR 3*2>(0+5+41-41) --', 0, NULL, NULL),
(717, 'IF(NOW()=SYSDATE(),SLEEP(6.436),0)/*\'XOR(IF(NOW()=', 'if(now()=sysdate(),sleep(6.436),0)/*\'XOR(if(now()=sysdate(),sleep(6.436),0))OR\'\"XOR(if(now()=sysdate(),sleep(6.436),0))OR\"*/', 0, NULL, NULL),
(718, '(SELECT(0)FROM(SELECT(SLEEP(6.436)))V)/*\'+(SELECT(', '(select(0)from(select(sleep(6.436)))v)/*\'+(select(0)from(select(sleep(6.436)))v)+\'\"+(select(0)from(select(sleep(6.436)))v)+\"*/', 0, NULL, NULL),
(719, '-1; WAITFOR DELAY \'0:0:6.436\' --', '-1; waitfor delay \'0:0:6.436\' --', 0, NULL, NULL),
(720, '-1); WAITFOR DELAY \'0:0:9.654\' --', '-1); waitfor delay \'0:0:9.654\' --', 0, NULL, NULL),
(721, '1 WAITFOR DELAY \'0:0:9.654\' --', '1 waitfor delay \'0:0:9.654\' --', 0, NULL, NULL),
(722, 'JSFVCCZD\'; WAITFOR DELAY \'0:0:3.218\' --', 'JsFVCCzd\'; waitfor delay \'0:0:3.218\' --', 0, NULL, NULL),
(723, '-1;SELECT PG_SLEEP(3.218); --', '-1;select pg_sleep(3.218); --', 0, NULL, NULL),
(724, '-1);SELECT PG_SLEEP(6.436); --', '-1);select pg_sleep(6.436); --', 0, NULL, NULL),
(725, '-1));SELECT PG_SLEEP(6.436); --', '-1));select pg_sleep(6.436); --', 0, NULL, NULL),
(726, 'UX6PISAE\';SELECT PG_SLEEP(9.654); --', 'UX6pisAe\';select pg_sleep(9.654); --', 0, NULL, NULL),
(727, 'UN7OXXXU\');SELECT PG_SLEEP(3.218); --', 'un7oXxxu\');select pg_sleep(3.218); --', 0, NULL, NULL),
(728, '7FZUGB8O\'));SELECT PG_SLEEP(3.218); --', '7fZUGB8O\'));select pg_sleep(3.218); --', 0, NULL, NULL),
(729, '1', '1', 0, NULL, NULL),
(730, '1', '1', 0, NULL, NULL),
(731, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(732, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(733, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(734, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(735, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(736, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(737, 'APSONIC 50', 'APSONIC 50', 1, NULL, NULL),
(738, 'APSONIC 50', 'APSONIC 50', 1, NULL, NULL),
(739, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(740, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(741, 'MBK', 'MBK', 1, NULL, NULL),
(742, 'MBK', 'MBK', 1, NULL, NULL),
(743, 'ROYAL ENFIELD', 'ROYAL ENFIELD', 1, NULL, NULL),
(744, 'HAOJOUE', 'HAOJOUE', 1, NULL, NULL),
(745, 'HAOJOUE', 'HAOJOUE', 1, NULL, NULL),
(746, 'HAOJOUE', 'HAOJOUE', 1, NULL, NULL),
(747, 'MBK', 'MBK', 1, NULL, NULL),
(748, 'MBK', 'MBK', 1, NULL, NULL),
(749, 'KTM', 'KTM', 1, NULL, NULL),
(750, 'HAOJOUE', 'HAOJOUE', 1, NULL, NULL),
(751, 'KTM', 'KTM', 1, NULL, NULL),
(752, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(753, 'KTM', 'KTM', 1, NULL, NULL),
(754, 'KTM', 'KTM', 1, NULL, NULL),
(755, 'KTM', 'KTM', 1, NULL, NULL),
(756, 'KTM', 'KTM', 1, NULL, NULL),
(757, 'KTM', 'KTM', 1, NULL, NULL),
(758, 'KTM', 'KTM', 1, NULL, NULL),
(759, 'KTM', 'KTM', 1, NULL, NULL),
(760, 'KTM', 'KTM', 1, NULL, NULL),
(761, 'KTM', 'KTM', 1, NULL, NULL),
(762, 'KTM', 'KTM', 1, NULL, NULL),
(763, 'KTM', 'KTM', 1, NULL, NULL),
(764, 'KTM', 'KTM', 1, NULL, NULL),
(765, 'KTM', 'KTM', 1, NULL, NULL),
(766, 'APSONIC 170 Z-ONE', 'APSONIC 170 Z-ONE', 1, NULL, NULL),
(767, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(768, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(769, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(770, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(771, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(772, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(773, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(774, 'KTM', 'KTM', 1, NULL, NULL),
(775, 'KTM', 'KTM', 1, NULL, NULL),
(776, 'KTM', 'KTM', 1, NULL, NULL),
(777, 'KTM', 'KTM', 1, NULL, NULL),
(778, 'SANYA', 'SANYA', 1, NULL, NULL),
(779, 'SANYA', 'SANYA', 1, NULL, NULL),
(780, 'RENAULT DUSTER', 'renault duster', 0, NULL, NULL),
(781, 'RENAULT DUSTER', 'renault duster', 0, NULL, NULL),
(782, 'TVS', 'TVS', 1, NULL, NULL),
(783, 'BESTUNE', 'bestune', 0, NULL, NULL),
(784, 'MADZA', 'MADZA', 0, NULL, NULL),
(785, 'KTM', 'KTM', 1, NULL, NULL),
(786, 'SUZIKI', 'SUZIKI', 1, NULL, NULL),
(787, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(788, 'TVS APACHE RTR180', 'TVS APACHE RTR180', 1, NULL, NULL),
(789, 'KTM', 'KTM', 1, NULL, NULL),
(790, 'KTM', 'KTM', 1, NULL, NULL),
(791, 'KTM', 'KTM', 1, NULL, NULL),
(792, 'KTM', 'KTM', 1, NULL, NULL),
(793, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(794, 'MAN', 'MAN', 0, NULL, NULL),
(795, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(796, 'KTM', 'KTM', 1, NULL, NULL),
(797, 'ABSONIC', 'ABSONIC', 1, NULL, NULL),
(798, 'KTM', 'KTM', 1, NULL, NULL),
(799, 'AOJUON', 'AOJUON', 1, NULL, NULL),
(800, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(801, 'BMW', 'BMW', 1, NULL, NULL),
(802, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(803, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(804, 'KTM', 'KTM', 1, NULL, NULL),
(805, 'KTM', 'KTM', 1, NULL, NULL),
(806, 'KTM', 'KTM', 1, NULL, NULL),
(807, 'KTM', 'KTM', 1, NULL, NULL),
(808, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(809, 'SUZUKI CELERIO', 'Suzuki Celerio', 0, NULL, NULL),
(810, 'CAMICO', 'CAMICO', 1, NULL, NULL),
(811, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(812, 'FAW BESTUNE', 'FAW BESTUNE', 0, NULL, NULL),
(813, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(814, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(815, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(816, 'KTM TM50', 'KTM TM50', 1, NULL, NULL),
(817, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(818, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(819, 'FORD FOCUS', 'ford focus', 0, NULL, NULL),
(820, 'SANA 125-8', 'SANA 125-8', 1, NULL, NULL),
(821, 'SUZUKI SPRESSO', 'suzuki spresso', 0, NULL, NULL),
(822, 'PEUGEOT 206 SD', 'Peugeot 206 sd', 0, NULL, NULL),
(823, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(824, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(825, 'HH HIBB', 'HH HIBB', 1, NULL, NULL),
(826, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(827, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(828, 'SUZUKI', 'SUZUKI', 1, NULL, NULL),
(829, 'SCOOTER', 'SCOOTER', 1, NULL, NULL),
(830, 'KTM', 'KTM', 1, NULL, NULL),
(831, 'KTM', 'KTM', 1, NULL, NULL),
(832, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(833, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(834, 'MADI', 'MADI', 1, NULL, NULL),
(835, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(836, 'KTM', 'KTM', 1, NULL, NULL),
(837, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(838, 'KTM', 'KTM', 1, NULL, NULL),
(839, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(840, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(841, 'KTM', 'KTM', 1, NULL, NULL),
(842, 'KTM APSONIC', 'KTM APSONIC', 1, NULL, NULL),
(843, 'KTM APSONIC', 'KTM APSONIC', 1, NULL, NULL),
(844, 'APACHE', 'APACHE', 1, NULL, NULL),
(845, 'SANYA-8', 'SANYA-8', 1, NULL, NULL),
(846, 'APSONIC ALOBA', 'APSONIC ALOBA', 1, NULL, NULL),
(847, 'APSONIC ALOBA', 'APSONIC ALOBA', 1, NULL, NULL),
(848, 'SUZUKI', 'SUZUKI', 1, NULL, NULL),
(849, 'KTM', 'KTM', 1, NULL, NULL),
(850, 'APSONIC KTM X1', 'APSONIC KTM X1', 1, NULL, NULL),
(851, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(852, 'KTM', 'KTM', 1, NULL, NULL),
(853, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(854, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(855, 'MAZDA 323 F', 'MAZDA 323 F', 0, NULL, NULL),
(856, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(857, 'HAOJUE SABABU', 'HAOJUE SABABU', 1, NULL, NULL),
(858, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(859, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(860, 'X1', 'X1', 1, NULL, NULL),
(861, 'VVHH', 'VVHH', 1, NULL, NULL),
(862, 'SANYA', 'SANYA', 1, NULL, NULL),
(863, 'KTM', 'KTM', 1, NULL, NULL),
(864, 'KTM', 'KTM', 1, NULL, NULL),
(865, 'QASKI 125-30', 'QASKI 125-30', 1, NULL, NULL),
(866, 'KTM', 'KTM', 1, NULL, NULL),
(867, 'SANYA', 'SANYA', 1, NULL, NULL),
(868, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(869, 'RIMCO', 'RIMCO', 1, NULL, NULL),
(870, 'MAZDA3', 'MAZDA3', 0, NULL, NULL),
(871, 'MAZDA3', 'MAZDA3', 0, NULL, NULL),
(872, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(873, 'MBK', 'MBK', 1, NULL, NULL),
(874, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(875, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(876, 'APOLLO', 'APOLLO', 1, NULL, NULL),
(877, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(878, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(879, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(880, 'HONDA', 'HONDA', 1, NULL, NULL),
(881, 'PRIMBULL', 'primbull', 0, NULL, NULL),
(882, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(883, 'TOYOTA ECHO', 'toyota echo', 0, NULL, NULL),
(884, 'HONDA', 'HONDA', 1, NULL, NULL),
(885, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(886, 'SUZUKI', 'SUZUKI', 1, NULL, NULL),
(887, 'KTM', 'KTM', 1, NULL, NULL),
(888, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(889, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(890, 'FENGHAO', 'FENGHAO', 1, NULL, NULL),
(891, 'FENGHAO', 'FENGHAO', 1, NULL, NULL),
(892, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(893, 'QASKI', 'Qaski', 0, NULL, NULL),
(894, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(895, 'KTM', 'KTM', 1, NULL, NULL),
(896, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(897, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(898, 'HHHHG', 'HHHHG', 1, NULL, NULL),
(899, 'SONLINK', 'SONLINK', 1, NULL, NULL),
(900, 'HONDA', 'HONDA', 1, NULL, NULL),
(901, 'SUZUKI', 'SUZUKI', 1, NULL, NULL),
(902, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(903, 'PEUGEOT', 'PEUGEOT', 1, NULL, NULL),
(904, 'PEUGEOT', 'PEUGEOT', 1, NULL, NULL),
(905, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(906, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(907, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(908, 'SUZIKI', 'suziki', 0, NULL, NULL),
(909, 'KTM', 'KTM', 1, NULL, NULL),
(910, 'APSOSONIC', 'APSOSONIC', 1, NULL, NULL),
(911, 'APSONIC 250 PRO GY-9', 'APSONIC 250 PRO GY-9', 1, NULL, NULL),
(912, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(913, 'GJJJJHY', 'GJJJJHY', 1, NULL, NULL),
(914, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(915, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(916, 'FGHH', 'FGHH', 1, NULL, NULL),
(917, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(918, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(919, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(920, 'FIRD', 'fird', 0, NULL, NULL),
(921, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(922, 'TVS', 'TVS', 1, NULL, NULL),
(923, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(924, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(925, 'KTM', 'KTM', 1, NULL, NULL),
(926, 'NFBNLKN', 'NFBNLKN', 1, NULL, NULL),
(927, 'FORD ESCORT', 'FORD ESCORT', 0, NULL, NULL),
(928, 'FORD ESCORT', 'FORD ESCORT', 0, NULL, NULL),
(929, 'APACH', 'APACH', 1, NULL, NULL),
(930, 'MERCEDES CLK320', 'Mercedes clk320', 0, NULL, NULL),
(931, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(932, 'SUZUKI', 'SUZUKI', 1, NULL, NULL),
(933, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(934, 'ALOBA', 'ALOBA', 1, NULL, NULL),
(935, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(936, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(937, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(938, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(939, 'KTM MOTORS', 'KTM MOTORS', 1, NULL, NULL),
(940, 'APACHE', 'APACHE', 1, NULL, NULL),
(941, 'HHHHG', 'HHHHG', 1, NULL, NULL),
(942, 'APRILLIA RS 660', 'APRILLIA RS 660', 1, NULL, NULL),
(943, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(944, 'KIA SPORTAGE', 'kia sportage', 0, NULL, NULL),
(945, 'TVS RTR180', 'TVS RTR180', 1, NULL, NULL),
(946, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(947, 'HYUNDAI', 'HYUNDAI', 0, NULL, NULL),
(948, 'HYUNDAI', 'HYUNDAI', 0, NULL, NULL),
(949, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(950, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(951, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(952, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(953, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(954, '1', '1', 0, NULL, NULL),
(955, '1\'\"', '1\'\"', 0, NULL, NULL),
(956, '1', '1', 0, NULL, NULL),
(957, '\\', '\\', 0, NULL, NULL),
(958, '1', '1', 0, NULL, NULL),
(959, '1\0????', '1\0????', 0, NULL, NULL),
(960, '-1 OR 2+248-248-1=0+0+0+1 --', '-1 OR 2+248-248-1=0+0+0+1 --', 0, NULL, NULL),
(961, '-1 OR 3+248-248-1=0+0+0+1 --', '-1 OR 3+248-248-1=0+0+0+1 --', 0, NULL, NULL),
(962, '@@PW37B', '@@Pw37B', 0, NULL, NULL),
(963, '-1 OR 3*2<(0+5+248-248) --', '-1 OR 3*2<(0+5+248-248) --', 0, NULL, NULL),
(964, 'JYI=', 'JyI=', 0, NULL, NULL),
(965, '?\'?\"', '?\'?\"', 0, NULL, NULL),
(966, '-1 OR 3*2>(0+5+248-248) --', '-1 OR 3*2>(0+5+248-248) --', 0, NULL, NULL),
(967, '-1 OR 2+82-82-1=0+0+0+1', '-1 OR 2+82-82-1=0+0+0+1', 0, NULL, NULL),
(968, '?\'\'?\"\"', '?\'\'?\"\"', 0, NULL, NULL),
(969, '-1 OR 3+82-82-1=0+0+0+1', '-1 OR 3+82-82-1=0+0+0+1', 0, NULL, NULL),
(970, '(SELECT CONVERT(INT,CHAR(65)))', '(select convert(int,CHAR(65)))', 0, NULL, NULL),
(971, '-1 OR 3*2<(0+5+82-82)', '-1 OR 3*2<(0+5+82-82)', 0, NULL, NULL),
(972, '-1 OR 3*2>(0+5+82-82)', '-1 OR 3*2>(0+5+82-82)', 0, NULL, NULL),
(973, '-1\' OR 2+198-198-1=0+0+0+1 --', '-1\' OR 2+198-198-1=0+0+0+1 --', 0, NULL, NULL),
(974, '-1\' OR 3+198-198-1=0+0+0+1 --', '-1\' OR 3+198-198-1=0+0+0+1 --', 0, NULL, NULL),
(975, '-1\' OR 3*2<(0+5+198-198) --', '-1\' OR 3*2<(0+5+198-198) --', 0, NULL, NULL),
(976, '-1\' OR 3*2>(0+5+198-198) --', '-1\' OR 3*2>(0+5+198-198) --', 0, NULL, NULL),
(977, '-1\' OR 2+296-296-1=0+0+0+1 OR \'DWXRNBUC\'=\'', '-1\' OR 2+296-296-1=0+0+0+1 or \'dWxRNBuc\'=\'', 0, NULL, NULL),
(978, '-1\' OR 3+296-296-1=0+0+0+1 OR \'DWXRNBUC\'=\'', '-1\' OR 3+296-296-1=0+0+0+1 or \'dWxRNBuc\'=\'', 0, NULL, NULL),
(979, '-1\' OR 3*2<(0+5+296-296) OR \'DWXRNBUC\'=\'', '-1\' OR 3*2<(0+5+296-296) or \'dWxRNBuc\'=\'', 0, NULL, NULL),
(980, '-1\' OR 3*2>(0+5+296-296) OR \'DWXRNBUC\'=\'', '-1\' OR 3*2>(0+5+296-296) or \'dWxRNBuc\'=\'', 0, NULL, NULL),
(981, '-1\" OR 2+592-592-1=0+0+0+1 --', '-1\" OR 2+592-592-1=0+0+0+1 --', 0, NULL, NULL),
(982, '-1\" OR 3+592-592-1=0+0+0+1 --', '-1\" OR 3+592-592-1=0+0+0+1 --', 0, NULL, NULL),
(983, '-1\" OR 3*2<(0+5+592-592) --', '-1\" OR 3*2<(0+5+592-592) --', 0, NULL, NULL),
(984, '-1\" OR 3*2>(0+5+592-592) --', '-1\" OR 3*2>(0+5+592-592) --', 0, NULL, NULL),
(985, 'IF(NOW()=SYSDATE(),SLEEP(3),0)/*\'XOR(IF(NOW()=SYSD', 'if(now()=sysdate(),sleep(3),0)/*\'XOR(if(now()=sysdate(),sleep(3),0))OR\'\"XOR(if(now()=sysdate(),sleep(3),0))OR\"*/', 0, NULL, NULL),
(986, '(SELECT(0)FROM(SELECT(SLEEP(6)))V)/*\'+(SELECT(0)FR', '(select(0)from(select(sleep(6)))v)/*\'+(select(0)from(select(sleep(6)))v)+\'\"+(select(0)from(select(sleep(6)))v)+\"*/', 0, NULL, NULL),
(987, '-1; WAITFOR DELAY \'0:0:6\' --', '-1; waitfor delay \'0:0:6\' --', 0, NULL, NULL),
(988, '-1); WAITFOR DELAY \'0:0:9\' --', '-1); waitfor delay \'0:0:9\' --', 0, NULL, NULL),
(989, '1 WAITFOR DELAY \'0:0:3\' --', '1 waitfor delay \'0:0:3\' --', 0, NULL, NULL),
(990, 'M1NNFAEL\'; WAITFOR DELAY \'0:0:3\' --', 'm1NNFAEl\'; waitfor delay \'0:0:3\' --', 0, NULL, NULL),
(991, '-1;SELECT PG_SLEEP(6); --', '-1;select pg_sleep(6); --', 0, NULL, NULL),
(992, '-1);SELECT PG_SLEEP(9); --', '-1);select pg_sleep(9); --', 0, NULL, NULL),
(993, '-1));SELECT PG_SLEEP(9); --', '-1));select pg_sleep(9); --', 0, NULL, NULL),
(994, 'VEXZNNYP\';SELECT PG_SLEEP(3); --', 'VEXzNnyP\';select pg_sleep(3); --', 0, NULL, NULL),
(995, 'CJTIEY6R\');SELECT PG_SLEEP(3); --', 'CjTIEy6r\');select pg_sleep(3); --', 0, NULL, NULL),
(996, 'TICRYR95\'));SELECT PG_SLEEP(6); --', 'TicrYr95\'));select pg_sleep(6); --', 0, NULL, NULL),
(997, '1', '1', 0, NULL, NULL),
(998, '1', '1', 0, NULL, NULL),
(999, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1000, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1001, 'RATO CITY', 'RATO CITY', 1, NULL, NULL),
(1002, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1003, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1004, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1005, 'KTM', 'KTM', 1, NULL, NULL),
(1006, 'SANYA', 'SANYA', 1, NULL, NULL),
(1007, 'KTM', 'KTM', 1, NULL, NULL),
(1008, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(1009, 'FRTN', 'FRTN', 1, NULL, NULL),
(1010, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1011, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1012, 'KTM', 'KTM', 1, NULL, NULL),
(1013, 'TVS', 'TVS', 1, NULL, NULL),
(1014, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1015, 'TVS', 'TVS', 1, NULL, NULL),
(1016, 'MOTO ROUGE BORDEREAU', 'MOTO ROUGE BORDEREAU', 1, NULL, NULL),
(1017, 'MOTO ROUGE BORDEREAU', 'MOTO ROUGE BORDEREAU', 1, NULL, NULL),
(1018, 'ROUGE', 'ROUGE', 1, NULL, NULL),
(1019, 'TVS', 'TVS', 1, NULL, NULL),
(1020, 'FENGHAO', 'FENGHAO', 1, NULL, NULL),
(1021, 'FENGHAO', 'FENGHAO', 1, NULL, NULL),
(1022, 'FENGHAO', 'FENGHAO', 1, NULL, NULL),
(1023, 'FENGHAO', 'FENGHAO', 1, NULL, NULL),
(1024, 'FORD ESCAPE', 'ford escape', 0, NULL, NULL),
(1025, 'JUNIOR', 'JUNIOR', 1, NULL, NULL),
(1026, 'JUNIOR', 'JUNIOR', 1, NULL, NULL),
(1027, 'YAHAMAHA', 'YAHAMAHA', 1, NULL, NULL),
(1028, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1029, 'APSONIC AP125-30', 'APSONIC AP125-30', 1, NULL, NULL),
(1030, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1031, 'KTM', 'KTM', 1, NULL, NULL),
(1032, 'KTM', 'KTM', 1, NULL, NULL),
(1033, 'KTM', 'KTM', 1, NULL, NULL),
(1034, 'SANIYA', 'SANIYA', 1, NULL, NULL),
(1035, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1036, 'HAOJIN', 'HAOJIN', 1, NULL, NULL),
(1037, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1038, 'VOLKSWAGEN TIGUAN', 'volkswagen tiguan', 0, NULL, NULL),
(1039, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(1040, 'KTM', 'KTM', 1, NULL, NULL),
(1041, 'QASKI', 'QASKI', 1, NULL, NULL),
(1042, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1043, 'KTM', 'KTM', 1, NULL, NULL),
(1044, 'KTM', 'KTM', 1, NULL, NULL),
(1045, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1046, 'HAOJUE HJ150', 'HAOJUE HJ150', 1, NULL, NULL),
(1047, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1048, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(1049, 'RYMCO', 'RYMCO', 1, NULL, NULL),
(1050, 'APSONIC 50 A', 'APSONIC 50 A', 1, NULL, NULL),
(1051, 'KTM', 'KTM', 1, NULL, NULL),
(1052, 'TVS', 'TVS', 1, NULL, NULL),
(1053, 'YAMAHA TRACER 9GT', 'YAMAHA TRACER 9GT', 1, NULL, NULL),
(1054, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(1055, 'FORD KA', 'ford KA', 0, NULL, NULL),
(1056, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1057, 'QASKI', 'QASKI', 1, NULL, NULL),
(1058, 'BAZOUMANA', 'BAZOUMANA', 1, NULL, NULL),
(1059, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1060, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1061, 'JIALING', 'JIALING', 1, NULL, NULL),
(1062, 'KTM', 'KTM', 1, NULL, NULL),
(1063, 'JAKATA', 'JAKATA', 1, NULL, NULL),
(1064, 'YAMAHA TMAX', 'YAMAHA TMAX', 1, NULL, NULL),
(1065, 'HAOJUE', 'HAOJUE', 1, NULL, NULL),
(1066, 'KTM', 'KTM', 1, NULL, NULL),
(1067, 'SANYA', 'SANYA', 1, NULL, NULL);
INSERT INTO `make` (`id`, `code`, `title`, `isMoto`, `created_at`, `updated_at`) VALUES
(1068, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1069, 'SANYA', 'SANYA', 1, NULL, NULL),
(1070, 'SANYA', 'SANYA', 1, NULL, NULL),
(1071, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1072, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1073, 'RATO', 'RATO', 1, NULL, NULL),
(1074, 'RATO', 'RATO', 1, NULL, NULL),
(1075, 'GRGRGS', 'GRGRGS', 1, NULL, NULL),
(1076, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1077, 'APSONIC', 'APSONIC', 1, NULL, NULL),
(1078, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1079, 'SANYA', 'SANYA', 1, NULL, NULL),
(1080, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(1081, 'FDGBNYTJTYH', 'FDGBNYTJTYH', 1, NULL, NULL),
(1082, 'L;LF;V;DPM', 'L;LF;V;DPM', 1, NULL, NULL),
(1083, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1084, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1085, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1086, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(1087, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1088, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(1089, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1090, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1091, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1092, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1093, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1094, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1095, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1096, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1097, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1098, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1099, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1100, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1101, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1102, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1103, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1104, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1105, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1106, 'DRAGON', 'DRAGON', 1, NULL, NULL),
(1107, 'DRAGON', 'DRAGON', 1, NULL, NULL),
(1108, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1109, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1110, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1111, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(1112, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(1113, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1114, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(1115, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1116, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(1117, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1118, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1119, 'TOYOTA', 'TOYOTA', 1, NULL, NULL),
(1120, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1121, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(1122, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(1123, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(1124, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(1125, 'ROYAL', 'ROYAL', 1, NULL, NULL),
(1126, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1127, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1128, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1129, 'FGGHG', 'FGGHG', 1, NULL, NULL),
(1130, 'FGGHG', 'FGGHG', 1, NULL, NULL),
(1131, 'FGGHG', 'FGGHG', 1, NULL, NULL),
(1132, 'FGGHG', 'FGGHG', 1, NULL, NULL),
(1133, 'FGGHG', 'FGGHG', 1, NULL, NULL),
(1134, 'FGGHG', 'FGGHG', 1, NULL, NULL),
(1135, 'FGGHG', 'FGGHG', 1, NULL, NULL),
(1136, 'SDGFHN,J;', 'SDGFHN,J;', 1, NULL, NULL),
(1137, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1138, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1139, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1140, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1141, 'YAMAHA', 'YAMAHA', 1, NULL, NULL),
(1142, 'YAMAHA', 'YAMAHA', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2025_01_27_224700_create_users_table', 1),
(2, '2025_01_27_224835_create_password_resets_table', 1),
(3, '2025_01_27_224946_create_failed_jobs_table', 1),
(4, '2025_01_27_231111_create_assurance_auto_infos_table', 1),
(5, '2025_01_27_231308_create_assurance_voyage_infos_table', 1),
(6, '2025_01_27_231404_create_attestations_table', 1),
(7, '2025_01_27_231502_create_auto_categories_table', 1),
(8, '2025_01_27_231554_create_auto_company_table', 1),
(9, '2025_01_27_231656_create_auto_companyquotation_table', 1),
(10, '2025_01_27_231734_create_auto_guarantee_table', 1),
(11, '2025_01_27_232004_create_auto_infos_table', 1),
(12, '2025_01_27_232058_create_auto_reglementarycost_table', 1),
(13, '2025_01_27_232152_create_callme_log_table', 1),
(14, '2025_01_27_232233_create_car_type_table', 1),
(15, '2025_01_27_233138_create_chat_messages_table', 1),
(16, '2025_01_27_233218_create_city_table', 1),
(17, '2025_01_27_233306_create_commune_table', 1),
(18, '2025_01_27_233343_create_delivery_order_table', 1),
(19, '2025_01_27_233422_create_delivery_signature_table', 1),
(20, '2025_01_27_233504_create_delivery_tour_order_table', 1),
(21, '2025_01_27_233559_create_delivery_tour_route_table', 1),
(22, '2025_01_27_233640_create_delivery_tour_table', 1),
(23, '2025_01_27_233824_create_espace_perso_account_table', 1),
(24, '2025_01_27_233910_create_job_table', 1),
(25, '2025_01_27_233945_create_log_table', 1),
(26, '2025_01_27_234028_create_made_quote_table', 1),
(27, '2025_01_27_234114_create_make_table', 1),
(28, '2025_01_27_234234_create_model_table', 1),
(29, '2025_01_27_234335_create_notifications_table', 1),
(30, '2025_01_27_234424_create_optional_service_table', 1),
(31, '2025_01_27_234509_create_order_status_actor_table', 1),
(32, '2025_01_27_234553_create_paye_table', 1),
(33, '2025_01_27_234700_create_payments_table', 1),
(34, '2025_01_27_234736_create_pays_table', 1),
(35, '2025_01_27_234822_create_periode_table', 1),
(36, '2025_01_27_234909_create_permission_role_table', 1),
(37, '2025_01_27_234945_create_permissions_table', 1),
(38, '2025_01_27_235023_create_quotation_table', 1),
(39, '2025_01_27_235059_create_reduction_table', 1),
(40, '2025_01_27_235148_create_revive_client_quotation_table', 1),
(41, '2025_01_27_235225_create_revive_client_role_user_table', 1),
(42, '2025_01_27_235302_create_roles_table', 1),
(43, '2025_01_27_235334_create_sending_notification_table', 1),
(44, '2025_01_27_235402_create_sessions_table', 1),
(45, '2025_01_27_235435_create_sinistre_status_log_table', 1),
(46, '2025_01_27_235519_create_sinistre_table', 1),
(47, '2025_05_02_143526_create_role_user_table', 1),
(48, '2025_05_02_201746_make_company_name_nullable_in_auto_infos', 1),
(49, '2025_05_02_203047_make_fields_nullable_in_auto_infos', 1);

-- --------------------------------------------------------

--
-- Structure de la table `model`
--

CREATE TABLE `model` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `make_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `model`
--

INSERT INTO `model` (`id`, `make_id`, `code`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'CL_MODELS', 'CL Models (4)', NULL, NULL),
(2, 1, '2.2CL', ' - 2.2CL', NULL, NULL),
(3, 1, '2.3CL', ' - 2.3CL', NULL, NULL),
(4, 1, '3.0CL', ' - 3.0CL', NULL, NULL),
(5, 1, '3.2CL', ' - 3.2CL', NULL, NULL),
(6, 1, 'ILX', 'ILX', NULL, NULL),
(7, 1, 'INTEG', 'Integra', NULL, NULL),
(8, 1, 'LEGEND', 'Legend', NULL, NULL),
(9, 1, 'MDX', 'MDX', NULL, NULL),
(10, 1, 'NSX', 'NSX', NULL, NULL),
(11, 1, 'RDX', 'RDX', NULL, NULL),
(12, 1, 'RL_MODELS', 'RL Models (2)', NULL, NULL),
(13, 1, '3.5RL', ' - 3.5 RL', NULL, NULL),
(14, 1, 'RL', ' - RL', NULL, NULL),
(15, 1, 'RSX', 'RSX', NULL, NULL),
(16, 1, 'SLX', 'SLX', NULL, NULL),
(17, 1, 'TL_MODELS', 'TL Models (3)', NULL, NULL),
(18, 1, '2.5TL', ' - 2.5TL', NULL, NULL),
(19, 1, '3.2TL', ' - 3.2TL', NULL, NULL),
(20, 1, 'TL', ' - TL', NULL, NULL),
(21, 1, 'TSX', 'TSX', NULL, NULL),
(22, 1, 'VIGOR', 'Vigor', NULL, NULL),
(23, 1, 'ZDX', 'ZDX', NULL, NULL),
(24, 1, 'ACUOTH', 'Other Acura Models', NULL, NULL),
(25, 2, 'ALFA164', '164', NULL, NULL),
(26, 2, 'ALFA8C', '8C Competizione', NULL, NULL),
(27, 2, 'ALFAGT', 'GTV-6', NULL, NULL),
(28, 2, 'MIL', 'Milano', NULL, NULL),
(29, 2, 'SPID', 'Spider', NULL, NULL),
(30, 2, 'ALFAOTH', 'Other Alfa Romeo Models', NULL, NULL),
(31, 3, 'AMCALLIAN', 'Alliance', NULL, NULL),
(32, 3, 'CON', 'Concord', NULL, NULL),
(33, 3, 'EAGLE', 'Eagle', NULL, NULL),
(34, 3, 'AMCENC', 'Encore', NULL, NULL),
(35, 3, 'AMCSPIRIT', 'Spirit', NULL, NULL),
(36, 3, 'AMCOTH', 'Other AMC Models', NULL, NULL),
(37, 4, 'DB7', 'DB7', NULL, NULL),
(38, 4, 'DB9', 'DB9', NULL, NULL),
(39, 4, 'DBS', 'DBS', NULL, NULL),
(40, 4, 'LAGONDA', 'Lagonda', NULL, NULL),
(41, 4, 'RAPIDE', 'Rapide', NULL, NULL),
(42, 4, 'V12VANT', 'V12 Vantage', NULL, NULL),
(43, 4, 'VANTAGE', 'V8 Vantage', NULL, NULL),
(44, 4, 'VANQUISH', 'Vanquish', NULL, NULL),
(45, 4, 'VIRAGE', 'Virage', NULL, NULL),
(46, 4, 'UNAVAILAST', 'Other Aston Martin Models', NULL, NULL),
(47, 5, 'AUDI100', '100', NULL, NULL),
(48, 5, 'AUDI200', '200', NULL, NULL),
(49, 5, '4000', '4000', NULL, NULL),
(50, 5, '5000', '5000', NULL, NULL),
(51, 5, '80', '80', NULL, NULL),
(52, 5, '90', '90', NULL, NULL),
(53, 5, 'A3', 'A3', NULL, NULL),
(54, 5, 'A4', 'A4', NULL, NULL),
(55, 5, 'A5', 'A5', NULL, NULL),
(56, 5, 'A6', 'A6', NULL, NULL),
(57, 5, 'A7', 'A7', NULL, NULL),
(58, 5, 'A8', 'A8', NULL, NULL),
(59, 5, 'ALLRDQUA', 'allroad', NULL, NULL),
(60, 5, 'AUDICABRI', 'Cabriolet', NULL, NULL),
(61, 5, 'AUDICOUPE', 'Coupe', NULL, NULL),
(62, 5, 'Q3', 'Q3', NULL, NULL),
(63, 5, 'Q5', 'Q5', NULL, NULL),
(64, 5, 'Q7', 'Q7', NULL, NULL),
(65, 5, 'QUATTR', 'Quattro', NULL, NULL),
(66, 5, 'R8', 'R8', NULL, NULL),
(67, 5, 'RS4', 'RS 4', NULL, NULL),
(68, 5, 'RS5', 'RS 5', NULL, NULL),
(69, 5, 'RS6', 'RS 6', NULL, NULL),
(70, 5, 'S4', 'S4', NULL, NULL),
(71, 5, 'S5', 'S5', NULL, NULL),
(72, 5, 'S6', 'S6', NULL, NULL),
(73, 5, 'S7', 'S7', NULL, NULL),
(74, 5, 'S8', 'S8', NULL, NULL),
(75, 5, 'TT', 'TT', NULL, NULL),
(76, 5, 'TTRS', 'TT RS', NULL, NULL),
(77, 5, 'TTS', 'TTS', NULL, NULL),
(78, 5, 'V8', 'V8 Quattro', NULL, NULL),
(79, 5, 'AUDOTH', 'Other Audi Models', NULL, NULL),
(80, 6, 'CONVERT', 'Convertible', NULL, NULL),
(81, 6, 'COUPEAVANT', 'Coupe', NULL, NULL),
(82, 6, 'SEDAN', 'Sedan', NULL, NULL),
(83, 6, 'UNAVAILAVA', 'Other Avanti Models', NULL, NULL),
(84, 7, 'ARNAGE', 'Arnage', NULL, NULL),
(85, 7, 'AZURE', 'Azure', NULL, NULL),
(86, 7, 'BROOKLANDS', 'Brooklands', NULL, NULL),
(87, 7, 'BENCONT', 'Continental', NULL, NULL),
(88, 7, 'CORNICHE', 'Corniche', NULL, NULL),
(89, 7, 'BENEIGHT', 'Eight', NULL, NULL),
(90, 7, 'BENMUL', 'Mulsanne', NULL, NULL),
(91, 7, 'BENTURBO', 'Turbo R', NULL, NULL),
(92, 7, 'UNAVAILBEN', 'Other Bentley Models', NULL, NULL),
(93, 8, '1_SERIES', '1 Series (3)', NULL, NULL),
(94, 8, '128I', ' - 128i', NULL, NULL),
(95, 8, '135I', ' - 135i', NULL, NULL),
(96, 8, '135IS', ' - 135is', NULL, NULL),
(97, 8, '3_SERIES', '3 Series (29)', NULL, NULL),
(98, 8, '318I', ' - 318i', NULL, NULL),
(99, 8, '318IC', ' - 318iC', NULL, NULL),
(100, 8, '318IS', ' - 318iS', NULL, NULL),
(101, 8, '318TI', ' - 318ti', NULL, NULL),
(102, 8, '320I', ' - 320i', NULL, NULL),
(103, 8, '323CI', ' - 323ci', NULL, NULL),
(104, 8, '323I', ' - 323i', NULL, NULL),
(105, 8, '323IS', ' - 323is', NULL, NULL),
(106, 8, '323IT', ' - 323iT', NULL, NULL),
(107, 8, '325CI', ' - 325Ci', NULL, NULL),
(108, 8, '325E', ' - 325e', NULL, NULL),
(109, 8, '325ES', ' - 325es', NULL, NULL),
(110, 8, '325I', ' - 325i', NULL, NULL),
(111, 8, '325IS', ' - 325is', NULL, NULL),
(112, 8, '325IX', ' - 325iX', NULL, NULL),
(113, 8, '325XI', ' - 325xi', NULL, NULL),
(114, 8, '328CI', ' - 328Ci', NULL, NULL),
(115, 8, '328I', ' - 328i', NULL, NULL),
(116, 8, '328IS', ' - 328iS', NULL, NULL),
(117, 8, '328XI', ' - 328xi', NULL, NULL),
(118, 8, '330CI', ' - 330Ci', NULL, NULL),
(119, 8, '330I', ' - 330i', NULL, NULL),
(120, 8, '330XI', ' - 330xi', NULL, NULL),
(121, 8, '335D', ' - 335d', NULL, NULL),
(122, 8, '335I', ' - 335i', NULL, NULL),
(123, 8, '335IS', ' - 335is', NULL, NULL),
(124, 8, '335XI', ' - 335xi', NULL, NULL),
(125, 8, 'ACTIVE3', ' - ActiveHybrid 3', NULL, NULL),
(126, 8, 'BMW325', ' - 325', NULL, NULL),
(127, 8, '5_SERIES', '5 Series (19)', NULL, NULL),
(128, 8, '524TD', ' - 524td', NULL, NULL),
(129, 8, '525I', ' - 525i', NULL, NULL),
(130, 8, '525XI', ' - 525xi', NULL, NULL),
(131, 8, '528E', ' - 528e', NULL, NULL),
(132, 8, '528I', ' - 528i', NULL, NULL),
(133, 8, '528IT', ' - 528iT', NULL, NULL),
(134, 8, '528XI', ' - 528xi', NULL, NULL),
(135, 8, '530I', ' - 530i', NULL, NULL),
(136, 8, '530IT', ' - 530iT', NULL, NULL),
(137, 8, '530XI', ' - 530xi', NULL, NULL),
(138, 8, '533I', ' - 533i', NULL, NULL),
(139, 8, '535I', ' - 535i', NULL, NULL),
(140, 8, '535IGT', ' - 535i Gran Turismo', NULL, NULL),
(141, 8, '535XI', ' - 535xi', NULL, NULL),
(142, 8, '540I', ' - 540i', NULL, NULL),
(143, 8, '545I', ' - 545i', NULL, NULL),
(144, 8, '550I', ' - 550i', NULL, NULL),
(145, 8, '550IGT', ' - 550i Gran Turismo', NULL, NULL),
(146, 8, 'ACTIVE5', ' - ActiveHybrid 5', NULL, NULL),
(147, 8, '6_SERIES', '6 Series (8)', NULL, NULL),
(148, 8, '633CSI', ' - 633CSi', NULL, NULL),
(149, 8, '635CSI', ' - 635CSi', NULL, NULL),
(150, 8, '640I', ' - 640i', NULL, NULL),
(151, 8, '640IGC', ' - 640i Gran Coupe', NULL, NULL),
(152, 8, '645CI', ' - 645Ci', NULL, NULL),
(153, 8, '650I', ' - 650i', NULL, NULL),
(154, 8, '650IGC', ' - 650i Gran Coupe', NULL, NULL),
(155, 8, 'L6', ' - L6', NULL, NULL),
(156, 8, '7_SERIES', '7 Series (15)', NULL, NULL),
(157, 8, '733I', ' - 733i', NULL, NULL),
(158, 8, '735I', ' - 735i', NULL, NULL),
(159, 8, '735IL', ' - 735iL', NULL, NULL),
(160, 8, '740I', ' - 740i', NULL, NULL),
(161, 8, '740IL', ' - 740iL', NULL, NULL),
(162, 8, '740LI', ' - 740Li', NULL, NULL),
(163, 8, '745I', ' - 745i', NULL, NULL),
(164, 8, '745LI', ' - 745Li', NULL, NULL),
(165, 8, '750I', ' - 750i', NULL, NULL),
(166, 8, '750IL', ' - 750iL', NULL, NULL),
(167, 8, '750LI', ' - 750Li', NULL, NULL),
(168, 8, '760I', ' - 760i', NULL, NULL),
(169, 8, '760LI', ' - 760Li', NULL, NULL),
(170, 8, 'ACTIVE7', ' - ActiveHybrid 7', NULL, NULL),
(171, 8, 'ALPINAB7', ' - Alpina B7', NULL, NULL),
(172, 8, '8_SERIES', '8 Series (4)', NULL, NULL),
(173, 8, '840CI', ' - 840Ci', NULL, NULL),
(174, 8, '850CI', ' - 850Ci', NULL, NULL),
(175, 8, '850CSI', ' - 850CSi', NULL, NULL),
(176, 8, '850I', ' - 850i', NULL, NULL),
(177, 8, 'L_SERIES', 'L Series (1)', NULL, NULL),
(178, 8, 'L7', ' - L7', NULL, NULL),
(179, 8, 'M_SERIES', 'M Series (8)', NULL, NULL),
(180, 8, '1SERIESM', ' - 1 Series M', NULL, NULL),
(181, 8, 'BMWMCOUPE', ' - M Coupe', NULL, NULL),
(182, 8, 'BMWROAD', ' - M Roadster', NULL, NULL),
(183, 8, 'M3', ' - M3', NULL, NULL),
(184, 8, 'M5', ' - M5', NULL, NULL),
(185, 8, 'M6', ' - M6', NULL, NULL),
(186, 8, 'X5M', ' - X5 M', NULL, NULL),
(187, 8, 'X6M', ' - X6 M', NULL, NULL),
(188, 8, 'X_SERIES', 'X Series (5)', NULL, NULL),
(189, 8, 'ACTIVEX6', ' - ActiveHybrid X6', NULL, NULL),
(190, 8, 'X1', ' - X1', NULL, NULL),
(191, 8, 'X3', ' - X3', NULL, NULL),
(192, 8, 'X5', ' - X5', NULL, NULL),
(193, 8, 'X6', ' - X6', NULL, NULL),
(194, 8, 'Z_SERIES', 'Z Series (3)', NULL, NULL),
(195, 8, 'Z3', ' - Z3', NULL, NULL),
(196, 8, 'Z4', ' - Z4', NULL, NULL),
(197, 8, 'Z8', ' - Z8', NULL, NULL),
(198, 8, 'BMWOTH', 'Other BMW Models', NULL, NULL),
(199, 9, 'CENT', 'Century', NULL, NULL),
(200, 9, 'ELEC', 'Electra', NULL, NULL),
(201, 9, 'ENCLAVE', 'Enclave', NULL, NULL),
(202, 9, 'BUIENC', 'Encore', NULL, NULL),
(203, 9, 'LACROSSE', 'LaCrosse', NULL, NULL),
(204, 9, 'LESA', 'Le Sabre', NULL, NULL),
(205, 9, 'LUCERNE', 'Lucerne', NULL, NULL),
(206, 9, 'PARK', 'Park Avenue', NULL, NULL),
(207, 9, 'RAINIER', 'Rainier', NULL, NULL),
(208, 9, 'REATTA', 'Reatta', NULL, NULL),
(209, 9, 'REG', 'Regal', NULL, NULL),
(210, 9, 'RENDEZVOUS', 'Rendezvous', NULL, NULL),
(211, 9, 'RIV', 'Riviera', NULL, NULL),
(212, 9, 'BUICKROAD', 'Roadmaster', NULL, NULL),
(213, 9, 'SKYH', 'Skyhawk', NULL, NULL),
(214, 9, 'SKYL', 'Skylark', NULL, NULL),
(215, 9, 'SOMER', 'Somerset', NULL, NULL),
(216, 9, 'TERRAZA', 'Terraza', NULL, NULL),
(217, 9, 'BUVERANO', 'Verano', NULL, NULL),
(218, 9, 'BUOTH', 'Other Buick Models', NULL, NULL),
(219, 10, 'ALLANT', 'Allante', NULL, NULL),
(220, 10, 'ATS', 'ATS', NULL, NULL),
(221, 10, 'BROUGH', 'Brougham', NULL, NULL),
(222, 10, 'CATERA', 'Catera', NULL, NULL),
(223, 10, 'CIMA', 'Cimarron', NULL, NULL),
(224, 10, 'CTS', 'CTS', NULL, NULL),
(225, 10, 'DEV', 'De Ville', NULL, NULL),
(226, 10, 'DTS', 'DTS', NULL, NULL),
(227, 10, 'ELDO', 'Eldorado', NULL, NULL),
(228, 10, 'ESCALA', 'Escalade', NULL, NULL),
(229, 10, 'ESCALAESV', 'Escalade ESV', NULL, NULL),
(230, 10, 'EXT', 'Escalade EXT', NULL, NULL),
(231, 10, 'FLEE', 'Fleetwood', NULL, NULL),
(232, 10, 'SEV', 'Seville', NULL, NULL),
(233, 10, 'SRX', 'SRX', NULL, NULL),
(234, 10, 'STS', 'STS', NULL, NULL),
(235, 10, 'XLR', 'XLR', NULL, NULL),
(236, 10, 'XTS', 'XTS', NULL, NULL),
(237, 10, 'CADOTH', 'Other Cadillac Models', NULL, NULL),
(238, 11, 'ASTRO', 'Astro', NULL, NULL),
(239, 11, 'AVALNCH', 'Avalanche', NULL, NULL),
(240, 11, 'AVEO', 'Aveo', NULL, NULL),
(241, 11, 'AVEO5', 'Aveo5', NULL, NULL),
(242, 11, 'BERETT', 'Beretta', NULL, NULL),
(243, 11, 'BLAZER', 'Blazer', NULL, NULL),
(244, 11, 'CAM', 'Camaro', NULL, NULL),
(245, 11, 'CAP', 'Caprice', NULL, NULL),
(246, 11, 'CHECAPS', 'Captiva Sport', NULL, NULL),
(247, 11, 'CAV', 'Cavalier', NULL, NULL),
(248, 11, 'CELE', 'Celebrity', NULL, NULL),
(249, 11, 'CHEVETTE', 'Chevette', NULL, NULL),
(250, 11, 'CITATION', 'Citation', NULL, NULL),
(251, 11, 'COBALT', 'Cobalt', NULL, NULL),
(252, 11, 'COLORADO', 'Colorado', NULL, NULL),
(253, 11, 'CORSI', 'Corsica', NULL, NULL),
(254, 11, 'CORV', 'Corvette', NULL, NULL),
(255, 11, 'CRUZE', 'Cruze', NULL, NULL),
(256, 11, 'ELCAM', 'El Camino', NULL, NULL),
(257, 11, 'EQUINOX', 'Equinox', NULL, NULL),
(258, 11, 'G15EXP', 'Express Van', NULL, NULL),
(259, 11, 'G10', 'G Van', NULL, NULL),
(260, 11, 'HHR', 'HHR', NULL, NULL),
(261, 11, 'CHEVIMP', 'Impala', NULL, NULL),
(262, 11, 'KODC4500', 'Kodiak C4500', NULL, NULL),
(263, 11, 'LUMINA', 'Lumina', NULL, NULL),
(264, 11, 'LAPV', 'Lumina APV', NULL, NULL),
(265, 11, 'LUV', 'LUV', NULL, NULL),
(266, 11, 'MALI', 'Malibu', NULL, NULL),
(267, 11, 'CHVMETR', 'Metro', NULL, NULL),
(268, 11, 'CHEVMONT', 'Monte Carlo', NULL, NULL),
(269, 11, 'NOVA', 'Nova', NULL, NULL),
(270, 11, 'CHEVPRIZM', 'Prizm', NULL, NULL),
(271, 11, 'CHVST', 'S10 Blazer', NULL, NULL),
(272, 11, 'S10PICKUP', 'S10 Pickup', NULL, NULL),
(273, 11, 'CHEV150', 'Silverado and other C/K1500', NULL, NULL),
(274, 11, 'CHEVC25', 'Silverado and other C/K2500', NULL, NULL),
(275, 11, 'CH3500PU', 'Silverado and other C/K3500', NULL, NULL),
(276, 11, 'SONIC', 'Sonic', NULL, NULL),
(277, 11, 'SPARK', 'Spark', NULL, NULL),
(278, 11, 'CHEVSPEC', 'Spectrum', NULL, NULL),
(279, 11, 'CHSPRINT', 'Sprint', NULL, NULL),
(280, 11, 'SSR', 'SSR', NULL, NULL),
(281, 11, 'CHEVSUB', 'Suburban', NULL, NULL),
(282, 11, 'TAHOE', 'Tahoe', NULL, NULL),
(283, 11, 'TRACKE', 'Tracker', NULL, NULL),
(284, 11, 'TRAILBLZ', 'TrailBlazer', NULL, NULL),
(285, 11, 'TRAILBZEXT', 'TrailBlazer EXT', NULL, NULL),
(286, 11, 'TRAVERSE', 'Traverse', NULL, NULL),
(287, 11, 'UPLANDER', 'Uplander', NULL, NULL),
(288, 11, 'VENTUR', 'Venture', NULL, NULL),
(289, 11, 'VOLT', 'Volt', NULL, NULL),
(290, 11, 'CHEOTH', 'Other Chevrolet Models', NULL, NULL),
(291, 12, 'CHRYS200', '200', NULL, NULL),
(292, 12, '300', '300', NULL, NULL),
(293, 12, 'CHRY300', '300M', NULL, NULL),
(294, 12, 'ASPEN', 'Aspen', NULL, NULL),
(295, 12, 'CARAVAN', 'Caravan', NULL, NULL),
(296, 12, 'CIRRUS', 'Cirrus', NULL, NULL),
(297, 12, 'CONC', 'Concorde', NULL, NULL),
(298, 12, 'CHRYCONQ', 'Conquest', NULL, NULL),
(299, 12, 'CORDOBA', 'Cordoba', NULL, NULL),
(300, 12, 'CROSSFIRE', 'Crossfire', NULL, NULL),
(301, 12, 'ECLASS', 'E Class', NULL, NULL),
(302, 12, 'FIFTH', 'Fifth Avenue', NULL, NULL),
(303, 12, 'CHRYGRANDV', 'Grand Voyager', NULL, NULL),
(304, 12, 'IMPE', 'Imperial', NULL, NULL),
(305, 12, 'INTREPID', 'Intrepid', NULL, NULL),
(306, 12, 'CHRYLAS', 'Laser', NULL, NULL),
(307, 12, 'LEBA', 'LeBaron', NULL, NULL),
(308, 12, 'LHS', 'LHS', NULL, NULL),
(309, 12, 'CHRYNEON', 'Neon', NULL, NULL),
(310, 12, 'NY', 'New Yorker', NULL, NULL),
(311, 12, 'NEWPORT', 'Newport', NULL, NULL),
(312, 12, 'PACIFICA', 'Pacifica', NULL, NULL),
(313, 12, 'CHPROWLE', 'Prowler', NULL, NULL),
(314, 12, 'PTCRUIS', 'PT Cruiser', NULL, NULL),
(315, 12, 'CHRYSEB', 'Sebring', NULL, NULL),
(316, 12, 'CHRYTC', 'TC by Maserati', NULL, NULL),
(317, 12, 'TANDC', 'Town & Country', NULL, NULL),
(318, 12, 'VOYAGER', 'Voyager', NULL, NULL),
(319, 12, 'CHOTH', 'Other Chrysler Models', NULL, NULL),
(320, 13, 'LANOS', 'Lanos', NULL, NULL),
(321, 13, 'LEGANZA', 'Leganza', NULL, NULL),
(322, 13, 'NUBIRA', 'Nubira', NULL, NULL),
(323, 13, 'DAEOTH', 'Other Daewoo Models', NULL, NULL),
(324, 14, 'CHAR', 'Charade', NULL, NULL),
(325, 14, 'ROCKY', 'Rocky', NULL, NULL),
(326, 14, 'DAIHOTH', 'Other Daihatsu Models', NULL, NULL),
(327, 15, 'DAT200SX', '200SX', NULL, NULL),
(328, 15, 'DAT210', '210', NULL, NULL),
(329, 15, '280Z', '280ZX', NULL, NULL),
(330, 15, '300ZX', '300ZX', NULL, NULL),
(331, 15, '310', '310', NULL, NULL),
(332, 15, '510', '510', NULL, NULL),
(333, 15, '720', '720', NULL, NULL),
(334, 15, '810', '810', NULL, NULL),
(335, 15, 'DATMAX', 'Maxima', NULL, NULL),
(336, 15, 'DATPU', 'Pickup', NULL, NULL),
(337, 15, 'PUL', 'Pulsar', NULL, NULL),
(338, 15, 'DATSENT', 'Sentra', NULL, NULL),
(339, 15, 'STAN', 'Stanza', NULL, NULL),
(340, 15, 'DATOTH', 'Other Datsun Models', NULL, NULL),
(341, 16, 'DMC12', 'DMC-12', NULL, NULL),
(342, 17, '400', '400', NULL, NULL),
(343, 17, 'DOD600', '600', NULL, NULL),
(344, 17, 'ARI', 'Aries', NULL, NULL),
(345, 17, 'AVENGR', 'Avenger', NULL, NULL),
(346, 17, 'CALIBER', 'Caliber', NULL, NULL),
(347, 17, 'DODCARA', 'Caravan', NULL, NULL),
(348, 17, 'CHALLENGER', 'Challenger', NULL, NULL),
(349, 17, 'DODCHAR', 'Charger', NULL, NULL),
(350, 17, 'DODCOLT', 'Colt', NULL, NULL),
(351, 17, 'DODCONQ', 'Conquest', NULL, NULL),
(352, 17, 'DODDW', 'D/W Truck', NULL, NULL),
(353, 17, 'DAKOTA', 'Dakota', NULL, NULL),
(354, 17, 'DODDART', 'Dart', NULL, NULL),
(355, 17, 'DAY', 'Daytona', NULL, NULL),
(356, 17, 'DIPLOMA', 'Diplomat', NULL, NULL),
(357, 17, 'DURANG', 'Durango', NULL, NULL),
(358, 17, 'DODDYNA', 'Dynasty', NULL, NULL),
(359, 17, 'GRANDCARAV', 'Grand Caravan', NULL, NULL),
(360, 17, 'INTRE', 'Intrepid', NULL, NULL),
(361, 17, 'JOURNEY', 'Journey', NULL, NULL),
(362, 17, 'LANCERDODG', 'Lancer', NULL, NULL),
(363, 17, 'MAGNUM', 'Magnum', NULL, NULL),
(364, 17, 'MIRADA', 'Mirada', NULL, NULL),
(365, 17, 'MONACO', 'Monaco', NULL, NULL),
(366, 17, 'DODNEON', 'Neon', NULL, NULL),
(367, 17, 'NITRO', 'Nitro', NULL, NULL),
(368, 17, 'OMNI', 'Omni', NULL, NULL),
(369, 17, 'RAIDER', 'Raider', NULL, NULL),
(370, 17, 'RAM1504WD', 'Ram 1500 Truck', NULL, NULL),
(371, 17, 'RAM25002WD', 'Ram 2500 Truck', NULL, NULL),
(372, 17, 'RAM3502WD', 'Ram 3500 Truck', NULL, NULL),
(373, 17, 'RAM4500', 'Ram 4500 Truck', NULL, NULL),
(374, 17, 'DODD50', 'Ram 50 Truck', NULL, NULL),
(375, 17, 'CV', 'RAM C/V', NULL, NULL),
(376, 17, 'RAMSRT10', 'Ram SRT-10', NULL, NULL),
(377, 17, 'RAMVANV8', 'Ram Van', NULL, NULL),
(378, 17, 'RAMWAGON', 'Ram Wagon', NULL, NULL),
(379, 17, 'RAMCGR', 'Ramcharger', NULL, NULL),
(380, 17, 'RAMPAGE', 'Rampage', NULL, NULL),
(381, 17, 'DODSHAD', 'Shadow', NULL, NULL),
(382, 17, 'DODSPIR', 'Spirit', NULL, NULL),
(383, 17, 'SPRINTER', 'Sprinter', NULL, NULL),
(384, 17, 'SRT4', 'SRT-4', NULL, NULL),
(385, 17, 'STREGIS', 'St. Regis', NULL, NULL),
(386, 17, 'STEAL', 'Stealth', NULL, NULL),
(387, 17, 'STRATU', 'Stratus', NULL, NULL),
(388, 17, 'VIPER', 'Viper', NULL, NULL),
(389, 17, 'DOOTH', 'Other Dodge Models', NULL, NULL),
(390, 18, 'EAGLEMED', 'Medallion', NULL, NULL),
(391, 18, 'EAGLEPREM', 'Premier', NULL, NULL),
(392, 18, 'SUMMIT', 'Summit', NULL, NULL),
(393, 18, 'TALON', 'Talon', NULL, NULL),
(394, 18, 'VISION', 'Vision', NULL, NULL),
(395, 18, 'EAGOTH', 'Other Eagle Models', NULL, NULL),
(396, 19, '308GTB', '308 GTB Quattrovalvole', NULL, NULL),
(397, 19, '308TBI', '308 GTBI', NULL, NULL),
(398, 19, '308GTS', '308 GTS Quattrovalvole', NULL, NULL),
(399, 19, '308TSI', '308 GTSI', NULL, NULL),
(400, 19, '328GTB', '328 GTB', NULL, NULL),
(401, 19, '328GTS', '328 GTS', NULL, NULL),
(402, 19, '348GTB', '348 GTB', NULL, NULL),
(403, 19, '348GTS', '348 GTS', NULL, NULL),
(404, 19, '348SPI', '348 Spider', NULL, NULL),
(405, 19, '348TB', '348 TB', NULL, NULL),
(406, 19, '348TS', '348 TS', NULL, NULL),
(407, 19, '360', '360', NULL, NULL),
(408, 19, '456GT', '456 GT', NULL, NULL),
(409, 19, '456MGT', '456M GT', NULL, NULL),
(410, 19, '458ITALIA', '458 Italia', NULL, NULL),
(411, 19, '512BBI', '512 BBi', NULL, NULL),
(412, 19, '512M', '512M', NULL, NULL),
(413, 19, '512TR', '512TR', NULL, NULL),
(414, 19, '550M', '550 Maranello', NULL, NULL),
(415, 19, '575M', '575M Maranello', NULL, NULL),
(416, 19, '599GTB', '599 GTB Fiorano', NULL, NULL),
(417, 19, '599GTO', '599 GTO', NULL, NULL),
(418, 19, '612SCAGLIE', '612 Scaglietti', NULL, NULL),
(419, 19, 'FERCALIF', 'California', NULL, NULL),
(420, 19, 'ENZO', 'Enzo', NULL, NULL),
(421, 19, 'F355', 'F355', NULL, NULL),
(422, 19, 'F40', 'F40', NULL, NULL),
(423, 19, 'F430', 'F430', NULL, NULL),
(424, 19, 'F50', 'F50', NULL, NULL),
(425, 19, 'FERFF', 'FF', NULL, NULL),
(426, 19, 'MOND', 'Mondial', NULL, NULL),
(427, 19, 'TEST', 'Testarossa', NULL, NULL),
(428, 19, 'UNAVAILFER', 'Other Ferrari Models', NULL, NULL),
(429, 20, '2000', '2000 Spider', NULL, NULL),
(430, 20, 'FIAT500', '500', NULL, NULL),
(431, 20, 'BERTON', 'Bertone X1/9', NULL, NULL),
(432, 20, 'BRAVA', 'Brava', NULL, NULL),
(433, 20, 'PININ', 'Pininfarina Spider', NULL, NULL),
(434, 20, 'STRADA', 'Strada', NULL, NULL),
(435, 20, 'FIATX19', 'X1/9', NULL, NULL),
(436, 20, 'UNAVAILFIA', 'Other Fiat Models', NULL, NULL),
(437, 21, 'KARMA', 'Karma', NULL, NULL),
(438, 22, 'AERO', 'Aerostar', NULL, NULL),
(439, 22, 'ASPIRE', 'Aspire', NULL, NULL),
(440, 22, 'BRON', 'Bronco', NULL, NULL),
(441, 22, 'B2', 'Bronco II', NULL, NULL),
(442, 22, 'FOCMAX', 'C-MAX', NULL, NULL),
(443, 22, 'FORDCLUB', 'Club Wagon', NULL, NULL),
(444, 22, 'CONTOUR', 'Contour', NULL, NULL),
(445, 22, 'COURIER', 'Courier', NULL, NULL),
(446, 22, 'CROWNVIC', 'Crown Victoria', NULL, NULL),
(447, 22, 'E150ECON', 'E-150 and Econoline 150', NULL, NULL),
(448, 22, 'E250ECON', 'E-250 and Econoline 250', NULL, NULL),
(449, 22, 'E350ECON', 'E-350 and Econoline 350', NULL, NULL),
(450, 22, 'EDGE', 'Edge', NULL, NULL),
(451, 22, 'ESCAPE', 'Escape', NULL, NULL),
(452, 22, 'ESCO', 'Escort', NULL, NULL),
(453, 22, 'EXCURSION', 'Excursion', NULL, NULL),
(454, 22, 'EXP', 'EXP', NULL, NULL),
(455, 22, 'EXPEDI', 'Expedition', NULL, NULL),
(456, 22, 'EXPEDIEL', 'Expedition EL', NULL, NULL),
(457, 22, 'EXPLOR', 'Explorer', NULL, NULL),
(458, 22, 'SPORTTRAC', 'Explorer Sport Trac', NULL, NULL),
(459, 22, 'F100', 'F100', NULL, NULL),
(460, 22, 'F150PICKUP', 'F150', NULL, NULL),
(461, 22, 'F250', 'F250', NULL, NULL),
(462, 22, 'F350', 'F350', NULL, NULL),
(463, 22, 'F450', 'F450', NULL, NULL),
(464, 22, 'FAIRM', 'Fairmont', NULL, NULL),
(465, 22, 'FESTIV', 'Festiva', NULL, NULL),
(466, 22, 'FIESTA', 'Fiesta', NULL, NULL),
(467, 22, 'FIVEHUNDRE', 'Five Hundred', NULL, NULL),
(468, 22, 'FLEX', 'Flex', NULL, NULL),
(469, 22, 'FOCUS', 'Focus', NULL, NULL),
(470, 22, 'FREESTAR', 'Freestar', NULL, NULL),
(471, 22, 'FREESTYLE', 'Freestyle', NULL, NULL),
(472, 22, 'FUSION', 'Fusion', NULL, NULL),
(473, 22, 'GRANADA', 'Granada', NULL, NULL),
(474, 22, 'GT', 'GT', NULL, NULL),
(475, 22, 'LTD', 'LTD', NULL, NULL),
(476, 22, 'MUST', 'Mustang', NULL, NULL),
(477, 22, 'PROBE', 'Probe', NULL, NULL),
(478, 22, 'RANGER', 'Ranger', NULL, NULL),
(479, 22, 'TAURUS', 'Taurus', NULL, NULL),
(480, 22, 'TAURUSX', 'Taurus X', NULL, NULL),
(481, 22, 'TEMPO', 'Tempo', NULL, NULL),
(482, 22, 'TBIRD', 'Thunderbird', NULL, NULL),
(483, 22, 'TRANSCONN', 'Transit Connect', NULL, NULL),
(484, 22, 'WINDST', 'Windstar', NULL, NULL),
(485, 22, 'FORDZX2', 'ZX2 Escort', NULL, NULL),
(486, 22, 'FOOTH', 'Other Ford Models', NULL, NULL),
(487, 23, 'FRESPRINT', 'Sprinter', NULL, NULL),
(488, 24, 'GEOMETRO', 'Metro', NULL, NULL),
(489, 24, 'GEOPRIZM', 'Prizm', NULL, NULL),
(490, 24, 'SPECT', 'Spectrum', NULL, NULL),
(491, 24, 'STORM', 'Storm', NULL, NULL),
(492, 24, 'GEOTRACK', 'Tracker', NULL, NULL),
(493, 24, 'GEOOTH', 'Other Geo Models', NULL, NULL),
(494, 25, 'ACADIA', 'Acadia', NULL, NULL),
(495, 25, 'CABALLERO', 'Caballero', NULL, NULL),
(496, 25, 'CANYON', 'Canyon', NULL, NULL),
(497, 25, 'ENVOY', 'Envoy', NULL, NULL),
(498, 25, 'ENVOYXL', 'Envoy XL', NULL, NULL),
(499, 25, 'ENVOYXUV', 'Envoy XUV', NULL, NULL),
(500, 25, 'JIM', 'Jimmy', NULL, NULL),
(501, 25, 'RALLYWAG', 'Rally Wagon', NULL, NULL),
(502, 25, 'GMCS15', 'S15 Jimmy', NULL, NULL),
(503, 25, 'S15', 'S15 Pickup', NULL, NULL),
(504, 25, 'SAFARIGMC', 'Safari', NULL, NULL),
(505, 25, 'GMCSAVANA', 'Savana', NULL, NULL),
(506, 25, '15SIPU4WD', 'Sierra C/K1500', NULL, NULL),
(507, 25, 'GMCC25PU', 'Sierra C/K2500', NULL, NULL),
(508, 25, 'GMC3500PU', 'Sierra C/K3500', NULL, NULL),
(509, 25, 'SONOMA', 'Sonoma', NULL, NULL),
(510, 25, 'SUB', 'Suburban', NULL, NULL),
(511, 25, 'GMCSYCLON', 'Syclone', NULL, NULL),
(512, 25, 'TERRAIN', 'Terrain', NULL, NULL),
(513, 25, 'TOPC4500', 'TopKick C4500', NULL, NULL),
(514, 25, 'TYPH', 'Typhoon', NULL, NULL),
(515, 25, 'GMCVANDUR', 'Vandura', NULL, NULL),
(516, 25, 'YUKON', 'Yukon', NULL, NULL),
(517, 25, 'YUKONXL', 'Yukon XL', NULL, NULL),
(518, 25, 'GMCOTH', 'Other GMC Models', NULL, NULL),
(519, 26, 'ACCORD', 'Accord', NULL, NULL),
(520, 26, 'CIVIC', 'Civic', NULL, NULL),
(521, 26, 'CRV', 'CR-V', NULL, NULL),
(522, 26, 'CRZ', 'CR-Z', NULL, NULL),
(523, 26, 'CRX', 'CRX', NULL, NULL),
(524, 26, 'CROSSTOUR_MODELS', 'Crosstour and Accord Crosstour Models (2)', NULL, NULL),
(525, 26, 'CROSSTOUR', ' - Accord Crosstour', NULL, NULL),
(526, 26, 'HONCROSS', ' - Crosstour', NULL, NULL),
(527, 26, 'HONDELSOL', 'Del Sol', NULL, NULL),
(528, 26, 'ELEMENT', 'Element', NULL, NULL),
(529, 26, 'FIT', 'Fit', NULL, NULL),
(530, 26, 'INSIGHT', 'Insight', NULL, NULL),
(531, 26, 'ODYSSEY', 'Odyssey', NULL, NULL),
(532, 26, 'PASSPO', 'Passport', NULL, NULL),
(533, 26, 'PILOT', 'Pilot', NULL, NULL),
(534, 26, 'PRE', 'Prelude', NULL, NULL),
(535, 26, 'RIDGELINE', 'Ridgeline', NULL, NULL),
(536, 26, 'S2000', 'S2000', NULL, NULL),
(537, 26, 'HONOTH', 'Other Honda Models', NULL, NULL),
(538, 27, 'HUMMER', 'H1', NULL, NULL),
(539, 27, 'H2', 'H2', NULL, NULL),
(540, 27, 'H3', 'H3', NULL, NULL),
(541, 27, 'H3T', 'H3T', NULL, NULL),
(542, 27, 'AMGOTH', 'Other Hummer Models', NULL, NULL),
(543, 28, 'ACCENT', 'Accent', NULL, NULL),
(544, 28, 'AZERA', 'Azera', NULL, NULL),
(545, 28, 'ELANTR', 'Elantra', NULL, NULL),
(546, 28, 'HYUELANCPE', 'Elantra Coupe', NULL, NULL),
(547, 28, 'ELANTOUR', 'Elantra Touring', NULL, NULL),
(548, 28, 'ENTOURAGE', 'Entourage', NULL, NULL),
(549, 28, 'EQUUS', 'Equus', NULL, NULL),
(550, 28, 'HYUEXCEL', 'Excel', NULL, NULL),
(551, 28, 'GENESIS', 'Genesis', NULL, NULL),
(552, 28, 'GENESISCPE', 'Genesis Coupe', NULL, NULL),
(553, 28, 'SANTAFE', 'Santa Fe', NULL, NULL),
(554, 28, 'SCOUPE', 'Scoupe', NULL, NULL),
(555, 28, 'SONATA', 'Sonata', NULL, NULL),
(556, 28, 'TIBURO', 'Tiburon', NULL, NULL),
(557, 28, 'TUCSON', 'Tucson', NULL, NULL),
(558, 28, 'VELOSTER', 'Veloster', NULL, NULL),
(559, 28, 'VERACRUZ', 'Veracruz', NULL, NULL),
(560, 28, 'XG300', 'XG300', NULL, NULL),
(561, 28, 'XG350', 'XG350', NULL, NULL),
(562, 28, 'HYUOTH', 'Other Hyundai Models', NULL, NULL),
(563, 29, 'EX_MODELS', 'EX Models (2)', NULL, NULL),
(564, 29, 'EX35', ' - EX35', NULL, NULL),
(565, 29, 'EX37', ' - EX37', NULL, NULL),
(566, 29, 'FX_MODELS', 'FX Models (4)', NULL, NULL),
(567, 29, 'FX35', ' - FX35', NULL, NULL),
(568, 29, 'FX37', ' - FX37', NULL, NULL),
(569, 29, 'FX45', ' - FX45', NULL, NULL),
(570, 29, 'FX50', ' - FX50', NULL, NULL),
(571, 29, 'G_MODELS', 'G Models (4)', NULL, NULL),
(572, 29, 'G20', ' - G20', NULL, NULL),
(573, 29, 'G25', ' - G25', NULL, NULL),
(574, 29, 'G35', ' - G35', NULL, NULL),
(575, 29, 'G37', ' - G37', NULL, NULL),
(576, 29, 'I_MODELS', 'I Models (2)', NULL, NULL),
(577, 29, 'I30', ' - I30', NULL, NULL),
(578, 29, 'I35', ' - I35', NULL, NULL),
(579, 29, 'J_MODELS', 'J Models (1)', NULL, NULL),
(580, 29, 'J30', ' - J30', NULL, NULL),
(581, 29, 'JX_MODELS', 'JX Models (1)', NULL, NULL),
(582, 29, 'JX35', ' - JX35', NULL, NULL),
(583, 29, 'M_MODELS', 'M Models (6)', NULL, NULL),
(584, 29, 'M30', ' - M30', NULL, NULL),
(585, 29, 'M35', ' - M35', NULL, NULL),
(586, 29, 'M35HYBRID', ' - M35h', NULL, NULL),
(587, 29, 'M37', ' - M37', NULL, NULL),
(588, 29, 'M45', ' - M45', NULL, NULL),
(589, 29, 'M56', ' - M56', NULL, NULL),
(590, 29, 'Q_MODELS', 'Q Models (1)', NULL, NULL),
(591, 29, 'Q45', ' - Q45', NULL, NULL),
(592, 29, 'QX_MODELS', 'QX Models (2)', NULL, NULL),
(593, 29, 'QX4', ' - QX4', NULL, NULL),
(594, 29, 'QX56', ' - QX56', NULL, NULL),
(595, 29, 'INFOTH', 'Other Infiniti Models', NULL, NULL),
(596, 30, 'AMIGO', 'Amigo', NULL, NULL),
(597, 30, 'ASCENDER', 'Ascender', NULL, NULL),
(598, 30, 'AXIOM', 'Axiom', NULL, NULL),
(599, 30, 'HOMBRE', 'Hombre', NULL, NULL),
(600, 30, 'I280', 'i-280', NULL, NULL),
(601, 30, 'I290', 'i-290', NULL, NULL),
(602, 30, 'I350', 'i-350', NULL, NULL),
(603, 30, 'I370', 'i-370', NULL, NULL),
(604, 30, 'ISUMARK', 'I-Mark', NULL, NULL),
(605, 30, 'ISUIMP', 'Impulse', NULL, NULL),
(606, 30, 'OASIS', 'Oasis', NULL, NULL),
(607, 30, 'ISUPU', 'Pickup', NULL, NULL),
(608, 30, 'RODEO', 'Rodeo', NULL, NULL),
(609, 30, 'STYLUS', 'Stylus', NULL, NULL),
(610, 30, 'TROOP', 'Trooper', NULL, NULL),
(611, 30, 'TRP2', 'Trooper II', NULL, NULL),
(612, 30, 'VEHICROSS', 'VehiCROSS', NULL, NULL),
(613, 30, 'ISUOTH', 'Other Isuzu Models', NULL, NULL),
(614, 31, 'STYPE', 'S-Type', NULL, NULL),
(615, 31, 'XTYPE', 'X-Type', NULL, NULL),
(616, 31, 'XF', 'XF', NULL, NULL),
(617, 31, 'XJ_SERIES', 'XJ Series (10)', NULL, NULL),
(618, 31, 'JAGXJ12', ' - XJ12', NULL, NULL),
(619, 31, 'JAGXJ6', ' - XJ6', NULL, NULL),
(620, 31, 'JAGXJR', ' - XJR', NULL, NULL),
(621, 31, 'JAGXJRS', ' - XJR-S', NULL, NULL),
(622, 31, 'JAGXJS', ' - XJS', NULL, NULL),
(623, 31, 'VANDEN', ' - XJ Vanden Plas', NULL, NULL),
(624, 31, 'XJ', ' - XJ', NULL, NULL),
(625, 31, 'XJ8', ' - XJ8', NULL, NULL),
(626, 31, 'XJ8L', ' - XJ8 L', NULL, NULL),
(627, 31, 'XJSPORT', ' - XJ Sport', NULL, NULL),
(628, 31, 'XK_SERIES', 'XK Series (3)', NULL, NULL),
(629, 31, 'JAGXK8', ' - XK8', NULL, NULL),
(630, 31, 'XK', ' - XK', NULL, NULL),
(631, 31, 'XKR', ' - XKR', NULL, NULL),
(632, 31, 'JAGOTH', 'Other Jaguar Models', NULL, NULL),
(633, 32, 'CHER', 'Cherokee', NULL, NULL),
(634, 32, 'JEEPCJ', 'CJ', NULL, NULL),
(635, 32, 'COMANC', 'Comanche', NULL, NULL),
(636, 32, 'COMMANDER', 'Commander', NULL, NULL),
(637, 32, 'COMPASS', 'Compass', NULL, NULL),
(638, 32, 'JEEPGRAND', 'Grand Cherokee', NULL, NULL),
(639, 32, 'GRWAG', 'Grand Wagoneer', NULL, NULL),
(640, 32, 'LIBERTY', 'Liberty', NULL, NULL),
(641, 32, 'PATRIOT', 'Patriot', NULL, NULL),
(642, 32, 'JEEPPU', 'Pickup', NULL, NULL),
(643, 32, 'SCRAMBLE', 'Scrambler', NULL, NULL),
(644, 32, 'WAGONE', 'Wagoneer', NULL, NULL),
(645, 32, 'WRANGLER', 'Wrangler', NULL, NULL),
(646, 32, 'JEOTH', 'Other Jeep Models', NULL, NULL),
(647, 33, 'AMANTI', 'Amanti', NULL, NULL),
(648, 33, 'BORREGO', 'Borrego', NULL, NULL),
(649, 33, 'FORTE', 'Forte', NULL, NULL),
(650, 33, 'FORTEKOUP', 'Forte Koup', NULL, NULL),
(651, 33, 'OPTIMA', 'Optima', NULL, NULL),
(652, 33, 'RIO', 'Rio', NULL, NULL),
(653, 33, 'RIO5', 'Rio5', NULL, NULL),
(654, 33, 'RONDO', 'Rondo', NULL, NULL),
(655, 33, 'SEDONA', 'Sedona', NULL, NULL),
(656, 33, 'SEPHIA', 'Sephia', NULL, NULL),
(657, 33, 'SORENTO', 'Sorento', NULL, NULL),
(658, 33, 'SOUL', 'Soul', NULL, NULL),
(659, 33, 'SPECTRA', 'Spectra', NULL, NULL),
(660, 33, 'SPECTRA5', 'Spectra5', NULL, NULL),
(661, 33, 'SPORTA', 'Sportage', NULL, NULL),
(662, 33, 'KIAOTH', 'Other Kia Models', NULL, NULL),
(663, 34, 'AVENT', 'Aventador', NULL, NULL),
(664, 34, 'COUNT', 'Countach', NULL, NULL),
(665, 34, 'DIABLO', 'Diablo', NULL, NULL),
(666, 34, 'GALLARDO', 'Gallardo', NULL, NULL),
(667, 34, 'JALPA', 'Jalpa', NULL, NULL),
(668, 34, 'LM002', 'LM002', NULL, NULL),
(669, 34, 'MURCIELAGO', 'Murcielago', NULL, NULL),
(670, 34, 'UNAVAILLAM', 'Other Lamborghini Models', NULL, NULL),
(671, 35, 'BETA', 'Beta', NULL, NULL),
(672, 35, 'ZAGATO', 'Zagato', NULL, NULL),
(673, 35, 'UNAVAILLAN', 'Other Lancia Models', NULL, NULL),
(674, 36, 'DEFEND', 'Defender', NULL, NULL),
(675, 36, 'DISCOV', 'Discovery', NULL, NULL),
(676, 36, 'FRELNDR', 'Freelander', NULL, NULL),
(677, 36, 'LR2', 'LR2', NULL, NULL),
(678, 36, 'LR3', 'LR3', NULL, NULL),
(679, 36, 'LR4', 'LR4', NULL, NULL),
(680, 36, 'RANGE', 'Range Rover', NULL, NULL),
(681, 36, 'EVOQUE', 'Range Rover Evoque', NULL, NULL),
(682, 36, 'RANGESPORT', 'Range Rover Sport', NULL, NULL),
(683, 36, 'ROVOTH', 'Other Land Rover Models', NULL, NULL),
(684, 37, 'CT_MODELS', 'CT Models (1)', NULL, NULL),
(685, 37, 'CT200H', ' - CT 200h', NULL, NULL),
(686, 37, 'ES_MODELS', 'ES Models (5)', NULL, NULL),
(687, 37, 'ES250', ' - ES 250', NULL, NULL),
(688, 37, 'ES300', ' - ES 300', NULL, NULL),
(689, 37, 'ES300H', ' - ES 300h', NULL, NULL),
(690, 37, 'ES330', ' - ES 330', NULL, NULL),
(691, 37, 'ES350', ' - ES 350', NULL, NULL),
(692, 37, 'GS_MODELS', 'GS Models (6)', NULL, NULL),
(693, 37, 'GS300', ' - GS 300', NULL, NULL),
(694, 37, 'GS350', ' - GS 350', NULL, NULL),
(695, 37, 'GS400', ' - GS 400', NULL, NULL),
(696, 37, 'GS430', ' - GS 430', NULL, NULL),
(697, 37, 'GS450H', ' - GS 450h', NULL, NULL),
(698, 37, 'GS460', ' - GS 460', NULL, NULL),
(699, 37, 'GX_MODELS', 'GX Models (2)', NULL, NULL),
(700, 37, 'GX460', ' - GX 460', NULL, NULL),
(701, 37, 'GX470', ' - GX 470', NULL, NULL),
(702, 37, 'HS_MODELS', 'HS Models (1)', NULL, NULL),
(703, 37, 'HS250H', ' - HS 250h', NULL, NULL),
(704, 37, 'IS_MODELS', 'IS Models (6)', NULL, NULL),
(705, 37, 'IS250', ' - IS 250', NULL, NULL),
(706, 37, 'IS250C', ' - IS 250C', NULL, NULL),
(707, 37, 'IS300', ' - IS 300', NULL, NULL),
(708, 37, 'IS350', ' - IS 350', NULL, NULL),
(709, 37, 'IS350C', ' - IS 350C', NULL, NULL),
(710, 37, 'ISF', ' - IS F', NULL, NULL),
(711, 37, 'LEXLFA', 'LFA', NULL, NULL),
(712, 37, 'LS_MODELS', 'LS Models (4)', NULL, NULL),
(713, 37, 'LS400', ' - LS 400', NULL, NULL),
(714, 37, 'LS430', ' - LS 430', NULL, NULL),
(715, 37, 'LS460', ' - LS 460', NULL, NULL),
(716, 37, 'LS600H', ' - LS 600h', NULL, NULL),
(717, 37, 'LX_MODELS', 'LX Models (3)', NULL, NULL),
(718, 37, 'LX450', ' - LX 450', NULL, NULL),
(719, 37, 'LX470', ' - LX 470', NULL, NULL),
(720, 37, 'LX570', ' - LX 570', NULL, NULL),
(721, 37, 'RX_MODELS', 'RX Models (5)', NULL, NULL),
(722, 37, 'RX300', ' - RX 300', NULL, NULL),
(723, 37, 'RX330', ' - RX 330', NULL, NULL),
(724, 37, 'RX350', ' - RX 350', NULL, NULL),
(725, 37, 'RX400H', ' - RX 400h', NULL, NULL),
(726, 37, 'RX450H', ' - RX 450h', NULL, NULL),
(727, 37, 'SC_MODELS', 'SC Models (3)', NULL, NULL),
(728, 37, 'SC300', ' - SC 300', NULL, NULL),
(729, 37, 'SC400', ' - SC 400', NULL, NULL),
(730, 37, 'SC430', ' - SC 430', NULL, NULL),
(731, 37, 'LEXOTH', 'Other Lexus Models', NULL, NULL),
(732, 38, 'AVIATOR', 'Aviator', NULL, NULL),
(733, 38, 'BLKWOOD', 'Blackwood', NULL, NULL),
(734, 38, 'CONT', 'Continental', NULL, NULL),
(735, 38, 'LSLINCOLN', 'LS', NULL, NULL),
(736, 38, 'MARKLT', 'Mark LT', NULL, NULL),
(737, 38, 'MARK6', 'Mark VI', NULL, NULL),
(738, 38, 'MARK7', 'Mark VII', NULL, NULL),
(739, 38, 'MARK8', 'Mark VIII', NULL, NULL),
(740, 38, 'MKS', 'MKS', NULL, NULL),
(741, 38, 'MKT', 'MKT', NULL, NULL),
(742, 38, 'MKX', 'MKX', NULL, NULL),
(743, 38, 'MKZ', 'MKZ', NULL, NULL),
(744, 38, 'NAVIGA', 'Navigator', NULL, NULL),
(745, 38, 'NAVIGAL', 'Navigator L', NULL, NULL),
(746, 38, 'LINCTC', 'Town Car', NULL, NULL),
(747, 38, 'ZEPHYR', 'Zephyr', NULL, NULL),
(748, 38, 'LINOTH', 'Other Lincoln Models', NULL, NULL),
(749, 39, 'ELAN', 'Elan', NULL, NULL),
(750, 39, 'LOTELISE', 'Elise', NULL, NULL),
(751, 39, 'ESPRIT', 'Esprit', NULL, NULL),
(752, 39, 'EVORA', 'Evora', NULL, NULL),
(753, 39, 'EXIGE', 'Exige', NULL, NULL),
(754, 39, 'UNAVAILLOT', 'Other Lotus Models', NULL, NULL),
(755, 40, '430', '430', NULL, NULL),
(756, 40, 'BITRBO', 'Biturbo', NULL, NULL),
(757, 40, 'COUPEMAS', 'Coupe', NULL, NULL),
(758, 40, 'GRANSPORT', 'GranSport', NULL, NULL),
(759, 40, 'GRANTURISM', 'GranTurismo', NULL, NULL),
(760, 40, 'QP', 'Quattroporte', NULL, NULL),
(761, 40, 'SPYDER', 'Spyder', NULL, NULL),
(762, 40, 'UNAVAILMAS', 'Other Maserati Models', NULL, NULL),
(763, 41, '57MAYBACH', '57', NULL, NULL),
(764, 41, '62MAYBACH', '62', NULL, NULL),
(765, 41, 'UNAVAILMAY', 'Other Maybach Models', NULL, NULL),
(766, 42, 'MAZDA323', '323', NULL, NULL),
(767, 42, 'MAZDA626', '626', NULL, NULL),
(768, 42, '929', '929', NULL, NULL),
(769, 42, 'B-SERIES', 'B-Series Pickup', NULL, NULL),
(770, 42, 'CX-5', 'CX-5', NULL, NULL),
(771, 42, 'CX-7', 'CX-7', NULL, NULL),
(772, 42, 'CX-9', 'CX-9', NULL, NULL),
(773, 42, 'GLC', 'GLC', NULL, NULL),
(774, 42, 'MAZDA2', 'MAZDA2', NULL, NULL),
(775, 42, 'MAZDA3', 'MAZDA3', NULL, NULL),
(776, 42, 'MAZDA5', 'MAZDA5', NULL, NULL),
(777, 42, 'MAZDA6', 'MAZDA6', NULL, NULL),
(778, 42, 'MAZDASPD3', 'MAZDASPEED3', NULL, NULL),
(779, 42, 'MAZDASPD6', 'MAZDASPEED6', NULL, NULL),
(780, 42, 'MIATA', 'Miata MX5', NULL, NULL),
(781, 42, 'MILL', 'Millenia', NULL, NULL),
(782, 42, 'MPV', 'MPV', NULL, NULL),
(783, 42, 'MX3', 'MX3', NULL, NULL),
(784, 42, 'MX6', 'MX6', NULL, NULL),
(785, 42, 'NAVAJO', 'Navajo', NULL, NULL),
(786, 42, 'PROTE', 'Protege', NULL, NULL),
(787, 42, 'PROTE5', 'Protege5', NULL, NULL),
(788, 42, 'RX7', 'RX-7', NULL, NULL),
(789, 42, 'RX8', 'RX-8', NULL, NULL),
(790, 42, 'TRIBUTE', 'Tribute', NULL, NULL),
(791, 42, 'MAZOTH', 'Other Mazda Models', NULL, NULL),
(792, 43, 'MP4', 'MP4-12C', NULL, NULL),
(793, 44, '190_CLASS', '190 Class (2)', NULL, NULL),
(794, 44, '190D', ' - 190D', NULL, NULL),
(795, 44, '190E', ' - 190E', NULL, NULL),
(796, 44, '240_CLASS', '240 Class (1)', NULL, NULL),
(797, 44, '240D', ' - 240D', NULL, NULL),
(798, 44, '300_CLASS_E_CLASS', '300 Class / E Class (6)', NULL, NULL),
(799, 44, '300CD', ' - 300CD', NULL, NULL),
(800, 44, '300CE', ' - 300CE', NULL, NULL),
(801, 44, '300D', ' - 300D', NULL, NULL),
(802, 44, '300E', ' - 300E', NULL, NULL),
(803, 44, '300TD', ' - 300TD', NULL, NULL),
(804, 44, '300TE', ' - 300TE', NULL, NULL),
(805, 44, 'C_CLASS', 'C Class (13)', NULL, NULL),
(806, 44, 'C220', ' - C220', NULL, NULL),
(807, 44, 'C230', ' - C230', NULL, NULL),
(808, 44, 'C240', ' - C240', NULL, NULL),
(809, 44, 'C250', ' - C250', NULL, NULL),
(810, 44, 'C280', ' - C280', NULL, NULL),
(811, 44, 'C300', ' - C300', NULL, NULL),
(812, 44, 'C320', ' - C320', NULL, NULL),
(813, 44, 'C32AMG', ' - C32 AMG', NULL, NULL),
(814, 44, 'C350', ' - C350', NULL, NULL),
(815, 44, 'C36AMG', ' - C36 AMG', NULL, NULL),
(816, 44, 'C43AMG', ' - C43 AMG', NULL, NULL),
(817, 44, 'C55AMG', ' - C55 AMG', NULL, NULL),
(818, 44, 'C63AMG', ' - C63 AMG', NULL, NULL),
(819, 44, 'CL_CLASS', 'CL Class (6)', NULL, NULL),
(820, 44, 'CL500', ' - CL500', NULL, NULL),
(821, 44, 'CL550', ' - CL550', NULL, NULL),
(822, 44, 'CL55AMG', ' - CL55 AMG', NULL, NULL),
(823, 44, 'CL600', ' - CL600', NULL, NULL),
(824, 44, 'CL63AMG', ' - CL63 AMG', NULL, NULL),
(825, 44, 'CL65AMG', ' - CL65 AMG', NULL, NULL),
(826, 44, 'CLK_CLASS', 'CLK Class (7)', NULL, NULL),
(827, 44, 'CLK320', ' - CLK320', NULL, NULL),
(828, 44, 'CLK350', ' - CLK350', NULL, NULL),
(829, 44, 'CLK430', ' - CLK430', NULL, NULL),
(830, 44, 'CLK500', ' - CLK500', NULL, NULL),
(831, 44, 'CLK550', ' - CLK550', NULL, NULL),
(832, 44, 'CLK55AMG', ' - CLK55 AMG', NULL, NULL),
(833, 44, 'CLK63AMG', ' - CLK63 AMG', NULL, NULL),
(834, 44, 'CLS_CLASS', 'CLS Class (4)', NULL, NULL),
(835, 44, 'CLS500', ' - CLS500', NULL, NULL),
(836, 44, 'CLS550', ' - CLS550', NULL, NULL),
(837, 44, 'CLS55AMG', ' - CLS55 AMG', NULL, NULL),
(838, 44, 'CLS63AMG', ' - CLS63 AMG', NULL, NULL),
(839, 44, 'E_CLASS', 'E Class (18)', NULL, NULL),
(840, 44, '260E', ' - 260E', NULL, NULL),
(841, 44, '280CE', ' - 280CE', NULL, NULL),
(842, 44, '280E', ' - 280E', NULL, NULL),
(843, 44, '400E', ' - 400E', NULL, NULL),
(844, 44, '500E', ' - 500E', NULL, NULL),
(845, 44, 'E300', ' - E300', NULL, NULL),
(846, 44, 'E320', ' - E320', NULL, NULL),
(847, 44, 'E320BLUE', ' - E320 Bluetec', NULL, NULL),
(848, 44, 'E320CDI', ' - E320 CDI', NULL, NULL),
(849, 44, 'E350', ' - E350', NULL, NULL),
(850, 44, 'E350BLUE', ' - E350 Bluetec', NULL, NULL),
(851, 44, 'E400', ' - E400 Hybrid', NULL, NULL),
(852, 44, 'E420', ' - E420', NULL, NULL),
(853, 44, 'E430', ' - E430', NULL, NULL),
(854, 44, 'E500', ' - E500', NULL, NULL),
(855, 44, 'E550', ' - E550', NULL, NULL),
(856, 44, 'E55AMG', ' - E55 AMG', NULL, NULL),
(857, 44, 'E63AMG', ' - E63 AMG', NULL, NULL),
(858, 44, 'G_CLASS', 'G Class (4)', NULL, NULL),
(859, 44, 'G500', ' - G500', NULL, NULL),
(860, 44, 'G550', ' - G550', NULL, NULL),
(861, 44, 'G55AMG', ' - G55 AMG', NULL, NULL),
(862, 44, 'G63AMG', ' - G63 AMG', NULL, NULL),
(863, 44, 'GL_CLASS', 'GL Class (5)', NULL, NULL),
(864, 44, 'GL320BLUE', ' - GL320 Bluetec', NULL, NULL),
(865, 44, 'GL320CDI', ' - GL320 CDI', NULL, NULL),
(866, 44, 'GL350BLUE', ' - GL350 Bluetec', NULL, NULL),
(867, 44, 'GL450', ' - GL450', NULL, NULL),
(868, 44, 'GL550', ' - GL550', NULL, NULL),
(869, 44, 'GLK_CLASS', 'GLK Class (1)', NULL, NULL),
(870, 44, 'GLK350', ' - GLK350', NULL, NULL),
(871, 44, 'M_CLASS', 'M Class (11)', NULL, NULL),
(872, 44, 'ML320', ' - ML320', NULL, NULL),
(873, 44, 'ML320BLUE', ' - ML320 Bluetec', NULL, NULL),
(874, 44, 'ML320CDI', ' - ML320 CDI', NULL, NULL),
(875, 44, 'ML350', ' - ML350', NULL, NULL),
(876, 44, 'ML350BLUE', ' - ML350 Bluetec', NULL, NULL),
(877, 44, 'ML430', ' - ML430', NULL, NULL),
(878, 44, 'ML450HY', ' - ML450 Hybrid', NULL, NULL),
(879, 44, 'ML500', ' - ML500', NULL, NULL),
(880, 44, 'ML550', ' - ML550', NULL, NULL),
(881, 44, 'ML55AMG', ' - ML55 AMG', NULL, NULL),
(882, 44, 'ML63AMG', ' - ML63 AMG', NULL, NULL),
(883, 44, 'R_CLASS', 'R Class (6)', NULL, NULL),
(884, 44, 'R320BLUE', ' - R320 Bluetec', NULL, NULL),
(885, 44, 'R320CDI', ' - R320 CDI', NULL, NULL),
(886, 44, 'R350', ' - R350', NULL, NULL),
(887, 44, 'R350BLUE', ' - R350 Bluetec', NULL, NULL),
(888, 44, 'R500', ' - R500', NULL, NULL),
(889, 44, 'R63AMG', ' - R63 AMG', NULL, NULL),
(890, 44, 'S_CLASS', 'S Class (30)', NULL, NULL),
(891, 44, '300SD', ' - 300SD', NULL, NULL),
(892, 44, '300SDL', ' - 300SDL', NULL, NULL),
(893, 44, '300SE', ' - 300SE', NULL, NULL),
(894, 44, '300SEL', ' - 300SEL', NULL, NULL),
(895, 44, '350SD', ' - 350SD', NULL, NULL),
(896, 44, '350SDL', ' - 350SDL', NULL, NULL),
(897, 44, '380SE', ' - 380SE', NULL, NULL),
(898, 44, '380SEC', ' - 380SEC', NULL, NULL),
(899, 44, '380SEL', ' - 380SEL', NULL, NULL),
(900, 44, '400SE', ' - 400SE', NULL, NULL),
(901, 44, '400SEL', ' - 400SEL', NULL, NULL),
(902, 44, '420SEL', ' - 420SEL', NULL, NULL),
(903, 44, '500SEC', ' - 500SEC', NULL, NULL),
(904, 44, '500SEL', ' - 500SEL', NULL, NULL),
(905, 44, '560SEC', ' - 560SEC', NULL, NULL),
(906, 44, '560SEL', ' - 560SEL', NULL, NULL),
(907, 44, '600SEC', ' - 600SEC', NULL, NULL),
(908, 44, '600SEL', ' - 600SEL', NULL, NULL),
(909, 44, 'S320', ' - S320', NULL, NULL),
(910, 44, 'S350', ' - S350', NULL, NULL),
(911, 44, 'S350BLUE', ' - S350 Bluetec', NULL, NULL),
(912, 44, 'S400HY', ' - S400 Hybrid', NULL, NULL),
(913, 44, 'S420', ' - S420', NULL, NULL),
(914, 44, 'S430', ' - S430', NULL, NULL),
(915, 44, 'S500', ' - S500', NULL, NULL),
(916, 44, 'S550', ' - S550', NULL, NULL),
(917, 44, 'S55AMG', ' - S55 AMG', NULL, NULL),
(918, 44, 'S600', ' - S600', NULL, NULL),
(919, 44, 'S63AMG', ' - S63 AMG', NULL, NULL),
(920, 44, 'S65AMG', ' - S65 AMG', NULL, NULL),
(921, 44, 'SL_CLASS', 'SL Class (13)', NULL, NULL),
(922, 44, '300SL', ' - 300SL', NULL, NULL),
(923, 44, '380SL', ' - 380SL', NULL, NULL),
(924, 44, '380SLC', ' - 380SLC', NULL, NULL),
(925, 44, '500SL', ' - 500SL', NULL, NULL),
(926, 44, '560SL', ' - 560SL', NULL, NULL),
(927, 44, '600SL', ' - 600SL', NULL, NULL),
(928, 44, 'SL320', ' - SL320', NULL, NULL),
(929, 44, 'SL500', ' - SL500', NULL, NULL),
(930, 44, 'SL550', ' - SL550', NULL, NULL),
(931, 44, 'SL55AMG', ' - SL55 AMG', NULL, NULL),
(932, 44, 'SL600', ' - SL600', NULL, NULL),
(933, 44, 'SL63AMG', ' - SL63 AMG', NULL, NULL),
(934, 44, 'SL65AMG', ' - SL65 AMG', NULL, NULL),
(935, 44, 'SLK_CLASS', 'SLK Class (8)', NULL, NULL),
(936, 44, 'SLK230', ' - SLK230', NULL, NULL),
(937, 44, 'SLK250', ' - SLK250', NULL, NULL),
(938, 44, 'SLK280', ' - SLK280', NULL, NULL),
(939, 44, 'SLK300', ' - SLK300', NULL, NULL),
(940, 44, 'SLK320', ' - SLK320', NULL, NULL),
(941, 44, 'SLK32AMG', ' - SLK32 AMG', NULL, NULL),
(942, 44, 'SLK350', ' - SLK350', NULL, NULL),
(943, 44, 'SLK55AMG', ' - SLK55 AMG', NULL, NULL),
(944, 44, 'SLR_CLASS', 'SLR Class (1)', NULL, NULL),
(945, 44, 'SLR', ' - SLR', NULL, NULL),
(946, 44, 'SLS_CLASS', 'SLS Class (1)', NULL, NULL),
(947, 44, 'SLSAMG', ' - SLS AMG', NULL, NULL),
(948, 44, 'SPRINTER_CLASS', 'Sprinter Class (1)', NULL, NULL),
(949, 44, 'MBSPRINTER', ' - Sprinter', NULL, NULL),
(950, 44, 'MBOTH', 'Other Mercedes-Benz Models', NULL, NULL),
(951, 45, 'CAPRI', 'Capri', NULL, NULL),
(952, 45, 'COUGAR', 'Cougar', NULL, NULL),
(953, 45, 'MERCGRAND', 'Grand Marquis', NULL, NULL),
(954, 45, 'LYNX', 'Lynx', NULL, NULL),
(955, 45, 'MARAUDER', 'Marauder', NULL, NULL),
(956, 45, 'MARINER', 'Mariner', NULL, NULL),
(957, 45, 'MARQ', 'Marquis', NULL, NULL),
(958, 45, 'MILAN', 'Milan', NULL, NULL),
(959, 45, 'MONTEGO', 'Montego', NULL, NULL),
(960, 45, 'MONTEREY', 'Monterey', NULL, NULL),
(961, 45, 'MOUNTA', 'Mountaineer', NULL, NULL),
(962, 45, 'MYSTIQ', 'Mystique', NULL, NULL),
(963, 45, 'SABLE', 'Sable', NULL, NULL),
(964, 45, 'TOPAZ', 'Topaz', NULL, NULL),
(965, 45, 'TRACER', 'Tracer', NULL, NULL),
(966, 45, 'VILLA', 'Villager', NULL, NULL),
(967, 45, 'MERCZEP', 'Zephyr', NULL, NULL),
(968, 45, 'MEOTH', 'Other Mercury Models', NULL, NULL),
(969, 46, 'SCORP', 'Scorpio', NULL, NULL),
(970, 46, 'XR4TI', 'XR4Ti', NULL, NULL),
(971, 46, 'MEROTH', 'Other Merkur Models', NULL, NULL),
(972, 47, 'COOPRCLUB_MODELS', 'Cooper Clubman Models (2)', NULL, NULL),
(973, 47, 'COOPERCLUB', ' - Cooper Clubman', NULL, NULL),
(974, 47, 'COOPRCLUBS', ' - Cooper S Clubman', NULL, NULL),
(975, 47, 'COOPCOUNTRY_MODELS', 'Cooper Countryman Models (2)', NULL, NULL),
(976, 47, 'COUNTRYMAN', ' - Cooper Countryman', NULL, NULL),
(977, 47, 'COUNTRYMNS', ' - Cooper S Countryman', NULL, NULL),
(978, 47, 'COOPCOUP_MODELS', 'Cooper Coupe Models (2)', NULL, NULL),
(979, 47, 'MINICOUPE', ' - Cooper Coupe', NULL, NULL),
(980, 47, 'MINISCOUPE', ' - Cooper S Coupe', NULL, NULL),
(981, 47, 'COOPER_MODELS', 'Cooper Models (2)', NULL, NULL),
(982, 47, 'COOPER', ' - Cooper', NULL, NULL),
(983, 47, 'COOPERS', ' - Cooper S', NULL, NULL),
(984, 47, 'COOPRROAD_MODELS', 'Cooper Roadster Models (2)', NULL, NULL),
(985, 47, 'COOPERROAD', ' - Cooper Roadster', NULL, NULL),
(986, 47, 'COOPERSRD', ' - Cooper S Roadster', NULL, NULL),
(987, 48, '3000GT', '3000GT', NULL, NULL),
(988, 48, 'CORD', 'Cordia', NULL, NULL),
(989, 48, 'DIAMAN', 'Diamante', NULL, NULL),
(990, 48, 'ECLIP', 'Eclipse', NULL, NULL),
(991, 48, 'ENDEAVOR', 'Endeavor', NULL, NULL),
(992, 48, 'MITEXP', 'Expo', NULL, NULL),
(993, 48, 'GALANT', 'Galant', NULL, NULL),
(994, 48, 'MITI', 'i', NULL, NULL),
(995, 48, 'LANCERMITS', 'Lancer', NULL, NULL),
(996, 48, 'LANCEREVO', 'Lancer Evolution', NULL, NULL),
(997, 48, 'MITPU', 'Mighty Max', NULL, NULL),
(998, 48, 'MIRAGE', 'Mirage', NULL, NULL),
(999, 48, 'MONT', 'Montero', NULL, NULL),
(1000, 48, 'MONTSPORT', 'Montero Sport', NULL, NULL),
(1001, 48, 'OUTLANDER', 'Outlander', NULL, NULL),
(1002, 48, 'OUTLANDSPT', 'Outlander Sport', NULL, NULL),
(1003, 48, 'PRECIS', 'Precis', NULL, NULL),
(1004, 48, 'RAIDERMITS', 'Raider', NULL, NULL),
(1005, 48, 'SIGMA', 'Sigma', NULL, NULL),
(1006, 48, 'MITSTAR', 'Starion', NULL, NULL),
(1007, 48, 'TRED', 'Tredia', NULL, NULL),
(1008, 48, 'MITVAN', 'Van', NULL, NULL),
(1009, 48, 'MITOTH', 'Other Mitsubishi Models', NULL, NULL),
(1010, 49, 'NIS200SX', '200SX', NULL, NULL),
(1011, 49, '240SX', '240SX', NULL, NULL),
(1012, 49, '300ZXTURBO', '300ZX', NULL, NULL),
(1013, 49, '350Z', '350Z', NULL, NULL),
(1014, 49, '370Z', '370Z', NULL, NULL),
(1015, 49, 'ALTIMA', 'Altima', NULL, NULL),
(1016, 49, 'PATHARMADA', 'Armada', NULL, NULL),
(1017, 49, 'AXXESS', 'Axxess', NULL, NULL),
(1018, 49, 'CUBE', 'Cube', NULL, NULL),
(1019, 49, 'FRONTI', 'Frontier', NULL, NULL),
(1020, 49, 'GT-R', 'GT-R', NULL, NULL),
(1021, 49, 'JUKE', 'Juke', NULL, NULL),
(1022, 49, 'LEAF', 'Leaf', NULL, NULL),
(1023, 49, 'MAX', 'Maxima', NULL, NULL),
(1024, 49, 'MURANO', 'Murano', NULL, NULL),
(1025, 49, 'MURANOCROS', 'Murano CrossCabriolet', NULL, NULL),
(1026, 49, 'NV', 'NV', NULL, NULL),
(1027, 49, 'NX', 'NX', NULL, NULL),
(1028, 49, 'PATH', 'Pathfinder', NULL, NULL),
(1029, 49, 'NISPU', 'Pickup', NULL, NULL),
(1030, 49, 'PULSAR', 'Pulsar', NULL, NULL),
(1031, 49, 'QUEST', 'Quest', NULL, NULL),
(1032, 49, 'ROGUE', 'Rogue', NULL, NULL),
(1033, 49, 'SENTRA', 'Sentra', NULL, NULL),
(1034, 49, 'STANZA', 'Stanza', NULL, NULL),
(1035, 49, 'TITAN', 'Titan', NULL, NULL),
(1036, 49, 'NISVAN', 'Van', NULL, NULL),
(1037, 49, 'VERSA', 'Versa', NULL, NULL),
(1038, 49, 'XTERRA', 'Xterra', NULL, NULL),
(1039, 49, 'NISSOTH', 'Other Nissan Models', NULL, NULL),
(1040, 50, '88', '88', NULL, NULL),
(1041, 50, 'ACHIEV', 'Achieva', NULL, NULL),
(1042, 50, 'ALERO', 'Alero', NULL, NULL),
(1043, 50, 'AURORA', 'Aurora', NULL, NULL),
(1044, 50, 'BRAV', 'Bravada', NULL, NULL),
(1045, 50, 'CUCR', 'Custom Cruiser', NULL, NULL),
(1046, 50, 'OLDCUS', 'Cutlass', NULL, NULL),
(1047, 50, 'OLDCALAIS', 'Cutlass Calais', NULL, NULL),
(1048, 50, 'CIERA', 'Cutlass Ciera', NULL, NULL),
(1049, 50, 'CSUPR', 'Cutlass Supreme', NULL, NULL),
(1050, 50, 'OLDSFIR', 'Firenza', NULL, NULL),
(1051, 50, 'INTRIG', 'Intrigue', NULL, NULL),
(1052, 50, '98', 'Ninety-Eight', NULL, NULL),
(1053, 50, 'OMEG', 'Omega', NULL, NULL),
(1054, 50, 'REGEN', 'Regency', NULL, NULL),
(1055, 50, 'SILHO', 'Silhouette', NULL, NULL),
(1056, 50, 'TORO', 'Toronado', NULL, NULL),
(1057, 50, 'OLDOTH', 'Other Oldsmobile Models', NULL, NULL),
(1058, 51, '405', '405', NULL, NULL),
(1059, 51, '504', '504', NULL, NULL),
(1060, 51, '505', '505', NULL, NULL),
(1061, 51, '604', '604', NULL, NULL),
(1062, 51, 'UNAVAILPEU', 'Other Peugeot Models', NULL, NULL),
(1063, 52, 'ACC', 'Acclaim', NULL, NULL),
(1064, 52, 'ARROW', 'Arrow', NULL, NULL),
(1065, 52, 'BREEZE', 'Breeze', NULL, NULL),
(1066, 52, 'CARAVE', 'Caravelle', NULL, NULL),
(1067, 52, 'CHAMP', 'Champ', NULL, NULL),
(1068, 52, 'COLT', 'Colt', NULL, NULL),
(1069, 52, 'PLYMCONQ', 'Conquest', NULL, NULL),
(1070, 52, 'GRANFURY', 'Gran Fury', NULL, NULL),
(1071, 52, 'PLYMGRANV', 'Grand Voyager', NULL, NULL),
(1072, 52, 'HORI', 'Horizon', NULL, NULL),
(1073, 52, 'LASER', 'Laser', NULL, NULL),
(1074, 52, 'NEON', 'Neon', NULL, NULL),
(1075, 52, 'PROWLE', 'Prowler', NULL, NULL),
(1076, 52, 'RELI', 'Reliant', NULL, NULL),
(1077, 52, 'SAPPOROPLY', 'Sapporo', NULL, NULL),
(1078, 52, 'SCAMP', 'Scamp', NULL, NULL),
(1079, 52, 'SUNDAN', 'Sundance', NULL, NULL),
(1080, 52, 'TRAILDUST', 'Trailduster', NULL, NULL),
(1081, 52, 'VOYA', 'Voyager', NULL, NULL),
(1082, 52, 'PLYOTH', 'Other Plymouth Models', NULL, NULL),
(1083, 53, 'T-1000', '1000', NULL, NULL),
(1084, 53, '6000', '6000', NULL, NULL),
(1085, 53, 'AZTEK', 'Aztek', NULL, NULL),
(1086, 53, 'BON', 'Bonneville', NULL, NULL),
(1087, 53, 'CATALINA', 'Catalina', NULL, NULL),
(1088, 53, 'FIERO', 'Fiero', NULL, NULL),
(1089, 53, 'FBIRD', 'Firebird', NULL, NULL),
(1090, 53, 'G3', 'G3', NULL, NULL),
(1091, 53, 'G5', 'G5', NULL, NULL),
(1092, 53, 'G6', 'G6', NULL, NULL),
(1093, 53, 'G8', 'G8', NULL, NULL),
(1094, 53, 'GRNDAM', 'Grand Am', NULL, NULL),
(1095, 53, 'GP', 'Grand Prix', NULL, NULL),
(1096, 53, 'GTO', 'GTO', NULL, NULL),
(1097, 53, 'J2000', 'J2000', NULL, NULL),
(1098, 53, 'LEMANS', 'Le Mans', NULL, NULL),
(1099, 53, 'MONTANA', 'Montana', NULL, NULL),
(1100, 53, 'PARISI', 'Parisienne', NULL, NULL),
(1101, 53, 'PHOENIX', 'Phoenix', NULL, NULL),
(1102, 53, 'SAFARIPONT', 'Safari', NULL, NULL),
(1103, 53, 'SOLSTICE', 'Solstice', NULL, NULL),
(1104, 53, 'SUNBIR', 'Sunbird', NULL, NULL),
(1105, 53, 'SUNFIR', 'Sunfire', NULL, NULL),
(1106, 53, 'TORRENT', 'Torrent', NULL, NULL),
(1107, 53, 'TS', 'Trans Sport', NULL, NULL),
(1108, 53, 'VIBE', 'Vibe', NULL, NULL),
(1109, 53, 'PONOTH', 'Other Pontiac Models', NULL, NULL),
(1110, 54, '911', '911', NULL, NULL),
(1111, 54, '924', '924', NULL, NULL),
(1112, 54, '928', '928', NULL, NULL),
(1113, 54, '944', '944', NULL, NULL),
(1114, 54, '968', '968', NULL, NULL),
(1115, 54, 'BOXSTE', 'Boxster', NULL, NULL),
(1116, 54, 'CARRERAGT', 'Carrera GT', NULL, NULL),
(1117, 54, 'CAYENNE', 'Cayenne', NULL, NULL),
(1118, 54, 'CAYMAN', 'Cayman', NULL, NULL),
(1119, 54, 'PANAMERA', 'Panamera', NULL, NULL),
(1120, 54, 'POROTH', 'Other Porsche Models', NULL, NULL),
(1121, 55, 'RAM1504WD', '1500', NULL, NULL),
(1122, 55, 'RAM25002WD', '2500', NULL, NULL),
(1123, 55, 'RAM3502WD', '3500', NULL, NULL),
(1124, 55, 'RAM4500', '4500', NULL, NULL),
(1125, 56, '18I', '18i', NULL, NULL),
(1126, 56, 'FU', 'Fuego', NULL, NULL),
(1127, 56, 'LECAR', 'Le Car', NULL, NULL),
(1128, 56, 'R18', 'R18', NULL, NULL),
(1129, 56, 'RENSPORT', 'Sportwagon', NULL, NULL),
(1130, 56, 'UNAVAILREN', 'Other Renault Models', NULL, NULL),
(1131, 57, 'CAMAR', 'Camargue', NULL, NULL),
(1132, 57, 'CORN', 'Corniche', NULL, NULL),
(1133, 57, 'GHOST', 'Ghost', NULL, NULL),
(1134, 57, 'PARKWARD', 'Park Ward', NULL, NULL),
(1135, 57, 'PHANT', 'Phantom', NULL, NULL),
(1136, 57, 'DAWN', 'Silver Dawn', NULL, NULL),
(1137, 57, 'SILSERAPH', 'Silver Seraph', NULL, NULL),
(1138, 57, 'RRSPIR', 'Silver Spirit', NULL, NULL),
(1139, 57, 'SPUR', 'Silver Spur', NULL, NULL),
(1140, 57, 'UNAVAILRR', 'Other Rolls-Royce Models', NULL, NULL),
(1141, 58, '9-2X', '9-2X', NULL, NULL),
(1142, 58, '9-3', '9-3', NULL, NULL),
(1143, 58, '9-4X', '9-4X', NULL, NULL),
(1144, 58, '9-5', '9-5', NULL, NULL),
(1145, 58, '97X', '9-7X', NULL, NULL),
(1146, 58, '900', '900', NULL, NULL),
(1147, 58, '9000', '9000', NULL, NULL),
(1148, 58, 'SAOTH', 'Other Saab Models', NULL, NULL),
(1149, 59, 'ASTRA', 'Astra', NULL, NULL),
(1150, 59, 'AURA', 'Aura', NULL, NULL),
(1151, 59, 'ION', 'ION', NULL, NULL),
(1152, 59, 'L_SERIES', 'L Series (3)', NULL, NULL),
(1153, 59, 'L100', ' - L100', NULL, NULL),
(1154, 59, 'L200', ' - L200', NULL, NULL),
(1155, 59, 'L300', ' - L300', NULL, NULL),
(1156, 59, 'LSSATURN', 'LS', NULL, NULL),
(1157, 59, 'LW_SERIES', 'LW Series (4)', NULL, NULL),
(1158, 59, 'LW', ' - LW1', NULL, NULL),
(1159, 59, 'LW2', ' - LW2', NULL, NULL),
(1160, 59, 'LW200', ' - LW200', NULL, NULL),
(1161, 59, 'LW300', ' - LW300', NULL, NULL);
INSERT INTO `model` (`id`, `make_id`, `code`, `title`, `created_at`, `updated_at`) VALUES
(1162, 59, 'OUTLOOK', 'Outlook', NULL, NULL),
(1163, 59, 'RELAY', 'Relay', NULL, NULL),
(1164, 59, 'SC_SERIES', 'SC Series (2)', NULL, NULL),
(1165, 59, 'SC1', ' - SC1', NULL, NULL),
(1166, 59, 'SC2', ' - SC2', NULL, NULL),
(1167, 59, 'SKY', 'Sky', NULL, NULL),
(1168, 59, 'SL_SERIES', 'SL Series (3)', NULL, NULL),
(1169, 59, 'SL', ' - SL', NULL, NULL),
(1170, 59, 'SL1', ' - SL1', NULL, NULL),
(1171, 59, 'SL2', ' - SL2', NULL, NULL),
(1172, 59, 'SW_SERIES', 'SW Series (2)', NULL, NULL),
(1173, 59, 'SW1', ' - SW1', NULL, NULL),
(1174, 59, 'SW2', ' - SW2', NULL, NULL),
(1175, 59, 'VUE', 'Vue', NULL, NULL),
(1176, 59, 'SATOTH', 'Other Saturn Models', NULL, NULL),
(1177, 60, 'SCIFRS', 'FR-S', NULL, NULL),
(1178, 60, 'IQ', 'iQ', NULL, NULL),
(1179, 60, 'TC', 'tC', NULL, NULL),
(1180, 60, 'XA', 'xA', NULL, NULL),
(1181, 60, 'XB', 'xB', NULL, NULL),
(1182, 60, 'XD', 'xD', NULL, NULL),
(1183, 61, 'FORTWO', 'fortwo', NULL, NULL),
(1184, 61, 'SMOTH', 'Other smart Models', NULL, NULL),
(1185, 62, 'SRTVIPER', 'Viper', NULL, NULL),
(1186, 63, '825', '825', NULL, NULL),
(1187, 63, '827', '827', NULL, NULL),
(1188, 63, 'UNAVAILSTE', 'Other Sterling Models', NULL, NULL),
(1189, 64, 'BAJA', 'Baja', NULL, NULL),
(1190, 64, 'BRAT', 'Brat', NULL, NULL),
(1191, 64, 'SUBBRZ', 'BRZ', NULL, NULL),
(1192, 64, 'FOREST', 'Forester', NULL, NULL),
(1193, 64, 'IMPREZ', 'Impreza', NULL, NULL),
(1194, 64, 'IMPWRX', 'Impreza WRX', NULL, NULL),
(1195, 64, 'JUSTY', 'Justy', NULL, NULL),
(1196, 64, 'SUBL', 'L Series', NULL, NULL),
(1197, 64, 'LEGACY', 'Legacy', NULL, NULL),
(1198, 64, 'LOYALE', 'Loyale', NULL, NULL),
(1199, 64, 'SUBOUTBK', 'Outback', NULL, NULL),
(1200, 64, 'SVX', 'SVX', NULL, NULL),
(1201, 64, 'B9TRIBECA', 'Tribeca', NULL, NULL),
(1202, 64, 'XT', 'XT', NULL, NULL),
(1203, 64, 'XVCRSSTREK', 'XV Crosstrek', NULL, NULL),
(1204, 64, 'SUBOTH', 'Other Subaru Models', NULL, NULL),
(1205, 65, 'AERIO', 'Aerio', NULL, NULL),
(1206, 65, 'EQUATOR', 'Equator', NULL, NULL),
(1207, 65, 'ESTEEM', 'Esteem', NULL, NULL),
(1208, 65, 'FORENZA', 'Forenza', NULL, NULL),
(1209, 65, 'GRANDV', 'Grand Vitara', NULL, NULL),
(1210, 65, 'KIZASHI', 'Kizashi', NULL, NULL),
(1211, 65, 'RENO', 'Reno', NULL, NULL),
(1212, 65, 'SAMUR', 'Samurai', NULL, NULL),
(1213, 65, 'SIDE', 'Sidekick', NULL, NULL),
(1214, 65, 'SWIFT', 'Swift', NULL, NULL),
(1215, 65, 'SX4', 'SX4', NULL, NULL),
(1216, 65, 'VERONA', 'Verona', NULL, NULL),
(1217, 65, 'VITARA', 'Vitara', NULL, NULL),
(1218, 65, 'X90', 'X-90', NULL, NULL),
(1219, 65, 'XL7', 'XL7', NULL, NULL),
(1220, 65, 'SUZOTH', 'Other Suzuki Models', NULL, NULL),
(1221, 66, 'ROADSTER', 'Roadster', NULL, NULL),
(1222, 67, '4RUN', '4Runner', NULL, NULL),
(1223, 67, 'AVALON', 'Avalon', NULL, NULL),
(1224, 67, 'CAMRY', 'Camry', NULL, NULL),
(1225, 67, 'CELICA', 'Celica', NULL, NULL),
(1226, 67, 'COROL', 'Corolla', NULL, NULL),
(1227, 67, 'CORONA', 'Corona', NULL, NULL),
(1228, 67, 'CRESS', 'Cressida', NULL, NULL),
(1229, 67, 'ECHO', 'Echo', NULL, NULL),
(1230, 67, 'FJCRUIS', 'FJ Cruiser', NULL, NULL),
(1231, 67, 'HIGHLANDER', 'Highlander', NULL, NULL),
(1232, 67, 'LC', 'Land Cruiser', NULL, NULL),
(1233, 67, 'MATRIX', 'Matrix', NULL, NULL),
(1234, 67, 'MR2', 'MR2', NULL, NULL),
(1235, 67, 'MR2SPYDR', 'MR2 Spyder', NULL, NULL),
(1236, 67, 'PASEO', 'Paseo', NULL, NULL),
(1237, 67, 'PICKUP', 'Pickup', NULL, NULL),
(1238, 67, 'PREVIA', 'Previa', NULL, NULL),
(1239, 67, 'PRIUS', 'Prius', NULL, NULL),
(1240, 67, 'PRIUSC', 'Prius C', NULL, NULL),
(1241, 67, 'PRIUSV', 'Prius V', NULL, NULL),
(1242, 67, 'RAV4', 'RAV4', NULL, NULL),
(1243, 67, 'SEQUOIA', 'Sequoia', NULL, NULL),
(1244, 67, 'SIENNA', 'Sienna', NULL, NULL),
(1245, 67, 'SOLARA', 'Solara', NULL, NULL),
(1246, 67, 'STARLET', 'Starlet', NULL, NULL),
(1247, 67, 'SUPRA', 'Supra', NULL, NULL),
(1248, 67, 'T100', 'T100', NULL, NULL),
(1249, 67, 'TACOMA', 'Tacoma', NULL, NULL),
(1250, 67, 'TERCEL', 'Tercel', NULL, NULL),
(1251, 67, 'TUNDRA', 'Tundra', NULL, NULL),
(1252, 67, 'TOYVAN', 'Van', NULL, NULL),
(1253, 67, 'VENZA', 'Venza', NULL, NULL),
(1254, 67, 'YARIS', 'Yaris', NULL, NULL),
(1255, 67, 'TOYOTH', 'Other Toyota Models', NULL, NULL),
(1256, 68, 'TR7', 'TR7', NULL, NULL),
(1257, 68, 'TR8', 'TR8', NULL, NULL),
(1258, 68, 'TRIOTH', 'Other Triumph Models', NULL, NULL),
(1259, 69, 'BEETLE', 'Beetle', NULL, NULL),
(1260, 69, 'VOLKSCAB', 'Cabrio', NULL, NULL),
(1261, 69, 'CAB', 'Cabriolet', NULL, NULL),
(1262, 69, 'CC', 'CC', NULL, NULL),
(1263, 69, 'CORR', 'Corrado', NULL, NULL),
(1264, 69, 'DASHER', 'Dasher', NULL, NULL),
(1265, 69, 'EOS', 'Eos', NULL, NULL),
(1266, 69, 'EUROVAN', 'Eurovan', NULL, NULL),
(1267, 69, 'VOLKSFOX', 'Fox', NULL, NULL),
(1268, 69, 'GLI', 'GLI', NULL, NULL),
(1269, 69, 'GOLFR', 'Golf R', NULL, NULL),
(1270, 69, 'GTI', 'GTI', NULL, NULL),
(1271, 69, 'GOLFANDRABBITMODELS', 'Golf and Rabbit Models (2)', NULL, NULL),
(1272, 69, 'GOLF', ' - Golf', NULL, NULL),
(1273, 69, 'RABBIT', ' - Rabbit', NULL, NULL),
(1274, 69, 'JET', 'Jetta', NULL, NULL),
(1275, 69, 'PASS', 'Passat', NULL, NULL),
(1276, 69, 'PHAETON', 'Phaeton', NULL, NULL),
(1277, 69, 'RABBITPU', 'Pickup', NULL, NULL),
(1278, 69, 'QUAN', 'Quantum', NULL, NULL),
(1279, 69, 'R32', 'R32', NULL, NULL),
(1280, 69, 'ROUTAN', 'Routan', NULL, NULL),
(1281, 69, 'SCIR', 'Scirocco', NULL, NULL),
(1282, 69, 'TIGUAN', 'Tiguan', NULL, NULL),
(1283, 69, 'TOUAREG', 'Touareg', NULL, NULL),
(1284, 69, 'VANAG', 'Vanagon', NULL, NULL),
(1285, 69, 'VWOTH', 'Other Volkswagen Models', NULL, NULL),
(1286, 70, '240', '240', NULL, NULL),
(1287, 70, '260', '260', NULL, NULL),
(1288, 70, '740', '740', NULL, NULL),
(1289, 70, '760', '760', NULL, NULL),
(1290, 70, '780', '780', NULL, NULL),
(1291, 70, '850', '850', NULL, NULL),
(1292, 70, '940', '940', NULL, NULL),
(1293, 70, '960', '960', NULL, NULL),
(1294, 70, 'C30', 'C30', NULL, NULL),
(1295, 70, 'C70', 'C70', NULL, NULL),
(1296, 70, 'S40', 'S40', NULL, NULL),
(1297, 70, 'S60', 'S60', NULL, NULL),
(1298, 70, 'S70', 'S70', NULL, NULL),
(1299, 70, 'S80', 'S80', NULL, NULL),
(1300, 70, 'S90', 'S90', NULL, NULL),
(1301, 70, 'V40', 'V40', NULL, NULL),
(1302, 70, 'V50', 'V50', NULL, NULL),
(1303, 70, 'V70', 'V70', NULL, NULL),
(1304, 70, 'V90', 'V90', NULL, NULL),
(1305, 70, 'XC60', 'XC60', NULL, NULL),
(1306, 70, 'XC', 'XC70', NULL, NULL),
(1307, 70, 'XC90', 'XC90', NULL, NULL),
(1308, 70, 'VOLOTH', 'Other Volvo Models', NULL, NULL),
(1309, 71, 'GV', 'GV', NULL, NULL),
(1310, 71, 'GVC', 'GVC', NULL, NULL),
(1311, 71, 'GVL', 'GVL', NULL, NULL),
(1312, 71, 'GVS', 'GVS', NULL, NULL),
(1313, 71, 'GVX', 'GVX', NULL, NULL),
(1314, 71, 'YUOTH', 'Other Yugo Models', NULL, NULL),
(1315, 72, 'KLM', 'klm', NULL, NULL),
(1316, 73, '45I', '45i', NULL, NULL),
(1317, 74, '45QS', '45qs', NULL, NULL),
(1318, 75, 'CLIO 45I', 'CLIO 45I', NULL, NULL),
(1319, 76, 'HJK', 'HJK', NULL, NULL),
(1320, 77, 'HJK', 'HJK', NULL, NULL),
(1321, 78, 'HJK', 'HJK', NULL, NULL),
(1322, 79, 'JKL', 'JKL', NULL, NULL),
(1323, 80, 'LMù', 'LMù', NULL, NULL),
(1324, 81, 'MLùù', 'MLùù', NULL, NULL),
(1325, 82, 'LKM', 'LKM', NULL, NULL),
(1326, 83, 'YAMAHA-1508572872', 'YAMAHA-1508572872', NULL, NULL),
(1327, 84, 'YAMAHA-1508572890', 'YAMAHA-1508572890', NULL, NULL),
(1328, 85, 'YAMAHA-1508572938', 'YAMAHA-1508572938', NULL, NULL),
(1329, 86, 'YAMAHA-1508572984', 'YAMAHA-1508572984', NULL, NULL),
(1330, 87, 'YAMAHA-1508573012', 'YAMAHA-1508573012', NULL, NULL),
(1331, 88, 'YAMAHA-1508573034', 'YAMAHA-1508573034', NULL, NULL),
(1332, 89, 'YAMAHA-1508573074', 'YAMAHA-1508573074', NULL, NULL),
(1333, 90, 'YAMAHA-1508573102', 'YAMAHA-1508573102', NULL, NULL),
(1334, 91, 'YAMAHA-1508573130', 'YAMAHA-1508573130', NULL, NULL),
(1335, 92, 'YAMAHA-1508573466', 'YAMAHA-1508573466', NULL, NULL),
(1336, 93, 'YAMAHA-1508573484', 'YAMAHA-1508573484', NULL, NULL),
(1337, 94, 'YAMAHA-1508573523', 'YAMAHA-1508573523', NULL, NULL),
(1338, 95, 'YAMAHA-1508573599', 'YAMAHA-1508573599', NULL, NULL),
(1339, 96, 'YAMAHA-1508573617', 'YAMAHA-1508573617', NULL, NULL),
(1340, 97, 'YAMAHA-1508573638', 'YAMAHA-1508573638', NULL, NULL),
(1341, 98, 'YAMAHA-1509372640', 'YAMAHA-1509372640', NULL, NULL),
(1342, 99, 'MAZDA-1510319959', 'MAZDA-1510319959', NULL, NULL),
(1343, 111, 'YAMAHA-1511799443', 'YAMAHA-1511799443', NULL, NULL),
(1344, 113, 'LEONIDAS-1512064726', 'LEONIDAS-1512064726', NULL, NULL),
(1345, 114, 'TOYOTA-1512132159', 'TOYOTA-1512132159', NULL, NULL),
(1346, 115, 'BMW-1512256719', 'BMW-1512256719', NULL, NULL),
(1347, 120, 'KTM-1513720310', 'KTM-1513720310', NULL, NULL),
(1348, 121, 'KTM-1513756683', 'KTM-1513756683', NULL, NULL),
(1349, 122, 'KTM-1513756722', 'KTM-1513756722', NULL, NULL),
(1350, 126, 'SUZUKI-1517234181', 'SUZUKI-1517234181', NULL, NULL),
(1351, 127, 'YAMAHA-1517264522', 'YAMAHA-1517264522', NULL, NULL),
(1352, 128, 'YAMAHA-1517264549', 'YAMAHA-1517264549', NULL, NULL),
(1353, 129, 'YAMAHA-1517264566', 'YAMAHA-1517264566', NULL, NULL),
(1354, 130, 'YAMAHA-1517264630', 'YAMAHA-1517264630', NULL, NULL),
(1355, 132, 'KTM-1517929087', 'KTM-1517929087', NULL, NULL),
(1356, 133, 'KYMCO-1517995577', 'KYMCO-1517995577', NULL, NULL),
(1357, 135, 'APSONIC-1519974462', 'APSONIC-1519974462', NULL, NULL),
(1358, 136, 'KTM-1520590257', 'KTM-1520590257', NULL, NULL),
(1359, 138, 'YAMAHA-1522159271', 'YAMAHA-1522159271', NULL, NULL),
(1360, 140, 'KYMCO-1522496500', 'KYMCO-1522496500', NULL, NULL),
(1361, 141, 'KYMCO-1522496611', 'KYMCO-1522496611', NULL, NULL),
(1362, 142, 'KYMCO-1522497554', 'KYMCO-1522497554', NULL, NULL),
(1363, 143, 'KYMCO-1522497866', 'KYMCO-1522497866', NULL, NULL),
(1364, 144, 'SUZUKI-1522775358', 'SUZUKI-1522775358', NULL, NULL),
(1365, 146, 'APACHE-1523439452', 'APACHE-1523439452', NULL, NULL),
(1366, 147, 'APACHE-1523439501', 'APACHE-1523439501', NULL, NULL),
(1367, 148, 'YAMAHA-1523560922', 'YAMAHA-1523560922', NULL, NULL),
(1368, 150, 'RATO-1525346964', 'RATO-1525346964', NULL, NULL),
(1369, 151, 'RATO-1525348784', 'RATO-1525348784', NULL, NULL),
(1370, 152, 'ROTA-1525358588', 'ROTA-1525358588', NULL, NULL),
(1371, 153, 'RATO-1525359948', 'RATO-1525359948', NULL, NULL),
(1372, 154, 'RATO-1525401573', 'RATO-1525401573', NULL, NULL),
(1373, 155, 'RATO-1525424535', 'RATO-1525424535', NULL, NULL),
(1374, 156, 'RATO-1525425943', 'RATO-1525425943', NULL, NULL),
(1375, 157, 'YAMAYA-1525801465', 'YAMAYA-1525801465', NULL, NULL),
(1376, 160, 'SANYA 125-1526946698', 'SANYA 125-1526946698', NULL, NULL),
(1377, 161, 'JAABOUK-1527159718', 'JAABOUK-1527159718', NULL, NULL),
(1378, 162, 'XXXX-1527160497', 'XXXX-1527160497', NULL, NULL),
(1379, 163, 'YAMAHA-1527529515', 'YAMAHA-1527529515', NULL, NULL),
(1380, 164, 'YAMAHA-1527594137', 'YAMAHA-1527594137', NULL, NULL),
(1381, 165, 'NJHBN-1527601448', 'NJHBN-1527601448', NULL, NULL),
(1382, 166, 'QWERGH-1528079315', 'QWERGH-1528079315', NULL, NULL),
(1383, 170, 'YAMAHA-1529418846', 'YAMAHA-1529418846', NULL, NULL),
(1384, 171, 'APSONIC-1530006420', 'APSONIC-1530006420', NULL, NULL),
(1385, 172, 'YAMAHA-1530089689', 'YAMAHA-1530089689', NULL, NULL),
(1386, 174, 'HAOJIN-1531386074', 'HAOJIN-1531386074', NULL, NULL),
(1387, 175, 'YAMAHA-1531756379', 'YAMAHA-1531756379', NULL, NULL),
(1388, 177, 'KTM-1532448981', 'KTM-1532448981', NULL, NULL),
(1389, 178, 'KTM-1534581904', 'KTM-1534581904', NULL, NULL),
(1390, 180, 'YAMAHA-1535674407', 'YAMAHA-1535674407', NULL, NULL),
(1391, 181, 'SUZIKI-1535807181', 'SUZIKI-1535807181', NULL, NULL),
(1392, 184, 'KTM-1536255236', 'KTM-1536255236', NULL, NULL),
(1393, 185, 'KTM-1536255549', 'KTM-1536255549', NULL, NULL),
(1394, 186, 'KTM 50-1536601702', 'KTM 50-1536601702', NULL, NULL),
(1395, 187, 'KTM 50-1536603451', 'KTM 50-1536603451', NULL, NULL),
(1396, 188, 'KTM X1-1536668690', 'KTM X1-1536668690', NULL, NULL),
(1397, 189, 'KTM-1537564457', 'KTM-1537564457', NULL, NULL),
(1398, 193, 'YAMAHA-1537974518', 'YAMAHA-1537974518', NULL, NULL),
(1399, 196, 'KTM-1538412038', 'KTM-1538412038', NULL, NULL),
(1400, 197, 'KTM-1538412488', 'KTM-1538412488', NULL, NULL),
(1401, 198, 'TOYOTA-1538575812', 'TOYOTA-1538575812', NULL, NULL),
(1402, 199, 'TVS ROCKZ-1538655429', 'TVS ROCKZ-1538655429', NULL, NULL),
(1403, 201, 'KTM 50-1538763619', 'KTM 50-1538763619', NULL, NULL),
(1404, 202, 'YAMAHA-1539273176', 'YAMAHA-1539273176', NULL, NULL),
(1405, 203, 'KTM-1539613304', 'KTM-1539613304', NULL, NULL),
(1406, 204, 'HAOJUE-1540077794', 'HAOJUE-1540077794', NULL, NULL),
(1407, 205, 'NX50CC-1540199937', 'NX50CC-1540199937', NULL, NULL),
(1408, 207, 'TVS-1540814415', 'TVS-1540814415', NULL, NULL),
(1409, 208, 'DSDS-1540987025', 'DSDS-1540987025', NULL, NULL),
(1410, 211, 'TOYOTA-1542631145', 'TOYOTA-1542631145', NULL, NULL),
(1411, 212, 'KTM-1542893790', 'KTM-1542893790', NULL, NULL),
(1412, 213, 'KTM-1543252827', 'KTM-1543252827', NULL, NULL),
(1413, 214, 'YAMAHA-1543579589', 'YAMAHA-1543579589', NULL, NULL),
(1414, 215, 'DAYANG-1544697460', 'DAYANG-1544697460', NULL, NULL),
(1415, 217, 'APSONIC-1545237070', 'APSONIC-1545237070', NULL, NULL),
(1416, 219, 'BMW-1545485745', 'BMW-1545485745', NULL, NULL),
(1417, 224, 'PIAGGIO-1546937261', 'PIAGGIO-1546937261', NULL, NULL),
(1418, 225, 'KTM-1547745756', 'KTM-1547745756', NULL, NULL),
(1419, 226, 'SUZUKI-1547825857', 'SUZUKI-1547825857', NULL, NULL),
(1420, 228, 'KTM-1548679189', 'KTM-1548679189', NULL, NULL),
(1421, 229, 'YAMAHA-1549024209', 'YAMAHA-1549024209', NULL, NULL),
(1422, 230, 'APSONIC-1550067290', 'APSONIC-1550067290', NULL, NULL),
(1423, 231, 'KTM-1550413764', 'KTM-1550413764', NULL, NULL),
(1424, 232, 'YAMAHA-1551000581', 'YAMAHA-1551000581', NULL, NULL),
(1425, 233, 'YAMAHA-1551002045', 'YAMAHA-1551002045', NULL, NULL),
(1426, 234, 'APSONIC-1551265214', 'APSONIC-1551265214', NULL, NULL),
(1427, 235, 'KTM X1-1551286643', 'KTM X1-1551286643', NULL, NULL),
(1428, 238, 'KTM-1552395492', 'KTM-1552395492', NULL, NULL),
(1429, 239, 'YAMAHA-1552665816', 'YAMAHA-1552665816', NULL, NULL),
(1430, 240, 'SAGNA-1552812860', 'SAGNA-1552812860', NULL, NULL),
(1431, 241, 'APSONIC-1552930310', 'APSONIC-1552930310', NULL, NULL),
(1432, 242, 'SANYA-1552937361', 'SANYA-1552937361', NULL, NULL),
(1433, 243, 'YAMAHA-1553458862', 'YAMAHA-1553458862', NULL, NULL),
(1434, 244, 'BMW-1554207517', 'BMW-1554207517', NULL, NULL),
(1435, 245, 'CAN AM-1554550358', 'CAN AM-1554550358', NULL, NULL),
(1436, 246, 'KAWASAKI-1554637089', 'KAWASAKI-1554637089', NULL, NULL),
(1437, 249, 'YAMAHA-1554933891', 'YAMAHA-1554933891', NULL, NULL),
(1438, 250, 'YAMAHA-1555058272', 'YAMAHA-1555058272', NULL, NULL),
(1439, 252, 'FVDFVDFV-1555820974', 'FVDFVDFV-1555820974', NULL, NULL),
(1440, 253, 'KTM-1555959585', 'KTM-1555959585', NULL, NULL),
(1441, 254, 'YAMAHA-1556363088', 'YAMAHA-1556363088', NULL, NULL),
(1442, 256, 'HUNDAY-1557399179', 'HUNDAY-1557399179', NULL, NULL),
(1443, 257, 'BMW-1557744538', 'BMW-1557744538', NULL, NULL),
(1444, 258, 'TVS-1558640879', 'TVS-1558640879', NULL, NULL),
(1445, 259, 'SUZUKI-1560686586', 'SUZUKI-1560686586', NULL, NULL),
(1446, 260, 'KTM-1560735461', 'KTM-1560735461', NULL, NULL),
(1447, 262, 'KTM-1561660617', 'KTM-1561660617', NULL, NULL),
(1448, 264, 'ROYAL MOTOR-1563564104', 'ROYAL MOTOR-1563564104', NULL, NULL),
(1449, 265, 'KTM-1564183951', 'KTM-1564183951', NULL, NULL),
(1450, 266, 'KTM-1564564198', 'KTM-1564564198', NULL, NULL),
(1451, 267, 'YAMAHA T MAX XP 500-1564666617', 'YAMAHA T MAX XP 500-1564666617', NULL, NULL),
(1452, 268, 'YAMAMOTO-1564948200', 'YAMAMOTO-1564948200', NULL, NULL),
(1453, 269, 'SANIA-1565014552', 'SANIA-1565014552', NULL, NULL),
(1454, 270, 'TOYOTA-1566233750', 'TOYOTA-1566233750', NULL, NULL),
(1455, 271, 'KTM-1566671428', 'KTM-1566671428', NULL, NULL),
(1456, 274, 'HAOJUE-1568442119', 'HAOJUE-1568442119', NULL, NULL),
(1457, 276, 'KTM-1569324956', 'KTM-1569324956', NULL, NULL),
(1458, 277, 'JO-1570196856', 'JO-1570196856', NULL, NULL),
(1459, 278, 'JO-1570197172', 'JO-1570197172', NULL, NULL),
(1460, 279, 'HONDA-1570455481', 'HONDA-1570455481', NULL, NULL),
(1461, 280, 'XXXX-1570457590', 'XXXX-1570457590', NULL, NULL),
(1462, 281, 'XXXX-1570458714', 'XXXX-1570458714', NULL, NULL),
(1463, 282, 'FFFF-1570458808', 'FFFF-1570458808', NULL, NULL),
(1464, 283, 'XXXX-1570459191', 'XXXX-1570459191', NULL, NULL),
(1465, 284, 'SSSS-1570459542', 'SSSS-1570459542', NULL, NULL),
(1466, 285, 'XXXX-1570459994', 'XXXX-1570459994', NULL, NULL),
(1467, 286, 'SUPER NUMéRO 1-1571386594', 'SUPER NUMéRO 1-1571386594', NULL, NULL),
(1468, 287, 'SCOOTER-1571399983', 'SCOOTER-1571399983', NULL, NULL),
(1469, 289, 'KTM-1572533329', 'KTM-1572533329', NULL, NULL),
(1470, 290, 'KTM-1572536985', 'KTM-1572536985', NULL, NULL),
(1471, 291, 'KTM-1572856831', 'KTM-1572856831', NULL, NULL),
(1472, 292, 'KTM-1572859021', 'KTM-1572859021', NULL, NULL),
(1473, 293, 'TVS-1573461909', 'TVS-1573461909', NULL, NULL),
(1474, 294, 'TVS-1573722743', 'TVS-1573722743', NULL, NULL),
(1475, 295, 'TVS-1573722800', 'TVS-1573722800', NULL, NULL),
(1476, 296, 'HONDA-1573892594', 'HONDA-1573892594', NULL, NULL),
(1477, 297, 'APSONIC-1574270336', 'APSONIC-1574270336', NULL, NULL),
(1478, 300, 'HAOJIN-1575376053', 'HAOJIN-1575376053', NULL, NULL),
(1479, 302, 'KTM-1575631309', 'KTM-1575631309', NULL, NULL),
(1480, 303, 'KTM-1575672580', 'KTM-1575672580', NULL, NULL),
(1481, 304, 'KTM-1576224560', 'KTM-1576224560', NULL, NULL),
(1482, 305, 'NISSAN-1576661796', 'NISSAN-1576661796', NULL, NULL),
(1483, 306, 'KTM-1576919057', 'KTM-1576919057', NULL, NULL),
(1484, 307, 'TOYOTA-1576949082', 'TOYOTA-1576949082', NULL, NULL),
(1485, 308, 'APSONIC-1577097587', 'APSONIC-1577097587', NULL, NULL),
(1486, 311, 'RATO-1578941454', 'RATO-1578941454', NULL, NULL),
(1487, 312, 'TVS-1579085032', 'TVS-1579085032', NULL, NULL),
(1488, 313, 'APSONIC-1579261967', 'APSONIC-1579261967', NULL, NULL),
(1489, 315, 'JIALING-1580150430', 'JIALING-1580150430', NULL, NULL),
(1490, 316, 'TVS-1580725121', 'TVS-1580725121', NULL, NULL),
(1491, 317, 'YAMAHA-1580931747', 'YAMAHA-1580931747', NULL, NULL),
(1492, 318, 'KTM-1581604583', 'KTM-1581604583', NULL, NULL),
(1493, 319, 'KTM-1581604592', 'KTM-1581604592', NULL, NULL),
(1494, 320, 'KTM-1582124891', 'KTM-1582124891', NULL, NULL),
(1495, 321, 'KTM-1582417476', 'KTM-1582417476', NULL, NULL),
(1496, 324, 'KTM-1587236693', 'KTM-1587236693', NULL, NULL),
(1497, 325, 'YAMAHA 125 RDX-1587727047', 'YAMAHA 125 RDX-1587727047', NULL, NULL),
(1498, 326, 'APSONIC-1587992774', 'APSONIC-1587992774', NULL, NULL),
(1499, 327, 'TVS-1588160537', 'TVS-1588160537', NULL, NULL),
(1500, 328, 'APSONIC-1588160722', 'APSONIC-1588160722', NULL, NULL),
(1501, 329, 'YAMAHA-1588424312', 'YAMAHA-1588424312', NULL, NULL),
(1502, 331, 'KTM-1588675701', 'KTM-1588675701', NULL, NULL),
(1503, 332, 'SANILI-1588768620', 'SANILI-1588768620', NULL, NULL),
(1504, 333, 'SANILI-1588772278', 'SANILI-1588772278', NULL, NULL),
(1505, 334, 'KTM-1588834340', 'KTM-1588834340', NULL, NULL),
(1506, 337, 'YAMAHA-1588927043', 'YAMAHA-1588927043', NULL, NULL),
(1507, 340, 'APSONIC-1589412261', 'APSONIC-1589412261', NULL, NULL),
(1508, 341, 'KTM-1589783575', 'KTM-1589783575', NULL, NULL),
(1509, 342, 'TVS-1589801976', 'TVS-1589801976', NULL, NULL),
(1510, 344, 'TVS-1589889936', 'TVS-1589889936', NULL, NULL),
(1511, 345, 'VESPAS-1590150555', 'VESPAS-1590150555', NULL, NULL),
(1512, 348, 'KTM-1590750897', 'KTM-1590750897', NULL, NULL),
(1513, 349, 'KTM X1-1591541610', 'KTM X1-1591541610', NULL, NULL),
(1514, 350, 'SYM-1591603093', 'SYM-1591603093', NULL, NULL),
(1515, 351, 'SYM-1591604229', 'SYM-1591604229', NULL, NULL),
(1516, 352, 'SYM-1591604842', 'SYM-1591604842', NULL, NULL),
(1517, 353, 'SAFARI-1591616976', 'SAFARI-1591616976', NULL, NULL),
(1518, 354, 'KTM-1591618272', 'KTM-1591618272', NULL, NULL),
(1519, 355, 'PIAGGIO-1591791261', 'PIAGGIO-1591791261', NULL, NULL),
(1520, 357, 'KTM-1591980389', 'KTM-1591980389', NULL, NULL),
(1521, 358, 'YAMAHA-1592753727', 'YAMAHA-1592753727', NULL, NULL),
(1522, 359, 'KTM-1592822019', 'KTM-1592822019', NULL, NULL),
(1523, 360, 'BMW-1592844869', 'BMW-1592844869', NULL, NULL),
(1524, 361, 'TOYOTA CAMRI-1593509600', 'TOYOTA CAMRI-1593509600', NULL, NULL),
(1525, 362, 'KTM-1594041049', 'KTM-1594041049', NULL, NULL),
(1526, 363, 'MOTO-1594671413', 'MOTO-1594671413', NULL, NULL),
(1527, 364, 'SUZUKI-1595002339', 'SUZUKI-1595002339', NULL, NULL),
(1528, 365, 'KTM-1595271580', 'KTM-1595271580', NULL, NULL),
(1529, 366, 'MOTO KTM-1595435997', 'MOTO KTM-1595435997', NULL, NULL),
(1530, 367, 'YAMAHA-1595549721', 'YAMAHA-1595549721', NULL, NULL),
(1531, 368, 'APSONIC-1596452543', 'APSONIC-1596452543', NULL, NULL),
(1532, 370, 'KTM-1596719620', 'KTM-1596719620', NULL, NULL),
(1533, 372, 'TVS-1598353019', 'TVS-1598353019', NULL, NULL),
(1534, 373, 'TVS-1598356249', 'TVS-1598356249', NULL, NULL),
(1535, 374, 'SAFARI-1599038513', 'SAFARI-1599038513', NULL, NULL),
(1536, 375, 'KTM-1599039123', 'KTM-1599039123', NULL, NULL),
(1537, 376, 'KTM-1599039287', 'KTM-1599039287', NULL, NULL),
(1538, 377, 'HAOJIN-1599039412', 'HAOJIN-1599039412', NULL, NULL),
(1539, 378, 'HAOJIN-1599039882', 'HAOJIN-1599039882', NULL, NULL),
(1540, 379, 'HAOJIN-1599040113', 'HAOJIN-1599040113', NULL, NULL),
(1541, 380, 'HAOJIN-1599040206', 'HAOJIN-1599040206', NULL, NULL),
(1542, 381, 'HAOJIN-1599040300', 'HAOJIN-1599040300', NULL, NULL),
(1543, 382, 'HAOJIN-1599040351', 'HAOJIN-1599040351', NULL, NULL),
(1544, 383, 'HAOJIN-1599040416', 'HAOJIN-1599040416', NULL, NULL),
(1545, 384, 'HAOJIN-1599040699', 'HAOJIN-1599040699', NULL, NULL),
(1546, 385, 'KTM-1599120466', 'KTM-1599120466', NULL, NULL),
(1547, 386, 'YAMAHA-1599270517', 'YAMAHA-1599270517', NULL, NULL),
(1548, 387, 'YAMAHA-1599271499', 'YAMAHA-1599271499', NULL, NULL),
(1549, 388, 'YAMAHA-1599353184', 'YAMAHA-1599353184', NULL, NULL),
(1550, 389, 'KTM X1-1599652992', 'KTM X1-1599652992', NULL, NULL),
(1551, 390, 'KTM-1599821235', 'KTM-1599821235', NULL, NULL),
(1552, 391, 'KAWASAKI-1599840168', 'KAWASAKI-1599840168', NULL, NULL),
(1553, 392, 'KAWASAKI-1599840389', 'KAWASAKI-1599840389', NULL, NULL),
(1554, 393, 'KAWASAKI-1599841141', 'KAWASAKI-1599841141', NULL, NULL),
(1555, 394, 'KAWASAKI-1599848956', 'KAWASAKI-1599848956', NULL, NULL),
(1556, 395, 'KAWASAKI-1599849261', 'KAWASAKI-1599849261', NULL, NULL),
(1557, 396, 'YAMAHA-1599926656', 'YAMAHA-1599926656', NULL, NULL),
(1558, 397, 'KTM-1600108819', 'KTM-1600108819', NULL, NULL),
(1559, 398, 'KTM-1600696730', 'KTM-1600696730', NULL, NULL),
(1560, 399, 'KTM-1600697246', 'KTM-1600697246', NULL, NULL),
(1561, 402, 'KAWASAKI-1602335547', 'KAWASAKI-1602335547', NULL, NULL),
(1562, 403, 'KAWASAKI-1602335950', 'KAWASAKI-1602335950', NULL, NULL),
(1563, 404, 'KAWASAKI-1602336413', 'KAWASAKI-1602336413', NULL, NULL),
(1564, 405, 'KAWASAKI-1602338095', 'KAWASAKI-1602338095', NULL, NULL),
(1565, 406, 'YAMAHA-1602591049', 'YAMAHA-1602591049', NULL, NULL),
(1566, 407, 'SUZUKI-1603618605', 'SUZUKI-1603618605', NULL, NULL),
(1567, 408, 'YAMAHA YBR 125G-1604518341', 'YAMAHA YBR 125G-1604518341', NULL, NULL),
(1568, 409, 'APSONIC-1616442363', 'APSONIC-1616442363', NULL, NULL),
(1569, 410, 'APSONIC-1616442375', 'APSONIC-1616442375', NULL, NULL),
(1570, 411, 'HUSQVARNA-1616659106', 'HUSQVARNA-1616659106', NULL, NULL),
(1571, 412, 'SANYA-1616665778', 'SANYA-1616665778', NULL, NULL),
(1572, 413, 'CAMICO-1616681431', 'CAMICO-1616681431', NULL, NULL),
(1573, 414, 'KTM-1617029707', 'KTM-1617029707', NULL, NULL),
(1574, 415, 'KTM-1617041851', 'KTM-1617041851', NULL, NULL),
(1575, 416, 'KTM-1617057547', 'KTM-1617057547', NULL, NULL),
(1576, 417, 'KTM-1617143020', 'KTM-1617143020', NULL, NULL),
(1577, 418, 'KTM-1617143032', 'KTM-1617143032', NULL, NULL),
(1578, 419, 'APSONIC-1617207414', 'APSONIC-1617207414', NULL, NULL),
(1579, 420, 'APSONIC-1618224299', 'APSONIC-1618224299', NULL, NULL),
(1580, 421, 'YAMAHA-1618313110', 'YAMAHA-1618313110', NULL, NULL),
(1581, 422, 'HAOJIN-1618672428', 'HAOJIN-1618672428', NULL, NULL),
(1582, 423, 'HAOJIN-1618672629', 'HAOJIN-1618672629', NULL, NULL),
(1583, 424, 'HAOJIN-1618672720', 'HAOJIN-1618672720', NULL, NULL),
(1584, 425, 'HAOJIN-1618672890', 'HAOJIN-1618672890', NULL, NULL),
(1585, 426, 'HAOJIN-1618774421', 'HAOJIN-1618774421', NULL, NULL),
(1586, 428, 'BMW-1619450723', 'BMW-1619450723', NULL, NULL),
(1587, 429, 'CONSECTETUR A EU TE-1619946667', 'CONSECTETUR A EU TE-1619946667', NULL, NULL),
(1588, 430, 'APSONIC-1620123546', 'APSONIC-1620123546', NULL, NULL),
(1589, 431, 'APSONIC-1620207871', 'APSONIC-1620207871', NULL, NULL),
(1590, 432, 'YAMAHA-1620269799', 'YAMAHA-1620269799', NULL, NULL),
(1591, 433, 'YAMAHA-1620270480', 'YAMAHA-1620270480', NULL, NULL),
(1592, 434, 'SAFARI-1620292248', 'SAFARI-1620292248', NULL, NULL),
(1593, 435, 'BMW-1620654844', 'BMW-1620654844', NULL, NULL),
(1594, 436, 'KTM-1620655535', 'KTM-1620655535', NULL, NULL),
(1595, 437, 'YAMAHA-1621004252', 'YAMAHA-1621004252', NULL, NULL),
(1596, 438, 'QLINK KEEWAY-1621070063', 'QLINK KEEWAY-1621070063', NULL, NULL),
(1597, 439, 'KTM-1621871687', 'KTM-1621871687', NULL, NULL),
(1598, 440, 'KTM-1622389194', 'KTM-1622389194', NULL, NULL),
(1599, 441, 'KTM-1622633956', 'KTM-1622633956', NULL, NULL),
(1600, 442, 'KTM-1622660125', 'KTM-1622660125', NULL, NULL),
(1601, 443, 'MOTOCYCLETTE PEUGEOT-1623236464', 'MOTOCYCLETTE PEUGEOT-1623236464', NULL, NULL),
(1602, 444, 'MOTOCYCLETTE PEUGEOT-1623237046', 'MOTOCYCLETTE PEUGEOT-1623237046', NULL, NULL),
(1603, 445, 'KTM-1623339581', 'KTM-1623339581', NULL, NULL),
(1604, 446, 'R1200-1624710337', 'R1200-1624710337', NULL, NULL),
(1605, 448, 'KTM-1625963732', 'KTM-1625963732', NULL, NULL),
(1606, 449, 'KTM-1626285202', 'KTM-1626285202', NULL, NULL),
(1607, 450, 'APSONIC-1627283941', 'APSONIC-1627283941', NULL, NULL),
(1608, 451, 'APSONIC-1627388831', 'APSONIC-1627388831', NULL, NULL),
(1609, 452, 'KTM-1627608884', 'KTM-1627608884', NULL, NULL),
(1610, 453, 'KTM-1628087792', 'KTM-1628087792', NULL, NULL),
(1611, 454, 'APPSONICK-1628277114', 'APPSONICK-1628277114', NULL, NULL),
(1612, 455, 'KTM-1628541639', 'KTM-1628541639', NULL, NULL),
(1613, 456, 'PART-1628754991', 'PART-1628754991', NULL, NULL),
(1614, 457, 'APSONIC-1629359537', 'APSONIC-1629359537', NULL, NULL),
(1615, 458, 'APSONIC-1629371241', 'APSONIC-1629371241', NULL, NULL),
(1616, 459, 'KTM-1630085691', 'KTM-1630085691', NULL, NULL),
(1617, 460, 'KTM-1630604200', 'KTM-1630604200', NULL, NULL),
(1618, 461, 'SONLINK-1630621543', 'SONLINK-1630621543', NULL, NULL),
(1619, 462, 'APSONIC-1630793659', 'APSONIC-1630793659', NULL, NULL),
(1620, 463, 'KTM-1631020418', 'KTM-1631020418', NULL, NULL),
(1621, 464, 'KTM-1631020746', 'KTM-1631020746', NULL, NULL),
(1622, 466, 'RENAULT-1632155054', 'RENAULT-1632155054', NULL, NULL),
(1623, 467, 'YAMAHA-1632400661', 'YAMAHA-1632400661', NULL, NULL),
(1624, 468, 'SOWMOTOR-1632923497', 'SOWMOTOR-1632923497', NULL, NULL),
(1625, 469, 'YAMAHA-1633938423', 'YAMAHA-1633938423', NULL, NULL),
(1626, 470, 'YAMAHA-1633938775', 'YAMAHA-1633938775', NULL, NULL),
(1627, 471, 'KTM 50-1633985147', 'KTM 50-1633985147', NULL, NULL),
(1628, 472, 'KTM-1633988871', 'KTM-1633988871', NULL, NULL),
(1629, 473, 'YAMAHA-1634114036', 'YAMAHA-1634114036', NULL, NULL),
(1630, 474, 'APSONIC-1634648233', 'APSONIC-1634648233', NULL, NULL),
(1631, 475, 'KTM-1636180485', 'KTM-1636180485', NULL, NULL),
(1632, 476, 'KTM X1-1636450383', 'KTM X1-1636450383', NULL, NULL),
(1633, 477, 'MOTO-1636537326', 'MOTO-1636537326', NULL, NULL),
(1634, 478, 'YAMAHA YBR 125-1636631498', 'YAMAHA YBR 125-1636631498', NULL, NULL),
(1635, 479, 'YAMAHA YBR 125-1636639842', 'YAMAHA YBR 125-1636639842', NULL, NULL),
(1636, 480, 'YAMAHA YBR 125-1636640707', 'YAMAHA YBR 125-1636640707', NULL, NULL),
(1637, 481, 'CAMICO CITY-1637319106', 'CAMICO CITY-1637319106', NULL, NULL),
(1638, 482, 'RATO WINGER GTR-1637320143', 'RATO WINGER GTR-1637320143', NULL, NULL),
(1639, 483, 'ROTO-1637332374', 'ROTO-1637332374', NULL, NULL),
(1640, 484, 'YAMAHA-1637777811', 'YAMAHA-1637777811', NULL, NULL),
(1641, 485, 'PHOUPHOUET DONATIEN-1638780196', 'PHOUPHOUET DONATIEN-1638780196', NULL, NULL),
(1642, 486, 'SUZUKI-1639199224', 'SUZUKI-1639199224', NULL, NULL),
(1643, 487, 'KTM-1642431835', 'KTM-1642431835', NULL, NULL),
(1644, 488, 'KTM-1642431888', 'KTM-1642431888', NULL, NULL),
(1645, 489, 'SONLINK-1642712314', 'SONLINK-1642712314', NULL, NULL),
(1646, 490, 'KTM-1642851800', 'KTM-1642851800', NULL, NULL),
(1647, 491, 'TVS-1642957277', 'TVS-1642957277', NULL, NULL),
(1648, 492, 'PART-1642977117', 'PART-1642977117', NULL, NULL),
(1649, 493, 'HAOJIN-1643212376', 'HAOJIN-1643212376', NULL, NULL),
(1650, 494, 'APSONIC-1643353540', 'APSONIC-1643353540', NULL, NULL),
(1651, 495, 'LION MOTO-1644678984', 'LION MOTO-1644678984', NULL, NULL),
(1652, 496, 'V-1645000932', 'V-1645000932', NULL, NULL),
(1653, 497, 'SAC-1645537032', 'SAC-1645537032', NULL, NULL),
(1654, 498, 'KTM-1646037505', 'KTM-1646037505', NULL, NULL),
(1655, 499, 'HUANGHE-1646082061', 'HUANGHE-1646082061', NULL, NULL),
(1656, 500, 'HARLEY-DAVIDSON-1646093905', 'HARLEY-DAVIDSON-1646093905', NULL, NULL),
(1657, 501, 'KTM-1646236544', 'KTM-1646236544', NULL, NULL),
(1658, 502, 'YAMAHA-1646410797', 'YAMAHA-1646410797', NULL, NULL),
(1659, 503, 'YAMAHA-1646412380', 'YAMAHA-1646412380', NULL, NULL),
(1660, 504, 'APSONIC 170 Z-ONE-1647158378', 'APSONIC 170 Z-ONE-1647158378', NULL, NULL),
(1661, 505, 'TEST-1647295015', 'TEST-1647295015', NULL, NULL),
(1662, 506, 'APSONIC-1647524634', 'APSONIC-1647524634', NULL, NULL),
(1663, 508, 'KTM-1648241844', 'KTM-1648241844', NULL, NULL),
(1664, 509, 'KTM-1648552011', 'KTM-1648552011', NULL, NULL),
(1665, 510, 'RATO-1648643716', 'RATO-1648643716', NULL, NULL),
(1666, 511, 'RATO-1648644259', 'RATO-1648644259', NULL, NULL),
(1667, 512, 'RATO-1648644782', 'RATO-1648644782', NULL, NULL),
(1668, 513, 'RATO-1648645307', 'RATO-1648645307', NULL, NULL),
(1669, 514, 'APSONIC-1648805268', 'APSONIC-1648805268', NULL, NULL),
(1670, 516, 'KTM-1649350675', 'KTM-1649350675', NULL, NULL),
(1671, 517, 'KTM-1650645714', 'KTM-1650645714', NULL, NULL),
(1672, 518, 'YAMAHA-1651022304', 'YAMAHA-1651022304', NULL, NULL),
(1673, 519, 'KTM POWERK-1652440682', 'KTM POWERK-1652440682', NULL, NULL),
(1674, 520, 'KTM-1652944317', 'KTM-1652944317', NULL, NULL),
(1675, 521, 'KTM-1653036375', 'KTM-1653036375', NULL, NULL),
(1676, 522, 'KTM-1653036721', 'KTM-1653036721', NULL, NULL),
(1677, 523, 'TOYOTA-1653129747', 'TOYOTA-1653129747', NULL, NULL),
(1678, 524, 'FDDFDFDFDFDF-1653132410', 'FDDFDFDFDFDF-1653132410', NULL, NULL),
(1679, 525, 'FDDFDFDFDFDF-1653132541', 'FDDFDFDFDFDF-1653132541', NULL, NULL),
(1680, 526, 'DFDFFDDF-1653224823', 'DFDFFDDF-1653224823', NULL, NULL),
(1681, 527, 'BMW-1653658506', 'BMW-1653658506', NULL, NULL),
(1682, 528, 'BMW-1653658816', 'BMW-1653658816', NULL, NULL),
(1683, 529, 'MEYLUN-1654065748', 'MEYLUN-1654065748', NULL, NULL),
(1684, 530, 'MAZDA-1654102720', 'MAZDA-1654102720', NULL, NULL),
(1685, 531, 'HAOJIN-1654167018', 'HAOJIN-1654167018', NULL, NULL),
(1686, 532, 'TVS-1655374913', 'TVS-1655374913', NULL, NULL),
(1687, 533, 'TVS-1655375080', 'TVS-1655375080', NULL, NULL),
(1688, 534, 'BMW-1656346526', 'BMW-1656346526', NULL, NULL),
(1689, 536, 'YAM-1657043513', 'YAM-1657043513', NULL, NULL),
(1690, 537, 'YAMAHA-1657540759', 'YAMAHA-1657540759', NULL, NULL),
(1691, 538, 'APSONIC-1657616482', 'APSONIC-1657616482', NULL, NULL),
(1692, 539, 'APSONIC-1657815005', 'APSONIC-1657815005', NULL, NULL),
(1693, 540, 'KTM-1658424164', 'KTM-1658424164', NULL, NULL),
(1694, 542, 'APSONIC-1658834174', 'APSONIC-1658834174', NULL, NULL),
(1695, 543, 'KTM-1659606658', 'KTM-1659606658', NULL, NULL),
(1696, 544, 'KTM-1659618161', 'KTM-1659618161', NULL, NULL),
(1697, 545, 'KTM-1659618332', 'KTM-1659618332', NULL, NULL),
(1698, 546, 'KTM-1659622341', 'KTM-1659622341', NULL, NULL),
(1699, 547, 'KTM-1659622624', 'KTM-1659622624', NULL, NULL),
(1700, 548, 'KTM-1659622848', 'KTM-1659622848', NULL, NULL),
(1701, 549, 'KTM-1659623017', 'KTM-1659623017', NULL, NULL),
(1702, 550, 'KTM-1659623196', 'KTM-1659623196', NULL, NULL),
(1703, 551, 'KTM-1660560858', 'KTM-1660560858', NULL, NULL),
(1704, 552, 'KTM-1660560936', 'KTM-1660560936', NULL, NULL),
(1705, 553, 'KTM-1660561217', 'KTM-1660561217', NULL, NULL),
(1706, 555, 'SUZUKI-1661261336', 'SUZUKI-1661261336', NULL, NULL),
(1707, 558, 'APSONIC-1661856926', 'APSONIC-1661856926', NULL, NULL),
(1708, 559, 'KTM-1661952341', 'KTM-1661952341', NULL, NULL),
(1709, 561, 'QASKI 125-30-1662410638', 'QASKI 125-30-1662410638', NULL, NULL),
(1710, 562, 'QASKI 125-30-1662410739', 'QASKI 125-30-1662410739', NULL, NULL),
(1711, 563, 'QASKI 125-30-1662411202', 'QASKI 125-30-1662411202', NULL, NULL),
(1712, 565, 'KTM-1663577155', 'KTM-1663577155', NULL, NULL),
(1713, 566, 'APSONIC-1664730041', 'APSONIC-1664730041', NULL, NULL),
(1714, 567, 'APSONIC-1664815624', 'APSONIC-1664815624', NULL, NULL),
(1715, 568, 'BMW-1666099299', 'BMW-1666099299', NULL, NULL),
(1716, 569, 'HONDA-1666186881', 'HONDA-1666186881', NULL, NULL),
(1717, 571, 'SANYA-1666275694', 'SANYA-1666275694', NULL, NULL),
(1718, 572, 'HAOJUE-1666728099', 'HAOJUE-1666728099', NULL, NULL),
(1719, 573, 'HAOJUE-1666728701', 'HAOJUE-1666728701', NULL, NULL),
(1720, 576, 'KTM-1669563365', 'KTM-1669563365', NULL, NULL),
(1721, 577, 'KTM POWER K-1670408282', 'KTM POWER K-1670408282', NULL, NULL),
(1722, 578, 'KTM-1671306777', 'KTM-1671306777', NULL, NULL),
(1723, 579, 'KTM-1672660229', 'KTM-1672660229', NULL, NULL),
(1724, 580, 'KTM-1672661096', 'KTM-1672661096', NULL, NULL),
(1725, 581, 'SAFARI-1672678174', 'SAFARI-1672678174', NULL, NULL),
(1726, 582, 'SAFARI-1672678629', 'SAFARI-1672678629', NULL, NULL),
(1727, 583, 'SAFARI-1672683865', 'SAFARI-1672683865', NULL, NULL),
(1728, 584, 'SAFARI-1672684238', 'SAFARI-1672684238', NULL, NULL),
(1729, 585, 'SAFARI-1672684424', 'SAFARI-1672684424', NULL, NULL),
(1730, 586, 'SAFARI-1672684559', 'SAFARI-1672684559', NULL, NULL),
(1731, 588, 'ORIGINAL SKF-1672913060', 'ORIGINAL SKF-1672913060', NULL, NULL),
(1732, 590, 'KTM-1673482630', 'KTM-1673482630', NULL, NULL),
(1733, 591, 'HAOJUE-1673609755', 'HAOJUE-1673609755', NULL, NULL),
(1734, 592, 'HAOJUE-1673610316', 'HAOJUE-1673610316', NULL, NULL),
(1735, 655, 'YAMAHA-1674026950', 'YAMAHA-1674026950', NULL, NULL),
(1736, 656, 'APSONIC-1674810223', 'APSONIC-1674810223', NULL, NULL),
(1737, 657, 'APSONIC-1674810321', 'APSONIC-1674810321', NULL, NULL),
(1738, 658, 'QASKI-1675073682', 'QASKI-1675073682', NULL, NULL),
(1739, 664, 'MOTOCYCLETTE-1675318108', 'MOTOCYCLETTE-1675318108', NULL, NULL),
(1740, 665, 'KTM-1675501359', 'KTM-1675501359', NULL, NULL),
(1741, 666, 'YAMAHA-1675714345', 'YAMAHA-1675714345', NULL, NULL),
(1742, 667, 'YAMAHA-1675714488', 'YAMAHA-1675714488', NULL, NULL),
(1743, 668, 'APSONIC-1675870471', 'APSONIC-1675870471', NULL, NULL),
(1744, 669, 'TVS-1676240298', 'TVS-1676240298', NULL, NULL),
(1745, 671, 'HONDA-1676652265', 'HONDA-1676652265', NULL, NULL),
(1746, 672, 'APSONIC-1676660592', 'APSONIC-1676660592', NULL, NULL),
(1747, 673, 'APSONIC-1676669789', 'APSONIC-1676669789', NULL, NULL),
(1748, 674, 'APSONIC-1676669841', 'APSONIC-1676669841', NULL, NULL),
(1749, 675, 'APSONIC-1676670231', 'APSONIC-1676670231', NULL, NULL),
(1750, 676, 'YAMAHA-1676745712', 'YAMAHA-1676745712', NULL, NULL),
(1751, 677, 'YAMAHA-1676747926', 'YAMAHA-1676747926', NULL, NULL),
(1752, 678, 'YAMAHA-1676753163', 'YAMAHA-1676753163', NULL, NULL),
(1753, 679, 'XXXXXXXXX-1676880873', 'XXXXXXXXX-1676880873', NULL, NULL),
(1754, 680, 'APSONIC-1676925075', 'APSONIC-1676925075', NULL, NULL),
(1755, 681, 'APSONIC-1676925322', 'APSONIC-1676925322', NULL, NULL),
(1756, 682, 'APSONIC-1677069070', 'APSONIC-1677069070', NULL, NULL),
(1757, 683, 'APSONIC-1677109159', 'APSONIC-1677109159', NULL, NULL),
(1758, 684, 'YAMAHA-1677483996', 'YAMAHA-1677483996', NULL, NULL),
(1759, 685, 'HAOHUE-1677501571', 'HAOHUE-1677501571', NULL, NULL),
(1760, 731, 'YAMAHA-1677607370', 'YAMAHA-1677607370', NULL, NULL),
(1761, 732, 'YAMAHA-1677607911', 'YAMAHA-1677607911', NULL, NULL),
(1762, 733, 'YAMAHA-1677608257', 'YAMAHA-1677608257', NULL, NULL),
(1763, 734, 'APSONIC-1677673819', 'APSONIC-1677673819', NULL, NULL),
(1764, 735, 'APSONIC-1677674256', 'APSONIC-1677674256', NULL, NULL),
(1765, 736, 'APSONIC-1678205537', 'APSONIC-1678205537', NULL, NULL),
(1766, 737, 'APSONIC 50-1678458794', 'APSONIC 50-1678458794', NULL, NULL),
(1767, 738, 'APSONIC 50-1678458979', 'APSONIC 50-1678458979', NULL, NULL),
(1768, 739, 'APSONIC-1678539119', 'APSONIC-1678539119', NULL, NULL),
(1769, 740, 'YAMAHA-1678540902', 'YAMAHA-1678540902', NULL, NULL),
(1770, 741, 'MBK-1678758938', 'MBK-1678758938', NULL, NULL),
(1771, 742, 'MBK-1678759550', 'MBK-1678759550', NULL, NULL),
(1772, 743, 'ROYAL ENFIELD-1678988712', 'ROYAL ENFIELD-1678988712', NULL, NULL),
(1773, 744, 'HAOJOUE-1679032717', 'HAOJOUE-1679032717', NULL, NULL),
(1774, 745, 'HAOJOUE-1679032798', 'HAOJOUE-1679032798', NULL, NULL),
(1775, 746, 'HAOJOUE-1679032891', 'HAOJOUE-1679032891', NULL, NULL),
(1776, 747, 'MBK-1679052108', 'MBK-1679052108', NULL, NULL),
(1777, 748, 'MBK-1679052283', 'MBK-1679052283', NULL, NULL),
(1778, 749, 'KTM-1679074738', 'KTM-1679074738', NULL, NULL),
(1779, 750, 'HAOJOUE-1679075279', 'HAOJOUE-1679075279', NULL, NULL),
(1780, 751, 'KTM-1679075593', 'KTM-1679075593', NULL, NULL),
(1781, 752, 'APSONIC-1679075702', 'APSONIC-1679075702', NULL, NULL),
(1782, 753, 'KTM-1679075984', 'KTM-1679075984', NULL, NULL),
(1783, 754, 'KTM-1679076064', 'KTM-1679076064', NULL, NULL),
(1784, 755, 'KTM-1679076629', 'KTM-1679076629', NULL, NULL),
(1785, 756, 'KTM-1679076922', 'KTM-1679076922', NULL, NULL),
(1786, 757, 'KTM-1679077158', 'KTM-1679077158', NULL, NULL),
(1787, 758, 'KTM-1679077183', 'KTM-1679077183', NULL, NULL),
(1788, 759, 'KTM-1679077307', 'KTM-1679077307', NULL, NULL),
(1789, 760, 'KTM-1679077374', 'KTM-1679077374', NULL, NULL),
(1790, 761, 'KTM-1679077992', 'KTM-1679077992', NULL, NULL),
(1791, 762, 'KTM-1679078171', 'KTM-1679078171', NULL, NULL),
(1792, 763, 'KTM-1679078257', 'KTM-1679078257', NULL, NULL),
(1793, 764, 'KTM-1679078440', 'KTM-1679078440', NULL, NULL),
(1794, 765, 'KTM-1679115588', 'KTM-1679115588', NULL, NULL),
(1795, 766, 'APSONIC 170 Z-ONE-1679124804', 'APSONIC 170 Z-ONE-1679124804', NULL, NULL),
(1796, 767, 'APSONIC-1679125109', 'APSONIC-1679125109', NULL, NULL),
(1797, 768, 'APSONIC-1679170030', 'APSONIC-1679170030', NULL, NULL),
(1798, 769, 'APSONIC-1679170455', 'APSONIC-1679170455', NULL, NULL),
(1799, 770, 'APSONIC-1679171140', 'APSONIC-1679171140', NULL, NULL),
(1800, 771, 'APSONIC-1679246585', 'APSONIC-1679246585', NULL, NULL),
(1801, 772, 'APSONIC-1679319230', 'APSONIC-1679319230', NULL, NULL),
(1802, 773, 'APSONIC-1679321325', 'APSONIC-1679321325', NULL, NULL),
(1803, 774, 'KTM-1679400037', 'KTM-1679400037', NULL, NULL),
(1804, 775, 'KTM-1679406851', 'KTM-1679406851', NULL, NULL),
(1805, 776, 'KTM-1680040897', 'KTM-1680040897', NULL, NULL),
(1806, 777, 'KTM-1680182859', 'KTM-1680182859', NULL, NULL),
(1807, 778, 'SANYA-1680185938', 'SANYA-1680185938', NULL, NULL),
(1808, 779, 'SANYA-1680512716', 'SANYA-1680512716', NULL, NULL),
(1809, 782, 'TVS-1680800336', 'TVS-1680800336', NULL, NULL),
(1810, 785, 'KTM-1680974040', 'KTM-1680974040', NULL, NULL),
(1811, 786, 'SUZIKI-1681061480', 'SUZIKI-1681061480', NULL, NULL),
(1812, 787, 'APSONIC-1681206380', 'APSONIC-1681206380', NULL, NULL),
(1813, 788, 'TVS APACHE RTR180-1681379131', 'TVS APACHE RTR180-1681379131', NULL, NULL),
(1814, 789, 'KTM-1681391448', 'KTM-1681391448', NULL, NULL),
(1815, 790, 'KTM-1681728777', 'KTM-1681728777', NULL, NULL),
(1816, 791, 'KTM-1681980287', 'KTM-1681980287', NULL, NULL),
(1817, 792, 'KTM-1682358871', 'KTM-1682358871', NULL, NULL),
(1818, 793, 'HAOJUE-1682372306', 'HAOJUE-1682372306', NULL, NULL),
(1819, 795, 'APSONIC-1683105099', 'APSONIC-1683105099', NULL, NULL),
(1820, 796, 'KTM-1683305808', 'KTM-1683305808', NULL, NULL),
(1821, 797, 'ABSONIC-1683387449', 'ABSONIC-1683387449', NULL, NULL),
(1822, 798, 'KTM-1683447891', 'KTM-1683447891', NULL, NULL),
(1823, 799, 'AOJUON-1683744651', 'AOJUON-1683744651', NULL, NULL),
(1824, 800, 'APSONIC-1683924554', 'APSONIC-1683924554', NULL, NULL),
(1825, 801, 'BMW-1684174609', 'BMW-1684174609', NULL, NULL),
(1826, 802, 'APSONIC-1684240341', 'APSONIC-1684240341', NULL, NULL),
(1827, 803, 'APSONIC-1684240470', 'APSONIC-1684240470', NULL, NULL),
(1828, 804, 'KTM-1684521452', 'KTM-1684521452', NULL, NULL),
(1829, 805, 'KTM-1684521892', 'KTM-1684521892', NULL, NULL),
(1830, 806, 'KTM-1684521939', 'KTM-1684521939', NULL, NULL),
(1831, 807, 'KTM-1684522401', 'KTM-1684522401', NULL, NULL),
(1832, 808, 'YAMAHA-1684579659', 'YAMAHA-1684579659', NULL, NULL),
(1833, 810, 'CAMICO-1685303006', 'CAMICO-1685303006', NULL, NULL),
(1834, 811, 'APSONIC-1685522538', 'APSONIC-1685522538', NULL, NULL),
(1835, 813, 'APSONIC-1685648035', 'APSONIC-1685648035', NULL, NULL),
(1836, 814, 'APSONIC-1685648429', 'APSONIC-1685648429', NULL, NULL),
(1837, 815, 'APSONIC-1685651871', 'APSONIC-1685651871', NULL, NULL),
(1838, 816, 'KTM TM50-1685710197', 'KTM TM50-1685710197', NULL, NULL),
(1839, 817, 'APSONIC-1686448565', 'APSONIC-1686448565', NULL, NULL),
(1840, 818, 'HAOJUE-1686487467', 'HAOJUE-1686487467', NULL, NULL),
(1841, 820, 'SANA 125-8-1686947285', 'SANA 125-8-1686947285', NULL, NULL),
(1842, 823, 'APSONIC-1687032352', 'APSONIC-1687032352', NULL, NULL),
(1843, 824, 'APSONIC-1687243686', 'APSONIC-1687243686', NULL, NULL),
(1844, 825, 'HH HIBB-1687279816', 'HH HIBB-1687279816', NULL, NULL),
(1845, 826, 'APSONIC-1687450349', 'APSONIC-1687450349', NULL, NULL),
(1846, 827, 'APSONIC-1688395951', 'APSONIC-1688395951', NULL, NULL),
(1847, 828, 'SUZUKI-1689104837', 'SUZUKI-1689104837', NULL, NULL),
(1848, 829, 'SCOOTER-1689389987', 'SCOOTER-1689389987', NULL, NULL),
(1849, 830, 'KTM-1689685676', 'KTM-1689685676', NULL, NULL),
(1850, 831, 'KTM-1689729452', 'KTM-1689729452', NULL, NULL),
(1851, 832, 'APSONIC-1689874516', 'APSONIC-1689874516', NULL, NULL),
(1852, 833, 'APSONIC-1689875604', 'APSONIC-1689875604', NULL, NULL),
(1853, 834, 'MADI-1690289385', 'MADI-1690289385', NULL, NULL),
(1854, 835, 'YAMAHA-1690808889', 'YAMAHA-1690808889', NULL, NULL),
(1855, 836, 'KTM-1690911874', 'KTM-1690911874', NULL, NULL),
(1856, 837, 'APSONIC-1690973041', 'APSONIC-1690973041', NULL, NULL),
(1857, 838, 'KTM-1691100289', 'KTM-1691100289', NULL, NULL),
(1858, 839, 'HAOJUE-1691226412', 'HAOJUE-1691226412', NULL, NULL),
(1859, 840, 'APSONIC-1691263706', 'APSONIC-1691263706', NULL, NULL),
(1860, 841, 'KTM-1691347124', 'KTM-1691347124', NULL, NULL),
(1861, 842, 'KTM APSONIC-1691614944', 'KTM APSONIC-1691614944', NULL, NULL),
(1862, 843, 'KTM APSONIC-1691615285', 'KTM APSONIC-1691615285', NULL, NULL),
(1863, 844, 'APACHE-1692178316', 'APACHE-1692178316', NULL, NULL),
(1864, 845, 'SANYA-8-1692549109', 'SANYA-8-1692549109', NULL, NULL),
(1865, 846, 'APSONIC ALOBA-1692628327', 'APSONIC ALOBA-1692628327', NULL, NULL),
(1866, 847, 'APSONIC ALOBA-1692628659', 'APSONIC ALOBA-1692628659', NULL, NULL),
(1867, 848, 'SUZUKI-1692897509', 'SUZUKI-1692897509', NULL, NULL),
(1868, 849, 'KTM-1692969522', 'KTM-1692969522', NULL, NULL),
(1869, 850, 'APSONIC KTM X1-1693308153', 'APSONIC KTM X1-1693308153', NULL, NULL),
(1870, 851, 'HAOJUE-1693406807', 'HAOJUE-1693406807', NULL, NULL),
(1871, 852, 'KTM-1694182264', 'KTM-1694182264', NULL, NULL),
(1872, 853, 'YAMAHA-1694193383', 'YAMAHA-1694193383', NULL, NULL),
(1873, 854, 'APSONIC-1694697313', 'APSONIC-1694697313', NULL, NULL),
(1874, 856, 'APSONIC-1694773114', 'APSONIC-1694773114', NULL, NULL),
(1875, 857, 'HAOJUE SABABU-1695381574', 'HAOJUE SABABU-1695381574', NULL, NULL),
(1876, 858, 'APSONIC-1695546886', 'APSONIC-1695546886', NULL, NULL),
(1877, 859, 'APSONIC-1695547605', 'APSONIC-1695547605', NULL, NULL),
(1878, 860, 'X1-1696752854', 'X1-1696752854', NULL, NULL),
(1879, 861, 'VVHH-1697308665', 'VVHH-1697308665', NULL, NULL),
(1880, 862, 'SANYA-1697502283', 'SANYA-1697502283', NULL, NULL),
(1881, 863, 'KTM-1697639798', 'KTM-1697639798', NULL, NULL),
(1882, 864, 'KTM-1697814523', 'KTM-1697814523', NULL, NULL),
(1883, 865, 'QASKI 125-30-1698163709', 'QASKI 125-30-1698163709', NULL, NULL),
(1884, 866, 'KTM-1698223632', 'KTM-1698223632', NULL, NULL),
(1885, 867, 'SANYA-1698774397', 'SANYA-1698774397', NULL, NULL),
(1886, 868, 'APSONIC-1699027744', 'APSONIC-1699027744', NULL, NULL),
(1887, 869, 'RIMCO-1699102008', 'RIMCO-1699102008', NULL, NULL),
(1888, 872, 'APSONIC-1699647878', 'APSONIC-1699647878', NULL, NULL),
(1889, 873, 'MBK-1700214706', 'MBK-1700214706', NULL, NULL),
(1890, 874, 'YAMAHA-1700331201', 'YAMAHA-1700331201', NULL, NULL),
(1891, 875, 'APSONIC-1700491086', 'APSONIC-1700491086', NULL, NULL),
(1892, 876, 'APOLLO-1700652429', 'APOLLO-1700652429', NULL, NULL),
(1893, 877, 'APSONIC-1700847064', 'APSONIC-1700847064', NULL, NULL),
(1894, 878, 'APSONIC-1701685174', 'APSONIC-1701685174', NULL, NULL),
(1895, 879, 'APSONIC-1701687325', 'APSONIC-1701687325', NULL, NULL),
(1896, 880, 'HONDA-1701698917', 'HONDA-1701698917', NULL, NULL),
(1897, 882, 'APSONIC-1702387289', 'APSONIC-1702387289', NULL, NULL),
(1898, 884, 'HONDA-1703162279', 'HONDA-1703162279', NULL, NULL),
(1899, 885, 'HAOJIN-1703251697', 'HAOJIN-1703251697', NULL, NULL),
(1900, 886, 'SUZUKI-1703278900', 'SUZUKI-1703278900', NULL, NULL),
(1901, 887, 'KTM-1703444423', 'KTM-1703444423', NULL, NULL),
(1902, 888, 'APSONIC-1703609089', 'APSONIC-1703609089', NULL, NULL),
(1903, 889, 'HAOJIN-1703799623', 'HAOJIN-1703799623', NULL, NULL),
(1904, 890, 'FENGHAO-1703887386', 'FENGHAO-1703887386', NULL, NULL),
(1905, 891, 'FENGHAO-1703887762', 'FENGHAO-1703887762', NULL, NULL),
(1906, 892, 'YAMAHA-1703931650', 'YAMAHA-1703931650', NULL, NULL),
(1907, 894, 'HAOJIN-1704028131', 'HAOJIN-1704028131', NULL, NULL),
(1908, 895, 'KTM-1704118984', 'KTM-1704118984', NULL, NULL),
(1909, 896, 'ROYAL-1704131941', 'ROYAL-1704131941', NULL, NULL),
(1910, 897, 'ROYAL-1704132403', 'ROYAL-1704132403', NULL, NULL),
(1911, 898, 'HHHHG-1704353722', 'HHHHG-1704353722', NULL, NULL),
(1912, 899, 'SONLINK-1704367776', 'SONLINK-1704367776', NULL, NULL),
(1913, 900, 'HONDA-1704387789', 'HONDA-1704387789', NULL, NULL),
(1914, 901, 'SUZUKI-1704538809', 'SUZUKI-1704538809', NULL, NULL),
(1915, 902, 'APSONIC-1704733161', 'APSONIC-1704733161', NULL, NULL),
(1916, 903, 'PEUGEOT-1704873905', 'PEUGEOT-1704873905', NULL, NULL),
(1917, 904, 'PEUGEOT-1704876037', 'PEUGEOT-1704876037', NULL, NULL),
(1918, 905, 'APSONIC-1705000839', 'APSONIC-1705000839', NULL, NULL),
(1919, 906, 'YAMAHA-1706008871', 'YAMAHA-1706008871', NULL, NULL),
(1920, 907, 'APSONIC-1706039491', 'APSONIC-1706039491', NULL, NULL),
(1921, 909, 'KTM-1706372503', 'KTM-1706372503', NULL, NULL),
(1922, 910, 'APSOSONIC-1707507100', 'APSOSONIC-1707507100', NULL, NULL),
(1923, 911, 'APSONIC 250 PRO GY-9-1708129158', 'APSONIC 250 PRO GY-9-1708129158', NULL, NULL),
(1924, 912, 'APSONIC-1708162254', 'APSONIC-1708162254', NULL, NULL),
(1925, 913, 'GJJJJHY-1708189028', 'GJJJJHY-1708189028', NULL, NULL),
(1926, 914, 'APSONIC-1708273775', 'APSONIC-1708273775', NULL, NULL),
(1927, 915, 'APSONIC-1708489845', 'APSONIC-1708489845', NULL, NULL),
(1928, 916, 'FGHH-1708605911', 'FGHH-1708605911', NULL, NULL),
(1929, 917, 'HAOJUE-1708686497', 'HAOJUE-1708686497', NULL, NULL),
(1930, 918, 'HAOJUE-1708688117', 'HAOJUE-1708688117', NULL, NULL),
(1931, 919, 'HAOJUE-1708693663', 'HAOJUE-1708693663', NULL, NULL),
(1932, 921, 'HAOJIN-1709030936', 'HAOJIN-1709030936', NULL, NULL),
(1933, 922, 'TVS-1709719366', 'TVS-1709719366', NULL, NULL),
(1934, 923, 'APSONIC-1709731780', 'APSONIC-1709731780', NULL, NULL),
(1935, 924, 'APSONIC-1709741961', 'APSONIC-1709741961', NULL, NULL),
(1936, 925, 'KTM-1709775102', 'KTM-1709775102', NULL, NULL),
(1937, 926, 'NFBNLKN-1710032435', 'NFBNLKN-1710032435', NULL, NULL),
(1938, 929, 'APACH-1710266301', 'APACH-1710266301', NULL, NULL),
(1939, 931, 'APSONIC-1710818727', 'APSONIC-1710818727', NULL, NULL),
(1940, 932, 'SUZUKI-1711104178', 'SUZUKI-1711104178', NULL, NULL),
(1941, 933, 'APSONIC-1711635594', 'APSONIC-1711635594', NULL, NULL),
(1942, 934, 'ALOBA-1711662194', 'ALOBA-1711662194', NULL, NULL),
(1943, 935, 'APSONIC-1712284478', 'APSONIC-1712284478', NULL, NULL),
(1944, 936, 'APSONIC-1712402223', 'APSONIC-1712402223', NULL, NULL),
(1945, 937, 'HAOJUE-1712581276', 'HAOJUE-1712581276', NULL, NULL),
(1946, 938, 'APSONIC-1712817743', 'APSONIC-1712817743', NULL, NULL),
(1947, 939, 'KTM MOTORS-1713169018', 'KTM MOTORS-1713169018', NULL, NULL),
(1948, 940, 'APACHE-1713280211', 'APACHE-1713280211', NULL, NULL),
(1949, 941, 'HHHHG-1713299410', 'HHHHG-1713299410', NULL, NULL),
(1950, 942, 'APRILLIA RS 660-1713538528', 'APRILLIA RS 660-1713538528', NULL, NULL),
(1951, 943, 'APSONIC-1713540116', 'APSONIC-1713540116', NULL, NULL),
(1952, 945, 'TVS RTR180-1713795195', 'TVS RTR180-1713795195', NULL, NULL),
(1953, 946, 'HAOJUE-1714133303', 'HAOJUE-1714133303', NULL, NULL),
(1954, 949, 'APSONIC-1714812817', 'APSONIC-1714812817', NULL, NULL),
(1955, 950, 'APSONIC-1715271382', 'APSONIC-1715271382', NULL, NULL),
(1956, 951, 'ROYAL-1715426402', 'ROYAL-1715426402', NULL, NULL),
(1957, 952, 'ROYAL-1715427241', 'ROYAL-1715427241', NULL, NULL),
(1958, 953, 'HAOJUE-1715818333', 'HAOJUE-1715818333', NULL, NULL),
(1959, 999, 'APSONIC-1716277116', 'APSONIC-1716277116', NULL, NULL),
(1960, 1000, 'YAMAHA-1716967379', 'YAMAHA-1716967379', NULL, NULL),
(1961, 1001, 'RATO CITY-1716972469', 'RATO CITY-1716972469', NULL, NULL),
(1962, 1002, 'YAMAHA-1717144180', 'YAMAHA-1717144180', NULL, NULL),
(1963, 1003, 'YAMAHA-1717175323', 'YAMAHA-1717175323', NULL, NULL),
(1964, 1004, 'YAMAHA-1717176080', 'YAMAHA-1717176080', NULL, NULL),
(1965, 1005, 'KTM-1717411048', 'KTM-1717411048', NULL, NULL),
(1966, 1006, 'SANYA-1717497513', 'SANYA-1717497513', NULL, NULL),
(1967, 1007, 'KTM-1717572498', 'KTM-1717572498', NULL, NULL),
(1968, 1008, 'HAOJUE-1717588551', 'HAOJUE-1717588551', NULL, NULL),
(1969, 1009, 'FRTN-1717756305', 'FRTN-1717756305', NULL, NULL),
(1970, 1010, 'APSONIC-1717771204', 'APSONIC-1717771204', NULL, NULL),
(1971, 1011, 'APSONIC-1718232696', 'APSONIC-1718232696', NULL, NULL),
(1972, 1012, 'KTM-1718285196', 'KTM-1718285196', NULL, NULL),
(1973, 1013, 'TVS-1718441231', 'TVS-1718441231', NULL, NULL),
(1974, 1014, 'APSONIC-1718442863', 'APSONIC-1718442863', NULL, NULL),
(1975, 1015, 'TVS-1718661965', 'TVS-1718661965', NULL, NULL),
(1976, 1016, 'MOTO ROUGE BORDEREAU-1718994295', 'MOTO ROUGE BORDEREAU-1718994295', NULL, NULL),
(1977, 1017, 'MOTO ROUGE BORDEREAU-1718994915', 'MOTO ROUGE BORDEREAU-1718994915', NULL, NULL),
(1978, 1018, 'ROUGE-1718995354', 'ROUGE-1718995354', NULL, NULL),
(1979, 1019, 'TVS-1719360811', 'TVS-1719360811', NULL, NULL),
(1980, 1020, 'FENGHAO-1719482019', 'FENGHAO-1719482019', NULL, NULL),
(1981, 1021, 'FENGHAO-1719482361', 'FENGHAO-1719482361', NULL, NULL),
(1982, 1022, 'FENGHAO-1719482644', 'FENGHAO-1719482644', NULL, NULL),
(1983, 1023, 'FENGHAO-1719482842', 'FENGHAO-1719482842', NULL, NULL),
(1984, 1025, 'JUNIOR-1719757043', 'JUNIOR-1719757043', NULL, NULL),
(1985, 1026, 'JUNIOR-1719757533', 'JUNIOR-1719757533', NULL, NULL),
(1986, 1027, 'YAHAMAHA-1719845711', 'YAHAMAHA-1719845711', NULL, NULL),
(1987, 1028, 'APSONIC-1720497026', 'APSONIC-1720497026', NULL, NULL),
(1988, 1029, 'APSONIC AP125-30-1720634021', 'APSONIC AP125-30-1720634021', NULL, NULL),
(1989, 1030, 'APSONIC-1720740983', 'APSONIC-1720740983', NULL, NULL),
(1990, 1031, 'KTM-1721146604', 'KTM-1721146604', NULL, NULL),
(1991, 1032, 'KTM-1721512581', 'KTM-1721512581', NULL, NULL),
(1992, 1033, 'KTM-1721513838', 'KTM-1721513838', NULL, NULL),
(1993, 1034, 'SANIYA-1721754369', 'SANIYA-1721754369', NULL, NULL);
INSERT INTO `model` (`id`, `make_id`, `code`, `title`, `created_at`, `updated_at`) VALUES
(1994, 1035, 'APSONIC-1721994584', 'APSONIC-1721994584', NULL, NULL),
(1995, 1036, 'HAOJIN-1722022040', 'HAOJIN-1722022040', NULL, NULL),
(1996, 1037, 'YAMAHA-1722095387', 'YAMAHA-1722095387', NULL, NULL),
(1997, 1039, 'HAOJUE-1722266176', 'HAOJUE-1722266176', NULL, NULL),
(1998, 1040, 'KTM-1722676166', 'KTM-1722676166', NULL, NULL),
(1999, 1041, 'QASKI-1722691893', 'QASKI-1722691893', NULL, NULL),
(2000, 1042, 'APSONIC-1723051614', 'APSONIC-1723051614', NULL, NULL),
(2001, 1043, 'KTM-1723125252', 'KTM-1723125252', NULL, NULL),
(2002, 1044, 'KTM-1723328121', 'KTM-1723328121', NULL, NULL),
(2003, 1045, 'APSONIC-1723378173', 'APSONIC-1723378173', NULL, NULL),
(2004, 1046, 'HAOJUE HJ150-1723419813', 'HAOJUE HJ150-1723419813', NULL, NULL),
(2005, 1047, 'YAMAHA-1723546128', 'YAMAHA-1723546128', NULL, NULL),
(2006, 1048, 'HAOJUE-1723644514', 'HAOJUE-1723644514', NULL, NULL),
(2007, 1049, 'RYMCO-1723716464', 'RYMCO-1723716464', NULL, NULL),
(2008, 1050, 'APSONIC 50 A-1723888375', 'APSONIC 50 A-1723888375', NULL, NULL),
(2009, 1051, 'KTM-1724148016', 'KTM-1724148016', NULL, NULL),
(2010, 1052, 'TVS-1724314594', 'TVS-1724314594', NULL, NULL),
(2011, 1053, 'YAMAHA TRACER 9GT-1724328554', 'YAMAHA TRACER 9GT-1724328554', NULL, NULL),
(2012, 1054, 'HAOJUE-1724345676', 'HAOJUE-1724345676', NULL, NULL),
(2013, 1056, 'APSONIC-1724497233', 'APSONIC-1724497233', NULL, NULL),
(2014, 1057, 'QASKI-1724755689', 'QASKI-1724755689', NULL, NULL),
(2015, 1058, 'BAZOUMANA-1724920930', 'BAZOUMANA-1724920930', NULL, NULL),
(2016, 1059, 'APSONIC-1725370103', 'APSONIC-1725370103', NULL, NULL),
(2017, 1060, 'APSONIC-1725375429', 'APSONIC-1725375429', NULL, NULL),
(2018, 1061, 'JIALING-1725384268', 'JIALING-1725384268', NULL, NULL),
(2019, 1062, 'KTM-1725384981', 'KTM-1725384981', NULL, NULL),
(2020, 1063, 'JAKATA-1725385359', 'JAKATA-1725385359', NULL, NULL),
(2021, 1064, 'YAMAHA TMAX-1725817233', 'YAMAHA TMAX-1725817233', NULL, NULL),
(2022, 1065, 'HAOJUE-1725906100', 'HAOJUE-1725906100', NULL, NULL),
(2023, 1066, 'KTM-1725963341', 'KTM-1725963341', NULL, NULL),
(2024, 1067, 'SANYA-1726325196', 'SANYA-1726325196', NULL, NULL),
(2025, 1068, 'APSONIC-1726388952', 'APSONIC-1726388952', NULL, NULL),
(2026, 1069, 'SANYA-1726565182', 'SANYA-1726565182', NULL, NULL),
(2027, 1070, 'SANYA-1726571063', 'SANYA-1726571063', NULL, NULL),
(2028, 1071, 'APSONIC-1726616386', 'APSONIC-1726616386', NULL, NULL),
(2029, 1072, 'APSONIC-1726660241', 'APSONIC-1726660241', NULL, NULL),
(2030, 1073, 'RATO-1726767620', 'RATO-1726767620', NULL, NULL),
(2031, 1074, 'RATO-1726767678', 'RATO-1726767678', NULL, NULL),
(2032, 1075, 'GRGRGS-1726828787', 'GRGRGS-1726828787', NULL, NULL),
(2033, 1076, 'APSONIC-1726915342', 'APSONIC-1726915342', NULL, NULL),
(2034, 1077, 'APSONIC-1727191845', 'APSONIC-1727191845', NULL, NULL),
(2035, 1078, 'YAMAHA-1727196528', 'YAMAHA-1727196528', NULL, NULL),
(2036, 1079, 'SANYA-1727434195', 'SANYA-1727434195', NULL, NULL),
(2037, 1080, 'ROYAL-1732303035', 'ROYAL-1732303035', NULL, NULL),
(2038, 1081, 'FDGBNYTJTYH-1732322824', 'FDGBNYTJTYH-1732322824', NULL, NULL),
(2039, 1082, 'L;LF;V;DPM-1732323089', 'L;LF;V;DPM-1732323089', NULL, NULL),
(2040, 1083, 'YAMAHA-1733042891', 'YAMAHA-1733042891', NULL, NULL),
(2041, 1084, 'YAMAHA-1733230503', 'YAMAHA-1733230503', NULL, NULL),
(2042, 1085, 'YAMAHA-1733321008', 'YAMAHA-1733321008', NULL, NULL),
(2043, 1086, 'ROYAL-1733321147', 'ROYAL-1733321147', NULL, NULL),
(2044, 1087, 'TOYOTA-1733321954', 'TOYOTA-1733321954', NULL, NULL),
(2045, 1088, 'ROYAL-1733322324', 'ROYAL-1733322324', NULL, NULL),
(2046, 1089, 'TOYOTA-1733322976', 'TOYOTA-1733322976', NULL, NULL),
(2047, 1090, 'TOYOTA-1733323063', 'TOYOTA-1733323063', NULL, NULL),
(2048, 1091, 'TOYOTA-1733323106', 'TOYOTA-1733323106', NULL, NULL),
(2049, 1092, 'TOYOTA-1733323247', 'TOYOTA-1733323247', NULL, NULL),
(2050, 1093, 'TOYOTA-1733323270', 'TOYOTA-1733323270', NULL, NULL),
(2051, 1094, 'TOYOTA-1733323503', 'TOYOTA-1733323503', NULL, NULL),
(2052, 1095, 'TOYOTA-1733323557', 'TOYOTA-1733323557', NULL, NULL),
(2053, 1096, 'TOYOTA-1733323596', 'TOYOTA-1733323596', NULL, NULL),
(2054, 1097, 'TOYOTA-1733323615', 'TOYOTA-1733323615', NULL, NULL),
(2055, 1098, 'TOYOTA-1733323649', 'TOYOTA-1733323649', NULL, NULL),
(2056, 1099, 'TOYOTA-1733323673', 'TOYOTA-1733323673', NULL, NULL),
(2057, 1100, 'TOYOTA-1733323686', 'TOYOTA-1733323686', NULL, NULL),
(2058, 1101, 'TOYOTA-1733324225', 'TOYOTA-1733324225', NULL, NULL),
(2059, 1102, 'TOYOTA-1733324608', 'TOYOTA-1733324608', NULL, NULL),
(2060, 1103, 'TOYOTA-1733325019', 'TOYOTA-1733325019', NULL, NULL),
(2061, 1104, 'TOYOTA-1733325054', 'TOYOTA-1733325054', NULL, NULL),
(2062, 1105, 'YAMAHA-1733325524', 'YAMAHA-1733325524', NULL, NULL),
(2063, 1106, 'DRAGON-1733325653', 'DRAGON-1733325653', NULL, NULL),
(2064, 1107, 'DRAGON-1733326537', 'DRAGON-1733326537', NULL, NULL),
(2065, 1108, 'TOYOTA-1733327100', 'TOYOTA-1733327100', NULL, NULL),
(2066, 1109, 'TOYOTA-1733328176', 'TOYOTA-1733328176', NULL, NULL),
(2067, 1110, 'TOYOTA-1733328739', 'TOYOTA-1733328739', NULL, NULL),
(2068, 1111, 'ROYAL-1733329990', 'ROYAL-1733329990', NULL, NULL),
(2069, 1112, 'ROYAL-1733335391', 'ROYAL-1733335391', NULL, NULL),
(2070, 1113, 'TOYOTA-1733502974', 'TOYOTA-1733502974', NULL, NULL),
(2071, 1114, 'ROYAL-1733514027', 'ROYAL-1733514027', NULL, NULL),
(2072, 1115, 'YAMAHA-1733526116', 'YAMAHA-1733526116', NULL, NULL),
(2073, 1116, 'ROYAL-1733560916', 'ROYAL-1733560916', NULL, NULL),
(2074, 1117, 'YAMAHA-1733597647', 'YAMAHA-1733597647', NULL, NULL),
(2075, 1118, 'YAMAHA-1733610865', 'YAMAHA-1733610865', NULL, NULL),
(2076, 1119, 'TOYOTA-1733666725', 'TOYOTA-1733666725', NULL, NULL),
(2077, 1120, 'YAMAHA-1733680152', 'YAMAHA-1733680152', NULL, NULL),
(2078, 1121, 'ROYAL-1733683353', 'ROYAL-1733683353', NULL, NULL),
(2079, 1122, 'ROYAL-1733683785', 'ROYAL-1733683785', NULL, NULL),
(2080, 1123, 'ROYAL-1733684461', 'ROYAL-1733684461', NULL, NULL),
(2081, 1124, 'ROYAL-1733685128', 'ROYAL-1733685128', NULL, NULL),
(2082, 1125, 'ROYAL-1733738314', 'ROYAL-1733738314', NULL, NULL),
(2083, 1126, 'YAMAHA-1733746057', 'YAMAHA-1733746057', NULL, NULL),
(2084, 1127, 'YAMAHA-1733746183', 'YAMAHA-1733746183', NULL, NULL),
(2085, 1128, 'YAMAHA-1733775707', 'YAMAHA-1733775707', NULL, NULL),
(2086, 1129, 'FGGHG-1734041805', 'FGGHG-1734041805', NULL, NULL),
(2087, 1130, 'FGGHG-1734169914', 'FGGHG-1734169914', NULL, NULL),
(2088, 1131, 'FGGHG-1734169967', 'FGGHG-1734169967', NULL, NULL),
(2089, 1132, 'FGGHG-1734192867', 'FGGHG-1734192867', NULL, NULL),
(2090, 1133, 'FGGHG-1734198423', 'FGGHG-1734198423', NULL, NULL),
(2091, 1134, 'FGGHG-1734198540', 'FGGHG-1734198540', NULL, NULL),
(2092, 1135, 'FGGHG-1734366372', 'FGGHG-1734366372', NULL, NULL),
(2093, 1136, 'SDGFHN,J;-1735651397', 'SDGFHN,J;-1735651397', NULL, NULL),
(2094, 1137, 'YAMAHA-1741440092', 'YAMAHA-1741440092', NULL, NULL),
(2095, 1138, 'YAMAHA-1741524531', 'YAMAHA-1741524531', NULL, NULL),
(2096, 1139, 'YAMAHA-1741525430', 'YAMAHA-1741525430', NULL, NULL),
(2097, 1140, 'YAMAHA-1741530341', 'YAMAHA-1741530341', NULL, NULL),
(2098, 1141, 'YAMAHA-1745704537', 'YAMAHA-1745704537', NULL, NULL),
(2099, 1142, 'YAMAHA-1745704733', 'YAMAHA-1745704733', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_id` int(11) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `optional_service`
--

CREATE TABLE `optional_service` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_type` int(11) NOT NULL,
  `service` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` double NOT NULL,
  `version` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `optional_service`
--

INSERT INTO `optional_service` (`id`, `product_type`, `service`, `description`, `amount`, `version`, `created_at`, `updated_at`) VALUES
(1, 1, 'Assistance constat et Remorquage', 'Nombre d\'intervention maximum : <b>1 par mois</b><br/>Zone d\'intervention :  <b>ABIDJAN</b><br/>Heure d’intervention : <b>06H00 à 22H00 </b>', 2000, 1, '2017-10-01 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `order_status_actor`
--

CREATE TABLE `order_status_actor` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paye`
--

CREATE TABLE `paye` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `montant` decimal(8,2) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pays_id` int(11) NOT NULL,
  `pays_name` varchar(255) NOT NULL,
  `pays_code` varchar(255) NOT NULL,
  `pays_zone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `pays_id`, `pays_name`, `pays_code`, `pays_zone`, `created_at`, `updated_at`) VALUES
(1, 1, 'France', 'fr', 'schenghen', NULL, NULL),
(2, 2, 'Afghanistan', 'af', 'monde', NULL, NULL),
(3, 3, 'Afrique du sud', 'za', 'monde', NULL, NULL),
(4, 4, 'Albanie', 'al', 'monde', NULL, NULL),
(5, 5, 'Algérie', 'dz', 'monde', NULL, NULL),
(6, 6, 'Allemagne', 'de', 'schenghen', NULL, NULL),
(7, 7, 'Arabie saoudite', 'sa', 'monde', NULL, NULL),
(8, 8, 'Argentine', 'ar', 'monde', NULL, NULL),
(9, 9, 'Australie', 'au', 'monde', NULL, NULL),
(10, 10, 'Autriche', 'at', 'schenghen', NULL, NULL),
(11, 11, 'Belgique', 'be', 'schenghen', NULL, NULL),
(12, 12, 'Brésil', 'br', 'monde', NULL, NULL),
(13, 13, 'Bulgarie', 'bg', 'monde', NULL, NULL),
(14, 14, 'Canada', 'ca', 'monde', NULL, NULL),
(15, 15, 'Chili', 'cl', 'monde', NULL, NULL),
(16, 16, 'Chine (Rép. pop.)', 'cn', 'monde', NULL, NULL),
(17, 17, 'Colombie', 'co', 'monde', NULL, NULL),
(18, 18, 'Corée, Sud', 'kr', 'monde', NULL, NULL),
(19, 19, 'Costa Rica', 'cr', 'monde', NULL, NULL),
(20, 20, 'Croatie', 'hr', 'monde', NULL, NULL),
(21, 21, 'Danemark', 'dk', 'schenghen', NULL, NULL),
(22, 22, 'Égypte', 'eg', 'monde', NULL, NULL),
(23, 23, 'Émirats arabes unis', 'ae', 'monde', NULL, NULL),
(24, 24, 'Équateur', 'ec', 'monde', NULL, NULL),
(25, 25, 'États-Unis', 'us', 'monde', NULL, NULL),
(26, 26, 'El Salvador', 'sv', 'monde', NULL, NULL),
(27, 27, 'Espagne', 'es', 'schenghen', NULL, NULL),
(28, 28, 'Finlande', 'fi', 'schenghen', NULL, NULL),
(29, 29, 'Grèce', 'gr', 'schenghen', NULL, NULL),
(30, 30, 'Hong Kong', 'hk', 'monde', NULL, NULL),
(31, 31, 'Hongrie', 'hu', 'schenghen', NULL, NULL),
(32, 32, 'Inde', 'in', 'monde', NULL, NULL),
(33, 33, 'Indonésie', 'id', 'monde', NULL, NULL),
(34, 34, 'Irlande', 'ie', 'monde', NULL, NULL),
(35, 35, 'Israël', 'il', 'monde', NULL, NULL),
(36, 36, 'Italie', 'it', 'schenghen', NULL, NULL),
(37, 37, 'Japon', 'jp', 'monde', NULL, NULL),
(38, 38, 'Jordanie', 'jo', 'monde', NULL, NULL),
(39, 39, 'Liban', 'lb', 'monde', NULL, NULL),
(40, 40, 'Malaisie', 'my', 'monde', NULL, NULL),
(41, 41, 'Maroc', 'ma', 'monde', NULL, NULL),
(42, 42, 'Mexique', 'mx', 'monde', NULL, NULL),
(43, 43, 'Norvège', 'no', 'schenghen', NULL, NULL),
(44, 44, 'Nouvelle-Zélande', 'nz', 'monde', NULL, NULL),
(45, 45, 'Pérou', 'pe', 'monde', NULL, NULL),
(46, 46, 'Pakistan', 'pk', 'monde', NULL, NULL),
(47, 47, 'Pays-Bas', 'nl', 'schenghen', NULL, NULL),
(48, 48, 'Philippines', 'ph', 'monde', NULL, NULL),
(49, 49, 'Pologne', 'pl', 'schenghen', NULL, NULL),
(50, 50, 'Porto Rico', 'pr', 'monde', NULL, NULL),
(51, 51, 'Portugal', 'pt', 'schenghen', NULL, NULL),
(52, 52, 'République tchèque', 'cz', 'schenghen', NULL, NULL),
(53, 53, 'Roumanie', 'ro', 'monde', NULL, NULL),
(54, 54, 'Royaume-Uni', 'uk', 'monde', NULL, NULL),
(55, 55, 'Russie', 'ru', 'monde', NULL, NULL),
(56, 56, 'Singapour', 'sg', 'monde', NULL, NULL),
(57, 57, 'Suède', 'se', 'schenghen', NULL, NULL),
(58, 58, 'Suisse', 'ch', 'schenghen', NULL, NULL),
(59, 59, 'Taiwan', 'tw', 'monde', NULL, NULL),
(60, 60, 'Thailande', 'th', 'monde', NULL, NULL),
(61, 61, 'Turquie', 'tr', 'monde', NULL, NULL),
(62, 62, 'Ukraine', 'ua', 'monde', NULL, NULL),
(63, 63, 'Venezuela', 've', 'monde', NULL, NULL),
(64, 64, 'Yougoslavie', 'yu', 'monde', NULL, NULL),
(65, 65, 'Samoa', 'as', 'monde', NULL, NULL),
(66, 66, 'Andorre', 'ad', 'monde', NULL, NULL),
(67, 67, 'Angola', 'ao', 'monde', NULL, NULL),
(68, 68, 'Anguilla', 'ai', 'monde', NULL, NULL),
(69, 69, 'Antarctique', 'aq', 'monde', NULL, NULL),
(70, 70, 'Antigua et Barbuda', 'ag', 'monde', NULL, NULL),
(71, 71, 'Arménie', 'am', 'monde', NULL, NULL),
(72, 72, 'Aruba', 'aw', 'monde', NULL, NULL),
(73, 73, 'Azerbaïdjan', 'az', 'monde', NULL, NULL),
(74, 74, 'Bahamas', 'bs', 'monde', NULL, NULL),
(75, 75, 'Bahrain', 'bh', 'monde', NULL, NULL),
(76, 76, 'Bangladesh', 'bd', 'monde', NULL, NULL),
(77, 77, 'Biélorussie', 'by', 'monde', NULL, NULL),
(78, 78, 'Belize', 'bz', 'monde', NULL, NULL),
(79, 79, 'Benin', 'bj', 'cima', NULL, NULL),
(80, 80, 'Bermudes (Les)', 'bm', 'monde', NULL, NULL),
(81, 81, 'Bhoutan', 'bt', 'monde', NULL, NULL),
(82, 82, 'Bolivie', 'bo', 'monde', NULL, NULL),
(83, 83, 'Bosnie-Herzégovine', 'ba', 'monde', NULL, NULL),
(84, 84, 'Botswana', 'bw', 'monde', NULL, NULL),
(85, 85, 'Bouvet (Îles)', 'bv', 'monde', NULL, NULL),
(86, 86, 'Territoire britannique de l\'océan Indien', 'io', 'monde', NULL, NULL),
(87, 87, 'Vierges britanniques (Îles)', 'vg', 'monde', NULL, NULL),
(88, 88, 'Brunei', 'bn', 'monde', NULL, NULL),
(89, 89, 'Burkina Faso', 'bf', 'cima', NULL, NULL),
(90, 90, 'Burundi', 'bi', 'monde', NULL, NULL),
(91, 91, 'Cambodge', 'kh', 'monde', NULL, NULL),
(92, 92, 'Cameroun', 'cm', 'cima', NULL, NULL),
(93, 93, 'Cap Vert', 'cv', 'monde', NULL, NULL),
(94, 94, 'Cayman (Îles)', 'ky', 'monde', NULL, NULL),
(95, 95, 'République centrafricaine', 'cf', 'cima', NULL, NULL),
(96, 96, 'Tchad', 'td', 'cima', NULL, NULL),
(97, 97, 'Christmas (Île)', 'cx', 'monde', NULL, NULL),
(98, 98, 'Cocos (Îles)', 'cc', 'monde', NULL, NULL),
(99, 99, 'Comores', 'km', 'cima', NULL, NULL),
(100, 100, 'Rép. Dém. du Congo', 'cg', 'cima', NULL, NULL),
(101, 101, 'Cook (Îles)', 'ck', 'monde', NULL, NULL),
(102, 102, 'Cuba', 'cu', 'monde', NULL, NULL),
(103, 103, 'Chypre', 'cy', 'monde', NULL, NULL),
(104, 104, 'Djibouti', 'dj', 'monde', NULL, NULL),
(105, 105, 'Dominique', 'dm', 'monde', NULL, NULL),
(106, 106, 'République Dominicaine', 'do', 'monde', NULL, NULL),
(107, 107, 'Timor', 'tp', 'monde', NULL, NULL),
(108, 108, 'Guinée Equatoriale', 'gq', 'cima', NULL, NULL),
(109, 109, 'Érythrée', 'er', 'monde', NULL, NULL),
(110, 110, 'Estonie', 'ee', 'schenghen', NULL, NULL),
(111, 111, 'Ethiopie', 'et', 'monde', NULL, NULL),
(112, 112, 'Falkland (Île)', 'fk', 'monde', NULL, NULL),
(113, 113, 'Féroé (Îles)', 'fo', 'monde', NULL, NULL),
(114, 114, 'Fidji (République des)', 'fj', 'monde', NULL, NULL),
(115, 115, 'Guyane française', 'gf', 'monde', NULL, NULL),
(116, 116, 'Polynésie française', 'pf', 'monde', NULL, NULL),
(117, 117, 'Territoires français du sud', 'tf', 'monde', NULL, NULL),
(118, 118, 'Gabon', 'ga', 'cima', NULL, NULL),
(119, 119, 'Gambie', 'gm', 'monde', NULL, NULL),
(120, 120, 'Géorgie', 'ge', 'monde', NULL, NULL),
(121, 121, 'Ghana', 'gh', 'monde', NULL, NULL),
(122, 122, 'Gibraltar', 'gi', 'monde', NULL, NULL),
(123, 123, 'Groenland', 'gl', 'monde', NULL, NULL),
(124, 124, 'Grenade', 'gd', 'monde', NULL, NULL),
(125, 125, 'Guadeloupe', 'gp', 'monde', NULL, NULL),
(126, 126, 'Guam', 'gu', 'monde', NULL, NULL),
(127, 127, 'Guatemala', 'gt', 'monde', NULL, NULL),
(128, 128, 'Guinée', 'gn', 'monde', NULL, NULL),
(129, 129, 'Guinée-Bissau', 'gw', 'monde', NULL, NULL),
(130, 130, 'Guyane', 'gy', 'monde', NULL, NULL),
(131, 131, 'Haïti', 'ht', 'monde', NULL, NULL),
(132, 132, 'Heard et McDonald (Îles)', 'hm', 'monde', NULL, NULL),
(133, 133, 'Honduras', 'hn', 'monde', NULL, NULL),
(134, 134, 'Islande', 'is', 'schenghen', NULL, NULL),
(135, 135, 'Iran', 'ir', 'monde', NULL, NULL),
(136, 136, 'Irak', 'iq', 'monde', NULL, NULL),
(137, 137, 'Côte d\'Ivoire', 'ci', 'cima', NULL, NULL),
(138, 138, 'Jamaïque', 'jm', 'monde', NULL, NULL),
(139, 139, 'Kazakhstan', 'kz', 'monde', NULL, NULL),
(140, 140, 'Kenya', 'ke', 'monde', NULL, NULL),
(141, 141, 'Kiribati', 'ki', 'monde', NULL, NULL),
(142, 142, 'Corée du Nord', 'kp', 'monde', NULL, NULL),
(143, 143, 'Koweit', 'kw', 'monde', NULL, NULL),
(144, 144, 'Kirghizistan', 'kg', 'monde', NULL, NULL),
(145, 145, 'Laos', 'la', 'monde', NULL, NULL),
(146, 146, 'Letonie', 'lv', 'schenghen', NULL, NULL),
(147, 147, 'Lesotho', 'ls', 'monde', NULL, NULL),
(148, 148, 'Libéria', 'lr', 'monde', NULL, NULL),
(149, 149, 'Libye', 'ly', 'monde', NULL, NULL),
(150, 150, 'Liechtenstein', 'li', 'schenghen', NULL, NULL),
(151, 151, 'Lithuanie', 'lt', 'schenghen', NULL, NULL),
(152, 152, 'Luxembourg', 'lu', 'schenghen', NULL, NULL),
(153, 153, 'Macau', 'mo', 'monde', NULL, NULL),
(154, 154, 'Macédoine', 'mk', 'monde', NULL, NULL),
(155, 155, 'Madagascar', 'mg', 'monde', NULL, NULL),
(156, 156, 'Malawi', 'mw', 'monde', NULL, NULL),
(157, 157, 'Maldives (Îles)', 'mv', 'monde', NULL, NULL),
(158, 158, 'Mali', 'ml', 'cima', NULL, NULL),
(159, 159, 'Malte', 'mt', 'schenghen', NULL, NULL),
(160, 160, 'Marshall (Îles)', 'mh', 'monde', NULL, NULL),
(161, 161, 'Martinique', 'mq', 'monde', NULL, NULL),
(162, 162, 'Mauritanie', 'mr', 'monde', NULL, NULL),
(163, 163, 'Maurice', 'mu', 'monde', NULL, NULL),
(164, 164, 'Mayotte', 'yt', 'monde', NULL, NULL),
(165, 165, 'Micronésie (États fédérés de)', 'fm', 'monde', NULL, NULL),
(166, 166, 'Moldavie', 'md', 'monde', NULL, NULL),
(167, 167, 'Monaco', 'mc', 'monde', NULL, NULL),
(168, 168, 'Mongolie', 'mn', 'monde', NULL, NULL),
(169, 169, 'Montserrat', 'ms', 'monde', NULL, NULL),
(170, 170, 'Mozambique', 'mz', 'monde', NULL, NULL),
(171, 171, 'Myanmar', 'mm', 'monde', NULL, NULL),
(172, 172, 'Namibie', 'na', 'monde', NULL, NULL),
(173, 173, 'Nauru', 'nr', 'monde', NULL, NULL),
(174, 174, 'Nepal', 'np', 'monde', NULL, NULL),
(175, 175, 'Antilles néerlandaises', 'an', 'monde', NULL, NULL),
(176, 176, 'Nouvelle Calédonie', 'nc', 'monde', NULL, NULL),
(177, 177, 'Nicaragua', 'ni', 'monde', NULL, NULL),
(178, 178, 'Niger', 'ne', 'cima', NULL, NULL),
(179, 179, 'Nigeria', 'ng', 'monde', NULL, NULL),
(180, 180, 'Niue', 'nu', 'monde', NULL, NULL),
(181, 181, 'Norfolk (Îles)', 'nf', 'monde', NULL, NULL),
(182, 182, 'Mariannes du Nord (Îles)', 'mp', 'monde', NULL, NULL),
(183, 183, 'Oman', 'om', 'monde', NULL, NULL),
(184, 184, 'Palau', 'pw', 'monde', NULL, NULL),
(185, 185, 'Panama', 'pa', 'monde', NULL, NULL),
(186, 186, 'Papouasie-Nouvelle-Guinée', 'pg', 'monde', NULL, NULL),
(187, 187, 'Paraguay', 'py', 'monde', NULL, NULL),
(188, 188, 'Pitcairn (Îles)', 'pn', 'monde', NULL, NULL),
(189, 189, 'Qatar', 'qa', 'monde', NULL, NULL),
(190, 190, 'Réunion (La)', 're', 'monde', NULL, NULL),
(191, 191, 'Rwanda', 'rw', 'monde', NULL, NULL),
(192, 192, 'Géorgie du Sud et Sandwich du Sud (Îles)', 'gs', 'monde', NULL, NULL),
(193, 193, 'Saint-Kitts et Nevis', 'kn', 'monde', NULL, NULL),
(194, 194, 'Sainte Lucie', 'lc', 'monde', NULL, NULL),
(195, 195, 'Saint Vincent et les Grenadines', 'vc', 'monde', NULL, NULL),
(196, 196, 'Samoa', 'ws', 'monde', NULL, NULL),
(197, 197, 'Saint-Marin (Rép. de)', 'sm', 'monde', NULL, NULL),
(198, 198, 'São Tomé et Príncipe (Rép.)', 'st', 'monde', NULL, NULL),
(199, 199, 'Sénégal', 'sn', 'cima', NULL, NULL),
(200, 200, 'Seychelles', 'sc', 'monde', NULL, NULL),
(201, 201, 'Sierra Leone', 'sl', 'monde', NULL, NULL),
(202, 202, 'Slovaquie', 'sk', 'schenghen', NULL, NULL),
(203, 203, 'Slovénie', 'si', 'schenghen', NULL, NULL),
(204, 204, 'Somalie', 'so', 'monde', NULL, NULL),
(205, 205, 'Sri Lanka', 'lk', 'monde', NULL, NULL),
(206, 206, 'Sainte Hélène', 'sh', 'monde', NULL, NULL),
(207, 207, 'Saint Pierre et Miquelon', 'pm', 'monde', NULL, NULL),
(208, 208, 'Soudan', 'sd', 'monde', NULL, NULL),
(209, 209, 'Suriname', 'sr', 'monde', NULL, NULL),
(210, 210, 'Svalbard et Jan Mayen (Îles)', 'sj', 'monde', NULL, NULL),
(211, 211, 'Swaziland', 'sz', 'monde', NULL, NULL),
(212, 212, 'Syrie', 'sy', 'monde', NULL, NULL),
(213, 213, 'Tadjikistan', 'tj', 'monde', NULL, NULL),
(214, 214, 'Tanzanie', 'tz', 'monde', NULL, NULL),
(215, 215, 'Togo', 'tg', 'cima', NULL, NULL),
(216, 216, 'Tokelau', 'tk', 'monde', NULL, NULL),
(217, 217, 'Tonga', 'to', 'monde', NULL, NULL),
(218, 218, 'Trinité et Tobago', 'tt', 'monde', NULL, NULL),
(219, 219, 'Tunisie', 'tn', 'monde', NULL, NULL),
(220, 220, 'Turkménistan', 'tm', 'monde', NULL, NULL),
(221, 221, 'Turks et Caïques (Îles)', 'tc', 'monde', NULL, NULL),
(222, 222, 'Tuvalu', 'tv', 'monde', NULL, NULL),
(223, 223, 'Îles Mineures Éloignées des États-Unis', 'um', 'monde', NULL, NULL),
(224, 224, 'Ouganda', 'ug', 'monde', NULL, NULL),
(225, 225, 'Uruguay', 'uy', 'monde', NULL, NULL),
(226, 226, 'Ouzbékistan', 'uz', 'monde', NULL, NULL),
(227, 227, 'Vanuatu', 'vu', 'monde', NULL, NULL),
(228, 228, 'Vatican (Etat du)', 'va', 'monde', NULL, NULL),
(229, 229, 'Vietnam', 'vn', 'monde', NULL, NULL),
(230, 230, 'Vierges (Îles)', 'vi', 'monde', NULL, NULL),
(231, 231, 'Wallis et Futuna (Îles)', 'wf', 'monde', NULL, NULL),
(232, 232, 'Sahara Occidental', 'eh', 'monde', NULL, NULL),
(233, 233, 'Yemen', 'ye', 'monde', NULL, NULL),
(234, 234, 'Zaïre', 'zr', 'monde', NULL, NULL),
(235, 235, 'Zambie', 'zm', 'monde', NULL, NULL),
(236, 236, 'Zimbabwe', 'zw', 'monde', NULL, NULL),
(237, 237, 'La Barbad', 'bb', 'monde', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `periode`
--

CREATE TABLE `periode` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `periode` varchar(255) NOT NULL,
  `fraction` double NOT NULL,
  `nbmois` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `periode`
--

INSERT INTO `periode` (`id`, `periode`, `fraction`, `nbmois`, `created_at`, `updated_at`) VALUES
(1, 'Annuelle', 1, 12, NULL, NULL),
(2, 'Mensuelle', 0.15, 1, NULL, NULL),
(3, 'Trimestrielle', 0.3, 3, NULL, NULL),
(4, 'Semestrielle', 0.55, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'read-garanties', 'Afficher garanties', '', '2017-05-08 15:20:01', '2017-05-08 15:20:01'),
(2, 'update-guaranties', 'Modifier garanties', '', '2017-05-08 15:22:02', '2017-05-08 15:22:02'),
(4, 'read-categories', 'Afficher catégories', '', '2017-05-08 15:28:44', '2017-05-08 15:28:44'),
(5, 'update-categories', 'Modifier catégories', '', '2017-05-08 15:28:44', '2017-05-08 15:28:44'),
(6, 'create-company', 'Créer compagnie d\'assurance', '', '2017-05-08 15:30:57', '2017-05-08 15:30:57'),
(7, 'read-company', 'Afficher compagnie d\'assurance', '', '2017-05-08 15:30:57', '2017-05-08 15:30:57'),
(8, 'update-company', 'Modifier compagnie d\'assurance', '', '2017-05-08 15:32:10', '2017-05-08 15:32:10'),
(9, 'delete-company', 'Supprimer compagnie d\'assurance', '', '2017-05-08 15:34:00', '2017-05-08 15:34:00'),
(11, 'create-companies-prices', 'Créer prix/taux compagnies d\'assurance', '', '2017-05-08 15:58:03', '2017-05-08 15:58:03'),
(12, 'read-companies-prices', 'Afficher prix/taux compagnies d\'assurance', '', '2017-05-08 15:58:03', '2017-05-08 15:58:03'),
(13, 'update-companies-prices', 'Modifier prix/taux compagnies d\'assurance', '', '2017-05-08 15:58:03', '2017-05-08 15:58:03'),
(14, 'delete-companies-prices', 'Supprimer prix/taux compagnies d\'assurance', '', '2017-05-08 15:58:03', '2017-05-08 15:58:03'),
(15, 'update-reduction-rate', 'Modifier taux de réductions', '', '2017-05-08 16:00:48', '2017-05-08 16:00:48'),
(16, 'create-users', 'Créer utilisateurs', '', '2017-05-08 16:03:36', '2017-05-08 16:03:36'),
(17, 'read-users', 'Afficher utilisateurs', '', '2017-05-08 16:03:36', '2017-05-08 16:03:36'),
(18, 'update-users', 'Modifier utilisateurs', '', '2017-05-08 16:03:36', '2017-05-08 16:03:36'),
(19, 'delete-users', 'Supprimer utilisateurs', '', '2017-05-08 16:03:36', '2017-05-08 16:03:36'),
(20, 'create-roles', 'Créer rôles/privilèges', '', '2017-05-08 16:05:52', NULL),
(21, 'read-roles', 'Afficher rôles/privilèges', '', '2017-05-08 16:05:52', '2017-05-08 16:05:52'),
(22, 'update-roles', 'Modifier rôles/privilèges', '', '2017-05-08 16:05:52', '2017-05-08 16:05:52'),
(23, 'delete-roles', 'Supprimer rôles/privilèges', '', '2017-05-08 16:05:52', '2017-05-08 16:05:52'),
(24, 'create-auto-quote-prospect', 'Créer devis auto prospect', '', '2017-05-08 16:48:18', '2017-05-08 16:48:18'),
(25, 'read-auto-quote-prospect', 'Afficher devis auto prospect', '', '2017-05-08 16:48:18', '2017-05-08 16:48:18'),
(26, 'update-quote-auto-prospect', 'Modifier devis auto prospect', '', '2017-05-08 16:48:18', '2017-05-08 16:48:18'),
(27, 'delete-quote-auto-prospect', 'Supprimer devis auto prospect', '', '2017-05-08 16:48:18', '2017-05-08 16:48:18'),
(28, 'create-auto-quote-client', 'Créer devis auto client', '', '2017-05-08 16:48:56', '2017-05-08 16:48:56'),
(29, 'read-auto-quote-client', 'Afficher devis auto client', '', '2017-05-08 16:48:56', '2017-05-08 16:48:56'),
(30, 'update-quote-auto-client', 'Modifier devis auto client', '', '2017-05-08 16:48:56', '2017-05-08 16:48:56'),
(31, 'delete-quote-auto-client', 'Supprimer devis auto client', '', '2017-05-08 16:48:56', '2017-05-08 16:48:56'),
(32, 'create-client', 'Créer client', '', '2017-05-08 16:51:54', '2017-05-08 16:51:54'),
(33, 'read-client', 'Afficher client', '', '2017-05-08 16:51:54', '2017-05-08 16:51:54'),
(34, 'update-client', 'Modifier client', '', '2017-05-08 16:51:54', '2017-05-08 16:51:54'),
(35, 'delete-client', 'Supprimer client', '', '2017-05-08 16:51:54', '2017-05-08 16:51:54'),
(36, 'read-order', 'Afficher commande', '', '2017-05-08 17:00:02', '2017-05-08 17:00:02'),
(37, 'update-order', 'Modifier commande', '', '2017-05-08 17:00:02', '2017-05-08 17:00:02'),
(38, 'validate-order', 'Valider commande', '', '2017-05-08 17:00:02', '2017-05-08 17:00:02'),
(39, 'cancel-order', 'Annuler commande', '', '2017-05-08 17:00:02', '2017-05-08 17:00:02'),
(40, 'cash-order', 'Encaisser commande', '', '2017-05-08 17:10:19', '2017-05-08 17:10:19'),
(41, 'treat-delivery', 'Traiter livraison', '', '2017-05-08 17:10:19', '2017-05-08 17:10:19'),
(42, 'declare-disaster', 'Declarer sinistre', '', '2017-05-08 17:10:19', '2017-05-08 17:10:19');

-- --------------------------------------------------------

--
-- Structure de la table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 1, NULL, NULL),
(9, 9, 1, NULL, NULL),
(10, 10, 1, NULL, NULL),
(11, 11, 1, NULL, NULL),
(12, 12, 1, NULL, NULL),
(13, 13, 1, NULL, NULL),
(14, 14, 1, NULL, NULL),
(15, 15, 1, NULL, NULL),
(16, 16, 1, NULL, NULL),
(17, 17, 1, NULL, NULL),
(18, 18, 1, NULL, NULL),
(19, 19, 1, NULL, NULL),
(20, 20, 1, NULL, NULL),
(21, 21, 1, NULL, NULL),
(22, 22, 1, NULL, NULL),
(23, 23, 1, NULL, NULL),
(24, 24, 1, NULL, NULL),
(25, 25, 1, NULL, NULL),
(26, 26, 1, NULL, NULL),
(27, 27, 1, NULL, NULL),
(28, 28, 1, NULL, NULL),
(29, 29, 1, NULL, NULL),
(30, 30, 1, NULL, NULL),
(31, 31, 1, NULL, NULL),
(32, 32, 1, NULL, NULL),
(33, 33, 1, NULL, NULL),
(34, 34, 1, NULL, NULL),
(35, 35, 1, NULL, NULL),
(36, 36, 1, NULL, NULL),
(37, 37, 1, NULL, NULL),
(38, 38, 1, NULL, NULL),
(39, 39, 1, NULL, NULL),
(40, 40, 1, NULL, NULL),
(41, 41, 1, NULL, NULL),
(42, 42, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `quotation`
--

CREATE TABLE `quotation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `assurance_infos_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_payed` int(11) NOT NULL,
  `product_type` int(11) NOT NULL,
  `number_n` varchar(255) NOT NULL,
  `policy_number` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `service_opt` varchar(255) NOT NULL,
  `delivery_location` text DEFAULT NULL,
  `inbox_amount` double NOT NULL DEFAULT 0,
  `phone_client` varchar(255) DEFAULT NULL,
  `view` int(11) NOT NULL,
  `collect_data` text NOT NULL,
  `renew_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reduction`
--

CREATE TABLE `reduction` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_produit` varchar(255) NOT NULL,
  `desc_reduction` varchar(255) NOT NULL,
  `rate` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `reduction`
--

INSERT INTO `reduction` (`id`, `id_produit`, `desc_reduction`, `rate`, `created_at`, `updated_at`) VALUES
(1, '1', 'Reduction commercial', 0.2, NULL, NULL),
(2, '1', 'Reduction Permis de conduire', 0.05, NULL, NULL),
(3, '1', 'Reduction Categorie socio. pro', 0.1, NULL, NULL),
(4, '1', 'Bonus Non Sinistre', 0.4, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `revive_client_quotation`
--

CREATE TABLE `revive_client_quotation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `revive_by_mail` int(11) NOT NULL,
  `revive_by_sms` int(11) NOT NULL,
  `revive_by_dashboard_alert` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `advisor_note` text NOT NULL,
  `revive_date` date NOT NULL,
  `revive_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `revive_client_role_user`
--

CREATE TABLE `revive_client_role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Super Admin', '', '', '2017-05-08 14:44:01', '2017-05-08 14:44:01'),
(2, 'advisor', 'Customer advisor', '', '', '2017-05-08 14:44:01', '2017-05-08 14:44:01'),
(3, 'financial', 'Financial manager', '', '', '2017-05-08 14:46:59', '2017-05-08 14:46:59'),
(4, 'operation', 'Operation Manager', '', '', '2017-05-08 14:46:59', '2017-05-08 14:46:59'),
(5, 'deliveryman', 'Deliveryman', '', '', '2017-05-08 14:46:59', '2017-05-08 14:46:59'),
(6, 'claimsmanager', 'Gestionnaire de sinistre', '', '', '2017-10-05 07:08:35', '2017-10-05 07:08:35'),
(9, 'usermanager', 'User manager', '', '', '2017-11-20 09:41:10', '2017-11-20 09:41:10'),
(10, 'settingsmanager', 'Setting Manager', '', '', '2017-11-20 09:41:10', '2017-11-20 09:41:10');

-- --------------------------------------------------------

--
-- Structure de la table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(9, 1),
(10, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sending_notification`
--

CREATE TABLE `sending_notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_notif` varchar(255) NOT NULL,
  `from_user` int(11) NOT NULL,
  `to_user` int(11) NOT NULL,
  `head_notif` varchar(255) NOT NULL,
  `body_notif` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` text NOT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sinistre`
--

CREATE TABLE `sinistre` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sin_id` int(11) NOT NULL,
  `sin_number` varchar(255) NOT NULL,
  `sin_manager` int(11) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_phone` varchar(255) NOT NULL,
  `client_policy_number` varchar(255) NOT NULL,
  `date_sinistre` date NOT NULL,
  `client_declaration` text NOT NULL,
  `sin_status` int(11) NOT NULL,
  `decision_sin` int(11) NOT NULL,
  `observation` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sinistre_status_log`
--

CREATE TABLE `sinistre_status_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_log` int(11) NOT NULL,
  `sinistre_id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `gender` char(2) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `job_id` int(11) NOT NULL,
  `date_pc` date DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'default.png',
  `status` int(11) NOT NULL,
  `usertype` int(11) NOT NULL,
  `remember_token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `gender`, `dob`, `contact`, `job_id`, `date_pc`, `email`, `password`, `avatar`, `status`, `usertype`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aroli', 'Aroli', 'M', '2024-05-27', '0700000000', 14, '2024-09-27', 'aroli@gmail.com', '$2y$12$xU0U24BKR6fxhAaorlW4Fup.ruyTQ4a1H6sCFghkEIzEuNSISS2.a', 'default.png', 1, 99, 'OzXBX1Cpv8wFrFkMgsIY3XUpmOE1T76R8EKG5ndtqHYKSzKS6yU1NHnEiPqm', '2025-05-07 23:21:55', '2025-05-07 23:21:55');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `assurance_auto_infos`
--
ALTER TABLE `assurance_auto_infos`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `assurance_voyage_infos`
--
ALTER TABLE `assurance_voyage_infos`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `attestations`
--
ALTER TABLE `attestations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `auto_categories`
--
ALTER TABLE `auto_categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `auto_company`
--
ALTER TABLE `auto_company`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `auto_companyquotation`
--
ALTER TABLE `auto_companyquotation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `auto_guarantee`
--
ALTER TABLE `auto_guarantee`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `auto_infos`
--
ALTER TABLE `auto_infos`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `auto_reglementarycost`
--
ALTER TABLE `auto_reglementarycost`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `callme_log`
--
ALTER TABLE `callme_log`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `car_type`
--
ALTER TABLE `car_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commune`
--
ALTER TABLE `commune`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `delivery_order`
--
ALTER TABLE `delivery_order`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `delivery_signature`
--
ALTER TABLE `delivery_signature`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `delivery_tour`
--
ALTER TABLE `delivery_tour`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `delivery_tour_order`
--
ALTER TABLE `delivery_tour_order`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `delivery_tour_route`
--
ALTER TABLE `delivery_tour_route`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `espace_perso_account`
--
ALTER TABLE `espace_perso_account`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `made_quote`
--
ALTER TABLE `made_quote`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `make`
--
ALTER TABLE `make`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `optional_service`
--
ALTER TABLE `optional_service`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `order_status_actor`
--
ALTER TABLE `order_status_actor`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `paye`
--
ALTER TABLE `paye`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `periode`
--
ALTER TABLE `periode`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `quotation`
--
ALTER TABLE `quotation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reduction`
--
ALTER TABLE `reduction`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `revive_client_quotation`
--
ALTER TABLE `revive_client_quotation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `revive_client_role_user`
--
ALTER TABLE `revive_client_role_user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`role_id`,`user_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Index pour la table `sending_notification`
--
ALTER TABLE `sending_notification`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sinistre`
--
ALTER TABLE `sinistre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sinistre_status_log`
--
ALTER TABLE `sinistre_status_log`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `assurance_auto_infos`
--
ALTER TABLE `assurance_auto_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `assurance_voyage_infos`
--
ALTER TABLE `assurance_voyage_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `attestations`
--
ALTER TABLE `attestations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auto_categories`
--
ALTER TABLE `auto_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `auto_company`
--
ALTER TABLE `auto_company`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `auto_companyquotation`
--
ALTER TABLE `auto_companyquotation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `auto_guarantee`
--
ALTER TABLE `auto_guarantee`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `auto_infos`
--
ALTER TABLE `auto_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auto_reglementarycost`
--
ALTER TABLE `auto_reglementarycost`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `callme_log`
--
ALTER TABLE `callme_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `car_type`
--
ALTER TABLE `car_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `city`
--
ALTER TABLE `city`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `commune`
--
ALTER TABLE `commune`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `delivery_order`
--
ALTER TABLE `delivery_order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `delivery_signature`
--
ALTER TABLE `delivery_signature`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `delivery_tour`
--
ALTER TABLE `delivery_tour`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `delivery_tour_order`
--
ALTER TABLE `delivery_tour_order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `delivery_tour_route`
--
ALTER TABLE `delivery_tour_route`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `espace_perso_account`
--
ALTER TABLE `espace_perso_account`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `log`
--
ALTER TABLE `log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `made_quote`
--
ALTER TABLE `made_quote`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `make`
--
ALTER TABLE `make`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1143;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pour la table `model`
--
ALTER TABLE `model`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2100;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `optional_service`
--
ALTER TABLE `optional_service`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `order_status_actor`
--
ALTER TABLE `order_status_actor`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `paye`
--
ALTER TABLE `paye`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;

--
-- AUTO_INCREMENT pour la table `periode`
--
ALTER TABLE `periode`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `quotation`
--
ALTER TABLE `quotation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `reduction`
--
ALTER TABLE `reduction`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `revive_client_quotation`
--
ALTER TABLE `revive_client_quotation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `revive_client_role_user`
--
ALTER TABLE `revive_client_role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `sending_notification`
--
ALTER TABLE `sending_notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sinistre`
--
ALTER TABLE `sinistre`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sinistre_status_log`
--
ALTER TABLE `sinistre_status_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
