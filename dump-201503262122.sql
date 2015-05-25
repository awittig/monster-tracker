-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: monster_tracker
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `encounter`
--

DROP TABLE IF EXISTS `encounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter`
--

LOCK TABLES `encounter` WRITE;
/*!40000 ALTER TABLE `encounter` DISABLE KEYS */;
INSERT INTO `encounter` VALUES (24,'RE: Highport to Stonehiem: Day 2, noon'),(26,'RE: Highport to Elredd: Day5 morning'),(27,'RE: Highport to Elredd: Day6 morning'),(28,'RE: Hightport-Elredd: Day 6 noon'),(30,'RE: Hightport-Elredd: Day7 night'),(31,'RE: Elredd-Badwall: Day 3 morning'),(32,'RE: Elredd-Fax: Day 2 morning'),(33,'A2: 1b'),(34,'A2: 1d'),(35,'A2: 1d'),(36,'A2: 2f'),(37,'A2: 5'),(38,'A2: 7a'),(39,'A2: 8a'),(40,'A2: 8b'),(41,'A2: 9a'),(42,'A2: 9b'),(43,'A2: 9c'),(44,'A2: 10a'),(45,'A2: 10b'),(46,'A2: 12'),(47,'A2: 13'),(48,'A2: 18c'),(49,'A2: 18f'),(50,'A2: 18c'),(52,'A2: 19'),(53,'A2: 25'),(54,'A2: 26 apprentices'),(56,'A2: 29'),(57,'A2: 33'),(58,'A2: 35'),(59,'A2: 36'),(60,'A2: 37'),(61,'A2: 39'),(62,'A2: 1a'),(63,'The boys'),(64,'A2: 34'),(65,'A2: Lower 1'),(66,'A2: Lower 4'),(67,'A2: Lower 8'),(68,'A2: Lower 12'),(69,'A2: Lower 12 b'),(70,'A2: Lower 18'),(71,'A2: Lower 19'),(72,'A2: Lower 21'),(73,'A2: Lower 22'),(74,'A2: Lower 24'),(75,'A2: Lower 25e');
/*!40000 ALTER TABLE `encounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_monster`
--

DROP TABLE IF EXISTS `encounter_monster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_monster` (
  `encounter_id` int(11) NOT NULL,
  `monster_type_id` int(11) NOT NULL,
  `hit_points` int(11) DEFAULT NULL,
  `dead_flag` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_monster`
--

LOCK TABLES `encounter_monster` WRITE;
/*!40000 ALTER TABLE `encounter_monster` DISABLE KEYS */;
INSERT INTO `encounter_monster` VALUES (26,14,9,0),(26,14,9,0),(26,14,9,0),(26,14,19,0),(26,14,19,0),(26,14,19,0),(26,14,9,0),(27,17,9,0),(27,17,9,0),(27,17,9,0),(27,17,15,0),(27,17,15,0),(27,17,15,0),(27,17,10,0),(27,17,10,0),(27,17,10,0),(28,15,15,0),(28,15,15,0),(28,15,10,0),(28,15,10,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,7,0),(30,16,2,0),(30,16,2,0),(30,16,2,0),(30,16,2,0),(30,16,2,0),(31,30,25,0),(31,30,22,0),(31,30,10,0),(32,15,11,0),(32,15,11,0),(32,15,11,0),(32,15,12,0),(32,15,12,0),(32,15,12,0),(32,15,10,0),(32,15,10,0),(33,21,9,0),(33,21,7,0),(34,23,9,0),(36,18,23,0),(38,21,4,0),(38,21,4,0),(39,21,6,0),(39,21,6,0),(40,21,6,0),(40,23,13,0),(40,21,6,0),(40,23,13,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(40,21,6,0),(41,21,6,0),(41,19,21,0),(41,21,6,0),(41,19,21,0),(41,21,6,0),(41,19,21,0),(41,21,6,0),(41,21,6,0),(41,21,6,0),(42,21,6,0),(42,23,9,0),(42,21,6,0),(42,21,6,0),(42,21,6,0),(42,21,6,0),(42,21,6,0),(44,21,6,0),(44,21,6,0),(44,21,6,0),(44,21,6,0),(45,21,6,0),(45,21,6,0),(45,21,6,0),(45,21,6,0),(46,19,20,0),(46,23,9,0),(47,21,6,0),(47,24,27,0),(47,21,6,0),(47,24,26,0),(47,21,6,0),(47,24,23,0),(47,21,6,0),(47,24,19,0),(47,21,6,0),(47,21,6,0),(47,21,6,0),(47,21,6,0),(47,21,6,0),(47,21,6,1),(47,21,6,0),(47,21,6,0),(48,23,13,0),(49,21,6,0),(49,21,6,0),(49,21,6,0),(49,21,6,0),(49,21,6,0),(49,21,6,0),(50,23,13,0),(54,10,5,0),(54,10,5,0),(59,7,5,0),(60,30,22,0),(61,29,27,0),(35,21,6,0),(35,23,9,0),(35,21,6,0),(34,21,6,0),(34,21,6,1),(43,21,6,0),(43,23,9,0),(43,36,5,0),(43,21,6,0),(43,21,6,0),(43,21,6,0),(43,21,6,0),(43,21,6,0),(43,21,6,0),(43,21,6,0),(43,21,6,0),(43,21,6,0),(43,21,6,0),(62,21,6,0),(62,21,6,0),(62,21,6,0),(62,21,6,0),(63,2,8,0),(63,1,6,0),(24,15,10,1),(24,15,10,1),(24,15,10,1),(24,15,15,1),(24,15,15,1),(24,15,15,1),(24,15,9,1),(53,20,33,1),(52,23,16,0),(52,21,9,1),(52,21,9,1),(52,21,9,1),(52,21,8,0),(52,21,8,1),(52,21,8,1),(52,21,8,1),(52,21,8,1),(52,21,8,0),(37,22,28,1),(64,23,9,0),(64,23,9,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(64,21,6,0),(65,21,4,0),(65,23,6,0),(65,21,4,0),(65,21,4,0),(65,21,4,0),(65,21,4,0),(65,21,4,0),(65,21,4,0),(65,21,4,0),(65,21,4,0),(65,21,4,0),(65,21,4,0),(65,21,4,0),(66,31,26,0),(66,31,20,0),(67,19,21,0),(67,19,24,0),(68,16,6,0),(68,32,23,0),(68,16,6,0),(68,32,22,0),(68,14,15,0),(68,16,6,0),(68,32,19,0),(68,14,17,0),(68,16,6,0),(68,16,6,0),(68,16,6,0),(68,16,6,0),(68,16,6,0),(68,16,6,0),(68,16,6,0),(68,16,6,0),(68,16,6,0),(68,16,6,0),(68,16,6,0),(68,16,6,0),(68,16,6,0),(69,32,15,0),(70,16,5,0),(70,32,27,0),(70,37,12,0),(70,32,25,0),(70,37,12,0),(70,32,22,0),(70,37,13,0),(70,32,20,0),(70,37,13,0),(70,32,19,0),(70,37,11,0),(70,32,19,0),(70,37,11,0),(70,32,19,0),(70,37,10,0),(70,32,16,0),(70,37,9,0),(70,32,20,0),(70,37,9,0),(70,37,14,0),(71,33,14,0),(71,33,10,0),(71,33,10,0),(71,33,9,0),(72,32,27,0),(72,32,20,0),(74,16,4,0),(74,16,4,0),(75,35,21,0),(75,35,21,0),(73,34,27,0),(73,37,8,0),(73,34,25,0),(73,37,8,0),(73,37,8,0),(73,37,8,0),(73,37,8,0),(73,37,8,0),(73,37,8,0),(73,37,8,0),(73,37,8,0),(73,37,8,0),(73,37,8,0),(73,37,8,0),(73,37,8,0),(56,10,5,1),(56,10,5,1),(56,10,5,1),(56,10,5,1),(56,10,5,1),(56,10,5,1),(56,10,5,1),(56,10,5,1),(57,16,4,1),(57,16,4,1),(57,16,4,1),(57,16,4,1),(57,16,4,1),(57,26,6,0),(57,16,4,1),(57,27,2,1),(57,27,2,1),(57,16,4,1),(57,27,2,1),(57,16,4,1),(57,27,2,1),(57,27,2,1),(57,27,2,1),(57,27,2,1),(57,27,2,1),(57,27,2,1),(57,27,2,1),(58,21,7,1),(58,28,27,1),(58,21,7,1),(58,28,23,1),(58,21,7,1),(58,28,21,1),(58,21,7,1),(58,21,7,1),(58,21,7,1),(58,21,7,1),(58,21,7,1);
/*!40000 ALTER TABLE `encounter_monster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_monster_type`
--

DROP TABLE IF EXISTS `encounter_monster_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_monster_type` (
  `encounter_id` int(11) NOT NULL,
  `monster_type_id` int(11) NOT NULL,
  `strategy` text,
  `notes` text,
  `treasure` mediumtext,
  PRIMARY KEY (`encounter_id`,`monster_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_monster_type`
--

LOCK TABLES `encounter_monster_type` WRITE;
/*!40000 ALTER TABLE `encounter_monster_type` DISABLE KEYS */;
INSERT INTO `encounter_monster_type` VALUES (24,15,'',NULL,'12 gp each '),(26,14,'',NULL,'7cp, 8sp, 14gp each'),(27,17,'',NULL,''),(28,15,'',NULL,'16 gp each '),(30,16,'swarm',NULL,'4sp each'),(31,30,'1 boar, 2 sow, 4 young. \r\nboar attacks, sow protect young',NULL,''),(32,15,'',NULL,'14gp each'),(33,21,'call to surrender and call for help. Defend until help arrives',NULL,''),(34,21,'',NULL,'7sp each, carved mahogany hawk under knife-throwers bunk (25sp)'),(35,21,'',NULL,'7sp each, carved mahogany hawk under knife-throwers bunk (25sp)'),(35,23,'call for help and defend, hold party in room until help arrives',NULL,'2gp, 7sp'),(36,18,'possesses then must defend/drive off intruders in the inner walkway',NULL,'iron box under floor stone: 37gp, 81sp, 317cp, ruby ring(200gp)- must survive possession to discover'),(37,22,'wait until characters near front gate/center.\r\nAttack at random- throwing victims into mud (no extra damage from juices, but takes 1 round to fight again)\r\nUpon death: high pitched keening-alarm',NULL,''),(38,21,'defend w/ pitchfork(1d6) and shovel(1d4). \r\nWill sound alarm, by door. 6-30 hobgobs from room 8s',NULL,'nil'),(39,21,'Watch door more than stairs',NULL,'2gp, 15sp, 39cp on floor next to them'),(40,21,'Only 8 wearing armor (14 AC 10).\r\nOne says in Hobgob \'you mercenaries are not allowed here\'. \r\nIf attacked will grab weapons and yell \'intruders\'\r\n-10 in eastern tower, 4 in middle, 8 in western tower',NULL,'E:3gp, 85sp, 30cp\r\nM: 7sp each\r\nW: 7 sp each'),(40,23,'-approach and ask what party\'s business is after 1 round\r\n-1 in Eastern tower, 1 in western towr',NULL,'Sergeant in West has ring of keys to unlock winches in room 4'),(41,19,'-will wail (alarm) is sense invisible intruder or guards fail\r\n-one in each section',NULL,'nil'),(41,21,'-two in each section of 9, attack intruders below w/ composite bows. \r\n-if sound alarm guards from 8 will arrive in two rounds',NULL,'7sp each'),(42,21,'-one sleeping against wall: stunned for two rounds if awaken suddenly\r\n-one chewing bark: spit in attacker\'s eyes- save vs. Breath or blinded for two rounds ',NULL,'6sp each'),(42,23,'',NULL,'-silver horn-shaped amulet (20gp)'),(43,21,'',NULL,'6sp each'),(43,23,'-footman\'s mace',NULL,'8gp, silver handkerchief(5gp)'),(43,36,'weaving and nipping at legs',NULL,''),(44,21,'-2 wield ballista: 20 bolts for 2-12 damage,every other round\r\n-2 hide behind rocks (AC2) and shoot (1d6)',NULL,'18gp, 4sp'),(45,21,'-tin cans tied to rooftop alert of intruders\r\n-topple boxes on trapdoor: first person stunned for 1 round\r\n-rush forward',NULL,'50sp'),(46,19,'',NULL,''),(46,23,'',NULL,'nil'),(47,21,'-if party stays for more than two rounds, drop down and position 4 to a side: 50% cover, surprise  1-4\r\n- throw down net: save vs. paralyzation or entangled\r\n-hit AC9 four times to cut free:dagger 2/round\r\n-bows 1D6 2*/round\r\n-do not follow out of room',NULL,''),(47,24,'-2 swing down to attack when door is approached\r\n-2 swing down when help comes\r\n-fight to death and will pursue',NULL,'nil'),(48,23,'-pull cord to sound alarm, will hesitate if threatened\r\n-sword on foot of bed',NULL,'-set of keys for room 18a and chest\r\n- cloak has flees: itching for 2 rounds'),(49,21,'-asleep w/ weapons in hand: faking if party is noisy\r\n- protect 18c',NULL,'-bag of 20 colored glass marbles\r\n-silvered hand mirror under blankets(3gp)'),(50,23,'-pull cord to sound alarm, will hesitate if threatened\r\n-sword on foot of bed\r\n-help from 18f in 2 rounds',NULL,'-set of keys for room 18a and chest\r\n- cloak has flees: itching for 2 rounds'),(52,21,'- 3@9 disguised as mummies\r\n-morningstars\r\n-charge after party advnaces\r\n-6@8\r\n-wait til party advances then attack\r\n-if discovered retreat to room 20: throw grease in corridor: roll Dex-mvmt speed or less on D20 to avoid falling: if fall stunned for 1 round',NULL,'6sp each'),(52,23,'2-5 w/ sling of seeking +2 (20 bullets)\r\n+2 w/ sword, 2-8 w/ sword\r\n',NULL,'6sp'),(53,20,'-wait til party is w/in 30\' then change to induce fear moan\r\n-cause weakness and attack\r\n-throw shadows at attackers\r\n-if down to 11hp create doubles and flit around ',NULL,'-dumbed hobgob sergent has cloak of protection +2'),(54,10,'-do as Smith says, protect matron',NULL,''),(56,10,'-surprised on 1-5\r\n-take one round to don armor when alarm raised\r\n-work for Estelrath\r\n-will defend Smith',NULL,'3gp, 7sp, 31cp'),(57,16,'Short Swords(1D6)\r\n-guests from visiting slaver\'s caravan',NULL,'17sp, 50cp in room'),(57,26,'-attack anyone close',NULL,''),(57,27,'-servents of fort\r\n-3 move to kill halfling when attacked',NULL,''),(58,21,'-six by door throw handaxes after Icar spills wine; attacks w/swords\r\n- 2 throw flaming oil flasks(3 each): on hit 2-12 1st round, 1-6 in 2nd round- characters w/in 5\' take 1-3 splash damage',NULL,''),(58,28,'-throw axes first\r\n-duck behind table: attack 1 round later in boar form\r\n-attack leaders(fighters, those who talk)',NULL,'nil'),(59,7,'-hiding under bed\r\n-attack w/ dagger w/ surprise anybody who looks under bed\r\nAC 10, HD1',NULL,'14sp'),(60,30,'-very aggressive',NULL,''),(61,29,'-guard treasure w/ life\r\n-If door is tried cries out in anger \"Icar, you snakes-belly, release me\" in common',NULL,''),(62,21,'-two per walkway\r\n-one will sound alarm if other attacked\r\n-no lanterns: only infravision\r\n-if trapdoor opens: fire at +4 anything coming out',NULL,''),(63,1,'Drink all the milk',NULL,''),(63,2,'become a dinosaur and stomp everything',NULL,''),(64,21,'10 on guard: 2 at each wall, 2 by door\r\n10 asleep in buncks\r\nSound alarm if attacked',NULL,'9gp 12sp 73cp'),(64,23,'1 awake, 1 asleep\r\nsound alarm if attacked',NULL,''),(65,21,'Wait for signal from leader, then shoot w/ hidden crossbows. \r\nAlso have clubs\r\nAmbush people in room 2 if not noticed',NULL,'7sp each'),(65,23,'Attack w/ surprise one round after hobgobs charge',NULL,'Pouch: large brass key to door at room 7\r\nCloth sack in armor: 20pg, cracked piece of ivory(75gp)'),(66,31,'Surprise on 4-6 on D6, hidden above archway\r\n1. Will drop a web on any group checking out the lure: 10X10- save paralyzation to avoid\r\n-caught will fee in rounds = 19-st\r\n-fire or burning hands  will destroy: damage trapped\r\n-oil/torch 2-8pts to trapped\r\n- minus 4 to hit by trapped and +2 to hit trapped\r\n2. Attack keeping members of party between each other to avoid ranged attacks',NULL,'-Corpse has a strange grimace upon it\'s face and its hand at its chin: between jaws if a ring of infravision\r\n-pouch w/ 10pp'),(67,19,'Attack from all side: d4 to choose, then disappear through holes\r\n\r\nCatch anything thrown at them: to hit vs AC 8 \r\n\r\nCan steal from fallen members: to hit vs AC 5\r\n\r\nCan drop from ceiling for 2 additional claw attacks\r\n\r\nEvery 10\' on oil & every round of fighting roll dex or less on D20 or fall and do nothing for that round',NULL,''),(68,14,'Two rounds to go around through room 11 and in the main door to attack. \r\n\r\nGet surprise on 1-3 on D6',NULL,'Scroll of cure disease and 60gp in pouch'),(68,16,'Sling(1d4), short sword(1d6)\r\n8 in central area torturing 5 humans, 4 south end of room sharpening nails, 2 cleaning up mortar in eastern wing, 2 in western alcove killing a human\r\n\r\nUse slings to keep intruders back until bugbears come- cover AC2\r\n\r\nCharge in groups of 4 when bugbears come\r\n\r\nOne runs through south end of room if turns bad',NULL,'6sp each'),(68,32,'1 in each cell on East side\r\n\r\nAttack if intruders come down the stairs',NULL,''),(69,32,'Actually a rapid wolf\r\n\r\nAttacks when freed, if bitten must save vs. Poison or die in 4 turns\r\n-cure disease will prevent death, but weak for four turns(-4 to hit)',NULL,''),(70,16,'Drop net and blow horn: \r\nSave vs Paralyzation- unable to attack, no dex in AC\r\n-opponents +4 to hit\r\n-Hit on AC 9 to free selves (must cut 4, 2 at a time w/ dagger)',NULL,'nil'),(70,32,'-Focus on people not in net\r\n-Attack first if coming from north',NULL,''),(70,37,'-Mount and charge one round after alarm\r\n-Lances to 2-12 (1-6 normal) in charge, +2 to hit \r\n-Morning start 2-8\r\n\r\n-Charge 3 at a time: when first clears they dismount and attack and 2nd charge\r\n-3rd left as reserves\r\n \r\n-Leader has halberd+1(1d10+1): avoid until surrounded\r\n\r\n-Focus on those in nets',NULL,'Black rune-encrusted arrow: arrow of bow breaking\r\n130gp, agate(10gp) \r\n\r\nOn leader: ring w/ two keys: portcullis to kennels \r\n\r\npouch of foul-smelling herbs on each guard: tell worgs they are friendly'),(71,33,'-Have 7 cubs\r\n\r\n-If carrying scent bags they will accept as friends\r\n\r\n-If not fight to protect cubs to death',NULL,''),(72,32,'-Chained in alcoves: cannot enter hallway\r\n\r\n-If have scent bags, sniff then sit back \r\n\r\n-Howl loudly: attack and leap at throat',NULL,''),(73,34,'-Attack closest target and most powerful fighters\r\n\r\n-Surprise on 1-5 on d6',NULL,''),(73,37,'1@1d6/2 w/ bow @ 1d6\r\n\r\n1. topple tun of brine w/ body parts: extinguish torches- minus 4 if no infravision\r\n\r\n2. Pull lever to release owl bears\r\n\r\n3. fire-out of arrows\r\n\r\n4. Swing down on ropes and fight w/ short swords\r\n\r\n*Attack any who talk during battle\r\n',NULL,''),(74,16,'If threatened run away screaming: \r\n\r\n\"The mercenaries \'Maglubiyet fry their livers\' are rioting again\"',NULL,''),(75,35,'Enter through secret door two rounds after entering\r\n\r\nSurrender and cooperate\r\n\r\nLead party down secret passage into Blackthorn\'s room\r\n\r\nAttack when Blackthorn does',NULL,'');
/*!40000 ALTER TABLE `encounter_monster_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experience` (
  `hit_dice_range_id` int(11) NOT NULL DEFAULT '0',
  `basic_xp` int(11) DEFAULT NULL,
  `hit_point_xp` int(11) DEFAULT NULL,
  `special_ability_xp` int(11) DEFAULT NULL,
  `exceptional_ability_xp` int(11) DEFAULT NULL,
  PRIMARY KEY (`hit_dice_range_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES (1,5,1,2,25),(2,10,1,4,35),(3,20,2,8,45),(4,35,3,15,55),(5,60,4,25,65),(6,90,5,40,75),(7,150,6,75,125),(8,225,8,125,175),(9,375,10,175,275),(10,600,12,300,400),(11,900,14,450,600),(12,1300,16,700,850),(13,1800,18,950,1200),(14,2400,20,1250,1600),(15,3000,25,1550,2000),(16,4000,30,2100,2500);
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hit_dice_range`
--

DROP TABLE IF EXISTS `hit_dice_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hit_dice_range` (
  `id` int(11) NOT NULL DEFAULT '0',
  `min_hit_die` int(11) DEFAULT NULL,
  `min_hit_die_modifier` int(11) DEFAULT NULL,
  `max_hit_die` int(11) DEFAULT NULL,
  `max_hit_die_modifier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hit_dice_range`
--

LOCK TABLES `hit_dice_range` WRITE;
/*!40000 ALTER TABLE `hit_dice_range` DISABLE KEYS */;
INSERT INTO `hit_dice_range` VALUES (1,0,0,1,-2),(2,1,-1,1,0),(3,1,1,2,0),(4,2,1,3,0),(5,3,1,4,0),(6,4,1,5,0),(7,5,1,6,0),(8,6,1,7,0),(9,7,1,8,0),(10,8,1,9,0),(11,9,1,10,9999),(12,11,0,12,9999),(13,13,0,14,9999),(14,15,0,16,9999),(15,17,0,18,9999),(16,19,0,20,9999);
/*!40000 ALTER TABLE `hit_dice_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monster_type`
--

DROP TABLE IF EXISTS `monster_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monster_type` (
  `name` varchar(20) DEFAULT NULL,
  `attack_count` int(11) DEFAULT NULL,
  `weapon_attack_flag` tinyint(4) DEFAULT NULL,
  `damage_per_attack` varchar(50) DEFAULT NULL,
  `hit_dice` int(11) DEFAULT NULL,
  `armor_class` int(11) DEFAULT NULL,
  `size` char(1) DEFAULT NULL,
  `movement` varchar(5) DEFAULT NULL,
  `treasure` varchar(255) DEFAULT NULL,
  `special_ability_count` int(11) DEFAULT NULL,
  `special_abilities` text,
  `exceptional_ability_count` int(11) DEFAULT NULL,
  `exceptional_abilities` varchar(255) DEFAULT NULL,
  `intelligence` varchar(10) DEFAULT NULL,
  `alignment` varchar(5) DEFAULT NULL,
  `rarity` varchar(15) DEFAULT NULL,
  `hit_die_modifier` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monster_type`
--

LOCK TABLES `monster_type` WRITE;
/*!40000 ALTER TABLE `monster_type` DISABLE KEYS */;
INSERT INTO `monster_type` VALUES ('Elias',2,0,'3',1,5,'S','slow','dinosaur',1,'noodlify',1,'soul-sucking','14','N','rare',-1,1,NULL),('Asher',1,1,'5',1,4,'S','3','ball',1,'whine',1,'willful disobedience','15','G','rare',2,2,NULL),('Ghoul',3,0,'3',2,6,'M','9\'\'','B,T',0,'',2,'-paralysis on touch\r\n-immune sleep & charm','low','CE','uncommon',0,3,NULL),('Aspis Drone',2,1,'',6,3,'M','15\'\'','F',0,'',1,'-Immune electrical and cold and 1/2 from fire','Standard','N','Rare',0,4,NULL),('Sundew, Giant',6,0,'1-3/6 attacks per creature w/in 5\'',8,7,'M','1\'\'','nil',3,'-causes -1 to hit/3 hits\r\n-suffocate on nat 20 in 2-4 rounds\r\n-1 damage/round/tendril until broken\r\n',1,'-1/2 damage on fire','semi','N','uncommon',0,5,NULL),('Wight',1,0,'1-4',4,5,'M','12\'\'','B',1,'-silver/magic to hit',2,'-energy drain\r\n-immune sleep/charm/hold/cold/poison/paralysis','average','LE','uncommon',3,6,NULL),('Half Orc Fighters',1,1,'',3,3,'M','9\'\'','variable',0,'',0,'','M','N','common',0,7,NULL),('Giant Weasle',1,0,'2-12',3,6,'M','15\'\'','nil',1,'-blood Drain: 2-12/round',0,'','animal','N','rare',3,8,NULL),('Doppleganger',1,0,'1-12',4,5,'M','9\'\'','E',2,'-Mutable form\r\n-greater change surprise\r\n-high intelligence',2,'-immune sleep/charm, -save as 10th lvl fighter','very','N','very rare',0,9,NULL),('Orc',1,1,'',1,6,'M','9\'\'','L',0,'',0,'','average','LE','common',0,10,NULL),('Troll',3,0,'5-8/5-8/2-12',6,4,'L','12\'\'','D',0,'-surprise only on 1',1,'-regeneration 3/round','low','CE','uncommon',6,11,NULL),('Ants, Giant',1,0,'1-6',2,3,'S','18\'\'','Q*3, S',0,'',0,'','animal','N','rare',0,12,NULL),('Ghast',3,0,'1-4/1-4/1-8',4,4,'M','15\'\'','B,Q,R,S,T',1,'-nausea: 10\' radius save vs poison or -2 to hit',3,'-paralysis on touch\r\n-immune sleep/charm\r\n-high int','very','CE','rare',0,13,NULL),('Bugbear',1,1,'2-8',3,5,'L','9\'\'','J,K,L,M (B in Lair)',1,'Surprise on 1-3',0,'','low','CE','uncommon',1,14,NULL),('Gnoll',1,1,'2-8',2,5,'L','9\'\'','L,M; D,Q*5,S in lair',0,'',0,'','low-avg','CE','uncommon',0,15,NULL),('Goblin',1,1,'1-6',1,6,'S','6\'\'','K; C in lair',0,'',0,'','avg(low)','LE','Uncommon',-1,16,'4 ft tall\r\n-1 to attack in sunlight\r\n60\' infravision\r\nhate dwarves and gnomes\r\nLanguages: goblin, LE, Kobald, Orcish, Hobgob'),('Wolf',1,0,'2-5',2,7,'S','18\'\'','nil',0,'',0,'','semi','N','Common',2,17,''),('Haunt',1,0,'as 5 hd monster',5,0,'M','6\'\'','nil',1,'-magic/silver weapons (1 hp + bonus/hit)to hit, or fire (1hp/round, magic=full damage)\r\n',1,'-attack drains 2 pts of dex, feeling cold and numb\r\n-upon reaching zero dex is possessed\r\n- if alignment opposite (G/E) try to strangle: to hit = 1 pt damage, then 2 then 4 etc\r\n-Upon leaving character has Dex 3, recover at 1pt/completer turn of rest','non','any','very rare',0,18,'-must stay w/in 6\'\' of spot of death\r\n-can look like ball of light, or translucent self\r\n-cannot be turned\r\n-Exorcism destroys (killing only dismisses for a week)\r\n-hold person while possessed= save vs paralyzation or be expelled\r\n'),('Boggle',3,0,'1-4/1-4/1-4',4,5,'S','9\'\'','C',5,'-secrete non-flammable oil: roll dex or lower on D20 when walking on or fall down:1 round to stand\r\n-Elastic skin: can double or half their size, -1 damage/die on them\r\n-fire resistance: immune normal fire, Magic: save at +4, -2 damage/ die \r\n-Spider Climb: at will, climb on ceilings and drop for 2 extra claw attacks\r\n-Great sense of smell: can detect invisible creatures: high-pitched keening wail to warn',1,'-Dimension door: up to 3\'\' at will, any complete frame(hole, door frame, between legs), use to reach through and attack','low','CN','very rare',3,19,'3\' tall, vaguely humanoid, dark gray skin with large bulbous heads'),('Cloaker',2,0,'1-6/1-6',6,3,'L','15\'\'','C',3,'-high int\r\n-Envelopes victims: 1/2 damage to each, full damage to both with area attacks: bites for 1-4 + unadjusted AC of victim damage; victim cannot attack\r\n-Subsonic Moaning: 3 lvls, not while biting: \r\n1: nervousness, unease: zombie-like state after six turns, -2 to hit and damage, 80\' range, stone blocks\r\n2: Fear 30\'range, save vs. Spells or run for 2 rounds\r\n',2,'Shadow Shifting: manipulate shadows to hide/obscure sigt-AC1; shadow images(mirror image); light spell will blind=no shadow shifting\r\n-3: Nausea/Weakness: cone 30\'L20W, lasts 2-5rounds, save vs. poision or helpless','high','CN','very rare',0,20,'-alien thought process, only mu can communicate\r\n-resemble large semi-circular cloaks, black eye-spots look like buttons\r\n-no back-side, no surprise\r\n-fly at 15\'\', or crawl at 1\'\'\r\n-tail is AC 1: 16 pts of damage before being cut off(this is the normal attacks)\r\n'),('Hobgoblin',1,1,'1-8',1,5,'M','9\"','J, M, D; Q*5 in lair',0,'',0,'','average','LE','uncommon',1,21,'infravision 60\'\r\n-attack elves first due to hatred\r\n-golbin, orcish, carvivorous ape, hobgob'),('Anhkheg',1,0,'3-18 +1-4',5,2,'L','12\"','C',1,'-1-4 damage from digestive juices',0,'','non','N','rare',0,22,'Looks like a 15\' long matis-like bug w/ pinkish underside(4 AC under)'),('Hobgoblin-sergent',1,1,'1-8',2,4,'M','9\"','J,M,D; Q*5 in lair',0,'',0,'','Average','LE','uncommon',0,23,''),('Ape, Carnivorous',3,0,'1-4/1-4/1-8',5,6,'L','12\"','C',1,'-if hits with both hands does addition 1-8 or rending damage',0,'','M-low','N','rare',0,24,'7\' aggressive relative of gorilla, very cunning with good sight, smell and hearing (only surprised on 1)'),('Viper',1,0,'1+poison',1,7,'S','6\"','nil',1,'poison',0,'','non','nil','common',-4,25,'3 hp each'),('Badger',3,0,'1-2/1-2/1-3',1,4,'S','6\"','nil',0,'',0,'','semi','nil','uncommon',2,26,'-pelts sell for 10-30 gp'),('Kobold',1,1,'1-4',1,7,'S','6\"','J,O; Q*5 in lair',0,'',0,'','average','LE','Uncommon',-4,27,'-usually speak kobold, goblin and orish'),('Wereboars',1,0,'2-12',5,4,'L','12\"','B,S',1,'-only silver and magic weapons hit',0,'','Average','N','rare',2,28,'-if another humanoid takes >=50% total hp infected with lycanthropy: belladonna has 25% chance of curing w/in 1 hr. If infected will be incapacitated for 1-4 days, 1% chance of death, cure disease from lvl 12 w/in 3 days or will become lycanthrope in 7-14 days'),('Medusa',1,0,'1-4',6,5,'M','9\"','P, Q*10, X, Y',1,'-high int',2,'-gaze will turn to stone w/in 3\'\', save vs petrifaction \r\n-asp hair stikes w/in 1\', save vs poison or die. ','very','LE','rare',0,29,'-speaks common & medusa\r\n-sees astral and ethereal planes'),('Boar, Wild',1,0,'3-12',3,7,'M','15\"','nil',0,'',0,'','semi','N','common',3,30,'-fights for 2-5 rounds while between 0 and -6 hp, dies at -7 hp'),('Spiders, Giant',1,0,'2-8',4,4,'L','3*12','C',1,'-Web both vertical and horizontal: like web spell, inflammable\r\nto break, S/rounds: 18/1,17/2 etc',1,'-poison bite: save vs poison or die','Low','CE','Uncommon',4,31,'-will flee from superior foe'),('Worg',1,0,'2-8',4,6,'l','18\"','nil',0,'',0,'','low','E','rare',4,32,'- have a language, often cooperate with goblins\r\n-size of ponies'),('Worg, female',1,0,'2-5',2,7,'L','18\"','nil',0,'',0,'','low','E','rare',2,33,''),('OwlBear',3,0,'1-6/1-6/2-12',5,5,'L','12\"','',1,'Hug: on 18 or better to hit w/ claw, drags opponent into hug: 2-16 damage that and every other round until killed',0,'','low','N','rare',2,34,'brown fur and feathers, 8\' tall w/ 2 inch long claws and ivory beaks. \'Exceedingly terrible to behold\' red-rimmed eyes'),('Werewolf',1,0,'2-8',4,5,'M','15\"','B',2,'-suprprise on 1-3\r\n-only silver and magic to hit',0,'','average','CE','common',3,35,''),('Wolf- cub',1,0,'0',1,6,'S','9\'\'','nil',0,'',0,'','','','',1,36,'-roll dex or less on D20 or fall and be stunned for 1 round when attacked by cub'),('Goblins- Elite',1,1,'1-6',2,4,'S','6\"','K; C in lair',0,'',0,'','med','LE','common',0,37,'4 ft tall\r\n-1 to attack in sunlight\r\n60\' infravision\r\nhate dwarves and gnomes\r\nLanguages: goblin, LE, Kobald, Orcish, Hobgob');
/*!40000 ALTER TABLE `monster_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-26 21:23:10
