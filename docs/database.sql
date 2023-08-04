-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 04 août 2023 à 07:33
-- Version du serveur : 8.0.31
-- Version de PHP : 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `auxshoes`
--

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT 'Le nom du produit',
  `description` text COMMENT 'La description du produit',
  `picture` varchar(128) DEFAULT NULL COMMENT 'L''URL de l''image du produit',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Le prix du produit',
  `rate` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'L''avis sur le produit, de 1 à 5',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Le statut du produit (1=dispo, 2=pas dispo)',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date de création du produit',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'La date de la dernière mise à jour du produit',
  `brand_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `type_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_brand_idx` (`brand_id`),
  KEY `fk_product_category1_idx` (`category_id`),
  KEY `fk_product_type1_idx` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) VALUES
(1, 'Kissing', 'Proinde concepta rabie saeviore, quam desperatio incendebat et fames, amplificatis viribus ardore incohibili in excidium urbium matris Seleuciae efferebantur, quam comes tuebatur Castricius tresque legiones bellicis sudoribus induratae.\r\n', 'https://benoclock.github.io/S06-images/produits/1-kiss.jpg', '40.00', 4, 1, '2018-10-17 09:00:00', NULL, 2, 1, 7),
(2, 'Pink Lady', 'Nunc vero inanes flatus quorundam vile esse quicquid extra urbis pomerium nascitur aestimant praeter orbos et caelibes, nec credi potest qua obsequiorum diversitate coluntur homines sine liberis Romae.', 'https://benoclock.github.io/S06-images/produits/2-rose.jpg', '20.00', 2, 1, '2018-10-17 09:00:00', NULL, 4, 6, 2),
(3, 'Panda', 'Homines enim eruditos et sobrios ut infaustos et inutiles vitant, eo quoque accedente quod et nomenclatores adsueti haec et talia venditare, mercede accepta lucris quosdam et prandiis inserunt subditicios ignobiles et obscuros.', 'https://benoclock.github.io/S06-images/produits/3-panda.jpg', '50.00', 5, 1, '2018-10-17 09:00:00', NULL, 5, 1, 7),
(4, 'Zombie', 'Sed si ille hac tam eximia fortuna propter utilitatem rei publicae frui non properat, ut omnia illa conficiat, quid ego, senator, facere debeo, quem, etiamsi ille aliud vellet, rei publicae consulere oporteret?', 'https://benoclock.github.io/S06-images/produits/4-zombie.jpg', '40.00', 2, 1, '2018-10-17 09:00:00', NULL, 7, 1, 7),
(5, 'Minion', 'Ut enim benefici liberalesque sumus, non ut exigamus gratiam (neque enim beneficium faeneramur sed natura propensi ad liberalitatem sumus), sic amicitiam non spe mercedis adducti sed quod omnis eius fructus in ipso amore inest, expetendam putamus.', 'https://benoclock.github.io/S06-images/produits/5-minion.jpg', '44.00', 3, 1, '2018-10-17 09:00:00', NULL, 6, 1, 7),
(6, 'Père Noël', 'Tempore quo primis auspiciis in mundanum fulgorem surgeret victura dum erunt homines Roma, ut augeretur sublimibus incrementis, foedere pacis aeternae Virtus convenit atque Fortuna plerumque dissidentes, quarum si altera defuisset, ad perfectam non venerat summitatem.', 'https://benoclock.github.io/S06-images/produits/6-pernoel.jpg', '36.00', 2, 2, '2018-10-17 09:00:00', NULL, 8, 1, 7),
(7, 'Sleepy', 'Vita est illis semper in fuga uxoresque mercenariae conductae ad tempus ex pacto atque, ut sit species matrimonii, dotis nomine futura coniunx hastam et tabernaculum offert marito, post statum diem si id elegerit discessura, et incredibile est quo ardore apud eos in venerem uterque solvitur sexus.', 'https://benoclock.github.io/S06-images/produits/7-sleepy.jpg', '40.00', 3, 1, '2018-10-17 09:00:00', NULL, 4, 1, 7),
(8, 'Bear', 'Fieri, inquam, Triari, nullo pacto potest, ut non dicas, quid non probes eius, a quo dissentias. quid enim me prohiberet Epicureum esse, si probarem, quae ille diceret? cum praesertim illa perdiscere ludus esset.', 'https://benoclock.github.io/S06-images/produits/8-bear.jpg', '46.00', 4, 1, '2018-10-17 09:00:00', NULL, 5, 1, 7),
(9, 'Pantufa', 'Quam ob rem dissentientium inter se reprehensiones non sunt vituperandae, maledicta, contumeliae, tum iracundiae, contentiones concertationesque in disputando pertinaces indignae philosophia mihi videri solent.', 'https://benoclock.github.io/S06-images/produits/9-pantufa.jpg', '48.00', 4, 1, '2018-10-17 09:00:00', NULL, 6, 1, 7),
(10, 'Jack', 'Quam ob rem id primum videamus, si placet, quatenus amor in amicitia progredi debeat. Numne, si Coriolanus habuit amicos, ferre contra patriam arma illi cum Coriolano debuerunt? num Vecellinum amici regnum adpetentem, num Maelium debuerunt iuvare?', 'https://benoclock.github.io/S06-images/produits/10-jack.jpg', '50.00', 3, 1, '2018-10-17 09:00:00', NULL, 8, 1, 7),
(11, 'Teeturtle', 'Nec minus feminae quoque calamitatum participes fuere similium. nam ex hoc quoque sexu peremptae sunt originis altae conplures, adulteriorum flagitiis obnoxiae vel stuprorum. inter quas notiores fuere Claritas et Flaviana, quarum altera cum duceretur ad mortem.', 'https://benoclock.github.io/S06-images/produits/11-teeturtle.jpg', '50.00', 3, 1, '2018-10-17 09:00:00', NULL, 7, 1, 7),
(12, 'Pikachu', 'Claritas et Flaviana, quarum altera cum duceretur ad mortem, indumento, quo vestita erat, abrepto, ne velemen quidem secreto membrorum sufficiens retinere permissa est. ideoque carnifex nefas admisisse convictus inmane, vivus exustus est.', 'https://benoclock.github.io/S06-images/produits/12-pika.jpg', '50.00', 4, 1, '2018-10-17 09:00:00', NULL, 2, 1, 7),
(13, 'Unicorn', 'Haec igitur Epicuri non probo, inquam. De cetero vellem equidem aut ipse doctrinis fuisset instructior est enim, quod tibi ita videri necesse est, non satis politus iis artibus, quas qui tenent, eruditi appellantur aut ne deterruisset alios a studiis. quamquam te quidem video minime esse deterritum.', 'https://benoclock.github.io/S06-images/produits/13-unicorn.jpg', '50.00', 4, 1, '2018-10-17 09:00:00', NULL, 5, 1, 7),
(14, 'Shark', 'Intellectum est enim mihi quidem in multis, et maxime in me ipso, sed paulo ante in omnibus, cum M. Marcellum senatui reique publicae concessisti, commemoratis praesertim offensionibus, te auctoritatem huius ordinis dignitatemque rei publicae tuis vel doloribus vel suspicionibus anteferre', 'https://benoclock.github.io/S06-images/produits/14-shark.jpg', '40.00', 3, 1, '2018-10-17 09:00:00', NULL, 7, 1, 7),
(15, 'Eagles', 'Ille quidem fructum omnis ante actae vitae hodierno die maximum cepit, cum summo consensu senatus, tum iudicio tuo gravissimo et maximo. Ex quo profecto intellegis quanta in dato beneficio sit laus, cum in accepto sit tanta gloria.', 'https://benoclock.github.io/S06-images/produits/15-eagle.jpg', '34.00', 2, 1, '2018-10-17 09:00:00', NULL, 2, 1, 7),
(18, 'Pokeball', 'Sed ut tum ad senem senex de senectute, sic hoc libro ad amicum amicissimus scripsi de amicitia. Tum est Cato locutus, quo erat nemo fere senior temporibus illis, nemo prudentior; nunc Laelius et sapiens (sic enim est habitus) et amicitiae gloria excellens de amicitia loquetur.', 'https://benoclock.github.io/S06-images/produits/18-pokeball.jpg', '46.00', 3, 2, '2018-10-17 09:00:00', NULL, 8, 1, 7),
(19, 'Hobbit', 'Tu velim a me animum parumper avertas, Laelium loqui ipsum putes. C. Fannius et Q. Mucius ad socerum veniunt post mortem Africani; ab his sermo oritur, respondet Laelius, cuius tota disputatio est de amicitia, quam legens te ipse cognosces.', 'https://benoclock.github.io/S06-images/produits/19-hobbit.jpg', '46.00', 3, 1, '2018-10-17 09:00:00', NULL, 6, 1, 7),
(20, 'Deadpool', 'Pandente itaque viam fatorum sorte tristissima, qua praestitutum erat eum vita et imperio spoliari, itineribus interiectis permutatione iumentorum emensis venit Petobionem oppidum Noricorum, ubi reseratae sunt insidiarum latebrae omnes, et Barbatio repente apparuit comes.', 'https://benoclock.github.io/S06-images/produits/20-deadpool.jpg', '36.00', 4, 1, '2018-10-17 09:00:00', NULL, 2, 1, 7),
(21, 'Convrese', 'Sed ut tum ad senem senex de senectute, sic hoc libro ad amicum amicissimus scripsi de amicitia. Tum est Cato locutus, quo erat nemo fere senior temporibus illis, nemo prudentior; nunc Laelius et sapiens (sic enim est habitus) et amicitiae gloria excellens de amicitia loquetur.', 'https://benoclock.github.io/S06-images/produits/21-converse.jpg', '60.00', 3, 1, '2018-10-17 09:00:00', NULL, 5, 5, 1),
(22, 'Mike', 'Tu velim a me animum parumper avertas, Laelium loqui ipsum putes. C. Fannius et Q. Mucius ad socerum veniunt post mortem Africani; ab his sermo oritur, respondet Laelius, cuius tota disputatio est de amicitia, quam legens te ipse cognosces.', 'https://benoclock.github.io/S06-images/produits/22-nike.jpg', '68.00', 3, 1, '2018-10-17 09:00:00', NULL, 5, 4, 1),
(23, 'Jardon', 'Fieri, inquam, Triari, nullo pacto potest, ut non dicas, quid non probes eius, a quo dissentias. quid enim me prohiberet Epicureum esse, si probarem, quae ille diceret? cum praesertim illa perdiscere ludus esset.', 'https://benoclock.github.io/S06-images/produits/23-jordan.jpg', '120.00', 4, 2, '2018-10-17 09:00:00', NULL, 7, 7, 2),
(24, 'Running', 'Fieri, inquam, Triari, nullo pacto potest, ut non dicas, quid non probes eius, a quo dissentias. quid enim me prohiberet Epicureum esse, si probarem, quae ille diceret? cum praesertim illa perdiscere ludus esset.', 'https://benoclock.github.io/S06-images/produits/24-running-nike.jpg', '80.00', 3, 1, '2018-10-17 09:00:00', NULL, 5, 7, 2),
(25, 'Sans dale', 'Nunc vero inanes flatus quorundam vile esse quicquid extra urbis pomerium nascitur aestimant praeter orbos et caelibes, nec credi potest qua obsequiorum diversitate coluntur homines sine liberis Romae.', 'https://benoclock.github.io/S06-images/produits/25-100dales.jpg', '23.00', 2, 1, '2018-10-17 09:00:00', NULL, 7, 4, 4),
(26, 'Talon aibrille', 'Proinde concepta rabie saeviore, quam desperatio incendebat et fames, amplificatis viribus ardore incohibili in excidium urbium matris Seleuciae efferebantur, quam comes tuebatur Castricius tresque legiones bellicis sudoribus induratae.', 'https://benoclock.github.io/S06-images/produits/26-oCirage.jpg', '240.00', 5, 1, '2018-10-17 09:00:00', NULL, 3, 3, 5);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
