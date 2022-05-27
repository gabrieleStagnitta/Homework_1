-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: torneo
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `calciatore`
--

DROP TABLE IF EXISTS `calciatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calciatore` (
  `id` int(11) NOT NULL,
  `ruolo` char(1) NOT NULL,
  `nome` varchar(25) DEFAULT NULL,
  `squadra` varchar(25) DEFAULT NULL,
  `quotazione` int(11) DEFAULT NULL,
  `infortunato` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idxsquadra` (`squadra`),
  CONSTRAINT `calciatore_ibfk_1` FOREIGN KEY (`squadra`) REFERENCES `squadra` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calciatore`
--

LOCK TABLES `calciatore` WRITE;
/*!40000 ALTER TABLE `calciatore` DISABLE KEYS */;
INSERT INTO `calciatore` VALUES (3,'P','RADUNOVIC','Cagliari',1,0),(4,'P','SPORTIELLO','Atalanta',1,0),(11,'D','CONTI','Milan',1,0),(15,'D','MASIELLO','Genoa',1,0),(22,'C','DE ROON','Atalanta',7,0),(27,'C','GRASSI','Cagliari',3,0),(41,'P','MIRANTE','Milan',1,0),(45,'D','FERRARI A.','Sampdoria',1,0),(50,'D','MBAYE','Bologna',1,0),(58,'C','DIAWARA','Roma',1,0),(73,'D','GAGLIOLO','Salernitana',5,0),(76,'D','ROMAGNOLI S.','Empoli',4,0),(90,'A','LASAGNA','Verona',6,0),(118,'D','RADOVANOVIC','Genoa',1,0),(133,'P','SKORUPSKI','Bologna',5,0),(140,'D','HYSAJ','Lazio',7,0),(142,'D','MARIO RUI','Napoli',11,0),(144,'D','TONELLI','Empoli',3,0),(148,'C','KRUNIC','Milan',9,0),(150,'C','SAPONARA','Fiorentina',13,0),(152,'C','ZIELINSKI','Napoli',21,0),(158,'P','LEZZERINI','Venezia',2,0),(160,'P','TATARUSANU','Milan',4,0),(170,'C','BADELJ','Genoa',5,0),(173,'C','CAPEZZI','Salernitana',3,0),(177,'A','ILICIC','Atalanta',21,0),(181,'C','VECINO','Inter',10,0),(184,'C','BERNARDESCHI','Juventus',4,0),(186,'A','REBIC','Milan',22,0),(215,'A','VERDE','Spezia',21,0),(218,'P','PERIN','Juventus',1,0),(220,'P','UJKANI','Empoli',1,0),(224,'D','DE MAIO','Udinese',1,0),(226,'D','IZZO','Torino',4,0),(236,'C','LAZOVIC','Verona',11,0),(238,'C','RINCON','Torino',3,0),(244,'D','GHIGLIONE','Genoa',5,0),(245,'A','PANDEV','Genoa',8,0),(247,'A','PAVOLETTI','Cagliari',12,0),(250,'P','HANDANOVIC','Inter',12,0),(252,'D','BIRAGHI','Fiorentina',11,0),(253,'D','D AMBROSIO','Inter',7,0),(254,'D','DIMARCO','Inter',14,0),(256,'D','JUAN JESUS','Napoli',1,0),(261,'D','RANOCCHIA','Inter',1,0),(264,'C','BESSA','Verona',8,0),(265,'C','BROZOVIC','Inter',12,0),(272,'C','MEDEL','Bologna',3,0),(286,'D','BONUCCI','Juventus',14,0),(287,'D','CACERES','Cagliari',8,0),(288,'D','CHIELLINI','Juventus',11,0),(294,'D','RUGANI','Juventus',1,0),(302,'C','PEREYRA','Udinese',18,0),(305,'C','STURARO','Genoa',2,0),(309,'A','DYBALA','Juventus',29,0),(313,'A','MORATA','Juventus',18,0),(315,'A','ZAZA','Torino',6,0),(316,'P','BERISHA','Torino',1,0),(318,'P','MARCHETTI','Genoa',1,0),(322,'D','DE VRIJ','Inter',9,0),(327,'D','PATRIC','Lazio',2,0),(329,'D','RADU','Lazio',1,0),(332,'C','CANDREVA','Sampdoria',26,0),(333,'C','CATALDI','Lazio',10,0),(335,'C','FELIPE ANDERSON','Lazio',22,0),(345,'A','KEITA B.','Cagliari',15,0),(357,'D','CALABRIA','Milan',17,0),(358,'D','DE SCIGLIO','Juventus',3,0),(367,'C','BONAVENTURA','Fiorentina',15,0),(376,'C','VERDI','Torino',10,0),(383,'A','PETAGNA','Napoli',9,0),(387,'P','REINA','Lazio',9,0),(390,'D','GHOULAM','Napoli',1,0),(392,'D','KOULIBALY','Napoli',21,0),(393,'D','LUPERTO','Empoli',2,0),(400,'C','DEZI','Venezia',1,0),(406,'C','CALLEJON','Fiorentina',6,0),(407,'A','GABBIADINI','Sampdoria',10,0),(409,'A','INSIGNE','Napoli',25,0),(410,'A','MERTENS','Napoli',17,0),(418,'D','GOLDANIGA','Sassuolo',1,0),(434,'C','JAJALO','Udinese',1,0),(440,'C','VIOLA','Bologna',3,0),(441,'A','BELOTTI','Torino',21,0),(453,'P','SZCZESNY','Juventus',12,0),(459,'D','MANOLAS','Napoli',5,0),(460,'D','ROMAGNOLI','Milan',9,0),(464,'D','FLORENZI','Milan',5,0),(470,'C','STROOTMAN','Cagliari',6,0),(472,'A','DESTRO','Genoa',27,0),(479,'A','SANABRIA','Torino',16,0),(487,'D','DE SILVESTRI','Bologna',14,0),(495,'A','CORREA','Inter',18,0),(505,'A','BONAZZOLI','Salernitana',12,0),(507,'A','MURIEL','Atalanta',28,0),(509,'P','CONSIGLI','Sassuolo',12,0),(510,'P','PEGOLO','Sassuolo',1,0),(513,'D','ACERBI','Lazio',8,0),(521,'D','PELUSO','Sassuolo',1,0),(526,'C','DUNCAN','Fiorentina',7,0),(528,'C','MAGNANELLI','Sassuolo',2,0),(530,'C','PELLEGRINI LO.','Roma',28,0),(531,'A','BERARDI','Sassuolo',34,0),(536,'A','POLITANO','Napoli',19,0),(537,'A','SANSONE','Bologna',6,0),(543,'P','PADELLI','Udinese',1,0),(550,'D','MAKSIMOVIC','Genoa',5,0),(551,'D','MOLINARO','Venezia',6,0),(554,'D','ZAPPACOSTA','Atalanta',17,0),(556,'C','BASELLI','Torino',2,0),(557,'C','BENASSI','Fiorentina',3,0),(560,'C','OBI','Salernitana',7,0),(568,'A','QUAGLIARELLA','Sampdoria',17,0),(572,'P','MERET','Napoli',10,0),(581,'D','FARAONI','Verona',20,0),(600,'C','VERRE','Sampdoria',5,0),(608,'A','ZAPATA D.','Atalanta',37,0),(630,'D','SALA','Spezia',2,0),(632,'C','ZACCAGNI','Lazio',18,0),(633,'D','FARES','Genoa',11,0),(640,'D','CHIRICHES','Sassuolo',7,0),(643,'A','DEFREL','Sassuolo',9,0),(644,'C','PULGAR','Fiorentina',5,0),(645,'C','MILINKOVIC-SAVIC','Lazio',28,0),(647,'A','DZEKO','Inter',35,0),(649,'A','MANAJ','Spezia',4,0),(652,'A','KALINIC','Verona',14,0),(660,'D','GYOMBER','Salernitana',4,0),(662,'D','ALEX SANDRO','Juventus',9,0),(695,'D','TOLOI','Atalanta',9,0),(697,'D','CUADRADO','Juventus',15,0),(704,'C','PERISIC','Inter',18,0),(706,'D','ANSALDI','Torino',15,0),(720,'P','BELEC','Salernitana',5,0),(761,'P','AUDERO','Sampdoria',6,0),(770,'D','PEZZELLA GIU.','Atalanta',4,0),(779,'C','CRISTANTE','Roma',9,0),(785,'A','IMMOBILE','Lazio',41,0),(787,'D','DJIMSITI','Atalanta',8,0),(788,'C','FREULER','Atalanta',9,0),(790,'D','SAMIR','Udinese',6,0),(791,'D','SABELLI','Genoa',4,0),(795,'A','EL SHAARAWY','Roma',12,0),(798,'D','SKRINIAR','Inter',17,0),(799,'P','BARDI','Bologna',1,0),(801,'C','GAGLIARDINI','Inter',6,0),(805,'D','FIAMOZZI','Empoli',1,0),(827,'C','LOCATELLI','Juventus',20,0),(1839,'A','EDERA','Torino',1,0),(1843,'P','RADU I.','Inter',1,0),(1847,'D','CALDARA','Venezia',3,0),(1850,'C','KESSIE ','Milan',19,0),(1852,'D','SPINAZZOLA','Roma',7,0),(1857,'A','DI FRANCESCO F.','Empoli',9,0),(1866,'D','CEPPITELLI','Cagliari',10,0),(1868,'D','MURRU','Sampdoria',2,0),(1870,'C','BARELLA','Inter',25,0),(1871,'C','DEIOLA','Cagliari',8,0),(1874,'A','JOAO PEDRO','Cagliari',31,0),(1879,'A','FARIAS','Cagliari',3,0),(1889,'P','CORDAZ','Inter',1,0),(1891,'D','CECCHERINI','Verona',4,0),(1895,'D','FERRARI G.','Sassuolo',7,0),(1917,'P','DRAGOWSKI','Fiorentina',10,0),(1930,'P','PINSOGLIO','Juventus',1,0),(1933,'C','MANDRAGORA','Torino',9,0),(1934,'P','STRAKOSHA','Lazio',1,0),(1943,'A','NESTOROVSKI','Udinese',4,0),(1946,'P','ARESTI','Cagliari',1,0),(1947,'P','FIORILLO','Salernitana',1,0),(1958,'A','CAPRARI','Verona',18,0),(1972,'C','TORREIRA','Fiorentina',9,0),(1978,'C','SENSI','Inter',4,0),(1980,'C','ARAMU','Venezia',17,0),(1995,'C','DJURICIC','Sassuolo',19,0),(1997,'A','SIMY','Salernitana',13,0),(1998,'A','PJACA','Torino',7,0),(2002,'C','CHIESA','Juventus',22,0),(2008,'C','LINETTY','Torino',5,0),(2009,'C','LUKIC','Torino',12,0),(2011,'C','MIGUEL VELOSO','Verona',7,0),(2038,'A','PINAMONTI','Empoli',15,0),(2061,'A','SIMEONE','Verona',20,0),(2064,'D','VESELI','Salernitana',1,0),(2065,'C','PRAET','Torino',10,0),(2073,'A','RAGUSA','Verona',1,0),(2076,'C','ROG','Cagliari',3,0),(2077,'C','PASALIC','Atalanta',20,0),(2083,'D','BIRASCHI','Genoa',3,0),(2085,'C','LUIS ALBERTO','Lazio',19,0),(2091,'P','PLIZZARI','Milan',1,0),(2097,'A','KEAN','Juventus',20,0),(2103,'A','PELLEGRI','Milan',3,0),(2104,'D','BERESZYNSKI','Sampdoria',7,0),(2107,'C','KIYINE','Venezia',5,0),(2115,'D','DELLI CARRI','Salernitana',1,0),(2116,'D','FARAGO ','Cagliari',1,0),(2117,'C','KASTANOS','Salernitana',7,0),(2119,'A','DEULOFEU','Udinese',16,0),(2120,'D','BASTONI','Inter',9,0),(2121,'C','MELEGONI','Genoa',2,0),(2127,'P','SATALINO','Sassuolo',1,0),(2130,'D','HATEBOER','Atalanta',7,0),(2134,'P','FALCONE','Sampdoria',1,0),(2137,'A','SCAMACCA','Sassuolo',14,0),(2141,'D','DEPAOLI','Sampdoria',2,0),(2144,'C','COULIBALY M.','Salernitana',11,0),(2154,'C','VIGNATO','Bologna',7,0),(2155,'A','CUTRONE','Empoli',10,0),(2160,'D','GOSENS','Atalanta',18,0),(2161,'C','HAAS','Empoli',8,0),(2164,'D','MILENKOVIC','Fiorentina',13,0),(2166,'C','BENTANCUR','Juventus',8,0),(2167,'C','ORSOLINI','Bologna',11,0),(2169,'D','RODRIGUEZ R.','Torino',7,0),(2170,'P','MILINKOVIC-SAVIC V.','Torino',15,0),(2172,'C','BARAK','Verona',24,0),(2174,'D','VENUTI','Fiorentina',3,0),(2178,'P','CRAGNO','Cagliari',6,0),(2179,'P','SIRIGU','Genoa',5,0),(2180,'D','KARSDORP','Roma',13,0),(2181,'D','PALOMINO','Atalanta',7,0),(2188,'D','MARUSIC','Lazio',4,0),(2192,'D','BONIFAZI','Bologna',4,0),(2194,'C','CALHANOGLU','Inter',16,0),(2195,'A','OUNAS','Napoli',4,0),(2208,'D','JAROSZYNSKI','Salernitana',3,0),(2209,'C','LUCAS LEIVA','Lazio',5,0),(2211,'P','SILVESTRI','Udinese',11,0),(2213,'C','CASSATA','Genoa',1,0),(2214,'D','KOLAROV','Inter',2,0),(2215,'C','VERETOUT','Roma',26,0),(2249,'P','SANTURRO','Udinese',1,0),(2252,'D','MARCHIZZA','Empoli',4,0),(2253,'C','BANDINELLI','Empoli',11,0),(2263,'D','LAZZARI','Lazio',10,0),(2279,'D','ROMAGNA','Sassuolo',1,0),(2280,'D','NUYTINCK','Udinese',11,0),(2284,'A','CAICEDO','Genoa',13,0),(2285,'D','BANI','Genoa',3,0),(2289,'D','DALBERT','Cagliari',4,0),(2296,'D','MANCINI','Roma',9,0),(2297,'P','ROSSI F.','Atalanta',1,0),(2302,'C','BEHRAMI','Genoa',4,0),(2304,'A','SALCEDO E.','Spezia',3,0),(2312,'D','HRISTOV','Spezia',3,0),(2315,'D','STRYGER LARSEN','Udinese',5,0),(2318,'D','ROGERIO','Sassuolo',7,0),(2328,'D','VANHEUSDEN','Genoa',3,0),(2335,'D','LUIZ FELIPE','Lazio',5,0),(2379,'C','RABIOT','Juventus',5,0),(2391,'C','EKDAL','Sampdoria',5,0),(2392,'C','WALACE','Udinese',4,0),(2409,'A','RIBERY','Salernitana',15,0),(2414,'C','VIDAL','Inter',9,0),(2453,'D','NASTASIC','Fiorentina',4,0),(2468,'P','OSPINA','Napoli',12,0),(2472,'C','RAMSEY','Juventus',4,0),(2475,'A','SANCHEZ','Inter',16,0),(2489,'A','PEDRO','Lazio',15,0),(2525,'D','DARMIAN','Inter',14,0),(2529,'C','MKHITARYAN','Roma',23,0),(2530,'A','IBRAHIMOVIC','Milan',28,0),(2544,'A','ABRAHAM','Roma',26,0),(2572,'D','GODIN','Cagliari',5,0),(2614,'D','ODRIOZOLA','Fiorentina',5,0),(2625,'C','SORIANO','Bologna',12,0),(2628,'P','ROMERO S.','Venezia',5,0),(2633,'D','KJAER','Milan',10,0),(2639,'C','BAKAYOKO','Milan',3,0),(2653,'D','LYKOGIANNIS','Cagliari',5,0),(2654,'A','CETER','Cagliari',1,0),(2692,'C','CASTILLEJO','Milan',6,0),(2703,'C','ADRIEN SILVA','Sampdoria',6,0),(2719,'A','BARROW','Bologna',23,0),(2724,'D','BUONGIORNO','Torino',4,0),(2728,'D','PELLEGRINI LU.','Juventus',2,0),(2739,'D','RECA','Spezia',1,0),(2741,'C','PESSINA','Atalanta',9,0),(2743,'A','SANTANDER','Bologna',1,0),(2744,'C','SVANBERG','Bologna',12,0),(2746,'D','DIJKS','Bologna',2,0),(2758,'D','GUNTER','Verona',5,0),(2759,'D','CRISCITO','Genoa',17,0),(2764,'A','MARTINEZ L.','Inter',35,0),(2766,'C','ZANIOLO','Roma',13,0),(2769,'D','MAGNANI','Verona',6,0),(2775,'C','RUIZ','Napoli',24,0),(2778,'C','STULAC','Empoli',12,0),(2781,'P','FUZATO','Roma',1,0),(2784,'D','COLLEY','Sampdoria',8,0),(2788,'D','BREMER','Torino',16,0),(2790,'P','ROSATI','Fiorentina',1,0),(2792,'P','MUSSO','Atalanta',12,0),(2814,'P','PROVEDEL','Spezia',3,0),(2815,'P','TERRACCIANO','Fiorentina',7,0),(2816,'D','DI LORENZO','Napoli',11,0),(2818,'C','BENNACER','Milan',14,0),(2819,'A','CAPUTO','Sampdoria',22,0),(2825,'C','BOURABIA','Spezia',7,0),(2826,'A','PUSSETTO','Udinese',12,0),(2832,'A','BOGA','Sassuolo',15,0),(2833,'C','KULUSEVSKI','Juventus',14,0),(2835,'C','KINGSLEY','Bologna',1,0),(2839,'C','SOTTIL','Fiorentina',9,0),(2841,'A','VLAHOVIC','Fiorentina',34,0),(2848,'C','FRATTESI','Sassuolo',12,0),(2855,'C','VIEIRA','Sampdoria',1,0),(2857,'C','TRAORE  HJ.','Sassuolo',16,0),(2860,'D','MALCUIT','Napoli',1,0),(2861,'P','SEMPER','Genoa',1,0),(2865,'D','AINA','Torino',5,0),(2869,'D','DJIDJI','Torino',3,0),(4179,'A','GONZALEZ N.','Fiorentina',18,0),(4184,'A','BREKALO','Torino',14,0),(4200,'A','GIROUD','Milan',24,0),(4220,'C','ZAMBO ANGUISSA','Napoli',12,0),(4237,'D','DANILO','Juventus',9,0),(4245,'D','SMALLING','Roma',6,0),(4268,'A','ARNAUTOVIC','Bologna',24,0),(4270,'P','RUI PATRICIO','Roma',14,0),(4285,'C','ARTHUR','Juventus',3,0),(4287,'C','LOBOTKA','Napoli',3,0),(4292,'D','HERNANDEZ T.','Milan',21,0),(4312,'P','MAIGNAN','Milan',16,0),(4323,'D','ZEEGELAAR','Udinese',3,0),(4327,'C','OLIVA','Cagliari',1,0),(4329,'D','NIKOLAOU','Spezia',3,0),(4331,'D','IBANEZ','Roma',12,0),(4332,'D','DEMIRAL','Atalanta',4,0),(4359,'A','PICCOLI','Atalanta',11,0),(4370,'C','PORTANOVA','Genoa',2,0),(4371,'A','RASPADORI','Sassuolo',16,0),(4374,'D','WALUKIEWICZ','Cagliari',4,0),(4375,'D','TERZIC','Fiorentina',2,0),(4376,'C','ZURKOWSKI','Empoli',4,0),(4377,'C','CASTROVILLI','Fiorentina',9,0),(4378,'D','RANIERI L.','Salernitana',5,0),(4389,'C','ANDERSON A.','Lazio',1,0),(4393,'C','SCHOUTEN','Bologna',4,0),(4397,'D','VAVRO','Lazio',1,0),(4401,'D','GABBIA','Milan',2,0),(4403,'D','CHABOT','Sampdoria',2,0),(4404,'C','THORSBY','Sampdoria',9,0),(4407,'D','IGOR','Fiorentina',3,0),(4409,'D','RRAHMANI','Napoli',15,0),(4412,'D','RODRIGO BECAO','Udinese',7,0),(4415,'C','SKOV OLSEN','Bologna',8,0),(4421,'D','AUGELLO','Sampdoria',11,0),(4423,'C','HERNANI','Genoa',3,0),(4426,'D','TOLJAN','Sassuolo',7,0),(4427,'C','MALINOVSKYI','Atalanta',21,0),(4428,'D','DE LIGT','Juventus',15,0),(4433,'D','ZORTEA','Salernitana',3,0),(4435,'A','COLLEY E.','Spezia',3,0),(4441,'P','ANDRENACCI','Genoa',1,0),(4449,'C','TONALI','Milan',14,0),(4453,'A','TORREGROSSA','Sampdoria',3,0),(4459,'C','ROVELLA','Genoa',14,0),(4461,'D','ZAPPA','Cagliari',5,0),(4477,'A','LA MANTIA','Empoli',3,0),(4479,'C','ELMAS','Napoli',12,0),(4483,'A','CANGIANO','Bologna',1,0),(4491,'P','BERARDI A.','Verona',1,0),(4493,'D','DAWIDOWICZ','Verona',5,0),(4495,'D','KUMBULLA','Roma',2,0),(4498,'C','HENDERSON L.','Empoli',8,0),(4501,'C','OBIANG','Sassuolo',1,0),(4510,'A','RAFAEL LEAO','Milan',23,0),(4514,'C','NANDEZ','Cagliari',10,0),(4515,'C','AGUDELO','Spezia',3,0),(4517,'A','LOZANO','Napoli',23,0),(4519,'D','CETIN','Verona',2,0),(4521,'D','MULDUR','Sassuolo',4,0),(4522,'C','AMRABAT','Fiorentina',4,0),(4525,'P','GEMELLO','Torino',1,0),(4530,'D','KYRIAKOPOULOS','Sassuolo',3,0),(4661,'A','OSIMHEN','Napoli',34,0),(4681,'C','LOPEZ M.','Sassuolo',11,0),(4719,'D','AMPADU','Venezia',5,0),(4725,'C','DEMME','Napoli',5,0),(4751,'D','TOMORI','Milan',13,0),(4825,'C','DIAZ B.','Milan',18,0),(4869,'C','DOMINGUEZ','Bologna',8,0),(4884,'A','CARLES PEREZ','Roma',8,0),(4885,'C','VILLAR','Roma',1,0),(4886,'C','PEREIRO','Cagliari',5,0),(4887,'D','BELLANOVA','Cagliari',2,0),(4888,'D','SUTALO','Verona',2,0),(4890,'C','TAMEZE','Verona',7,0),(4891,'D','SOUMAORO','Bologna',3,0),(4892,'C','SAELEMAEKERS','Milan',13,0),(4895,'D','YOSHIDA','Sampdoria',13,0),(4896,'C','MALDINI','Milan',5,0),(4899,'D','SINGO','Torino',14,0),(4921,'C','ASKILDSEN','Sampdoria',3,0),(4925,'D','CARBONI','Cagliari',4,0),(4934,'D','LOVATO','Atalanta',3,0),(4935,'C','LADINETTI','Cagliari',1,0),(4938,'A','MORO','Lazio',4,0),(4945,'D','CALAFIORI','Roma',3,0),(4946,'D','FRABOTTA','Verona',1,0),(4953,'C','PALUMBO','Juventus',1,0),(4957,'P','MONTIPO ','Verona',7,0),(4964,'P','VICARIO','Empoli',8,0),(4965,'C','MARIN','Cagliari',12,0),(4970,'C','MESSIAS','Milan',7,0),(4973,'C','MCKENNIE','Juventus',10,0),(4975,'C','ESCALANTE','Lazio',1,0),(4976,'D','KALULU','Milan',6,0),(4977,'P','RAVAGLIA','Sampdoria',1,0),(4978,'C','DAMSGAARD','Sampdoria',9,0),(4979,'D','AYHAN','Sassuolo',4,0),(4982,'D','ERLIC','Spezia',4,0),(4983,'D','FERRER','Spezia',4,0),(4988,'C','MAGGIORE','Spezia',15,0),(4992,'A','GYASI','Spezia',12,0),(4994,'D','VOJVODA','Torino',4,0),(4996,'P','PANDUR','Verona',1,0),(4997,'D','RUEGG','Verona',1,0),(4998,'D','MOLINA N.','Udinese',13,0),(5001,'C','MIRANCHUK','Atalanta',9,0),(5004,'A','FORESTIERI','Udinese',4,0),(5005,'P','ZOET','Spezia',3,0),(5007,'C','ILIC','Verona',15,0),(5010,'D','ISMAJLI','Empoli',3,0),(5012,'A','MURIQI','Lazio',3,0),(5017,'D','BALLO-TOURE ','Milan',2,0),(5119,'C','SAMARDZIC','Udinese',6,0),(5233,'A','MAYORAL','Roma',13,0),(5286,'C','AKPA AKPRO','Lazio',2,0),(5287,'C','ARSLAN','Udinese',5,0),(5298,'C','POBEGA','Torino',14,0),(5300,'D','HICKEY','Bologna',10,0),(5304,'P','BOER','Roma',1,0),(5311,'A','SHOMURODOV','Roma',12,0),(5312,'C','LEO  SENA','Spezia',2,0),(5323,'D','MARTINEZ QUARTA','Fiorentina',7,0),(5329,'C','MAKENGO','Udinese',7,0),(5332,'D','BASTONI S.','Spezia',13,0),(5336,'A','NZOLA','Spezia',12,0),(5354,'D','RUGGERI','Salernitana',2,0),(5355,'D','UDOGIE','Udinese',6,0),(5360,'A','VERGANI','Salernitana',1,0),(5365,'D','DRAGUSIN','Sampdoria',2,0),(5375,'D','MAEHLE','Atalanta',6,0),(5391,'A','KOKORIN','Fiorentina',3,0),(5397,'C','KOVALENKO','Spezia',8,0),(5398,'D','REYNOLDS','Roma',1,0),(5420,'C','DARBOE','Roma',2,0),(5422,'C','ZALEWSKI','Roma',1,0),(5423,'C','BOVE','Roma',1,0),(5439,'A','KALLON','Genoa',6,0),(5445,'D','BINKS','Bologna',4,0),(5446,'A','VAN HOOIJDONK','Bologna',1,0),(5447,'D','ALTARE','Cagliari',2,0),(5448,'P','FURLAN','Empoli',1,0),(5449,'D','PARISI','Empoli',1,0),(5450,'D','STOJANOVIC','Empoli',5,0),(5451,'C','BAJRAMI','Empoli',16,0),(5452,'C','DAMIANI','Empoli',1,0),(5453,'C','RICCI S.','Empoli',9,0),(5454,'A','MANCUSO','Empoli',12,0),(5457,'C','MALEH','Fiorentina',5,0),(5458,'A','MUNTEANU','Fiorentina',1,0),(5459,'A','BUKSA','Genoa',1,0),(5460,'A','SATRIANO','Inter',3,0),(5462,'C','CIERVO','Sampdoria',2,0),(5463,'D','AYA','Salernitana',2,0),(5464,'D','BOGDAN','Salernitana',2,0),(5466,'D','STRANDBERG','Salernitana',4,0),(5469,'C','DI TACCHIO','Salernitana',4,0),(5470,'C','SCHIAVONE','Salernitana',5,0),(5471,'A','DJURIC','Salernitana',10,0),(5475,'D','AMIAN','Spezia',4,0),(5477,'A','WARMING','Torino',1,0),(5478,'P','MAENPAA','Venezia',5,0),(5479,'D','CECCARONI','Venezia',9,0),(5480,'D','EBUEHI','Venezia',4,0),(5481,'D','MAZZOCCHI','Venezia',5,0),(5482,'D','MODOLO','Venezia',1,0),(5483,'D','SCHNEGG','Venezia',2,0),(5484,'D','SVOBODA','Venezia',4,0),(5485,'C','BJARKASON','Venezia',1,0),(5486,'C','CRNIGOJ','Venezia',7,0),(5487,'C','HEYMANS','Venezia',4,0),(5488,'C','FIORDILINO','Venezia',3,0),(5489,'C','PECILE','Venezia',1,0),(5490,'C','PERETZ','Venezia',4,0),(5492,'C','TESSMANN','Venezia',2,0),(5493,'A','BOCALON','Venezia',1,0),(5495,'A','FORTE','Venezia',5,0),(5496,'A','JOHNSEN','Venezia',6,0),(5498,'D','CASALE','Verona',9,0),(5499,'C','HONGLA','Verona',3,0),(5500,'A','CANCELLIERI','Verona',1,0),(5501,'C','SIGURDSSON A.','Venezia',5,0),(5502,'P','ADAMONIS','Lazio',1,0),(5503,'D','KECHRIDA','Salernitana',5,0),(5504,'C','COULIBALY L.','Salernitana',5,0),(5505,'A','KAIO JORGE','Juventus',2,0),(5506,'A','EKUBAN','Genoa',5,0),(5507,'C','BUSIO','Venezia',12,0),(5508,'C','VACCA','Venezia',4,0),(5509,'D','VINA','Roma',6,0),(5510,'C','ROMERO L.','Lazio',1,0),(5511,'C','MATHEUS HENRIQUE','Sassuolo',4,0),(5513,'D','DUMFRIES','Inter',10,0),(5514,'D','VASQUEZ','Genoa',8,0),(5515,'A','OKEREKE','Venezia',14,0),(5516,'C','BIANCO','Fiorentina',1,0),(5517,'C','YEPES','Sampdoria',1,0),(5518,'P','MARFELLA','Napoli',1,0),(5519,'C','SHER','Spezia',1,0),(5520,'D','CAMBIASO','Genoa',11,0),(5521,'P','BERTINATO','Venezia',1,0),(5523,'A','BIANCHI F.','Genoa',2,0),(5524,'D','SERPE','Genoa',2,0),(5526,'D','SCALVINI','Atalanta',2,0),(5527,'D','ZANOLI','Napoli',1,0),(5528,'P','ZOVKO','Spezia',1,0),(5529,'A','HENRY','Venezia',11,0),(5673,'A','ANTISTE','Spezia',9,0),(5674,'C','BASIC','Lazio',5,0),(5675,'D','THEATE','Bologna',12,0),(5676,'A','SUCCESS','Udinese',8,0),(5677,'D','PEREZ N.','Udinese',4,0),(5682,'P','MOLLA','Bologna',1,0),(5684,'C','TOURE  A.','Genoa',3,0),(5685,'C','KOOPMEINERS','Atalanta',11,0),(5686,'D','SOPPY','Udinese',4,0),(5688,'C','HARROUI','Sassuolo',2,0),(5689,'C','IHATTAREN','Sampdoria',2,0),(5690,'A','STRELEC','Spezia',7,0),(5691,'D','ZIMA','Torino',3,0),(5693,'D','KIWIOR','Spezia',1,0),(5694,'A','BETO','Udinese',15,0),(5695,'D','HAPS','Venezia',3,0),(5701,'D','OBERT','Cagliari',2,0),(5704,'P','RUSSO','Salernitana',1,0),(5705,'C','GALDAMES','Genoa',4,0),(5707,'P','PIANA','Udinese',1,0),(5713,'P','NERI','Venezia',1,0),(5714,'A','GONDO','Salernitana',6,0),(5716,'A','PODGOREANU','Spezia',2,0),(5718,'D','VITI','Empoli',2,0),(5719,'C','ASLLANI','Empoli',2,0),(5722,'C','NGUIAMBA','Spezia',1,0),(5725,'C','KONE B.','Torino',1,0),(5728,'A','AFENA-GYAN','Roma',1,0);
/*!40000 ALTER TABLE `calciatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fantaallenatore`
--

DROP TABLE IF EXISTS `fantaallenatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fantaallenatore` (
  `id` int(11) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `nickname` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idFantasquadra` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idxfantasquadra` (`idFantasquadra`),
  CONSTRAINT `fantaallenatore_ibfk_1` FOREIGN KEY (`idFantasquadra`) REFERENCES `fantasquadra` (`idFantasquadra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fantaallenatore`
--

LOCK TABLES `fantaallenatore` WRITE;
/*!40000 ALTER TABLE `fantaallenatore` DISABLE KEYS */;
INSERT INTO `fantaallenatore` VALUES (1,'Utente1','usr1','$2y$10$yhA8qq2v6Afbm9uPh3OSWeo6DBZMSmekfvDHJ3iO7WEWPtLvonbLS',1),(2,'utente2','usr2','$2y$10$B9iNnUqN5nwcO56IDMF9ve1MZGhqfoKVo6AG.wuV6oNc9cZuQ0lZe',2),(3,'aa','aa','$2y$10$iDRvNwkZ6ja9..NApu',3),(5,'root','root','$2y$10$PyxAOzgA41jp7YV8b3E4Qu.GRHWIGffebL.V4gY9eiUBRgSPv4k7O',NULL),(6,'federico','FEDERICO','$2y$10$ke2vBbbYJeJV8yJcgr',5),(7,'porr','porrr','$2y$10$XapNM0RC3O4Vf85aMc',6),(9,'hjkh','gtr','$2y$10$Q56aC7ztKjgVwDBW9StDnuaA9HeYDxi8hDtx3s8bzjnESEOLhTI82',NULL);
/*!40000 ALTER TABLE `fantaallenatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fantasquadra`
--

DROP TABLE IF EXISTS `fantasquadra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fantasquadra` (
  `idFantasquadra` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(25) DEFAULT NULL,
  `crediti` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFantasquadra`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fantasquadra`
--

LOCK TABLES `fantasquadra` WRITE;
/*!40000 ALTER TABLE `fantasquadra` DISABLE KEYS */;
INSERT INTO `fantasquadra` VALUES (1,'Squadra1',7),(2,'juventus',463),(3,'aaa',500),(5,'PESSI FC',500),(6,'prova',500),(7,'po',500),(8,'okfe',500),(9,'lpokop',378);
/*!40000 ALTER TABLE `fantasquadra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fs_calciatore`
--

DROP TABLE IF EXISTS `fs_calciatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fs_calciatore` (
  `idCalciatore` int(11) NOT NULL,
  `idFantaSquadra` int(11) NOT NULL,
  PRIMARY KEY (`idCalciatore`,`idFantaSquadra`),
  KEY `idxCalciatore` (`idCalciatore`),
  KEY `idxFantaSquadra` (`idFantaSquadra`),
  CONSTRAINT `fs_calciatore_ibfk_1` FOREIGN KEY (`idCalciatore`) REFERENCES `calciatore` (`id`),
  CONSTRAINT `fs_calciatore_ibfk_2` FOREIGN KEY (`idFantaSquadra`) REFERENCES `fantasquadra` (`idFantasquadra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fs_calciatore`
--

LOCK TABLES `fs_calciatore` WRITE;
/*!40000 ALTER TABLE `fs_calciatore` DISABLE KEYS */;
INSERT INTO `fs_calciatore` VALUES (22,9),(177,9),(554,9),(788,1),(1871,2),(2077,9),(2719,9),(2835,2),(4332,1),(4428,1),(4934,1),(5010,2),(5526,1),(5526,9);
/*!40000 ALTER TABLE `fs_calciatore` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `fantaCrediti` AFTER INSERT ON `fs_calciatore` FOR EACH ROW UPDATE fantasquadra SET crediti = crediti - (	SELECT quotazione

													from calciatore

													where calciatore.id = new.idCalciatore)

                                                    WHERE fantasquadra.idFantasquadra = new.idFantaSquadra */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `iscrizionelega`
--

DROP TABLE IF EXISTS `iscrizionelega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iscrizionelega` (
  `idFantasquadra` int(11) NOT NULL,
  `idLega` int(11) NOT NULL,
  PRIMARY KEY (`idFantasquadra`,`idLega`),
  KEY `idxSquadra` (`idFantasquadra`),
  KEY `idxLega` (`idLega`),
  CONSTRAINT `iscrizionelega_ibfk_1` FOREIGN KEY (`idFantasquadra`) REFERENCES `fantasquadra` (`idFantasquadra`),
  CONSTRAINT `iscrizionelega_ibfk_2` FOREIGN KEY (`idLega`) REFERENCES `leghe` (`idLega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iscrizionelega`
--

LOCK TABLES `iscrizionelega` WRITE;
/*!40000 ALTER TABLE `iscrizionelega` DISABLE KEYS */;
INSERT INTO `iscrizionelega` VALUES (1,1),(1,4),(8,1),(9,5);
/*!40000 ALTER TABLE `iscrizionelega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leghe`
--

DROP TABLE IF EXISTS `leghe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leghe` (
  `idLega` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idLega`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leghe`
--

LOCK TABLES `leghe` WRITE;
/*!40000 ALTER TABLE `leghe` DISABLE KEYS */;
INSERT INTO `leghe` VALUES (1,'Lega Principale'),(2,'aa'),(3,'prova'),(4,'Serie A'),(5,'poooooo');
/*!40000 ALTER TABLE `leghe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likefantasquadra`
--

DROP TABLE IF EXISTS `likefantasquadra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likefantasquadra` (
  `idFantaAllenatore` int(11) NOT NULL,
  `idFantaSquadra` int(11) NOT NULL,
  PRIMARY KEY (`idFantaAllenatore`,`idFantaSquadra`),
  KEY `idxallenatore` (`idFantaAllenatore`),
  KEY `idxSquadra` (`idFantaSquadra`),
  CONSTRAINT `likefantasquadra_ibfk_1` FOREIGN KEY (`idFantaAllenatore`) REFERENCES `fantaallenatore` (`id`),
  CONSTRAINT `likefantasquadra_ibfk_2` FOREIGN KEY (`idFantaSquadra`) REFERENCES `fantasquadra` (`idFantasquadra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likefantasquadra`
--

LOCK TABLES `likefantasquadra` WRITE;
/*!40000 ALTER TABLE `likefantasquadra` DISABLE KEYS */;
INSERT INTO `likefantasquadra` VALUES (5,1),(9,1);
/*!40000 ALTER TABLE `likefantasquadra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `squadra`
--

DROP TABLE IF EXISTS `squadra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `squadra` (
  `id` int(11) NOT NULL,
  `nome` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `squadra`
--

LOCK TABLES `squadra` WRITE;
/*!40000 ALTER TABLE `squadra` DISABLE KEYS */;
INSERT INTO `squadra` VALUES (1,'Atalanta'),(2,'Bologna'),(3,'Cagliari'),(4,'Empoli'),(5,'Fiorentina'),(6,'Genoa'),(7,'Inter'),(8,'Juventus'),(9,'Lazio'),(10,'Milan'),(11,'Napoli'),(12,'Roma'),(13,'Salernitana'),(14,'Sampdoria'),(15,'Sassuolo'),(16,'Spezia'),(17,'Torino'),(18,'Udinese'),(19,'Venezia'),(20,'Verona');
/*!40000 ALTER TABLE `squadra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-27  0:44:35

delimiter //
    CREATE PROCEDURE eliminaTeam(IN nick varchar(255))
    BEGIN
        SET @idSquadra = (SELECT fantaallenatore.idFantasquadra FROM fantaallenatore WHERE fantaallenatore.nickname=nick);
        UPDATE fantaallenatore SET fantaallenatore.idFantasquadra = NULL WHERE fantaallenatore.nickname=nick;
        DELETE FROM fantasquadra WHERE fantasquadra.idFantasquadra=@idSquadra;
        DELETE FROM likefantasquadra WHERE likefantasquadra.idFantaSquadra=@idSquadra;
        DELETE FROM fs_calciatore WHERE fs_calciatore.idFantaSquadra=@idSquadra;
        DELETE FROM iscrizionelega where iscrizionelega.idFantasquadra=@idSquadra;
    END//
    DELIMITER ;

delimiter //
    create procedure likeFS (IN nickname varchar(25),IN fantaS varchar(25))
    BEGIN
    SET @idAllenatore = (SELECT fantaallenatore.id from fantaallenatore where fantaallenatore.nickname=nickname);
    SET @idSquadra = (SELECT fantasquadra.idFantasquadra from fantasquadra where fantasquadra.nome = fantaS);
    SET @isLiked = ( 
	SELECT count(*) 
    FROM likefantasquadra
    WHERE likefantasquadra.idFantaSquadra = @idSquadra and likefantasquadra.idFantaAllenatore = @idAllenatore);
    IF	@isLiked = 0	 THEN INSERT INTO likefantasquadra values (@idAllenatore,@idSquadra);
    ELSE 				 DELETE FROM likefantasquadra WHERE likefantasquadra.idFantaAllenatore=@idAllenatore and likefantasquadra.idFantaSquadra=@idSquadra;
    END IF;
    END//
    delimiter ;

delimiter //
        CREATE PROCEDURE nuovoTeam (IN nickname varchar(25), IN nomeSquadra varchar(25))
        BEGIN
	        DECLARE num int DEFAULT 0;
            SET num = 1 + (SELECT fantasquadra.idFantasquadra from fantasquadra GROUP by fantasquadra.idFantasquadra desc limit 1);
	        INSERT INTO fantasquadra
    	        VALUES (num,nomeSquadra,500);
	        UPDATE fantaallenatore
    	        SET fantaallenatore.idFantasquadra = num
                WHERE fantaallenatore.nickname = nickname;
        END//
        delimiter ; 