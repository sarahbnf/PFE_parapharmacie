-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 21 mai 2025 à 14:43
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
-- Base de données : `parapharmacie`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `nom`) VALUES
(4, 'Bébé & Maternité'),
(5, 'Matériel médical & Premiers soins'),
(3, 'Santé & Bien-être'),
(1, 'Soins & Hygiène'),
(2, 'Soins capillaires');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_commande` datetime DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'en cours',
  `statut` varchar(20) NOT NULL DEFAULT 'panier'?
  'total' int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande_produits`
--

CREATE TABLE `commande_produits` (
  `commande_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `prix` decimal(10,2) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `date_ajout` datetime DEFAULT current_timestamp(),
  `quantite` int(11) NOT NULL DEFAULT 0,
  `categorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `prix`, `photo`, `stock`, `date_ajout`, `quantite`, `categorie_id`) VALUES
(1, 'Gel douche surgras - Bioderma Atoderm', 'Pour peaux sensibles', 2500.00, 'SH Gel douche.webp', 30, '2025-05-21 12:27:07', 0, 1),
(2, 'Mousse nettoyante douce - Caudalie Mousse Fleur de Vigne', 'Nettoyant doux pour le visage', 2620.00, 'SH Mousse nettoyante.avif', 30, '2025-05-21 12:27:07', 0, 1),
(3, 'Gel nettoyant purifiant - Avène Cleanance', 'Gel purifiant pour peaux grasses', 4050.00, 'SH gel nettoyant', 30, '2025-05-21 12:27:07', 0, 1),
(4, 'Crème hydratante - Avène Hydrance', 'Hydratation durable pour peau sensible', 3400.00, 'SH creme hydratante.png', 30, '2025-05-21 12:27:07', 0, 1),
(5, 'Gel hydratant non gras - La Roche-Posay Effaclar Mat', 'Peau mixte à grasse', 3550.00, 'SH Gel hydratant.jpg', 30, '2025-05-21 12:27:07', 0, 1),
(6, 'Sérum à l’acide hyaluronique - Vichy Minéral 89', 'Hydratation intense et repulpant', 5600.00, 'SH serum.webp', 30, '2025-05-21 12:27:07', 0, 1),
(7, 'Sérum anti-taches - Caudalie Vinoperfect', 'Unifie et illumine le teint', 11125.00, 'SH Anti tache.avif', 30, '2025-05-21 12:27:07', 0, 1),
(8, 'Lait corporel hydratant - Lipikar Lait', 'Hydratation pour peaux sèches', 5000.00, 'SH lait corporel.jpg', 30, '2025-05-21 12:27:07', 0, 1),
(9, 'Crème peaux très sèches - Atoderm Intensive Baume', 'Apaise et nourrit les peaux atopiques', 3600.00, 'SH Creme.jpg', 30, '2025-05-21 12:27:07', 0, 1),
(10, 'Gommage anti-cellulite - Caudalie Crushed Cabernet', 'Exfoliation efficace du corps', 6900.00, 'SH gommage.avif', 30, '2025-05-21 12:27:07', 0, 1),
(11, 'Dentifrice - Sensodyne Rapide', 'Soulage la sensibilité dentaire', 1400.00, 'SH sendodyne.jfif', 30, '2025-05-21 12:27:07', 0, 1),
(12, 'Dentifrice - Parogencyl Soin Intensif', 'Traitement pour gencives sensibles', 1200.00, 'SH parogencyl.avif', 30, '2025-05-21 12:27:07', 0, 1),
(13, 'Bain de bouche - Listerine Total Care', 'Antiseptique bucco-dentaire', 2550.00, 'SH bain de bouche.png', 30, '2025-05-21 12:27:07', 0, 1),
(14, 'Fil dentaire - Oral-B Essential', 'Nettoyage interdentaire', 830.00, 'SH fil dentaire.webp', 30, '2025-05-21 12:27:07', 0, 1),
(15, 'Spray buccal - Halita Spray', 'Action antibactérienne pour haleine fraîche', 1200.00, 'SH spray.png', 30, '2025-05-21 12:27:07', 0, 1),
(16, 'Solution nasale - Physiologica', 'Dosettes stériles pour toute la famille', 2000.00, 'SH PHYSIOLOGICA.png', 30, '2025-05-21 12:27:07', 0, 1),
(17, 'Spray nasal - Stérimar Nez Bouché', 'Soulage la congestion nasale', 1600.00, 'SH nez boucher.jpg', 30, '2025-05-21 12:27:07', 0, 1),
(18, 'Inhalateur respiratoire - Puressentiel', 'Décongestionnant naturel', 1470.00, 'SH inhaleur respiratoire.webp', 30, '2025-05-21 12:27:07', 0, 1),
(19, 'Pastilles immunité - ArkoRoyal Propolis', 'Immunité et confort ORL', 1490.00, 'SH Arkoroya.jpg', 30, '2025-05-21 12:27:07', 0, 1),
(20, 'Shampooing dermo-protecteur - Ducray Extra-Doux', NULL, 3700.00, 'SC extra doux', 0, '2025-05-21 12:36:11', 0, 2),
(21, 'Shampooing pour cuir chevelu sensible - Klorane Shampooing à la pivoine', NULL, 2900.00, 'SC klorane', 0, '2025-05-21 12:36:11', 0, 2),
(22, 'Shampooing sans parabène - Vichy Dercos Minéral Doux', NULL, 4500.00, 'SC sans parabene.webp', 0, '2025-05-21 12:36:11', 0, 2),
(23, 'antipelliculaire doux sans tensioactifs agressifs - Bioderma Nodé P', NULL, 3000.00, 'SC node p.jpg', 0, '2025-05-21 12:36:11', 0, 2),
(24, 'pellicules grasses, démangeaisons - La Roche-Posay Kerium DS', NULL, 4400.00, 'SC pellicule grasse.jpg', 0, '2025-05-21 12:36:11', 0, 2),
(25, 'version cheveux normaux à gras ou secs - Vichy Dercos Anti-pelliculaire', NULL, 2500.00, 'SC anti pellicule CN.webp', 0, '2025-05-21 12:36:11', 0, 2),
(26, 'complément anti-chute - Ducray Anaphase+ Shampooing', NULL, 2600.00, 'SC s antichute', 0, '2025-05-21 12:36:11', 0, 2),
(27, 'SHAMPOOING ÉNERGISANT ANTI-CHUTE - Vichy Dercos Énergisant', NULL, 3050.00, 'SC dercos.webp', 0, '2025-05-21 12:36:11', 0, 2),
(28, 'stimulation du cuir chevelu - René Furterer Triphasic / Forticea', NULL, 9900.00, 'SC stimulation du cuir chevelu', 0, '2025-05-21 12:36:11', 0, 2),
(29, 'anti-chute femme, traitement stimulant - Phytocyane', NULL, 9200.00, 'SC traitement antichute.jpg', 0, '2025-05-21 12:36:11', 0, 2),
(30, 'fortifiant cheveux & ongles - Forcapil (Arkopharma)', NULL, 4950.00, 'SC fortifiant cheveux.webp', 0, '2025-05-21 12:36:11', 0, 2),
(31, 'Hair Expert Fortifiant intégral - Oenobiol Capillaire Fortifiant', NULL, 5000.00, 'SC hair expert.webp', 0, '2025-05-21 12:36:11', 0, 2),
(32, 'Chute de cheveux réactionnelle, ongles - Force, croissance, volume - Phytophanère (Phyto)', NULL, 7250.00, 'SC phyto.jpg', 0, '2025-05-21 12:36:11', 0, 2),
(33, 'anti-chute & vitalité - Cystiphane Biorga', NULL, 4100.00, 'SC cystiphane.jpg', 0, '2025-05-21 12:36:11', 0, 2),
(34, 'Pousse, Croissance & Fortification - Luxéol Croissance & Fortification', NULL, 9950.00, 'SC luxeol.jpg', 0, '2025-05-21 12:36:11', 0, 2),
(35, 'Huile sèche sublimatrice cheveux et corps - René Furterer 5 Sens Huile Sublimatrice', NULL, 4470.00, 'SC huile', 0, '2025-05-21 12:36:11', 0, 2),
(36, 'hydratation légère sans rinçage - Phyto 7 Crème de jour végétale', NULL, 3500.00, 'SC creme.jpg', 0, '2025-05-21 12:36:11', 0, 2),
(37, 'Pointes sèches - Klorane Soin sans rinçage à la mangue', NULL, 2500.00, 'SC creme mangue', 0, '2025-05-21 12:36:11', 0, 2),
(38, 'multivitamines + magnésium + zinc + vitamine C - Berocca', NULL, 4200.00, 'SB berocco.avif', 0, '2025-05-21 12:45:01', 0, 3),
(39, 'mélatonine + plantes (Sommeil & Relaxation) - Arkorelax Sommeil', NULL, 3600.00, 'SB sommeil.webp', 0, '2025-05-21 12:45:01', 0, 3),
(40, 'circulation cérébrale et mémoire - Arkogélules Ginkgo biloba', NULL, 2200.00, 'SB memoire.webp', 0, '2025-05-21 12:45:01', 0, 3),
(41, 'protection hivernale - Propolis Intense (Ladrôme)', NULL, 3600.00, 'SB immunite.webp', 0, '2025-05-21 12:45:01', 0, 3),
(42, 'perte d’eau, purification - Nutrisanté Minceur Draineur', NULL, 950.00, 'SB minceur.webp', 0, '2025-05-21 12:45:01', 0, 3),
(43, 'articulations, collagène - Ostéocartilage (Ineldea)', NULL, 4500.00, 'SB osteobiol.jpg', 0, '2025-05-21 12:45:01', 0, 3),
(44, 'probiotique multi-souches - Lactibiane Référence (Pileje)', NULL, 7800.00, 'SB probiotique.webp', 0, '2025-05-21 12:45:01', 0, 3),
(45, 'mélange de plantes digestives - Ergydigest (Nutergia)', NULL, 4700.00, 'SB digestive.webp', 0, '2025-05-21 12:45:01', 0, 3),
(46, 'anti-reflux à base de plantes et minéraux - Arkopharma Arkogastro', NULL, 2800.00, 'SB reflux.webp', 0, '2025-05-21 12:45:01', 0, 3),
(47, 'soutien probiotique en cas de désordre digestif - Lactibiane Imedia', NULL, 2900.00, 'SB Diarrhée.webp', 0, '2025-05-21 12:45:01', 0, 3),
(48, '17 huiles essentielles, effet froid immédiat - Puressentiel Circulation Spray ou Gel Express', NULL, 4400.00, 'SB spray.webp', 0, '2025-05-21 12:45:01', 0, 3),
(49, 'action décongestionnante cosmétique - Somatoline Drainant Jambes', NULL, 6500.00, 'SB bandages.webp', 0, '2025-05-21 12:45:01', 0, 3),
(50, 'aux huiles essentielles - Phytosun Aroms Gel Jambes Légères', NULL, 2900.00, 'SB gel.webp', 0, '2025-05-21 12:45:01', 0, 3),
(51, 'Peau normale des bébés et des enfants - Bioderma ABCDerm Gel Moussant', NULL, 3100.00, 'BM gel moussant.png', 0, '2025-05-21 12:46:35', 0, 4),
(52, 'Nettoie et protege - Liniment oléo-calcaire Gifrer', NULL, 700.00, 'BM change.png', 0, '2025-05-21 12:46:35', 0, 4),
(53, 'Restaure la barrière cutanée, Nourrit, Hydrate - Dexeryl Emollient', NULL, 4400.00, 'BM dexeryl', 0, '2025-05-21 12:46:35', 0, 4),
(54, 'Croûtes de lait & peaux sensibles - Bioderma ABCDerm Babysquam', NULL, 3500.00, 'BM anti croutes de lait.jpg', 0, '2025-05-21 12:46:35', 0, 4),
(55, 'Lavage nez & oreilles - Physiologica Sérum Physiologique', NULL, 1250.00, 'BM Physio_Serum.png', 0, '2025-05-21 12:46:35', 0, 4),
(56, 'Calisma 1er âge - 830g - Lait infantile', NULL, 4500.00, 'BM Gallia.jpg', 0, '2025-05-21 12:46:35', 0, 4),
(57, 'MAM Biberon Easy Start anti-colique 160 ml, 0+ mois', NULL, 2500.00, 'BM biberon.webp', 0, '2025-05-21 12:46:35', 0, 4),
(58, 'Lot de 2 sucettes anatomiques Mathilde Cabanas +18 mois', NULL, 2000.00, 'BM sucettes.webp', 0, '2025-05-21 12:46:35', 0, 4),
(59, 'Tire-lait électrique simple Swing Flex 2-Phase', NULL, 35000.00, 'BM tire lait.webp', 0, '2025-05-21 12:46:35', 0, 4),
(60, 'Weleda Huile de Massage Vergetures', NULL, 5400.00, 'BM vergeture.jfif', 0, '2025-05-21 12:46:35', 0, 4),
(61, 'Améliore le sommeil pendant la grossesse - Ceinture de sommeil Dream Belt', NULL, 11000.00, 'BM ceinture de sommeil.webp', 0, '2025-05-21 12:46:35', 0, 4),
(62, 'Grand coussin de maternité - Coussin d’allaitement Doomoo', NULL, 8000.00, 'BM coussin.webp', 0, '2025-05-21 12:46:35', 0, 4),
(63, 'Ceinture Ventrale Post-partum Respirable Récupération Ajustable Gaine Post Accouchement', NULL, 7000.00, 'BM gaine.jpg', 0, '2025-05-21 12:46:35', 0, 4),
(64, 'Thermomètre frontal Braun - Braun Sensian 7', NULL, 10800.00, 'BM th braun.jpg', 0, '2025-05-21 12:46:35', 0, 4),
(65, 'Humidificateur avec vapeur froide - Humidificateur d\'air Babymoov Hygro+', NULL, 21500.00, 'BM Humidificateur.webp', 0, '2025-05-21 12:46:35', 0, 4),
(66, 'Spray anti-moustique bébé Parakito', NULL, 2200.00, 'BM Anti-Moustiques.webp', 0, '2025-05-21 12:46:35', 0, 4),
(67, 'Soins solaires - Peaux sensibles SPRAY ENFANT SPF50+', NULL, 3600.00, 'BM Soins solaires', 0, '2025-05-21 12:46:35', 0, 4),
(68, 'Thermomètre sans contact Withings Thermo', NULL, 18000.00, 'MP Thermomètre sans contact.webp', 0, '2025-05-21 12:48:49', 0, 5),
(69, 'Tensiomètre poignet Beurer BC 32', NULL, 8700.00, 'MP tensiometre.webp', 0, '2025-05-21 12:48:49', 0, 5),
(70, 'Oxymètre Beurer PO 30', NULL, 11000.00, 'MP Oxymètres.webp', 0, '2025-05-21 12:48:49', 0, 5),
(71, 'Balance impédancemètre Terraillon Web Coach', NULL, 11500.00, 'MP balence.png', 0, '2025-05-21 12:48:49', 0, 5),
(72, 'Pansements Urgo Résistants - Waterproof - Spécial ampoules', NULL, 1500.00, 'MP Pansements.webp', 0, '2025-05-21 12:48:49', 0, 5),
(73, 'Compresses stériles Hartmann', NULL, 700.00, 'MP compressses.jpg', 0, '2025-05-21 12:48:49', 0, 5),
(74, 'Cooper Chlorhexidine 0,5% Solution Antiseptique', NULL, 960.00, 'MP spray antiseptique.webp', 0, '2025-05-21 12:48:49', 0, 5),
(75, 'Bande de crêpe élastique Lohmann & Rauscher', NULL, 25.00, 'MP Bande de crêpe.jpg', 0, '2025-05-21 12:48:49', 0, 5),
(76, 'Filets de maintien stériles Urgo', NULL, 1400.00, 'MP Filets de maintien.webp', 0, '2025-05-21 12:48:49', 0, 5),
(77, 'Spray eau oxygénée 10 volumes', NULL, 500.00, 'MP Eau Oxygénée.webp', 0, '2025-05-21 12:48:49', 0, 5),
(78, 'Attelle de poignet Thuasne Manurhizo', NULL, 8000.00, 'MP Attelle de poignet.webp', 0, '2025-05-21 12:48:49', 0, 5),
(79, 'Chevillère élastique Gibaud', NULL, 8500.00, 'MP Chevillère.jpg', 0, '2025-05-21 12:48:49', 0, 5),
(80, 'Genouillère rotulienne Zamst', NULL, 7200.00, 'MP grenouillere.webp', 0, '2025-05-21 12:48:49', 0, 5),
(81, 'Ceinture lombaire Lombatech (Thuasne)', NULL, 15000.00, 'MP Ceinture lombaire.webp', 0, '2025-05-21 12:48:49', 0, 5),
(82, 'Aérosol Beurer IH60 compact', NULL, 16000.00, 'MP Inhalateur.webp', 0, '2025-05-21 12:48:49', 0, 5),
(83, 'Trousse Urgo Premiers soins voyage', NULL, 1900.00, 'MP trousse.webp', 0, '2025-05-21 12:48:49', 0, 5),
(84, 'Poches de froid instantané Euroglas', NULL, 200.00, 'MP Poches de froid.jpg', 0, '2025-05-21 12:48:49', 0, 5);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `email`, `adresse`, `password`) VALUES
(1, 'Meriem', 'test@gmail.com', NULL', '123456');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `commande_produits`
--
ALTER TABLE `commande_produits`
  ADD PRIMARY KEY (`commande_id`,`produit_id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `utilisateurs` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commande_produits`
--
ALTER TABLE `commande_produits`
  ADD CONSTRAINT `commande_produits_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commandes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `commande_produits_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`);
COMMIT;

CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    sujet VARCHAR(255) NOT NULL UNIQUE,
    message VARCHAR(255) NOT NULL UNIQUE,
    date_envoi DATE NOT NULL
);


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
