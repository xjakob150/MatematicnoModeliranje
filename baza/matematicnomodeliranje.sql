-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 07, 2026 at 03:13 PM
-- Server version: 5.6.20-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `matematicnomodeliranje`
--

-- --------------------------------------------------------

--
-- Table structure for table `generiranje_oglasa`
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
-- Table structure for table `platforma`
--

CREATE TABLE IF NOT EXISTS `platforma` (
`id_platforme` int(11) NOT NULL,
  `ime_platforme` varchar(50) COLLATE utf8_slovenian_ci NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `platforma`
--

INSERT INTO `platforma` (`id_platforme`, `ime_platforme`) VALUES
(1, 'instagram'),
(2, 'facebook');

-- --------------------------------------------------------

--
-- Table structure for table `tecaji`
--

CREATE TABLE IF NOT EXISTS `tecaji` (
`id_tecaja` int(11) NOT NULL,
  `ime_tecaja` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `starostna_skupina` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL,
  `cena` int(11) DEFAULT NULL,
  `st_udelezencev` int(11) DEFAULT NULL,
  `stopnja` int(11) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tecaji`
--

INSERT INTO `tecaji` (`id_tecaja`, `ime_tecaja`, `starostna_skupina`, `cena`, `st_udelezencev`, `stopnja`) VALUES
(1, 'Prvi Koraki v programiranje (Scratch)', '7', 240, 12, 1),
(2, 'Koderska 2d/3D pustolovščina', '7', 240, 12, 2),
(3, 'Postani mojster programiranja v Scratchu', '10', 240, 12, 1),
(4, 'Minecraft kreativni studio in umetna inteligenca v Scratchu', '10', 240, 12, 2),
(5, 'Mojster mobilnih aplikacij in iger: Ustvari svojo mobilno igro z AppInventorjem', '10', 240, 12, 3),
(6, 'Python raziskovalec Minecrafta: osnove programiranja s programskim jezikom Python v Minecraft EE', '10', 240, 12, 4),
(7, 'Oblikuj svojo prvo spletno stran, uporabi HTML, CSS in Java Script', '13', 240, 12, 0),
(8, 'Orodja umetne inteligence (AI/UI) v praksi', '13', 240, 12, 0),
(9, 'Kodiraj svojo prihodnost: Uvod v programiranje s programskim jezikom Python', '13', 240, 12, 1),
(10, 'Programerski mastermind: Osvoji principe objektnega programiranja v Pythonu', '13', 240, 12, 2),
(11, 'Python Art Lab: 2D grafika, animacije, podatkovne strukture in algoritmi', '13', 240, 12, 3);

-- --------------------------------------------------------

--
-- Table structure for table `teme`
--

CREATE TABLE IF NOT EXISTS `teme` (
`id_teme` int(11) NOT NULL,
  `ime_teme` varchar(255) COLLATE utf8_slovenian_ci DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=135 ;

--
-- Dumping data for table `teme`
--

INSERT INTO `teme` (`id_teme`, `ime_teme`) VALUES
(1, '#2026'),
(2, '#AI'),
(3, '#AIvIzobraževanju'),
(4, '#AIvPraksi'),
(5, '#AppInventor'),
(6, '#BrezPavze'),
(7, '#BrezplacniTecaji'),
(8, '#CSS'),
(9, '#Celje'),
(10, '#CodeWeek'),
(11, '#CodingGiants'),
(12, '#CodingGiantsSlovenija'),
(13, '#DIGCodingGiants'),
(14, '#DIGILand'),
(15, '#Debugging'),
(16, '#December2025'),
(17, '#DigComp'),
(18, '#DigiLand'),
(19, '#DigitalnaPismenost'),
(20, '#DigitalnaPreobrazba'),
(21, '#DigitalnaPrihodnost'),
(22, '#DigitalnaVzgoja'),
(23, '#DigitalneKompetence'),
(24, '#DigitalneVesčine'),
(25, '#DigitalneVeščine'),
(26, '#DigitalniProgrami'),
(27, '#DigitalnoIzobraževanje'),
(28, '#Ekipa'),
(29, '#GiganciProgramiranja'),
(30, '#GitHubCopilot'),
(31, '#GlobalnaSkupnost'),
(32, '#HTML'),
(33, '#HvalaMami'),
(34, '#IKTdan'),
(35, '#JavaScript'),
(36, '#JavaScrpt'),
(37, '#MachineLearning'),
(38, '#Maribor'),
(39, '#MaterinskiDan'),
(40, '#Minecraft'),
(41, '#MinecraftEducation'),
(42, '#MinecraftEducationEdition'),
(43, '#MladiInTehnologija'),
(44, '#MladiProgramer'),
(45, '#MladiProgramerji'),
(46, '#NajdiNapako'),
(47, '#NovoLeto'),
(48, '#OlimpijskoZlato'),
(49, '#OsnoveProgramiranja'),
(50, '#OtrociInTehnologija'),
(51, '#OtrociProgramerji'),
(52, '#PametnoUčenje'),
(53, '#PokliciPrihodnosti'),
(54, '#Ponosni'),
(55, '#PrešernovDan'),
(56, '#Programiranje'),
(57, '#ProgramiranjeZaMlajše'),
(58, '#ProgramiranjeZaOtroke'),
(59, '#Python'),
(60, '#RačunalniškiVid'),
(61, '#Robotika'),
(62, '#STEM'),
(63, '#Scratch'),
(64, '#Slovenija'),
(65, '#SlovenskaKultura'),
(66, '#SpletniRazvoj'),
(67, '#SpletnoOblikovanje'),
(68, '#StarševskiNadzor'),
(69, '#SvetovniDanMatematike'),
(70, '#TechFuture'),
(71, '#TehnološkaVzgoja'),
(72, '#TehnoparkCelje'),
(73, '#TečajiProgramiranja'),
(74, '#UI'),
(75, '#UIvŠolah'),
(76, '#UmetnaInteligenca'),
(77, '#UstvariPrihodnost'),
(78, '#UčenjeJeZabava'),
(79, '#UčenjePoKorakih'),
(80, '#UčenjeProgramiranja'),
(81, '#UčenjeZaPrihodnost'),
(82, '#VelikiProgramiranja'),
(83, '#Zasloni'),
(84, '#božičnidan'),
(85, '#celje'),
(86, '#codinggiants'),
(87, '#codinggiantsslovenija'),
(88, '#delavniceprogramiranja'),
(89, '#digiSI'),
(90, '#digisi'),
(91, '#digisreda'),
(92, '#digital'),
(93, '#digitalnakariera'),
(94, '#digitalnapismenost'),
(95, '#digitalnevesčine'),
(96, '#digitalschool'),
(97, '#ditalnatransformacija'),
(98, '#htmlcss'),
(99, '#inovacije'),
(100, '#izobraževanje'),
(101, '#karierniNasveti'),
(102, '#maratondelavnic'),
(103, '#maribor'),
(104, '#mladina'),
(105, '#mladiprogramerji'),
(106, '#mladitehnologi'),
(107, '#mladiznalci'),
(108, '#novoletnazaobljuba'),
(109, '#otroci'),
(110, '#otrok'),
(111, '#prazniki'),
(112, '#programiranje'),
(113, '#programiranjezaotroke'),
(114, '#programming'),
(115, '#python'),
(116, '#responsibleTech'),
(117, '#school'),
(118, '#slovenia'),
(119, '#slovenija'),
(120, '#sola'),
(121, '#solaprogramiranja'),
(122, '#startupi'),
(123, '#svetovnidanradia'),
(124, '#tehnologija'),
(125, '#tehnoparkcelje'),
(126, '#tečajprogramiranja'),
(127, '#ucenjesprogramiranjem'),
(128, '#ustvarjalnost'),
(129, '#učenje'),
(130, '#učenjekode'),
(131, '#veselbožič'),
(132, '#zabava'),
(133, '#zaposlitevvIT'),
(134, '#šola');

-- --------------------------------------------------------

--
-- Table structure for table `uporabnik`
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
-- Table structure for table `zgodovina_oglasov`
--

CREATE TABLE IF NOT EXISTS `zgodovina_oglasov` (
`id_zgodovina` int(11) NOT NULL,
  `doseg` int(11) DEFAULT NULL,
  `starostna_skupina` int(11) DEFAULT NULL,
  `vsebina` varchar(1000) COLLATE utf8_slovenian_ci DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_slovenian_ci AUTO_INCREMENT=127 ;

--
-- Dumping data for table `zgodovina_oglasov`
--

INSERT INTO `zgodovina_oglasov` (`id_zgodovina`, `doseg`, `starostna_skupina`, `vsebina`) VALUES
(122, 4930, 7, 'Digitalne kompetence za varno prihodnost! ??\r\nVarno brskanje, razumevanje zasebnosti na spletu in kritično presojanje informacij so ključni deli digitalne pismenosti, ki jih vključujemo v vse naše tečaje. ??️\r\n\r\nZnanje je najboljša zaščita v digitalnem svetu.\r\nPoskrbite, da bo vaš otrok opremljen z ustreznimi veščinami! ?✨\r\n\r\n#DigitalnaPismenost #VarnoNaSpletu #CodingGiantsSlovenija #VzgojaZaPrihodnost'),
(123, 4766, 7, '? Programiranje je več kot le koda — je timsko delo!\r\nV naših skupinah se učenci učijo sodelovanja, izmenjave idej in skupnega reševanja problemov. To so veščine, ki jim bodo koristile na vsakem koraku v življenju. ??\r\n\r\nPridruži se naši ekipi mladih gigantov in ustvarjaj skupaj z nami! ?✨\r\n\r\n#Ekipa #Sodelovanje #CodingGiantsSlovenija #MladiZnalci'),
(121, 4877, 7, 'Kako spodbuditi radovednost pri otrocih? ??\r\nDajte jim orodja, da lahko sami raziskujejo in gradijo! Programiranje je idealno za to, saj vsak ukaz prinese takojšen odziv na zaslonu. To otroke spodbuja, da preizkušajo nove poti in se ne bojijo napak. ?✨\r\n\r\nV naši šoli je radovednost vedno na prvem mestu.\r\nPridružite se nam na brezplačni delavnici! ?️?\r\n\r\n? Rezerviraj mesto: https://bit.ly/CwGBrezplacno\r\n#Radovednost #Učenje #CodingGiantsSlovenija #MladiProgramerji'),
(120, 5012, 13, 'JavaScript: jezik, ki poganja sodobni splet! ⚡?\r\nČe želiš, da tvoja spletna stran ni le lepa, ampak tudi interaktivna, potrebuješ JavaScript. Od animacij do kompleksnih spletnih aplikacij — JS je nepogrešljiv. ??\r\n\r\nNauči se programirati v jeziku, ki ga uporablja ves svet!\r\nPridruži se nam na tečajih spletnega razvoja. ?️✨\r\n\r\n#JavaScript #WebDevelopment #CodingGiantsSlovenija #UčenjeProgramiranja'),
(118, 5231, 7, 'Minecraft Education: šola v svetu kock! ??\r\nSte vedeli, da se v Minecraftu lahko naučite vsega — od kemije do programiranja? Pri nas Minecraft uporabljamo kot orodje za učenje logike in algoritmičnega razmišljanja. ??\r\n\r\nUčenje je najuspešnejše takrat, ko otroci sploh ne opazijo, da se učijo, ker se ob tem tako zabavajo! ?✨\r\n\r\n#MinecraftEducation #UčenjeSProgramiranjem #CodingGiantsSlovenija'),
(119, 4955, 13, '? Postani mojster podatkov s Pythonom!\r\nV današnjem svetu so podatki nova nafta. Na naših naprednih tečajih učimo mlade, kako zbirati, analizirati in prikazovati podatke s pomočjo kode. ??\r\n\r\nTe veščine so izjemno dragocene v skoraj vsakem poklicu — od znanosti do ekonomije.\r\nPripravi se na digitalno kariero s Coding Giants! ??\r\n\r\n#Python #DataScience #CodingGiantsSlovenija #DigitalnaKariera'),
(116, 4721, 7, 'Ste pripravljeni na programerski maraton? ?‍♂️?\r\nNaše delavnice so zasnovane tako, da otroci v kratkem času osvojijo ključne koncepte in jih takoj uporabijo v praksi. Brez dolgovezne teorije — samo ustvarjanje! ?️✨\r\n\r\nPridruži se nam na naslednjem terminu in sprogramiraj svojo prvo avanturo. ??\r\n\r\n? Več na: https://bit.ly/CwGBrezplacno\r\n#maratondelavnic  #codinggiantsslovenija  #učenje'),
(117, 4683, 13, 'Python Art: koda namesto čopiča! ??\r\nZ uporabo knjižnic za grafiko lahko v Pythonu ustvarimo neverjetne vizualne učinke in animacije. To je odličen način za povezovanje umetnosti in tehnologije. ?️✨\r\n\r\nNa naših tečajih starejši učenci spoznajo, da so algoritmi lahko tudi čudoviti.\r\nOdkrij svojo umetniško plat skozi programiranje! ??\r\n\r\n#PythonArt #STEM #CodingGiantsSlovenija #Ustvarjalnost'),
(115, 4892, 13, 'Svet spleta na dosegu rok! ?✨\r\nV naših tečajih spletnega razvoja mladi ne le spoznajo HTML in CSS, ampak razumejo, kako internet sploh deluje. Kako se podatki prenašajo? Kaj je strežnik? Kako narediti stran varno? ??\r\n\r\nDigitalna prihodnost je v rokah tistih, ki razumejo njeno arhitekturo.\r\nPostani spletni razvijalec pri Coding Giants! ??️\r\n\r\n#SpletniRazvoj #HTMLCSS #CodingGiantsSlovenija #DigitalnaPrihodnost'),
(114, 5103, 7, 'Programiranje krepi vztrajnost! ?‍♂️?\r\nV kodi se napake zgodijo vsakemu — tudi najboljšim programerjem. Iskanje teh napak (debugging) uči otroke, da se ne ustrašijo izzivov, ampak vztrajno iščejo rešitev, dokler koda ne deluje. ??\r\n\r\nTo je pomembna življenjska lekcija: napaka ni konec poti, ampak priložnost za učenje.\r\nPridruži se nam in razvijaj svojo "programersko vztrajnost"! ??\r\n\r\n#Debugging #Vztrajnost #Programiranje #CodingGiantsSlovenija'),
(112, 4839, 7, 'VESEL BOŽIČ IN ČAROBNE PRAZNIKE! ?✨?\r\nNaj bodo praznični dnevi polni topline, veselja in trenutkov z najbližjimi. Mi pa vam pošiljamo kanček digitalne magije in veliko navdiha za ustvarjanje v novem letu. ???\r\n\r\nNaj vam in vašim otrokom prazniki prinesejo nove sanje, ki jih bomo skupaj spremenili v delujočo kodo! ??\r\n\r\n#veselbožič  #prazniki  #codinggiantsslovenija  #ustvarjalnost'),
(113, 4921, 7, 'Ali vaš otrok raje igra igre ali bi jih raje ustvarjal? ??\r\nPrehod od igranja k ustvarjanju je tisti "aha" trenutek, ki v otroku prebudi pravo radovednost. Ko spozna, da lahko sam določa pravila igre, postane tehnologija orodje za njegovo izražanje. ??\r\n\r\nPri Coding Giants vodimo otroke skozi ta proces na zabaven in dostopen način.\r\nPreizkusite našo brezplačno delavnico in poglejte, kako vaša ideja oživi na zaslonu! ?️✨\r\n\r\n? Prijava: https://bit.ly/CwGBrezplacno\r\n#ProgramiranjeZaOtroke #OdIgreKUstvarjanju #CodingGiantsSlovenija'),
(111, 5201, 7, 'SREČNO 2026! ?✨?\r\nNaj bo prihajajoče leto polno novih idej, uspešnih projektov in poguma za raziskovanje neznanega. V digitalnem svetu so možnosti neskončne — mi pa smo tukaj, da jih pomagamo uresničiti vašim otrokom. ??\r\n\r\nHvala vsem staršem in učencem, ki ste del naše zgodbe. Skupaj gradimo prihodnost, v kateri tehnologija služi ustvarjalnosti in znanju. ??\r\n\r\nVeselimo se vseh novih programerskih izzivov, ki jih prinaša leto 2026! ??\r\n\r\n#NovoLeto #Srečno2026 #CodingGiantsSlovenija #PrihodnostJeDigitalna'),
(110, 5122, 7, '? Programiranje je veščina prihodnosti! ?✨\r\nSvet postaja vse bolj digitaliziran, zato je razumevanje tehnologije ena najpomembnejših popotnic za mlade. Programiranje ne uči le "kako pisati kodo", ampak predvsem kako razmišljati logično, reševati probleme in biti ustvarjalen. ??\r\n\r\nPri Coding Giants Slovenija otroke in mladino (6–18 let) učimo skozi projekte, ki jih navdušijo:\r\n? razvoj lastnih iger v Scratchu in Minecraftu\r\n? programiranje v jeziku Python\r\n? ustvarjanje mobilnih aplikacij\r\n? spletni razvoj (HTML, CSS, JavaScript)\r\n? uporabo orodij umetne inteligence\r\n\r\nNe čakajte na jutri — omogočite svojemu otroku, da postane soustvarjalec digitalnega sveta! ??\r\n\r\n? Preverite naše programe: https://www.codinggiants.si\r\n#Programiranje #DigitalneVeščine #UčenjeZaPrihodnost #CodingGiantsSlovenija'),
(109, 4901, 7, 'V lanskem letu nas je pri izvedbi brezplačnih tečajev s področja programiranja, namenjenih otrokom in mladini, s ciljem krepitve digitalnih kompetenc, podprlo tudi  Ministrstvo za digitalno preobrazbo . V okviru prejetega sofinanciranja smo izvedli več izobraževalnih programov, ki so mladim omogočili prve korake v svet programiranja, spletnega razvoja in umetne inteligence. ??\r\n\r\nVerjamemo, da je vlaganje v digitalno znanje ključno za varno in uspešno prihodnost naših otrok. Tudi letos nadaljujemo z našim poslanstvom – otrokom in mladini približati sodobne tehnologije na zabaven, dostopen in varen način. ?‍??✨\r\n\r\nHvala ministrstvu za zaupanje in podporo pri soustvarjanju digitalne prihodnosti! ???\r\n\r\n#BrezplacniTecaji #DigitalneKompetence #Programiranje #MladiProgramerji #Slovenija #CodingGiantsSlovenija'),
(108, 4732, 7, '? Gradimo temelje digitalne pismenosti! ?‍??\r\n\r\nDigitalna pismenost danes ni več izbira, temveč nuja – in programiranje je njen pomemben temelj.  \r\nV šoli programiranja **Coding Giants Slovenija** učimo otroke in mladino ne le ustvarjati igre, spletne strani in aplikacije, temveč jih tudi **navajamo na varno in odgovorno rabo tehnologije**.\r\n\r\n? Z razumevanjem, kako delujejo digitalna orodja, otroci lažje prepoznajo nevarnosti na spletu.  \r\n? Naučijo se razmišljati logično, reševati probleme in varovati svoje podatke.  \r\n? Obenem pa razvijajo kreativnost, samostojnost in digitalne kompetence prihodnosti.\r\n\r\nPri izvedbi dela naših izobraževanj, namenjenih razvoju digitalnih kompetenc otrok in mladine, nas je v minulem letu podpiralo tudi  Ministrstvo za digitalno preobrazbo , z veseljem delimo objavo ministrstva, s katerim poudarja pomen digitalnega opismenjevanja vseh generacij.\r\n\r\n➡️ Pridružite se nam in omogočite otroku, da z znanjem programiranja pogumno vstopi v digitalni svet! ?  '),
(107, 1032, 7, '? Programiranje je digitalno platno za tvojo ustvarjalnost!\r\nMnogi mislijo, da je programiranje le matematika, a v resnici je eno najbolj kreativnih področij. ?️✨\r\n\r\nV naših tečajih učenci:\r\n? oblikujejo svetove in like v igrah\r\n? izbirajo barve, pisave in postavitve spletnih strani\r\n?️ ustvarjajo digitalno umetnost s kodo\r\n\r\nNaj tvoj otrok odkrije, kako lahko svojo domišljijo spremeni v delujoč digitalni projekt. ??\r\n\r\n? Prijava na brezplačne delavnice: https://bit.ly/CwGBrezplacno\r\n#Ustvarjalnost #Programiranje #CodingGiantsSlovenija #MladiInovatorji'),
(105, 1076, 7, '? Postanite del globalne zgodbe Coding Giants!\r\nNaša šola programiranja je prisotna v več kot 10 državah, kjer tisoče otrok vsak teden odkriva svet tehnologije. ??\r\n\r\nZnanje, ki ga pridobijo pri nas, je univerzalno — koda je namreč jezik, ki ga razume ves svet.\r\nPonosni smo, da lahko slovenskim otrokom ponudimo vrhunsko izobraževanje po preverjenih mednarodnih metodah. ??✨\r\n\r\nPridruži se skupnosti mladih gigantov in si odpri vrata v digitalni prihodnost!'),
(106, 1232, 13, '? Kako delujejo roboti in ali nas bodo zamenjali?\r\nRobotika in umetna inteligenca sta področji, ki bosta zaznamovali trg dela v prihodnosti. Pri Coding Giants otrokom ne dajemo le tehničnega znanja, ampak jih spodbujamo k razumevanju etike in odgovorne rabe tehnologije. ?️?\r\n\r\nSpoznavajo:\r\n• osnove avtomatizacije\r\n• kako računalnik sprejema odločitve\r\n• pomen sodelovanja med človekom in strojem\r\n\r\nRazumevanje tehnologije zmanjšuje strah pred njo in odpira neskončne možnosti za ustvarjanje. ??\r\n\r\n#Robotika #UmetnaInteligenca #CodingGiantsSlovenija #PokliciPrihodnosti'),
(104, 1098, 10, '? Ustvari svojo mobilno aplikacijo z App Inventorjem!\r\nSte se kdaj vprašali, kako nastanejo aplikacije na vašem telefonu? Z orodjem App Inventor lahko otroci sami zgradijo delujoče aplikacije in jih preizkusijo na svoji napravi! ?✨\r\n\r\nSkozi ta tečaj učenci spoznajo:\r\n✅ kako načrtovati uporabniški vmesnik\r\n✅ kako povezati gumbe in funkcije\r\n✅ kako uporabljati senzorje v telefonu\r\n\r\nIz pasivnih uporabnikov telefonov postanejo ustvarjalci, ki razumejo mobilno tehnologijo od znotraj. ??\r\n\r\n? Pridruži se nam in spoznaj svet mobilnih aplikacij!\r\n#AppInventor #MobilneAplikacije #CodingGiantsSlovenija #DigitalneVesčine'),
(103, 4432, 10, '? Python: od prve vrstice kode do umetne inteligence!\r\nAli ste vedeli, da je Python eden najbolj priljubljenih jezikov na svetu? Uporabljajo ga v Googlu, NASA-i in za razvoj najsodobnejših UI orodij. ??\r\n\r\nPri Coding Giants otroke in mlade učimo Pythona na način, ki je prilagojen njihovi starosti:\r\n? Za mlajše (10-12 let): programiranje v okolju Minecraft Education.\r\n? Za starejše (13-18 let): razvoj grafike, 2D iger in resnih algoritmov.\r\n\r\nPython je odlična izbira za vse, ki želijo razumeti, kako deluje sodobna tehnologija. ??\r\n\r\n? Rezerviraj svoje mesto na brezplačni delavnici: https://bit.ly/CwGBrezplacno\r\n#CodingGiantsSlovenija #Python #MladiProgramerji #UčenjeZaPrihodnost'),
(102, 10321, 7, '?✨ Spoznajmo osnove programiranja skozi igro!\r\nScratch je idealen za otroke, ki želijo stopiti v svet programiranja brez dolgega pisanja kode. Namesto tega uporabljajo barvne bloke, ki jih zlagajo kot kocke. ??\r\n\r\nSkozi takšno učenje otroci:\r\n✅ spoznajo logično zaporedje ukazov\r\n✅ razvijajo algoritmično razmišljanje\r\n✅ ustvarijo svoje prve animacije in igre\r\n\r\nProgramiranje v Scratchu je zabavno, barvito in izjemno učinkovito za razvoj prvih digitalnih spretnosti. ?\r\n\r\n? Želiš preizkusiti? Prijavi se na brezplačno delavnico!\r\n#CodingGiantsSlovenija #Scratch #ProgramiranjeZaOtroke #UčenjeJeZabava'),
(100, 3209, 7, 'Ste že slišali za Code with Giants? ??\r\nTo so naše največje brezplačne delavnice programiranja, ki potekajo dvakrat letno in na tisoče otrokom po vsem svetu odprejo vrata v digitalni svet.\r\n\r\nZnanje programiranja je danes ena najpomembnejših popotnic za življenje.\r\nPrijava je popolnoma brezplačna, število mest pa omejeno. Ne zamudite priložnosti za svoj prvi programerski projekt! ?✨\r\n\r\n? Prijava: https://bit.ly/CwGBrezplacno\r\n\r\n#CodeWithGiants #BrezplačneDelavnice #Programiranje #CodingGiantsSlovenija'),
(101, 4976, 13, 'Razvijanje spletnih strani je kot gradnja hiše v digitalnem svetu! ??\r\nHTML so temelji in stene, CSS je barva in pohištvo, JavaScript pa so luči in pametne naprave, ki hišo oživijo.\r\n\r\nV naših tečajih Web Developmenta se mladi naučijo celotnega procesa — od prve vrstice kode do objave svoje strani na internetu.\r\nSi pripravljen postati spletni arhitekt? ??\r\n\r\n? Preveri naše tečaje: https://www.codinggiants.si\r\n\r\n#SpletniRazvoj #HTML #CSS #JavaScript #CodingGiantsSlovenija'),
(99, 4381, 13, 'Umetna inteligenca ni čarovnija — je matematika in logika v praksi! ?✨\r\nNa naših naprednih tečajih mladim pokažemo, kako delujejo algoritmi, ki poganjajo sodobni svet.\r\n\r\nOd prepoznavanja slik do klepetalnih robotov — razumevanje teh tehnologij daje mladim ogromno prednost v prihodnosti.\r\nPridruži se nam in spoznaj, kako lahko tudi ti uporabiš UI za svoje projekte. ??\r\n\r\n? Več o naših programih: https://www.codinggiants.si\r\n\r\n#UmetnaInteligenca #DigitalneKompetence #CodingGiantsSlovenija #MladiTehnologi'),
(98, 4165, 7, '? Ste pripravljeni na poletje, polno kode, zabave in novih prijateljstev?\r\nVpis v naše poletne šole programiranja je uradno odprt! ☀️?\r\n\r\nLetos bomo raziskovali:\r\n? Razvoj iger v Minecraftu in Scratchu\r\n? Osnove Pythona za mlade raziskovalce\r\n? Ustvarjanje spletnih strani in aplikacij\r\n? Svet umetne inteligence in robotike\r\n\r\nPoletne šole so odlična priložnost, da otroci preživijo počitnice ustvarjalno, se naučijo novih veščin in spoznajo vrstnike s podobnimi zanimanji.\r\n\r\n? Maribor & Celje\r\n? Več informacij in prijava: https://www.codinggiants.si/poletne-sole\r\n\r\n#PoletnaŠola #ProgramiranjeZaOtroke #CodingGiantsSlovenija #ZabavnoPoletje'),
(96, 5393, 7, 'Ali ste vedeli, da je programiranje tretji najbolj iskan poklic prihodnosti? ??\r\nSvet se hitro spreminja in digitalne veščine postajajo nujne na skoraj vseh področjih dela.\r\n\r\nV šoli programiranja Coding Giants Slovenija otroke in mlade pripravljamo na te izzive. Skozi igro in praktične projekte se učijo logičnega razmišljanja, reševanja problemov in ustvarjalnega dela s tehnologijo.\r\n\r\n? Pridružite se nam na brezplačnih delavnicah in odkrijte svet programiranja!\r\n? Več na: https://www.codinggiants.si\r\n\r\n#PokliciPrihodnosti #DigitalneVesčine #CodingGiantsSlovenija #MladiProgramerji'),
(97, 5849, 7, 'Programiranje je kot učenje novega jezika — le da se tukaj pogovarjaš z računalnikom! ??\r\nIn ko otroci enkrat razumejo osnovne ukaze, se jim odpre popolnoma nov svet ustvarjalnosti.\r\n\r\nPri Coding Giants učimo na način, ki otroke motivira, da iz uporabnikov tehnologije postanejo njeni ustvarjalci.\r\nPreizkusite našo brezplačno delavnico in poglejte, kako hitro lahko vaš otrok sprogramira svojo prvo igro. ??\r\n\r\n? Rezervacija mesta: https://bit.ly/CwGBrezplacno\r\n\r\n#UčenjeProgramiranja #CodingGiantsSlovenija #MladiInTehnologija #UstvariSvojoIgro'),
(94, 8826, 7, 'Ko otroci in mladi dobijo priložnost, da tehnologijo ne le uporabljajo, temveč jo razumejo in soustvarjajo, se začnejo graditi resnične zgodbe prihodnosti ??\r\n\r\nV letu 2025 smo v DT.LAB-u in šoli programiranja Coding Giants Slovenija v okviru projekta DIGI LAND / MLADI 2025–26 otrokom in mladim omogočali dostop do znanj, ki jim dajejo samozavest, radovednost in pogum za digitalni svet ??✨\r\n\r\nVsak otrok ima potencial. Naša naloga je, da mu odpremo vrata ??\r\n\r\nHvaležni smo, da smo lahko del širših prizadevanj Ministrstva za digitalno preobrazbo, ki vlagajo v znanje – za danes in za prihodnost ????'),
(95, 10142, 7, '?⏳ Kako v letu 2026 poskrbeti uravnoteženo uporabo sodobnih tehnologij?\r\n\r\nV lanskem letu smo v okviru DIGI LAND projektov, podprtih s strani Ministrstvo za digitalno preobrazbo, izvajali delavnice "Digitalna vzgoja: starši in otroci", kjer smo staršem in otrokom pomagali krepiti veščine za varno in odgovorno uporabo spleta.\r\n\r\nKljučni nasveti za uravnotežen digitalni vsakdan v letu 2026:\r\n✅ Postavite jasne meje – dogovorite se za čas brez zaslonov (npr. med obroki).\r\n✅ Bodite zgled – otroci opazujejo naše digitalne navade.\r\n✅ Pogovarjajte se o vsebinah – splet je prostor za učenje in ustvarjalnost, ne le za pasivno spremljanje.\r\n✅ Uporabljajte orodja za starševski nadzor – a naj bodo le pomoč pri vzgoji, ne zamenjava za zaupanje.\r\n✅ Spodbujajte analogne aktivnosti – hobiji, šport in druženje v živo so neprecenljivi.\r\n\r\nDigitalna pismenost je popotnica za celo življenje. Gradimo jo skupaj! ?✨\r\n\r\n#DIGILand #DigitalnaVzgoja #VarnoNaSpletu #DigitalnaPismenost #StarševskiNadzor #OtrociInTe'),
(93, 5531, 7, '?✨ Umetna inteligenca ni več prihodnost. Je sedanjost – in mladi jo že aktivno spoznavajo.\r\n\r\nV vse tečaje, ki jih izvajamo, sistematično vključujemo tudi vsebine s področja umetne inteligence. V teh dneh smo se v okviru tečaja Orodja umetne inteligence v praksi z udeleženci, starimi od 13 do 17 let, poglabljali v računalniški vid ?️? – eno ključnih tehnologij sodobne AI.\r\n\r\n? Kako računalnik »vidi« sliko?\r\n? Kako prepozna obraz, predmet ali vzorec?\r\n? Kje se te tehnologije že uporabljajo v vsakdanjem življenju – in kje bodo odločilne v prihodnosti?\r\n\r\nNe govorimo le o teoriji. Mladi razumejo koncepte, postavljajo vprašanja ?‍♀️?‍♂️ in jih povezujejo z realnimi primeri uporabe. To je temelj digitalne pismenosti prihodnosti: razumevanje tehnologije, ne zgolj njena uporaba.\r\n\r\n#DIGILand #UmetnaInteligenca #RačunalniškiVid #DigitalneKompetence #MladiInTehnologija #AIvPraksi #CodingGiantsSlovenija'),
(91, 8338, 7, 'Digitalna kompetenca pomeni veliko več kot samo uporabo aplikacij.\r\nGre za logično razmišljanje, medijsko pismenost in prvo razumevanje tehnologije.\r\nPri Coding Giants se otroci poleg programiranja učijo tudi varne in premišljene uporabe digitalnih medijev. ?\r\n\r\nZato ponujamo brezplačno poskusno uro, kjer lahko vaš otrok spozna osnove digitalne pismenosti in programiranja. ??\r\nDrsanje, tipkanje, pomikanje – toda ali otroci res razumejo, kaj se skriva v ozadju?\r\n\r\nCoding Giants – učenje programiranja z zabavo in pogledom v prihodnost.\r\n #CodingGiants #OtrociInTehnologija #DigitalnaVzgoja #programiranje'),
(92, 4708, 7, '?? Programiranje in natančnost gresta z roko v roki.\r\nNatančno in premišljeno delo je danes ključnega pomena, saj otrokom pomaga razvijati organiziranost, zanesljivost in sposobnost reševanja problemov v vsakdanjem življenju.\r\n\r\nZato je še posebej pomembno, da se teh veščin začnejo učiti že v zgodnjem otroštvu.\r\nPri Coding Giants otroke strokovno vodimo in podpiramo na tej poti. Skozi igro in praktične primere jih postopno uvajamo v strukturirano razmišljanje ter jasno in učinkovito komunikacijo.\r\n\r\n? Programiranje ni le učenje tehnologije – je naložba v otrokovo prihodnost.\r\n\r\nŠola novih tehnologij Coding Giants Slovenija - učenje programiranja z veseljem in vizijo prihodnosti.\r\n\r\n#šola #učenje #programiranje #otrok #otroci #mladina #ustvarjalnost #maribor #slovenija #slovenia #ditalnatransformacija #sola #zabava #digital #school #digitalschool #codinggiants  @followers @topfans'),
(90, 8560, 7, '?Zakaj za udeležence naših tečajev Python predvsem ni kača? Oziroma ... od blokcev do vrstic prave delujoče ? programske kode :-)   \r\n\r\nSte se kdaj vprašali, kaj sledi, ko mladi programerji "prerastejo" Scratch, App Inventor in Minecraft? Pri nas je odgovor **Python.** Python ni le prvi "pravi" programski jezik, ki ga naši tečajniki spoznajo – predstavlja preprost med programiranjem kot igro in resnim razvojem. Je dovolj enostaven za začetek, a hkrati dovolj močan, da poganja Google, Netflix in najsodobnejšo umetno inteligenco.\r\n\r\n### ? Premišljena pot od igre do poklica\r\n\r\nUčenje pri nas ni skok v globoko vodo, ampak učinkovito stopnjevanje:\r\n\r\n✅ **Temelji v vizualnih okoljih:** Najprej osvojimo logiko, zanke in spremenljivke v Scratchu in Minecraftu.\r\n✅**Prvi koraki v Minecraft EE (10–12 let):** Python začnemo spoznavati v okolju, ki ga otroci obožujejo. Namesto z miško, svet Minecrafta gradijo s kodo in takoj vidijo učinek svojega dela.\r\n✅ **Profesionalni pristop (13–18 let):** Star'),
(87, 1097, 7, '? Kaj pomeni tipizacija v Pythonu in zakaj je tako pomembna?\r\nOtroci se na naših tečajih naučijo, kako Python uporablja različne podatkovne tipe: številke, besedila, sezname, logične vrednosti in še več. ?\r\n\r\nRazumejo, zakaj mora koda upoštevati pravilne tipe, kako se izognejo napakam in zakaj je to ključno za zanesljivo programiranje.\r\nTako razvijajo ne le tehnične veščine, ampak tudi razumevanje, kako “razmišlja” računalnik. ?\r\n\r\n? Na brezplačni poskusni uri razložimo vse korak za korakom.\r\nCoding Giants – učenje programiranja z zabavo in prihodnostjo.'),
(88, 4963, 7, 'Oseba Coding Giants Slovenija je posodobila naslovno fotografijo.'),
(89, 7701, 7, '? Kako Python shranjuje podatke in zakaj je to pomembno?\r\nV Pythonu so informacije shranjene v spremenljivkah – lahko so številke, besedila, seznami ali celo objekti.\r\nPri Coding Giants se otroci učijo, kako delujejo različni podatkovni tipi in zakaj mora računalnik natančno vedeti, s katero vrsto podatkov dela. ??\r\n\r\nTako hitro razumejo, zakaj je 5 nekaj povsem drugega kot "5", ter kako se izognejo napakam, še preden sploh začnejo programirati.\r\n\r\n? Te osnove so ključne za razvoj pravih programerskih veščin.\r\nNa naši brezplačni poskusni uri jih razložimo postopoma in na otrokom prijazen način. ?\r\n\r\nCoding Giants – učenje programiranja z zabavo in pogledom v prihodnost. #OtrociInTehnologija #CodingGiants #programiranje #učenjekode #TechFuture #PokliciPrihodnosti'),
(86, 10439, 7, '? Postanite arhitekti digitalnega sveta z udeležbo na Code with Giants brezplačnih delavnicah!\r\n\r\nSe tudi pri vas začne z “samo še 5 minut igranja” … bi želeli otrokovo zanimanje za tehnologijo preusmerit v koristno aktivnost, ki mu bo omogočila potešit radovednost za nove tehnologije, hkrati pa  bo ustvari nekaj novega?\r\nOdgovor je preprost: programiranje. ?✨\r\n\r\nV šoli novih tehnologij Coding Giants Slovenija prav zato  organiziramo brezplačne online delavnice programiranja, kjer otroci ne “tipkajo ukazov kar tako, ... na pamet”, ampak se učijo:\r\n✅ kako razmišljati logično\r\n✅ kako reševati probleme\r\n✅ kako ideje spremeniti v konkreten digitalni izdelek ??\r\n\r\nZakaj na Code with Giants delavnico?\r\n? Brez pritiska: otrok preizkusi programiranje brez obveznosti.\r\n? Od igranja k ustvarjanju: današnje nove tehnologije ob tem, da poenostavljajo delo in vsakdanja opravila, omogočajo samostojno ustvarjanje in uresničevanje lastnih idej.\r\n? Mentorji, ki govorijo jezik otrok in mladih: prijazno,'),
(85, 6849, 7, '?✨ IKT dan: Umetna inteligenca + robotika v praksi (Scratch + AI)\r\n\r\nV okviru cikla brezplačnih delavnic Coding Giants Slovenija (februar–marec 2026), smo v sodelovanju s  Strojno fakulteto Univerze v Mariboru izvedli IKT dan za učence OŠ Franceta Prešerna (Maribor).\r\n\r\nNajprej smo na razumljiv in “hands-on” način osvetlili ključne teme:\r\n✅ kaj je umetna inteligenca in kako deluje strojno učenje,\r\n✅ kje jo srečujemo danes (jezik, računalniški vid, robotika, optimizacija),\r\n✅ kaj pomenijo generativna orodja in veliki jezikovni modeli. \r\n\r\n? Glavni cilj delavnic pa je bil praktičen projekt: učenci so v Scratchu izdelali svojo igro “AI-powered I Spy”, kjer računalnik s pomočjo "pretrained" modela ImageNet prepozna objekt na sliki, igralec pa ugiba, kaj je UI “videla”. Projekt smo nadgradili še z izboljšanjem namigov in testiranjem z lastnimi slikami. \r\n\r\n?Za dodatno popestritev so poskrbeli kolegi strojne fakultete, ki so učencem omogočili vpogled v realno inženirsko okolje:\r\n✈️ ogled mod'),
(84, 7120, 7, '⚙️ Kako se C#‑koda sploh izvaja?\r\nVeliko otrok pri programiranju najprej pomisli na barvne bloke ali kratke ukaze, a v ozadju poteka res fascinanten proces! ?✨\r\n\r\nNa naših tečajih otroci korak za korakom spoznajo:\r\n• kako računalnik razume napisano kodo\r\n• kako se koda prevede in izvede\r\n• zakaj mora biti vsaka vrstica logično zasnovana\r\n\r\nTo ne prinese le Aha trenutkov, ampak tudi pravo tehnično razumevanje. ?\r\n\r\n? Naši tečaji otrokom pokažejo ne le kako programirati, ampak tudi zakaj stvari delujejo.\r\n\r\nCoding Giants – učenje programiranja z zabavo in prihodnostjo.'),
(82, 10361, 7, '? Tvoje ideje, tvoja koda, tvoja zgodba!\r\n⠀\r\nZ Scratchom se otroci na igriv način naučijo, kako upravljati like, pripovedovati zgodbe in ustvarjati svoje prve igre. ?✨\r\n⠀\r\nTako se ustvarjalnost spremeni v pravo programersko moč – brez zapletene kode, a z veliko zabave! ?\r\n⠀\r\n? Preizkusi brezplačno poskusno uro in postani pravi Story-Coder!\r\n⠀\r\nCoding Giants – programiranje z zabavo in prihodnostjo.'),
(83, 1990, 7, '8. februar – Prešernov dan ??✨  \r\nDanes se poklanjamo Franceu Prešernu, pesniku, ki je s svojo ustvarjalnostjo, pogumom in ljubeznijo do jezika oblikoval slovensko kulturo.\r\nTudi pri Coding Giants verjamemo v moč znanja in ustvarjalnosti — le da jo prenašamo v svet digitalnih veščin.\r\n\r\nDa lahko otroci razvijajo svoje talente tudi na področju programiranja, smo pripravili brezplačne preizkusne delavnice za otroke od 6 do 18 let.\r\nNaj odkrijejo, kako lahko ustvarjajo, gradijo in razmišljajo kot pravi mali inovatorji. ❤️\r\n\r\n? Prijava na brezplačno delavnico: https://bit.ly/CwGBrezplacno\r\n#PrešernovDan #SlovenskaKultura #CodingGiantsSlovenija'),
(81, 8826, 7, 'IMAMO OLIMPIJSKO ZLATO! ???\r\nNaši skakalci so znova dokazali, da je srce slovenskega športa neustavljivo. Pogum, predanost in ekipni duh so nas popeljali do vrha — in mi navijamo z vsem ponosom!\r\n\r\nPri Coding Giants otroke učimo podobnih vrednot: vztrajnosti, poguma in zaupanja v svoje sposobnosti. Tako kot športniki tudi mladi programerji rastejo z vsakim korakom, vsakim projektom in vsako novo veščino.\r\n\r\n? Naj tudi tvoj otrok naredi svoj prvi “skok” v svet programiranja  \r\n? Brezplačna delavnica: https://bit.ly/CwGBrezplacno  \r\n#Slovenija #OlimpijskoZlato #Ponosni #CodingGiantsSlovenija'),
(80, 4532, 7, 'Ali bi morala biti umetna inteligenca obvezni del pouka? ??  \r\nSvet, v katerega odraščajo naši otroci, že danes poganja umetna inteligenca. Pri Coding Giants jih ne pripravljamo na prihodnost – pomagamo jim, da jo ustvarjajo.\r\n\r\nPosodobili smo vse naše programe, da otroci in mladi (6–18 let) tehnologijo ne le uporabljajo, ampak jo razumejo in obvladajo od začetka. ?\r\n✔️ Online pouk v živo  \r\n✔️ Izkušeni mentorji  \r\n✔️ Metodologija: od igranja do ustvarjanja\r\n\r\nPripravi jih na digitalni svet, v katerem bodo voditelji. ✨\r\n? Rezerviraj BREZPLAČNI preizkusni tečaj: https://bit.ly/CwGBrezplacno\r\n#CodingGiants #UIvŠolah #DigitalnaPrihodnost #TehnološkaVzgoja #OtrociProgramerji'),
(79, 3466, 7, 'Svetovni dan radia ?✨  \r\nDanes praznujemo enega najstarejših in najvplivnejših medijev, ki je povezal svet dolgo pred internetom. Radio je prinašal novice, glasbo, zgodbe in znanje — in še danes ostaja pomemben del našega vsakdana.\r\n\r\nPri Coding Giants učimo otroke, da razumejo tehnologijo, ki nas obdaja, od klasičnih medijev do digitalnih platform.\r\nVsaka tehnologija ima svojo zgodbo — mi pa pomagamo otrokom razumeti, kako nastaja in kako jo lahko ustvarjajo tudi sami.\r\n\r\n? Želiš, da tvoj otrok naredi prve korake v svet programiranja\r\n? Brezplačna delavnica: https://bit.ly/CwGBrezplacno\r\n#svetovnidanradia  #codinggiantsslovenija  #digitalnevesčine'),
(78, 8631, 7, 'UI je del našega vsakdana ✨  \r\nOtroci odraščajo v svetu, kjer tehnologija ni več izbira, ampak realnost. Zato jim pri Coding Giants pomagamo razumeti digitalni svet, se v njem znajti in ga uporabljati odgovorno.\r\n\r\nNa naših delavnicah se otroci učijo programiranja na zabaven, varen in praktičen način — skozi projekte, ki jih navdušijo in jim odprejo vrata v prihodnost.\r\n\r\n? Želiš, da tudi tvoj otrok naredi prvi korak v svet programiranja\r\n? Prijava na brezplačno delavnico: https://bit.ly/CwGBrezplacno\r\n#CodingGiantsSlovenija #ProgramiranjeZaOtroke #DigitalneVesčine'),
(77, 6937, 7, 'Prvi koraki v svet umetne inteligence ✨?  \r\nUmetna inteligenca ni več tehnologija prihodnosti — je del vsakdana naših otrok. Zato je pomembno, da jo razumejo, se z njo znajo varno srečati in jo uporabljajo odgovorno.\r\n\r\nPri Coding Giants otroke vodimo skozi prve korake v svet UI na način, ki je varen, razumljiv in zabaven.\r\nSkozi praktične projekte spoznajo, kako UI deluje, kje jo srečamo in kako jo lahko uporabimo za ustvarjanje, ne le za igranje.\r\n\r\n? Če želiš, da tvoj otrok samozavestno stopi v digitalni svet\r\n? Prijava na brezplačno delavnico: https://bit.ly/CwGBrezplacno\r\n#UmetnaInteligenca #CodingGiantsSlovenija #DigitalneVesčine'),
(75, 4074, 7, 'UI pomaga otrokom učiti se iz napak ??  \r\nNe gre le za odgovore — UI razloži napake, ponudi lažje primere, ustvari naloge po meri in spodbuja samostojno razmišljanje.\r\nV Giganci Programiranja otroke učimo, da UI podpira razumevanje, ne pa da ga nadomesti.\r\n#GiganciProgramiranja #UI #DigitalneVesčine'),
(76, 4248, 7, 'Kako lahko UI pomaga otrokom pri učenju ?✨  \r\nUmetna inteligenca lahko otrokom pomaga na veliko več načinov kot samo s tem, da jim pove pravilen odgovor. Njena največja moč je v tem, da jih uči razmišljati, razumeti in napredovati.\r\n\r\nUI lahko otroku pomaga tako, da:\r\n• razloži, zakaj je odgovor napačen\r\n• ponudi enostavnejši primer\r\n• ustvari dodatne naloge na otrokovi ravni\r\n• pokaže več različnih poti do pravilne rešitve\r\n• spodbuja radovednost z vprašanji, ki otroka vodijo do samostojnega razmišljanja  \r\n• pomaga graditi samozavest, ker otrok vidi, da je napaka samo korak v procesu\r\n\r\nV šoli programiranja Coding Giants otroke učimo, da so napake priložnost za rast — UI pa je odličen pomočnik, ki jim to pokaže na jasen, razumljiv in prijazen način.\r\n\r\n? Želiš, da tvoj otrok spozna UI in programiranje na zabaven, varen in razumljiv način\r\n? Prijava na brezplačno delavnico: https://bit.ly/CwGBrezplacno\r\n#CodingGiantsSlovenija #UmetnaInteligenca #UčenjeZaPrihodnost'),
(74, 11188, 7, 'Zakaj je dobro začeti zgodaj z učenjem programiranja? ???  \r\nZgodnje učenje programiranja otrokom pomaga razvijati veščine, ki jih bodo potrebovali v svetu, kjer je tehnologija del skoraj vsakega poklica. Programiranje ni le pisanje kode — je način razmišljanja.\r\n\r\nRaziskave kažejo, da zgodnje učenje programiranja:\r\n• krepi sposobnost reševanja problemov,\r\n• spodbuja ustvarjalnost in domišljijo,\r\n• uči logičnega razmišljanja,\r\n• razvija vztrajnost in samostojnost,\r\n• otrokom pomaga razumeti tehnologijo, ne le uporabljati jo.\r\n\r\nV šoli programiranja Coding Giants Slovenija otroke učimo, da je programiranje zabavno, dostopno in odlična vaja za možgane. Ko začnejo zgodaj, se učijo naravno — skozi igro, raziskovanje in ustvarjanje.\r\n\r\n#CodingGiantsSlovenija #ProgramiranjeZaOtroke #DigitalneVesčine #UčenjeZaPrihodnost'),
(73, 1241, 13, 'Ali veste, katere funkcije ponuja GitHub Copilot? ?⚡  \r\nGitHub Copilot je postal nepogrešljiv pomočnik številnim programerjem, saj močno pospeši razvoj in olajša delo pri vsakodnevnih nalogah.\r\n\r\n➤ Predlogi kode: Copilot predlaga optimalne dopolnitve glede na kontekst in najboljše prakse.\r\n➤ Generiranje kode iz naravnega jezika: Opis v navadnem jeziku spremeni v delujočo kodo, kar močno skrajša čas razvoja.\r\n➤ Ustvarjanje enotnih testov: Samodejno pripravi testne predloge za razrede in metode.\r\n➤ Klepetalna podpora: Odgovarja na vprašanja o kodi, pomaga pri razumevanju napak in predlaga rešitve.\r\n\r\nTakšna orodja razvijalcem omogočajo, da se osredotočijo na logiko, arhitekturo in reševanje problemov — medtem ko UI prevzame ponavljajoče se naloge.\r\n\r\n#CodingGiantsSlovenija #GitHubCopilot #Programiranje #UmetnaInteligenca'),
(72, 7532, 7, 'Coding Giants Slovenija je del mednarodne skupnosti, ki otrokom po svetu približuje programiranje na sodoben, zabaven in dostopen način.\r\nNaša prisotnost v številnih državah pomeni, da se otroci učijo po preverjenih metodah, ki jih uporabljajo mladi programerji po vsem svetu.\r\n\r\nGlobalna mreža nam omogoča:\r\n• izmenjavo najboljših praks,\r\n• razvoj kakovostnih učnih programov,\r\n• povezovanje otrok z mednarodnim tehnološkim okoljem,\r\n• ustvarjanje skupnosti, ki spodbuja radovednost in inovativnost.\r\n\r\nPonosni smo, da je Slovenija del te zgodbe — in da lahko otrokom odpremo vrata v svet digitalnih veščin.\r\n\r\n#CodingGiantsSlovenija #GlobalnaSkupnost #ProgramiranjeZaOtroke #DigitalneVesčine'),
(71, 7463, 7, 'Matematika je temelj logičnega razmišljanja, programiranje pa njena naravna nadgradnja.\r\nKo otroci povežejo številke, vzorce in algoritme, začnejo razumevati svet tehnologije na čisto nov način.\r\n\r\nPri Coding Giants Slovenija jim to pokažemo skozi praktične primere, igre in ustvarjanje lastnih projektov.\r\nČe želiš, da tvoj otrok matematiko doživi na zabaven, uporaben in sodoben način, je to odlična priložnost.\r\n\r\n? Prijava na brezplačno delavnico: https://bit.ly/CwGBrezplacno\r\n\r\n#CodingGiantsSlovenija #SvetovniDanMatematike #ProgramiranjeZaOtroke #STEM'),
(70, 9717, 7, 'Prihodnost ne pripada tistim, ki jo samo opazujejo, ampak tistim, ki jo znajo ustvariti.\r\nProgramiranje otrokom in mladim odpira vrata v svet, kjer lahko svoje ideje spremenijo v resnične projekte — od iger in aplikacij do pametnih rešitev za vsakdan.\r\n\r\nPri Coding Giants Slovenija učimo na način, ki spodbuja ustvarjalnost, logično razmišljanje in samozavest pri delu s tehnologijo.\r\nČe želiš, da tvoj otrok naredi prve korake v svet programiranja na zabaven in dostopen način, je to idealna priložnost.\r\n\r\n? Prijava na brezplačno delavnico: https://bit.ly/CwGBrezplacno\r\n\r\n#CodingGiantsSlovenija #ProgramiranjeZaOtroke #DigitalneVesčine #UstvariPrihodnost'),
(69, 1283, 7, 'Vedno več mladih programerjev začne svojo pot tako, da najprej odprejo ChatGPT — šele potem pa pomislijo na HTML, CSS, JavaScript ali algoritme.\r\nIn ja, UI je super orodje. Ampak brez osnov se hitro zgodi, da ne razumejo, zakaj nekaj deluje, ali pa ne znajo popraviti napak, ko predlogi ne delujejo.\r\n\r\nPri Coding Giants Slovenija učimo, da je UI pomočnik, ne bližnjica.\r\nNajprej osnove. Potem logika. Potem razumevanje. In šele nato ChatGPT kot orodje, ki pospeši učenje — ne pa ga nadomesti.\r\n\r\n? Prijava na brezplačno delavnico: https://bit.ly/CwGBrezplacno\r\n\r\n#CodingGiantsSlovenija #ProgramiranjeZaOtroke #UčenjePoKorakih #DigitalneVesčine'),
(68, 7159, 7, 'Vsak mladi programer potrebuje dobre temelje — in prav zato smo pripravili začetni paket, ki otrokom pomaga narediti prve korake v svet kodiranja na zabaven, ustvarjalen in motivacijski način.\r\n\r\nPri Coding Giants Slovenija verjamemo, da se najboljše učenje zgodi takrat, ko otrok lahko raziskuje, ustvarja in se ob tem počuti ponosno na svoje prve projekte.\r\nZ našimi začetnimi materiali otroci spoznajo osnovne koncepte programiranja, razvijajo logično razmišljanje in dobijo samozavest, da nadaljujejo svojo pot.\r\n\r\nČe želiš, da tvoj otrok odkrije, kako zabavno je programiranje, ga lahko prijaviš na brezplačno delavnico, kjer bo vse to preizkusil v praksi.\r\n\r\n? Prijava na brezplačno delavnico: https://bit.ly/CwGBrezplacno\r\n\r\n#CodingGiantsSlovenija #MladiProgramer #ProgramiranjeZaOtroke #DigitalneVesčine'),
(67, 4453, 7, 'Napake v kodi niso sovražnik — so najboljši učitelj.\r\nZato imamo radi takšne mini izzive, kjer morajo otroci sami opaziti, kaj je narobe, in razmisliti, kako bi to popravili.\r\n\r\nPri Coding Giants Slovenija otroke spodbujamo, da najprej poskusijo sami najti rešitev, šele nato pa preverijo, ali so imeli prav.\r\nTo gradi logiko, samozavest in pravo “programersko oko”.\r\n\r\nČe želiš, da tvoj otrok preizkusi še več takšnih izzivov, ga lahko prijaviš na brezplačno delavnico.\r\n\r\n? Prijava na brezplačno delavnico: https://bit.ly/CwGBrezplacno\r\n\r\n#CodingGiantsSlovenija #Debugging #NajdiNapako #MladiProgramer'),
(66, 10239, 7, 'Materinski dan je dan, ko se spomnimo, koliko nevidnih supermoči imajo mame.\r\nOne so tiste, ki skrbijo, da otroci pridejo na treninge, krožke, rojstnodnevne zabave, tečaje and delavnice.\r\nOne so tiste, ki jih prijavljajo na aktivnosti, jih spodbujajo, ko poskušajo nekaj novega, in jih tolažijo, ko ne gre po načrtu.\r\nIn seveda — one so tiste, ki vedno najdejo čas za objem, igro, pomoč pri nalogah in nasmeh.\r\n\r\nNaš robotek na grafiki nosi posebno sporočilo, QR koda pa skriva še majhno presenečenje, ki ga lahko otroci podarijo svojim mamam.\r\n\r\nVse mame: hvala, ker ste vsak dan naš najljubši program. ?\r\n\r\n#MaterinskiDan #CodingGiantsSlovenija #HvalaMami'),
(65, 6153, 7, '? Mnogi starši se sprašujejo: Kako naj otroku pomagamo, da uravnoteženo uporablja digitalne naprave?\r\n\r\n? Delite svoje izkušnje in nasvete v komentarju. Skupaj poiščimo poti, kako otrokom pokazati, da obstaja tudi svet zunaj zaslonov.\r\n\r\n#šola #učenje #programiranje #otrok #otroci #mladina #ustvarjalnost #maribor #slovenija #slovenia #ditalnatransformacija #sola #zabava #digital #school #digitalschool #codinggiants #digisi @followers #digisi'),
(64, 4918, 7, '[VSAK MOJSTER JE BIL NEKOČ ZAČETNIK] ?  \r\n?V tečajih Coding Giants  spoznavamo osnove programiranja tudi v okolju Minecraft Education Editon!  \r\nTo odlično orodje otrokom omogoča, da se učijo programiranja na zabaven in zanimiv način. ??  \r\n\r\n? Otroci lahko preizkušajo različne rešitve in programske algoritme – učijo se po principu "poskusi in izboljšaj", kar spodbuja logično razmišljanje in vztrajnost. Spoznajo, da se napak ni potrebno bati, ampak, da se je iz napak mogoče vedno kaj naučiti. :-)\r\n\r\nV naši šoli programiranja znanje raste skupaj z otroško radovednostjo! ??‍??  \r\n\r\n#šola #učenje #programiranje #otrok #otroci #mladina #ustvarjalnost #maribor #slovenija #slovenia #ditalnatransformacija #sola #zabava #digital #school #digitalschool #codinggiants #digisi @followers'),
(124, 4981, 7, 'Ali ste pripravljeni na naslednji korak v svoji digitalni avanturi? ??\r\nVsak tečaj pri Coding Giants je stopnica na poti do znanja, ki vam bo odprlo vrata v svet tehnologije. Od prvih blokov v Scratchu do kompleksnih sistemov v Pythonu — mi smo z vami na vsakem koraku! ?✨\r\n\r\nVpis v nove semestre je odprt. Ne zamudite priložnosti!\r\n? Preverite termine: https://www.codinggiants.si\r\n\r\n#UčenjePoKorakih #CodingGiantsSlovenija #DigitalnaPrihodnost #ZnanjeJeMoč'),
(125, 5044, 7, 'Programiranje za vsakogar! ??\r\nPri Coding Giants verjamemo, da bi moral vsak otrok imeti priložnost spoznati osnove programiranja, ne glede na to, kaj želi postati v prihodnosti. Te veščine namreč krepijo logiko, ki je uporabna povsod. ?✨\r\n\r\nPridružite se nam in odkrijte, kako zabavno je lahko programiranje! ??\r\n\r\n? Rezerviraj brezplačno delavnico: https://bit.ly/CwGBrezplacno\r\n#ProgramiranjeZaVse  #CodingGiantsSlovenija  #DigitalneKompetence'),
(126, 5112, 7, 'Ste že spoznali našo maskoto? ??\r\nNaš gigant simbolizira moč znanja in pogum za raziskovanje digitalnega sveta. Pridruži se mu na poti od igranja iger do njihovega ustvarjanja! ??\r\n\r\nPostani tudi ti Coding Giant! ✨?\r\n\r\n#CodingGiants #MladiProgramerji #Programiranje #Zabava');

-- --------------------------------------------------------

--
-- Table structure for table `zgodovina_oglasov_teme`
--

CREATE TABLE IF NOT EXISTS `zgodovina_oglasov_teme` (
`id` int(11) NOT NULL,
  `zgodovina_oglasa_id` int(11) NOT NULL,
  `tema_id` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1157 ;

--
-- Dumping data for table `zgodovina_oglasov_teme`
--

INSERT INTO `zgodovina_oglasov_teme` (`id`, `zgodovina_oglasa_id`, `tema_id`) VALUES
(1156, 126, 91),
(1155, 126, 90),
(1154, 126, 86),
(1153, 126, 96),
(1152, 126, 117),
(1151, 126, 92),
(1150, 126, 132),
(1149, 126, 120),
(1148, 126, 97),
(1147, 126, 118),
(1146, 126, 119),
(1145, 126, 103),
(1144, 126, 128),
(1143, 126, 104),
(1142, 126, 109),
(1141, 126, 110),
(1140, 126, 112),
(1139, 126, 129),
(1138, 126, 134),
(1137, 124, 90),
(1136, 124, 86),
(1135, 124, 96),
(1134, 124, 117),
(1133, 124, 92),
(1132, 124, 132),
(1131, 124, 120),
(1130, 124, 97),
(1129, 124, 118),
(1128, 124, 119),
(1127, 124, 103),
(1126, 124, 128),
(1125, 124, 104),
(1124, 124, 109),
(1123, 124, 110),
(1122, 124, 112),
(1121, 124, 129),
(1120, 124, 134),
(1119, 123, 42),
(1118, 123, 5),
(1117, 123, 35),
(1116, 123, 8),
(1115, 123, 32),
(1114, 123, 59),
(1113, 123, 63),
(1112, 123, 19),
(1111, 123, 45),
(1110, 123, 73),
(1109, 123, 11),
(1108, 122, 91),
(1107, 122, 90),
(1106, 122, 20),
(1105, 122, 58),
(1104, 122, 12),
(1103, 122, 7),
(1102, 122, 23),
(1101, 122, 18),
(1100, 122, 13),
(1099, 121, 6),
(1098, 121, 26),
(1097, 121, 11),
(1096, 120, 90),
(1095, 120, 86),
(1094, 120, 96),
(1093, 120, 117),
(1092, 120, 92),
(1091, 120, 132),
(1090, 120, 120),
(1089, 120, 97),
(1088, 120, 118),
(1087, 120, 119),
(1086, 120, 103),
(1085, 120, 128),
(1084, 120, 104),
(1083, 120, 109),
(1082, 120, 110),
(1081, 120, 112),
(1080, 120, 129),
(1079, 120, 134),
(1078, 119, 94),
(1077, 119, 107),
(1076, 119, 98),
(1075, 119, 115),
(1074, 119, 106),
(1073, 119, 112),
(1072, 118, 27),
(1071, 118, 82),
(1070, 118, 67),
(1069, 118, 80),
(1068, 118, 49),
(1067, 118, 66),
(1066, 118, 32),
(1065, 117, 93),
(1064, 117, 124),
(1063, 117, 122),
(1062, 117, 133),
(1061, 117, 112),
(1060, 117, 101),
(1059, 117, 105),
(1058, 116, 127),
(1057, 116, 105),
(1056, 116, 126),
(1055, 116, 112),
(1054, 115, 89),
(1053, 115, 103),
(1052, 115, 119),
(1051, 115, 35),
(1050, 115, 8),
(1049, 115, 32),
(1048, 115, 59),
(1047, 115, 63),
(1046, 115, 17),
(1045, 115, 45),
(1044, 115, 12),
(1043, 115, 20),
(1042, 115, 58),
(1041, 115, 7),
(1040, 115, 23),
(1039, 115, 18),
(1038, 115, 13),
(1037, 114, 90),
(1036, 114, 86),
(1035, 114, 96),
(1034, 114, 117),
(1033, 114, 92),
(1032, 114, 132),
(1031, 114, 120),
(1030, 114, 97),
(1029, 114, 118),
(1028, 114, 119),
(1027, 114, 103),
(1026, 114, 128),
(1025, 114, 104),
(1024, 114, 109),
(1023, 114, 110),
(1022, 114, 112),
(1021, 114, 129),
(1020, 114, 134),
(1019, 113, 116),
(1018, 113, 99),
(1017, 113, 11),
(1016, 113, 100),
(1015, 113, 2),
(1014, 112, 89),
(1013, 112, 64),
(1012, 112, 11),
(1011, 112, 28),
(1010, 110, 90),
(1009, 110, 86),
(1008, 110, 96),
(1007, 110, 117),
(1006, 110, 92),
(1005, 110, 132),
(1004, 110, 120),
(1003, 110, 97),
(1002, 110, 118),
(1001, 110, 119),
(1000, 110, 103),
(999, 110, 128),
(998, 110, 104),
(997, 110, 109),
(996, 110, 110),
(995, 110, 112),
(994, 110, 129),
(993, 110, 134),
(992, 109, 78),
(991, 109, 57),
(990, 109, 63),
(989, 108, 90),
(988, 108, 86),
(987, 108, 96),
(986, 108, 117),
(985, 108, 92),
(984, 108, 132),
(983, 108, 120),
(982, 108, 97),
(981, 108, 118),
(980, 108, 119),
(979, 108, 128),
(978, 108, 104),
(977, 108, 109),
(976, 108, 110),
(975, 108, 112),
(974, 108, 129),
(973, 108, 134),
(972, 107, 89),
(971, 107, 64),
(970, 107, 11),
(969, 107, 28),
(968, 106, 3),
(967, 106, 19),
(966, 106, 58),
(965, 106, 52),
(964, 106, 76),
(963, 106, 11),
(962, 105, 114),
(961, 105, 112),
(960, 105, 59),
(959, 105, 11),
(958, 105, 28),
(957, 104, 9),
(956, 104, 63),
(955, 104, 59),
(954, 104, 41),
(953, 104, 76),
(952, 104, 58),
(951, 104, 72),
(950, 104, 11),
(949, 103, 121),
(948, 103, 10),
(947, 103, 2),
(946, 103, 59),
(945, 103, 36),
(944, 103, 8),
(943, 103, 32),
(942, 103, 63),
(941, 103, 40),
(940, 100, 102),
(939, 100, 85),
(938, 100, 125),
(937, 100, 113),
(936, 100, 88),
(935, 100, 86),
(934, 98, 90),
(933, 98, 86),
(932, 98, 96),
(931, 98, 117),
(930, 98, 92),
(929, 98, 132),
(928, 98, 120),
(927, 98, 97),
(926, 98, 118),
(925, 98, 119),
(924, 98, 103),
(923, 98, 128),
(922, 98, 104),
(921, 98, 109),
(920, 98, 110),
(919, 98, 112),
(918, 98, 129),
(917, 98, 134),
(916, 97, 111),
(915, 97, 84),
(914, 97, 131),
(913, 97, 11),
(912, 96, 90),
(911, 96, 86),
(910, 96, 96),
(909, 96, 117),
(908, 96, 92),
(907, 96, 132),
(906, 96, 120),
(905, 96, 97),
(904, 96, 118),
(903, 96, 119),
(902, 96, 103),
(901, 96, 128),
(900, 96, 104),
(899, 96, 109),
(898, 96, 110),
(897, 96, 112),
(896, 96, 129),
(895, 96, 134),
(894, 95, 90),
(893, 95, 86),
(892, 95, 96),
(891, 95, 117),
(890, 95, 92),
(889, 95, 132),
(888, 95, 120),
(887, 95, 97),
(886, 95, 118),
(885, 95, 119),
(884, 95, 103),
(883, 95, 128),
(882, 95, 104),
(881, 95, 109),
(880, 95, 110),
(879, 95, 112),
(878, 95, 129),
(877, 95, 134),
(876, 94, 16),
(875, 94, 62),
(874, 94, 130),
(873, 94, 112),
(872, 94, 108),
(871, 94, 11),
(870, 93, 90),
(869, 93, 86),
(868, 93, 96),
(867, 93, 117),
(866, 93, 92),
(865, 93, 132),
(864, 93, 120),
(863, 93, 97),
(862, 93, 118),
(861, 93, 119),
(860, 93, 128),
(859, 93, 104),
(858, 93, 109),
(857, 93, 110),
(856, 93, 112),
(855, 93, 129),
(854, 93, 134),
(853, 92, 47),
(852, 92, 81),
(851, 92, 25),
(850, 92, 1),
(849, 92, 11),
(848, 91, 11),
(847, 91, 50),
(846, 91, 83),
(845, 91, 68),
(844, 91, 1),
(843, 91, 22),
(842, 89, 12),
(841, 89, 4),
(840, 89, 43),
(839, 89, 23),
(838, 89, 60),
(837, 89, 76),
(836, 89, 14),
(835, 88, 86),
(834, 88, 96),
(833, 88, 117),
(832, 88, 92),
(831, 88, 132),
(830, 88, 120),
(829, 88, 97),
(828, 88, 118),
(827, 88, 119),
(826, 88, 103),
(825, 88, 128),
(824, 88, 104),
(823, 88, 109),
(822, 88, 110),
(821, 88, 112),
(820, 88, 129),
(819, 88, 134),
(818, 87, 112),
(817, 87, 22),
(816, 87, 50),
(815, 87, 11),
(814, 85, 53),
(813, 85, 70),
(812, 85, 130),
(811, 85, 112),
(810, 85, 11),
(809, 85, 50),
(808, 81, 23),
(807, 81, 38),
(806, 81, 62),
(805, 81, 37),
(804, 81, 61),
(803, 81, 63),
(802, 81, 76),
(801, 81, 34),
(800, 81, 14),
(799, 81, 12),
(798, 79, 12),
(797, 79, 65),
(796, 79, 55),
(795, 77, 12),
(794, 77, 54),
(793, 77, 48),
(792, 77, 64),
(791, 76, 51),
(790, 76, 71),
(789, 76, 21),
(788, 76, 75),
(787, 76, 11),
(786, 75, 95),
(785, 75, 87),
(784, 75, 123),
(783, 74, 24),
(782, 74, 58),
(781, 74, 12),
(780, 73, 24),
(779, 73, 12),
(778, 73, 76),
(777, 72, 81),
(776, 72, 76),
(775, 72, 12),
(774, 71, 24),
(773, 71, 74),
(772, 71, 29),
(771, 70, 81),
(770, 70, 24),
(769, 70, 58),
(768, 70, 12),
(767, 69, 76),
(766, 69, 56),
(765, 69, 30),
(764, 69, 12),
(763, 68, 24),
(762, 68, 58),
(761, 68, 31),
(760, 68, 12),
(759, 67, 62),
(758, 67, 58),
(757, 67, 69),
(756, 67, 12),
(755, 66, 77),
(754, 66, 24),
(753, 66, 58),
(752, 66, 12),
(751, 65, 24),
(750, 65, 79),
(749, 65, 58),
(748, 65, 12),
(747, 64, 24),
(746, 64, 58),
(745, 64, 44),
(744, 64, 12),
(743, 63, 44),
(742, 63, 46),
(741, 63, 15),
(740, 63, 12),
(739, 62, 33),
(738, 62, 12),
(737, 62, 39),
(736, 61, 90),
(735, 61, 86),
(734, 61, 96),
(733, 61, 117),
(732, 61, 92),
(731, 61, 132),
(730, 61, 120),
(729, 61, 97),
(728, 61, 118),
(727, 61, 119),
(726, 61, 103),
(725, 61, 128),
(724, 61, 104),
(723, 61, 109),
(722, 61, 110),
(721, 61, 112),
(720, 61, 129),
(719, 61, 134),
(718, 60, 90),
(717, 60, 86),
(716, 60, 96),
(715, 60, 117),
(714, 60, 92),
(713, 60, 132),
(712, 60, 120),
(711, 60, 97),
(710, 60, 118),
(709, 60, 119),
(708, 60, 103),
(707, 60, 128),
(706, 60, 104),
(705, 60, 109),
(704, 60, 110),
(703, 60, 112),
(702, 60, 129),
(701, 60, 134);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `generiranje_oglasa`
--
ALTER TABLE `generiranje_oglasa`
 ADD PRIMARY KEY (`id_oglasa`), ADD KEY `id_uporabnika` (`id_uporabnika`), ADD KEY `id_platforme` (`id_platforme`);

--
-- Indexes for table `platforma`
--
ALTER TABLE `platforma`
 ADD PRIMARY KEY (`id_platforme`);

--
-- Indexes for table `tecaji`
--
ALTER TABLE `tecaji`
 ADD PRIMARY KEY (`id_tecaja`);

--
-- Indexes for table `teme`
--
ALTER TABLE `teme`
 ADD PRIMARY KEY (`id_teme`);

--
-- Indexes for table `uporabnik`
--
ALTER TABLE `uporabnik`
 ADD PRIMARY KEY (`id_uporabnika`), ADD UNIQUE KEY `email` (`email`,`geslo`);

--
-- Indexes for table `zgodovina_oglasov`
--
ALTER TABLE `zgodovina_oglasov`
 ADD PRIMARY KEY (`id_zgodovina`);

--
-- Indexes for table `zgodovina_oglasov_teme`
--
ALTER TABLE `zgodovina_oglasov_teme`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_oglas_tema` (`zgodovina_oglasa_id`,`tema_id`), ADD KEY `fk_tema` (`tema_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `generiranje_oglasa`
--
ALTER TABLE `generiranje_oglasa`
MODIFY `id_oglasa` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `platforma`
--
ALTER TABLE `platforma`
MODIFY `id_platforme` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tecaji`
--
ALTER TABLE `tecaji`
MODIFY `id_tecaja` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `teme`
--
ALTER TABLE `teme`
MODIFY `id_teme` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT for table `uporabnik`
--
ALTER TABLE `uporabnik`
MODIFY `id_uporabnika` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `zgodovina_oglasov`
--
ALTER TABLE `zgodovina_oglasov`
MODIFY `id_zgodovina` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT for table `zgodovina_oglasov_teme`
--
ALTER TABLE `zgodovina_oglasov_teme`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1157;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
