/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `auth` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `auth`;

CREATE TABLE IF NOT EXISTS `account` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` binary(32) NOT NULL,
  `verifier` binary(32) NOT NULL,
  `session_key_auth` binary(40) DEFAULT NULL,
  `session_key_bnet` varbinary(64) DEFAULT NULL,
  `totp_secret` varbinary(128) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reg_mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `last_attempt_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int unsigned NOT NULL DEFAULT '0',
  `locked` tinyint unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint unsigned NOT NULL DEFAULT '11',
  `mutetime` bigint NOT NULL DEFAULT '0',
  `mutereason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `muteby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_build` int unsigned NOT NULL DEFAULT '0',
  `locale` tinyint unsigned NOT NULL DEFAULT '0',
  `os` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timezone_offset` smallint NOT NULL DEFAULT '0',
  `recruiter` int unsigned NOT NULL DEFAULT '0',
  `battlenet_account` int unsigned DEFAULT NULL,
  `battlenet_index` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  UNIQUE KEY `uk_bnet_acc` (`battlenet_account`,`battlenet_index`),
  CONSTRAINT `fk_bnet_acc` FOREIGN KEY (`battlenet_account`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account System';

INSERT INTO `account` (`id`, `username`, `salt`, `verifier`, `session_key_auth`, `session_key_bnet`, `totp_secret`, `email`, `reg_mail`, `joindate`, `last_ip`, `last_attempt_ip`, `failed_logins`, `locked`, `lock_country`, `last_login`, `online`, `expansion`, `mutetime`, `mutereason`, `muteby`, `client_build`, `locale`, `os`, `timezone_offset`, `recruiter`, `battlenet_account`, `battlenet_index`) VALUES
	(1, '1#1', _binary 0xe60d60e18b08e9a93e4a7d741d00a8ca5f916d7b97ed3ef15a1fa7b95e5ae732, _binary 0x3c04a48d3e0d24963fbf8e82bafe50de255739ac97ff8bb17d2c353ae7cf8128, NULL, _binary 0x386b39630c0714cee21f8eab69a202e34ec9b9bf39ff1d10d6d61e46eeea238978b390d080d1f3db, NULL, 'GM@GM', 'GM@GM', '2024-05-26 16:22:41', '127.0.0.1', '127.0.0.1', 0, 0, '00', '2026-03-20 16:01:44', 0, 11, 0, '', '', 66384, 0, 'Wn64', -300, 0, 1, 1);
INSERT INTO `account` (`id`, `username`, `salt`, `verifier`, `session_key_auth`, `session_key_bnet`, `totp_secret`, `email`, `reg_mail`, `joindate`, `last_ip`, `last_attempt_ip`, `failed_logins`, `locked`, `lock_country`, `last_login`, `online`, `expansion`, `mutetime`, `mutereason`, `muteby`, `client_build`, `locale`, `os`, `timezone_offset`, `recruiter`, `battlenet_account`, `battlenet_index`) VALUES
	(2, 'WEBADMIN', _binary 0xcbc1e7e41efaedab5855f30e2a98b7e8eb4c6aa218c11546fc000c3ff2b17714, _binary 0x36c235745951dfd60bc8c5be430363e95491d99afda0d21db31fd6af18400171, NULL, NULL, NULL, 'webadmin@webadmin.de', '', '2024-05-26 15:25:39', '192.168.0.75', '127.0.0.1', 0, 0, '00', NULL, 0, 11, 0, '', '', 0, 0, '', 0, 0, 2, 1);
INSERT INTO `account` (`id`, `username`, `salt`, `verifier`, `session_key_auth`, `session_key_bnet`, `totp_secret`, `email`, `reg_mail`, `joindate`, `last_ip`, `last_attempt_ip`, `failed_logins`, `locked`, `lock_country`, `last_login`, `online`, `expansion`, `mutetime`, `mutereason`, `muteby`, `client_build`, `locale`, `os`, `timezone_offset`, `recruiter`, `battlenet_account`, `battlenet_index`) VALUES
	(4, '4#1', _binary 0x74bf03d84ffddec125d8ed900a973a8b7c9813eb99dfa48561c0e9f439e4a4a0, _binary 0x50326e34edbacef5119783af06b2d435fd6b9983752d59b70d04ea15858c3659, NULL, _binary 0x5754d6c2c8c99a39cda193f907a513fe8c5ebe48d716f6a54c2ec539fe39807d50eaeebe8b037484, NULL, 'A@A', 'A@A', '2026-04-04 15:29:15', '127.0.0.1', '127.0.0.1', 0, 0, '00', '2026-07-01 17:28:17', 0, 11, 0, '', '', 66709, 0, 'Wn64', 120, 0, 4, 1);
INSERT INTO `account` (`id`, `username`, `salt`, `verifier`, `session_key_auth`, `session_key_bnet`, `totp_secret`, `email`, `reg_mail`, `joindate`, `last_ip`, `last_attempt_ip`, `failed_logins`, `locked`, `lock_country`, `last_login`, `online`, `expansion`, `mutetime`, `mutereason`, `muteby`, `client_build`, `locale`, `os`, `timezone_offset`, `recruiter`, `battlenet_account`, `battlenet_index`) VALUES
	(5, '5#1', _binary 0xb9b4b9a30bd753f6cafb03d0145c5dbf32c4b21f792270025a4fd701df843d5d, _binary 0x971b72f99d3e24d735513fb260ae2bc148307703e5953a0af6cbbde945c1ba06, NULL, _binary 0x74144f061bb263720977383e6bfd893e77cc9358d4061e126658ed4348a7ded3cbb1b3ed5690fc07, NULL, 'B@B', 'B@B', '2026-07-16 14:33:16', '127.0.0.1', '127.0.0.1', 0, 0, '00', '2026-07-16 14:34:47', 0, 10, 0, '', '', 66709, 0, 'Wn64', 120, 0, 5, 1);

CREATE TABLE IF NOT EXISTS `account_access` (
  `AccountID` int unsigned NOT NULL,
  `SecurityLevel` tinyint unsigned NOT NULL,
  `RealmID` int NOT NULL DEFAULT '-1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AccountID`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `account_access` (`AccountID`, `SecurityLevel`, `RealmID`, `Comment`) VALUES
	(1, 3, -1, NULL);
INSERT INTO `account_access` (`AccountID`, `SecurityLevel`, `RealmID`, `Comment`) VALUES
	(4, 3, -1, NULL);
INSERT INTO `account_access` (`AccountID`, `SecurityLevel`, `RealmID`, `Comment`) VALUES
	(5, 3, -1, NULL);

CREATE TABLE IF NOT EXISTS `account_banned` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int unsigned NOT NULL DEFAULT '0',
  `unbandate` int unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Ban List';


CREATE TABLE IF NOT EXISTS `account_last_played_character` (
  `accountId` int unsigned NOT NULL,
  `region` tinyint unsigned NOT NULL,
  `battlegroup` tinyint unsigned NOT NULL,
  `realmId` int unsigned DEFAULT NULL,
  `characterName` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `characterGUID` bigint unsigned DEFAULT NULL,
  `lastPlayedTime` int unsigned DEFAULT NULL,
  PRIMARY KEY (`accountId`,`region`,`battlegroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `account_last_played_character` (`accountId`, `region`, `battlegroup`, `realmId`, `characterName`, `characterGUID`, `lastPlayedTime`) VALUES
	(1, 1, 1, 1, 'Awemeo', 14, 1774023143);
INSERT INTO `account_last_played_character` (`accountId`, `region`, `battlegroup`, `realmId`, `characterName`, `characterGUID`, `lastPlayedTime`) VALUES
	(4, 1, 1, 1, 'Thewayoffags', 15, 1782931642);
INSERT INTO `account_last_played_character` (`accountId`, `region`, `battlegroup`, `realmId`, `characterName`, `characterGUID`, `lastPlayedTime`) VALUES
	(5, 1, 1, 1, 'Marinovantww', 18, 1784222152);

CREATE TABLE IF NOT EXISTS `account_muted` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mutedate` int unsigned NOT NULL DEFAULT '0',
  `mutetime` int unsigned NOT NULL DEFAULT '0',
  `mutedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mutereason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`guid`,`mutedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='mute List';


CREATE TABLE IF NOT EXISTS `account_warband_group_members` (
  `groupId` bigint unsigned NOT NULL,
  `characterGuid` bigint unsigned NOT NULL,
  `placementId` int unsigned NOT NULL,
  `type` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupId`,`characterGuid`),
  CONSTRAINT `fk_warband_group` FOREIGN KEY (`groupId`) REFERENCES `account_warband_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `account_warband_group_members` (`groupId`, `characterGuid`, `placementId`, `type`) VALUES
	(1, 1, 1, 0);
INSERT INTO `account_warband_group_members` (`groupId`, `characterGuid`, `placementId`, `type`) VALUES
	(1, 2, 4, 0);
INSERT INTO `account_warband_group_members` (`groupId`, `characterGuid`, `placementId`, `type`) VALUES
	(1, 3, 6, 0);
INSERT INTO `account_warband_group_members` (`groupId`, `characterGuid`, `placementId`, `type`) VALUES
	(1, 5, 8, 0);
INSERT INTO `account_warband_group_members` (`groupId`, `characterGuid`, `placementId`, `type`) VALUES
	(2, 15, 1, 0);
INSERT INTO `account_warband_group_members` (`groupId`, `characterGuid`, `placementId`, `type`) VALUES
	(2, 16, 4, 0);
INSERT INTO `account_warband_group_members` (`groupId`, `characterGuid`, `placementId`, `type`) VALUES
	(2, 17, 6, 0);
INSERT INTO `account_warband_group_members` (`groupId`, `characterGuid`, `placementId`, `type`) VALUES
	(3, 18, 1, 0);

CREATE TABLE IF NOT EXISTS `account_warband_groups` (
  `id` bigint unsigned NOT NULL,
  `accountId` int unsigned NOT NULL,
  `realmId` int unsigned NOT NULL DEFAULT '1',
  `orderIndex` tinyint unsigned NOT NULL,
  `name` varchar(257) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warbandSceneId` int unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_realm` (`accountId`,`realmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `account_warband_groups` (`id`, `accountId`, `realmId`, `orderIndex`, `name`, `warbandSceneId`, `flags`) VALUES
	(1, 1, 1, 0, 'Favorites', 1, 0);
INSERT INTO `account_warband_groups` (`id`, `accountId`, `realmId`, `orderIndex`, `name`, `warbandSceneId`, `flags`) VALUES
	(2, 4, 1, 0, 'Favorites', 1, 0);
INSERT INTO `account_warband_groups` (`id`, `accountId`, `realmId`, `orderIndex`, `name`, `warbandSceneId`, `flags`) VALUES
	(3, 5, 1, 0, 'Favorites', 1, 0);

CREATE TABLE IF NOT EXISTS `autobroadcast` (
  `realmid` int NOT NULL DEFAULT '-1',
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint unsigned DEFAULT '1',
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`realmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `battle_pet_declinedname` (
  `guid` bigint NOT NULL,
  `genitive` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dative` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `accusative` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instrumental` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prepositional` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`),
  CONSTRAINT `fk_battle_pet__battle_pet_declinedname` FOREIGN KEY (`guid`) REFERENCES `battle_pets` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `battle_pet_slots` (
  `id` tinyint NOT NULL,
  `battlenetAccountId` int NOT NULL,
  `battlePetGuid` bigint NOT NULL,
  `locked` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`battlenetAccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battle_pet_slots` (`id`, `battlenetAccountId`, `battlePetGuid`, `locked`) VALUES
	(0, 1, 0, 1);
INSERT INTO `battle_pet_slots` (`id`, `battlenetAccountId`, `battlePetGuid`, `locked`) VALUES
	(0, 4, 0, 1);
INSERT INTO `battle_pet_slots` (`id`, `battlenetAccountId`, `battlePetGuid`, `locked`) VALUES
	(0, 5, 0, 1);
INSERT INTO `battle_pet_slots` (`id`, `battlenetAccountId`, `battlePetGuid`, `locked`) VALUES
	(1, 1, 0, 1);
INSERT INTO `battle_pet_slots` (`id`, `battlenetAccountId`, `battlePetGuid`, `locked`) VALUES
	(1, 4, 0, 1);
INSERT INTO `battle_pet_slots` (`id`, `battlenetAccountId`, `battlePetGuid`, `locked`) VALUES
	(1, 5, 0, 1);
INSERT INTO `battle_pet_slots` (`id`, `battlenetAccountId`, `battlePetGuid`, `locked`) VALUES
	(2, 1, 0, 1);
INSERT INTO `battle_pet_slots` (`id`, `battlenetAccountId`, `battlePetGuid`, `locked`) VALUES
	(2, 4, 0, 1);
INSERT INTO `battle_pet_slots` (`id`, `battlenetAccountId`, `battlePetGuid`, `locked`) VALUES
	(2, 5, 0, 1);

CREATE TABLE IF NOT EXISTS `battle_pets` (
  `guid` bigint NOT NULL,
  `battlenetAccountId` int NOT NULL,
  `species` int NOT NULL,
  `breed` smallint NOT NULL,
  `displayId` int NOT NULL DEFAULT '0',
  `level` smallint NOT NULL DEFAULT '1',
  `exp` smallint NOT NULL DEFAULT '0',
  `health` int NOT NULL DEFAULT '1',
  `quality` tinyint NOT NULL DEFAULT '0',
  `flags` smallint NOT NULL DEFAULT '0',
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nameTimestamp` bigint NOT NULL DEFAULT '0',
  `owner` bigint DEFAULT NULL,
  `ownerRealmId` int DEFAULT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `battlenet_account_bans` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int unsigned NOT NULL DEFAULT '0',
  `unbandate` int unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Ban List';


CREATE TABLE IF NOT EXISTS `battlenet_account_heirlooms` (
  `accountId` int unsigned NOT NULL,
  `itemId` int unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `battlenet_account_mounts` (
  `battlenetAccountId` int unsigned NOT NULL,
  `mountSpellId` int unsigned NOT NULL,
  `flags` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`mountSpellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) VALUES
	(1, 5784, 0);
INSERT INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) VALUES
	(1, 23161, 0);
INSERT INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) VALUES
	(1, 417888, 0);
INSERT INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) VALUES
	(1, 424484, 0);
INSERT INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) VALUES
	(4, 5784, 0);
INSERT INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) VALUES
	(4, 23161, 0);
INSERT INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) VALUES
	(4, 417888, 0);
INSERT INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) VALUES
	(4, 424484, 0);
INSERT INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) VALUES
	(4, 1242904, 0);
INSERT INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) VALUES
	(5, 5784, 0);
INSERT INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) VALUES
	(5, 23161, 0);
INSERT INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) VALUES
	(5, 417888, 0);
INSERT INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) VALUES
	(5, 424484, 0);

CREATE TABLE IF NOT EXISTS `battlenet_account_player_data_element` (
  `battlenetAccountId` int unsigned NOT NULL,
  `playerDataElementAccountId` int unsigned NOT NULL,
  `floatValue` float DEFAULT NULL,
  `int64Value` bigint DEFAULT NULL,
  PRIMARY KEY (`battlenetAccountId`,`playerDataElementAccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `battlenet_account_player_data_flag` (
  `battlenetAccountId` int unsigned NOT NULL,
  `storageIndex` int unsigned NOT NULL,
  `mask` bigint unsigned NOT NULL,
  PRIMARY KEY (`battlenetAccountId`,`storageIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `battlenet_account_toys` (
  `accountId` int unsigned NOT NULL,
  `itemId` int NOT NULL DEFAULT '0',
  `isFavourite` tinyint(1) DEFAULT '0',
  `hasFanfare` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`accountId`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `battlenet_account_transmog_illusions` (
  `battlenetAccountId` int unsigned NOT NULL,
  `blobIndex` smallint unsigned NOT NULL,
  `illusionMask` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`blobIndex`),
  CONSTRAINT `battlenet_account_transmog_illusions_ibfk_1` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battlenet_account_transmog_illusions` (`battlenetAccountId`, `blobIndex`, `illusionMask`) VALUES
	(1, 0, 4294967292);
INSERT INTO `battlenet_account_transmog_illusions` (`battlenetAccountId`, `blobIndex`, `illusionMask`) VALUES
	(1, 1, 4294967295);
INSERT INTO `battlenet_account_transmog_illusions` (`battlenetAccountId`, `blobIndex`, `illusionMask`) VALUES
	(1, 2, 477888304);
INSERT INTO `battlenet_account_transmog_illusions` (`battlenetAccountId`, `blobIndex`, `illusionMask`) VALUES
	(1, 3, 8);
INSERT INTO `battlenet_account_transmog_illusions` (`battlenetAccountId`, `blobIndex`, `illusionMask`) VALUES
	(4, 0, 4294967292);
INSERT INTO `battlenet_account_transmog_illusions` (`battlenetAccountId`, `blobIndex`, `illusionMask`) VALUES
	(4, 1, 4294967295);
INSERT INTO `battlenet_account_transmog_illusions` (`battlenetAccountId`, `blobIndex`, `illusionMask`) VALUES
	(4, 2, 477888304);
INSERT INTO `battlenet_account_transmog_illusions` (`battlenetAccountId`, `blobIndex`, `illusionMask`) VALUES
	(4, 3, 8);
INSERT INTO `battlenet_account_transmog_illusions` (`battlenetAccountId`, `blobIndex`, `illusionMask`) VALUES
	(5, 0, 4294967292);
INSERT INTO `battlenet_account_transmog_illusions` (`battlenetAccountId`, `blobIndex`, `illusionMask`) VALUES
	(5, 1, 4294967295);
INSERT INTO `battlenet_account_transmog_illusions` (`battlenetAccountId`, `blobIndex`, `illusionMask`) VALUES
	(5, 2, 477888304);
INSERT INTO `battlenet_account_transmog_illusions` (`battlenetAccountId`, `blobIndex`, `illusionMask`) VALUES
	(5, 3, 8);

CREATE TABLE IF NOT EXISTS `battlenet_account_warband_scenes` (
  `battlenetAccountId` int unsigned NOT NULL,
  `warbandSceneId` int NOT NULL DEFAULT '0',
  `isFavorite` tinyint(1) DEFAULT '0',
  `hasFanfare` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`warbandSceneId`),
  CONSTRAINT `fk_battlenet_account_warband_scenes__accountId` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battlenet_account_warband_scenes` (`battlenetAccountId`, `warbandSceneId`, `isFavorite`, `hasFanfare`) VALUES
	(1, 1, 0, 0);
INSERT INTO `battlenet_account_warband_scenes` (`battlenetAccountId`, `warbandSceneId`, `isFavorite`, `hasFanfare`) VALUES
	(1, 4, 0, 0);
INSERT INTO `battlenet_account_warband_scenes` (`battlenetAccountId`, `warbandSceneId`, `isFavorite`, `hasFanfare`) VALUES
	(1, 29, 0, 0);
INSERT INTO `battlenet_account_warband_scenes` (`battlenetAccountId`, `warbandSceneId`, `isFavorite`, `hasFanfare`) VALUES
	(4, 1, 0, 0);
INSERT INTO `battlenet_account_warband_scenes` (`battlenetAccountId`, `warbandSceneId`, `isFavorite`, `hasFanfare`) VALUES
	(4, 4, 0, 0);
INSERT INTO `battlenet_account_warband_scenes` (`battlenetAccountId`, `warbandSceneId`, `isFavorite`, `hasFanfare`) VALUES
	(4, 29, 0, 0);
INSERT INTO `battlenet_account_warband_scenes` (`battlenetAccountId`, `warbandSceneId`, `isFavorite`, `hasFanfare`) VALUES
	(5, 1, 0, 0);
INSERT INTO `battlenet_account_warband_scenes` (`battlenetAccountId`, `warbandSceneId`, `isFavorite`, `hasFanfare`) VALUES
	(5, 4, 0, 0);
INSERT INTO `battlenet_account_warband_scenes` (`battlenetAccountId`, `warbandSceneId`, `isFavorite`, `hasFanfare`) VALUES
	(5, 29, 0, 0);

CREATE TABLE IF NOT EXISTS `battlenet_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `email` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `srp_version` tinyint NOT NULL DEFAULT '1',
  `salt` binary(32) NOT NULL,
  `verifier` blob NOT NULL,
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int unsigned NOT NULL DEFAULT '0',
  `locked` tinyint unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint unsigned NOT NULL DEFAULT '0',
  `locale` tinyint unsigned NOT NULL DEFAULT '0',
  `os` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `LastCharacterUndelete` int unsigned NOT NULL DEFAULT '0',
  `LoginTicket` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LoginTicketExpiry` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account System';

INSERT INTO `battlenet_accounts` (`id`, `email`, `srp_version`, `salt`, `verifier`, `joindate`, `last_ip`, `failed_logins`, `locked`, `lock_country`, `last_login`, `online`, `locale`, `os`, `LastCharacterUndelete`, `LoginTicket`, `LoginTicketExpiry`) VALUES
	(1, 'GM@GM', 2, _binary 0xefc1b49fe17986462c988f5461def2236891fb86ba873fef5642e11a4e12c3df, _binary 0x1c395e21ba88a0e5ad941bbdf48d591cc2c2448e0aca0ee3e9eb272fe791521d8ff35a5ebd905014539dbf318ee1737178a83b20b905dcb53a3a3454df0de6191fe3b1ebdca6369a31254db2c7039cc13d3c21135d305ebd734b11365fc556b9b85bab81ccadc8487f087b1c8771a68b2a67d3b14c82a49842b58ba9edebda90ef9df082e7f1fc5e6c7047777b5055925e819781776e3241d1f920ca72fab0c20c10df1c891f31f7a0f2e66c79c7503636a607fc1ea77b9cf57647cc4a620ff315f2f09a9aa61c13593d62646fc6c85132d0fc88d36ce07bde83147675a98cac1d595c5618297d374ce5da38a1ae6cfe6e5b998681731a0c3a4f1fd205198265, '2024-05-26 16:22:41', '127.0.0.1', 0, 0, '00', '2026-03-20 06:05:48', 0, 0, 'Wn64', 0, 'TC-8BC02FAAA48CFA6EA7058710B44DEDFED7C1BBCE', 1773990331);
INSERT INTO `battlenet_accounts` (`id`, `email`, `srp_version`, `salt`, `verifier`, `joindate`, `last_ip`, `failed_logins`, `locked`, `lock_country`, `last_login`, `online`, `locale`, `os`, `LastCharacterUndelete`, `LoginTicket`, `LoginTicketExpiry`) VALUES
	(2, 'WEBADMIN@WEBADMIN.DE', 1, _binary 0x7c8e08b666b61ddb0840a53e44d13a52b7140cc648108faaeac358c4cfb3a81c, _binary 0x4cc936fd4d2d89381cf7e4381f9894a51d9fd6e02ae3c18eef7fac67aec2b3991fe2d2a0c9cbc484717e19ae3230b817563c719c0ac7ed59f679edb91c5ba2815062df4c3d94ea6085d066ed0c2c8d1103d20ad2f8fa0bf6a1e8f97bf9a78c7ba7fcb6399601d3bbd6dc10223692eece4272c38b944300e013bd369881d15667, '2024-05-26 15:25:39', '192.168.0.68', 0, 0, '00', NULL, 0, 0, '', 0, NULL, NULL);
INSERT INTO `battlenet_accounts` (`id`, `email`, `srp_version`, `salt`, `verifier`, `joindate`, `last_ip`, `failed_logins`, `locked`, `lock_country`, `last_login`, `online`, `locale`, `os`, `LastCharacterUndelete`, `LoginTicket`, `LoginTicketExpiry`) VALUES
	(4, 'A@A', 2, _binary 0x6b2686eda829889724f50b4f97f241cc60400dc27180909f3e0eeb8c7f20f389, _binary 0xb1e220cf3ce24a75f8508b430e6832bf88efc47c6d30581dc0d50afd562b82fceb39d2bc1f11c351ec8aa49019d8ff3e288729e9d71693ce657130c123af2d80e3825e5e00912ecb41212359be2546788613630de1d26fd276a6359d5b341443cb799ebceaccfd80c66dabfc18f09c04533db8a079578c90e18c797905eefb9fef48f0b32141d8970be242c4412ad14fee29c33a5af59fa37d4b22e33a9b4a2fc9cf6f5a6b879b696b850c6ad74c6ecfc7c84e419fa91749d270ab5a3aafde5907e1ceb603f2d65f8fd82631556c7f62848ff39216546ed9fd13bc34b2024476d7f2af165062209d5030b20e057288572d93abff55ae9b2b81b8c9e6ccdecb6d, '2026-04-04 15:29:15', '127.0.0.1', 0, 0, '00', '2026-07-01 17:28:16', 0, 0, 'Wn64', 0, 'TC-AE8F3209EE95DA9552509EDEF40063D7E13B4710', 1782930496);
INSERT INTO `battlenet_accounts` (`id`, `email`, `srp_version`, `salt`, `verifier`, `joindate`, `last_ip`, `failed_logins`, `locked`, `lock_country`, `last_login`, `online`, `locale`, `os`, `LastCharacterUndelete`, `LoginTicket`, `LoginTicketExpiry`) VALUES
	(5, 'B@B', 2, _binary 0xffa9bb3ed82b1c33f417e0cf3a767f417fc487e778e968f69c3c99142492f39d, _binary 0x1c8ad3b5872c5eb331bfb695622e77f8599f1e7e4418471d7b9d798c9fcbc5feaf19e2671c5fd64b1cc91c60b1053aec10f02d5b94146037af1bca9cb6590ee17d4e07da41a4d6a8ed7c8ab5f2e037341bc1b53a45b4af921f02557bd26ff2af41dbfc01f8a7882a861861fcc1b42aae6b19b30b23911e6a3788c30dea4e661b61b13fa27b0af105d5211628d7b47bb7ce694a5b59168bf25a62bf99e1ce6abf6fd80c9f1fcd074afb3a0f154af7b80eec7e5bb4f96c3488ae88aa343d4a443d42ec05f415e945769bf7d69e96c4d23076b3c3102b13f9cd363e03dcfae7d411b14bdf826dc806e6faac1ac19f200bea84d525062de16eb34ea1137579fd3e10, '2026-07-16 14:33:16', '127.0.0.1', 0, 0, '00', '2026-07-16 14:34:46', 0, 0, 'Wn64', 0, 'TC-A750B5655936228BC9ABEFEBEBA7DA2B79705B3E', 1784216085);

CREATE TABLE IF NOT EXISTS `battlenet_item_appearances` (
  `battlenetAccountId` int unsigned NOT NULL,
  `blobIndex` smallint unsigned NOT NULL,
  `appearanceMask` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`blobIndex`),
  CONSTRAINT `fk_battlenet_item_appearances` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 0, 65536);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 18, 16384);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 42, 268435456);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 133, 32768);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 235, 33554432);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 287, 536870912);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 372, 134217728);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 373, 134218240);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 375, 1073741824);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 378, 4);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 385, 32);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 386, 131072);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 391, 2);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 394, 2621440);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 396, 134217728);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 407, 58720256);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 502, 4128);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 667, 4096);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 668, 1073741824);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 669, 16384);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 766, 1024);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 1165, 131200);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 1166, 536871424);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 1167, 4096);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 1181, 2048);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 1200, 4096);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 1428, 1);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 1526, 16384);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2170, 33562624);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2262, 65536);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2267, 8192);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2268, 4);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2396, 2147483648);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2397, 67109376);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2398, 268435456);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2399, 8);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2416, 2147483648);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2417, 3);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2600, 12);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2631, 2147483648);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2633, 256);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2803, 133693440);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2931, 1024);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 2947, 134217728);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 3258, 133693440);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 3268, 469762048);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 3398, 32768);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 3484, 25169920);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 5166, 3221229504);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 5167, 67108863);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 5244, 134217728);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 6778, 32);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 8960, 67108864);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 8961, 262144);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 8978, 16);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9241, 512);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9253, 32);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9260, 1073741824);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9263, 4194304);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9303, 67125248);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9304, 262208);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9305, 1024);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9394, 1044480);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9410, 2);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9411, 3221225472);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9412, 267911619);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9413, 255);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9440, 536870912);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9485, 28);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(1, 9503, 201472);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 258, 131072);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 2416, 2147483648);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 2417, 3);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 2600, 12);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 2631, 2147483648);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 2947, 134217728);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 3268, 469762048);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 5166, 3221225472);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 5167, 15);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 9275, 4195328);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 9276, 67125252);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 9277, 1074004032);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 9278, 1024);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 9295, 1074003968);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 9296, 4195328);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 9297, 67125252);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 9298, 262208);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 9412, 71303425);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 9413, 68);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(4, 9503, 512);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(5, 258, 131072);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(5, 2416, 2147483648);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(5, 2417, 3);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(5, 2600, 12);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(5, 2631, 2147483648);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(5, 2947, 134217728);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(5, 3268, 469762048);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(5, 5166, 3221225472);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(5, 5167, 15);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(5, 8955, 1073741824);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(5, 8956, 4195328);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(5, 8957, 67125252);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(5, 8958, 1074004032);
INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES
	(5, 8966, 256);

CREATE TABLE IF NOT EXISTS `battlenet_item_favorite_appearances` (
  `battlenetAccountId` int unsigned NOT NULL,
  `itemModifiedAppearanceId` int unsigned NOT NULL,
  PRIMARY KEY (`battlenetAccountId`,`itemModifiedAppearanceId`),
  CONSTRAINT `fk_battlenet_item_favorite_appearances` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `battlenet_transmog_illusions` (
  `battlenetAccountId` int unsigned NOT NULL,
  `blobIndex` smallint unsigned NOT NULL,
  `illusionMask` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`blobIndex`),
  CONSTRAINT `fk_battlenet_transmog_illusions` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


CREATE TABLE IF NOT EXISTS `build_auth_key` (
  `build` int NOT NULL,
  `platform` char(4) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `arch` char(4) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `type` char(4) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `key` binary(16) NOT NULL,
  PRIMARY KEY (`build`,`platform`,`arch`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(25549, 'Mac', 'x64', 'WoW', _binary 0x66fc5e09b8706126795f140308c8c1d8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(25549, 'Win', 'x64', 'WoW', _binary 0x1252624ed8cbd6fac7d33f5d67a535f3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(25549, 'Win', 'x86', 'WoW', _binary 0xfe594fc35e7f9aff86d99d8a364ab297);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(25996, 'Mac', 'x64', 'WoW', _binary 0x210b970149d6f56cac9badf2aac91e8e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(25996, 'Win', 'x64', 'WoW', _binary 0xc7ff932d6a2174a3d538ca7212136d2b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(25996, 'Win', 'x86', 'WoW', _binary 0x23c59c5963cbef5b728d13a50878dfcb);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26124, 'Mac', 'x64', 'WoW', _binary 0xc9ca997ab8ede1c65465cb2920869c4e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26124, 'Win', 'x64', 'WoW', _binary 0x46df06d0147ba67ba49af553435e093f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26124, 'Win', 'x86', 'WoW', _binary 0xf8c05ae372deca1d6c81da7a8d1c5c39);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26365, 'Mac', 'x64', 'WoW', _binary 0xdbe7f860276d6b400aaa86b35d51a417);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26365, 'Win', 'x64', 'WoW', _binary 0x59a53f307288454b419b13e694df503c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26365, 'Win', 'x86', 'WoW', _binary 0x2aac82c80e829e2ca902d70cfa1a833a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26654, 'Mac', 'x64', 'WoW', _binary 0x9234c1bd5e9687adbd19f764f2e0e811);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26654, 'Win', 'x64', 'WoW', _binary 0xa752640e8b99fe5b57c1320bc492895a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26654, 'Win', 'x86', 'WoW', _binary 0xfac2d693e702b9ec9f750f17245696d8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26822, 'Mac', 'x64', 'WoW', _binary 0x91003668c245d14ecd8df094e065e06b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26822, 'Win', 'x64', 'WoW', _binary 0x2b05f6d746c0c6cc7ef79450b309e595);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26822, 'Win', 'x86', 'WoW', _binary 0x283e8d77ecf7060be6347be4eb99c7c7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26899, 'Mac', 'x64', 'WoW', _binary 0x8368efc2021329110a16339d298200d4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26899, 'Win', 'x64', 'WoW', _binary 0x3551ef0028b51e92170559bd25644b03);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26899, 'Win', 'x86', 'WoW', _binary 0xf462cd2fe4ea3eadf875308fdbb18c99);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26972, 'Mac', 'x64', 'WoW', _binary 0x341cfefe3d72aca9a4407dc535ded66a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26972, 'Win', 'x64', 'WoW', _binary 0x6e212def6a0124a3d9ad07f5e322f7ae);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(26972, 'Win', 'x86', 'WoW', _binary 0x797ecc19662dcbd5090a4481173f1d26);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(28153, 'Win', 'x64', 'WoW', _binary 0xdd626517cc6d31932b479934ccdc0abf);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(30706, 'Win', 'x64', 'WoW', _binary 0xbb6d9866fe4a19a568015198783003fc);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(30993, 'Win', 'x64', 'WoW', _binary 0x2bad61655abc2fc3d04893b536403a91);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(31229, 'Win', 'x64', 'WoW', _binary 0x8a46f23670309f2aae85c9a47276382b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(31429, 'Win', 'x64', 'WoW', _binary 0x7795a507af9dc3525eff724fee17e70c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(31478, 'Win', 'x64', 'WoW', _binary 0x7973a8d54bdb8b798d9297b096e771ef);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(32305, 'Win', 'x64', 'WoW', _binary 0x21f5a6fc7ad89fbf411fda8b8738186a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(32494, 'Win', 'x64', 'WoW', _binary 0x58984ace04919401835c61309a848f8a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(32580, 'Win', 'x64', 'WoW', _binary 0x87c2faa0d7931bf016299025c0ddca14);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(32638, 'Win', 'x64', 'WoW', _binary 0x5d07ece7d4a867ddde615dad22b76d4e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(32722, 'Win', 'x64', 'WoW', _binary 0x1a09be1d38a122586b4931beccead4aa);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(32750, 'Mac', 'x64', 'WoW', _binary 0xef1f4e4d099ea2a81fd4c0debc1e7086);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(32750, 'Win', 'x64', 'WoW', _binary 0xc5cb669f5a5b237d1355430877173207);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(32978, 'Mac', 'x64', 'WoW', _binary 0x1852c1f847e795d6eb45278cd433f339);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(32978, 'Win', 'x64', 'WoW', _binary 0x76ae2ea03e525d97f5688843f5489000);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(33369, 'Mac', 'x64', 'WoW', _binary 0xf5a849c70a1054f07ea3ab833ebf6671);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(33369, 'Win', 'x64', 'WoW', _binary 0x5986ac18b04d3c403f56a0cf8c4f0a14);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(33528, 'Win', 'x64', 'WoW', _binary 0x0ece033ca9b11d92f7d2792c785b47df);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(33724, 'Win', 'x64', 'WoW', _binary 0x38f7bbcf284939dd20e8c64cdbf9fe77);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(33775, 'Mac', 'x64', 'WoW', _binary 0x354d2de619d124ee1398f76b0436fcfc);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(33775, 'Win', 'x64', 'WoW', _binary 0xb826300a8449ed0f6ef16ea747fa2d2e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(33941, 'Win', 'x64', 'WoW', _binary 0x88af1a36d2770d0a6ca086497096a889);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(34220, 'Win', 'x64', 'WoW', _binary 0xb5e35b976c6baf82505700e7d9666a2c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(34601, 'Win', 'x64', 'WoW', _binary 0x0d7df38f725faba4f009257799a10563);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(34769, 'Win', 'x64', 'WoW', _binary 0x93f9b9af6397e3e4eed94d36d16907d2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(34963, 'Mac', 'x64', 'WoW', _binary 0xc5658a17e702163447baaae46d130a1b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(34963, 'Win', 'x64', 'WoW', _binary 0x7ba50c879c5d04221423b02ac3603a11);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(35249, 'Win', 'x64', 'WoW', _binary 0xc7b11f9ae9ff1409f5582902b3d10d1c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(35284, 'Mac', 'x64', 'WoW', _binary 0xa6201b0ac5a73d13ab2fdcc79bb252af);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(35284, 'Win', 'x64', 'WoW', _binary 0xea3818e7dcfd2009dbfc83ee3c1e4f1b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(35435, 'Mac', 'x64', 'WoW', _binary 0x8fe657c14a46bcdb2ce6da37e430450e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(35435, 'Win', 'x64', 'WoW', _binary 0xbb397a92fe23740ea52fc2b5ba2ec8e0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(35662, 'Mac', 'x64', 'WoW', _binary 0x5966016c368ed9f7aab603ee6703081c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(35662, 'Win', 'x64', 'WoW', _binary 0x578bc94870c278cb6962f30e6dc203bb);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(36753, 'Win', 'x64', 'WoW', _binary 0x386fde8559b5ead67b791b490b200b88);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(36839, 'Win', 'x64', 'WoW', _binary 0x356eb4412b8efcf72e3af50d5181d529);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(36949, 'Win', 'x64', 'WoW', _binary 0x51c074cd8a09a75384b9b44188c56981);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(37142, 'Win', 'x64', 'WoW', _binary 0x5d9cfb3139f0d1b6c2b304261f9eabc9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(37176, 'Win', 'x64', 'WoW', _binary 0x3c725ea504ec3daed143eb6ff3b48cda);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(37474, 'Mac', 'x64', 'WoW', _binary 0x024c9be7e44237b7e81c6d42e678d433);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(37474, 'Win', 'x64', 'WoW', _binary 0x0de685bbb0551086e7fbdc0b4bb06a5b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(38134, 'Win', 'x64', 'WoW', _binary 0x32275ed0f13b357c28bdb0e611ef9e31);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(38556, 'Win', 'x64', 'WoW', _binary 0xec7d5af64364ac3e7181f3fba1b3a882);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(39653, 'Win', 'x64', 'WoW', _binary 0x10d015ab1eeb91310428d9c57ee24632);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(39804, 'Win', 'x64', 'WoW', _binary 0xe42d2bba12ed260a76f9b1e477e19ea5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(40000, 'Win', 'x64', 'WoW', _binary 0x4cb1433ab637f09f03fbbd1b221b04b0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(40120, 'Mac', 'x64', 'WoW', _binary 0x853f0f2985ceaed46df422583cd07a7c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(40120, 'Win', 'x64', 'WoW', _binary 0x04f47eaefd8bdefe14aa0350ea336678);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(40443, 'Win', 'x64', 'WoW', _binary 0x8597bb43e8ab38c85504e8bfb72abbf5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(40593, 'Win', 'x64', 'WoW', _binary 0xba14570f2d62d5f61953394164a8dae2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(40725, 'Win', 'x64', 'WoW', _binary 0xc1ebdbeb9bb2956ebccef7c9d27a1b3b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(40906, 'Win', 'x64', 'WoW', _binary 0xf5fc259c8635488afe0d0cd023f361d4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(40944, 'Win', 'x64', 'WoW', _binary 0x368fc7fabaf487a8a049c11970657074);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(40966, 'Win', 'x64', 'WoW', _binary 0xd90f47af21f381d2d8f3763b994bac88);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(41031, 'Win', 'x64', 'WoW', _binary 0x019a0facd6b0d6374b7ba69a5b677449);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(41079, 'Win', 'x64', 'WoW', _binary 0xf8853cf823bc0bbe8a9677a762dfaee1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(41288, 'Win', 'x64', 'WoW', _binary 0x871c0c9691dbc536eb24b68ec73fad5b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(41323, 'Win', 'x64', 'WoW', _binary 0xe53d0df1fac1a59a1c8071b295a04a1d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(41359, 'Win', 'x64', 'WoW', _binary 0x5f8d7f2a690a4375a1b52a28d6d681fa);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(41488, 'Win', 'x64', 'WoW', _binary 0x1bc91ec368705815f3f532b553dad981);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(41793, 'Win', 'x64', 'WoW', _binary 0xb3b47da3b7615570742a55b96614ee1c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(42010, 'Win', 'x64', 'WoW', _binary 0x302970161d16417b5be553cc530e011a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(42423, 'Win', 'x64', 'WoW', _binary 0x0b03614a7e94dd57548596be420e9dc2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(42488, 'Win', 'x64', 'WoW', _binary 0xa78755e6928d83a271c5d1ee3cdb6f15);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(42521, 'Win', 'x64', 'WoW', _binary 0x5fe6c12fc407c6b15b4a5d3b5b4a5d3b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(42538, 'Win', 'x64', 'WoW', _binary 0x71a7504bd53f8de518f24265d37310ae);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(42560, 'Win', 'x64', 'WoW', _binary 0x115fe8c38a8d67ca4664bb192e0f0dfe);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(42614, 'Win', 'x64', 'WoW', _binary 0x772be726feef42124255d2ea7973ca18);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(42698, 'Win', 'x64', 'WoW', _binary 0xb4497b1cd11fc974c5fb09548ac27269);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(42825, 'Win', 'x64', 'WoW', _binary 0xa14da228c6a6aff1ddba51218939e557);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(42852, 'Win', 'x64', 'WoW', _binary 0xde9f9f0c3cc8fd54d3aff99ceffce129);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(42937, 'Win', 'x64', 'WoW', _binary 0xf5fc75e70874752c92846b3333920e63);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(42979, 'Win', 'x64', 'WoW', _binary 0xe1dd38ae6450fc4d2ae4609233c59e54);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(43114, 'Win', 'x64', 'WoW', _binary 0xf75c9380ccb24a48a24eee52c1594a7e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(43206, 'Win', 'x64', 'WoW', _binary 0xdde806532c7704ffb75f256dc5f1f3d9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(43340, 'Win', 'x64', 'WoW', _binary 0x70e46d2d888e84df9316ea849b068cf4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(43345, 'Win', 'x64', 'WoW', _binary 0xd911abfcda030dee8caf4ee3f60dee13);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(43971, 'Win', 'x64', 'WoW', _binary 0x681cf99e61fb0005a5c7d31d0aad1ed9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(44015, 'Win', 'x64', 'WoW', _binary 0xfcf0bda7c98bfef92ae6d8c39a217abd);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(44061, 'Win', 'x64', 'WoW', _binary 0xfd2b5c0b3293fe0e9caa6eb0b7788119);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(44127, 'Win', 'x64', 'WoW', _binary 0x787887cec9fcc9b516481f60e4fc34a8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(44232, 'Win', 'x64', 'WoW', _binary 0x81f0a71df7e9873bb3750022d64d33cf);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(44325, 'Win', 'x64', 'WoW', _binary 0x138a7d524d268a7f9934c3d148e8f01b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(44730, 'Win', 'x64', 'WoW', _binary 0xfc0b18c47bb4c79f4300ca0ff3e5cac7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(44908, 'Win', 'x64', 'WoW', _binary 0xbffaec40c9bcd591c7c959a9d5a8ba8c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(45114, 'Win', 'x64', 'WoW', _binary 0xd7afe240bd00f06c30d0c2d16e54a8be);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(45161, 'Win', 'x64', 'WoW', _binary 0x74bd2e787a98b145b063bda9a98f6cbd);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(45338, 'Win', 'x64', 'WoW', _binary 0x5ce2094a41b61eda9df56378bc3b1de0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(45745, 'Win', 'x64', 'WoW', _binary 0x0f6dc90161694d765a595a3af603166b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(46479, 'Win', 'x64', 'WoW', _binary 0xcb9af4d89b60a3aba288d395d315d932);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(46658, 'Win', 'x64', 'WoW', _binary 0x3f8efb085428d75360e9efe25cd8639a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(46689, 'Win', 'x64', 'WoW', _binary 0xd9a11d188d6ad60906f5467510efd3aa);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(46702, 'Win', 'x64', 'WoW', _binary 0x01b4d1688ff97dc9aafccd0a0b842c0b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(46741, 'Win', 'x64', 'WoW', _binary 0x4c0f4a7ec2098af1fba745848ec79a78);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(46801, 'Win', 'x64', 'WoW', _binary 0xe6ac18d1ea5d36abffae5eded80630df);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(46879, 'Win', 'x64', 'WoW', _binary 0xefec43936051dd1a210633af1f6b63db);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(46924, 'Win', 'x64', 'WoW', _binary 0xe6ce0b1a8119f069ecf1e7dbaa7bb2f8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(47067, 'Win', 'x64', 'WoW', _binary 0x63862cfcdea6bd2bd7f740eb36b65657);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(47187, 'Win', 'x64', 'WoW', _binary 0x711f8455c5000c237292e1e6e90631e1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(47213, 'Win', 'x64', 'WoW', _binary 0x23c50d88ceac0a8696adde8dd244d4a2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(47631, 'Win', 'x64', 'WoW', _binary 0xf986ab91d0aeb20822efb72f4256713c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(47777, 'Win', 'x64', 'WoW', _binary 0xa88c04915ab9e035a104e55c4dcf5f9f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(47799, 'Win', 'x64', 'WoW', _binary 0x7364eb093c23db2cdc9513d5a7b4933e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(47825, 'Win', 'x64', 'WoW', _binary 0x82a3b94e5e727af3a208b471ff2054c0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(47849, 'Win', 'x64', 'WoW', _binary 0xdd8bbe2087a28c0af4984cbe23a1c707);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(47871, 'Win', 'x64', 'WoW', _binary 0x8e4f7d30ee4982b02b3b3f8837c2c4f2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(47884, 'Win', 'x64', 'WoW', _binary 0x2b7a002bc359f2c31104bc2de04302bf);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(47936, 'Win', 'x64', 'WoW', _binary 0x833d30d8fbc43b3fae99cd3898d70849);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(47967, 'Win', 'x64', 'WoW', _binary 0xcfe225d0089e224d9e7541d3b5c26478);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(48001, 'Win', 'x64', 'WoW', _binary 0x4b0260a37bd95b615e71048469e6d5bb);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(48069, 'Win', 'x64', 'WoW', _binary 0x558cdf958fa082e95849779c7c6945e5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(48317, 'Win', 'x64', 'WoW', _binary 0xc096e37b45b43244e9c79916604dd4af);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(48397, 'Win', 'x64', 'WoW', _binary 0x64ba8779eaa97e6c57982b6b1a5b32e7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(48526, 'Win', 'x64', 'WoW', _binary 0xd5b7d3303a2a741e6913ee1aeb0bcb65);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(48676, 'Win', 'x64', 'WoW', _binary 0xe059fb74dff6438cc20c7f28900f64ca);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(48749, 'Win', 'x64', 'WoW', _binary 0x92dbcca0e33dfb8a17a2b6a39246b288);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(48838, 'Win', 'x64', 'WoW', _binary 0x9e6f4e1e46ef228d2de90f7bc48aaa96);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(48865, 'Win', 'x64', 'WoW', _binary 0x4b774abe7b34d6702571b4279a4b6a13);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(48892, 'Win', 'x64', 'WoW', _binary 0xaa31bf27458321b03a1a346964dd7b9d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(48966, 'Win', 'x64', 'WoW', _binary 0x823142ca131fbb715ff55d4343e55c6d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(48999, 'Win', 'x64', 'WoW', _binary 0x79ba6ff0f9672eef875f64155c8b62d4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(49267, 'Win', 'x64', 'WoW', _binary 0xeee77ea5a216e0731adbb41aefb1df31);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(49318, 'Win', 'x64', 'WoW', _binary 0xaf439aee62ee48b36c1725111e3d9bbf);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(49343, 'Win', 'x64', 'WoW', _binary 0x301a0b4c0942b9b6f605b903ad6c1f60);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(49407, 'Win', 'x64', 'WoW', _binary 0x6413820dc9885bb0693b37090cbb2f30);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(49426, 'Win', 'x64', 'WoW', _binary 0xd85edfbfe9a94a55e2b4510be41c19b2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(49444, 'Win', 'x64', 'WoW', _binary 0x363b2b05285bdd8857419d2866316d3c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(49474, 'Win', 'x64', 'WoW', _binary 0x44a7d2b352ee3d098a3cb4c2f1065e37);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(49570, 'Win', 'x64', 'WoW', _binary 0xb024de67acaeb9e8ee6db38dc53e8281);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(49679, 'Win', 'x64', 'WoW', _binary 0x9ce59b68d8797ebf00581f41138f4316);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(49741, 'Win', 'x64', 'WoW', _binary 0x0ef181e2bb0e946cf3b7422adeb6cd1a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(49801, 'Win', 'x64', 'WoW', _binary 0x0832179567b66ca85dbd5678b604c683);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(49890, 'Win', 'x64', 'WoW', _binary 0x22a5b8a1eb797a64995f705b3dbcb14c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(50000, 'Win', 'x64', 'WoW', _binary 0x02f06ffa2296fd66384295dbfd5a4c91);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(50401, 'Win', 'x64', 'WoW', _binary 0x3eef52d902cce81d16d0e255f0aa4938);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(50438, 'Win', 'x64', 'WoW', _binary 0x0b5f68f06b129cb4c57702f6d30f260b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(50467, 'Win', 'x64', 'WoW', _binary 0x5e996b1cdcee68432d6340138e68d1eb);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(50469, 'Win', 'x64', 'WoW', _binary 0x1768ccb6589e16ab3befa9d608a393a2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(50504, 'Win', 'x64', 'WoW', _binary 0x7d5fd20c0b32c9af5dd65433b391d49c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(50585, 'Win', 'x64', 'WoW', _binary 0xc4f7cc38a3b84935a485f7edad3e764b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(50622, 'Win', 'x64', 'WoW', _binary 0xd23a26fd75fd9a6073eb7060aa28e6a7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(50747, 'Win', 'x64', 'WoW', _binary 0x2d3c386a9c45c27304ed3a3c6eb3f7c8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(50791, 'Win', 'x64', 'WoW', _binary 0x0be7d0bb07ef37c25cbc682409091ea0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(51130, 'Win', 'x64', 'WoW', _binary 0x44cd2c91e4f0655da387483726ce4035);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(51187, 'Win', 'x64', 'WoW', _binary 0x74e2055d3965269447b5cb1b31fc71c6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(51237, 'Win', 'x64', 'WoW', _binary 0xc8660a21b766646fbd67f481cfcf55c3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(51261, 'Win', 'x64', 'WoW', _binary 0x1bebb57ae450331e9f8c301aa7876fab);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(51313, 'Win', 'x64', 'WoW', _binary 0x35419ed0ab16735cf720858f45dc300c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(51421, 'Win', 'x64', 'WoW', _binary 0x45e24d6f3335269787df2b2063939002);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(51485, 'Win', 'x64', 'WoW', _binary 0xec549e1d0a5dd85c03e7a9d93b7dc6d1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(51536, 'Win', 'x64', 'WoW', _binary 0x570eea10a8ec169c3ff9621d1b635bb4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(51754, 'Win', 'x64', 'WoW', _binary 0xbed5a861c071ab41fef6087e0c37bb1a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(51886, 'Win', 'x64', 'WoW', _binary 0x09cf8919fd2eabdeaebc0c810f53b511);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(51972, 'Win', 'x64', 'WoW', _binary 0x444dc7ef3544b6670c18884dada00428);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52038, 'Win', 'x64', 'WoW', _binary 0xa8ef004aded8a3aff5a67d2bb8d95795);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52068, 'Win', 'x64', 'WoW', _binary 0xa44f842baccc7ee8e2975faf01f12474);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52095, 'Win', 'x64', 'WoW', _binary 0xba36382887d16d274ea9149695f0c9c8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52106, 'Win', 'x64', 'WoW', _binary 0x95f43869b7d881212cbc1690b8f393ed);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52129, 'Win', 'x64', 'WoW', _binary 0x02dd842f2a7162eeb8fd5b9d325606f8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52148, 'Win', 'x64', 'WoW', _binary 0x8a969717c8cdc6e7ff4c54d5cb00c224);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52188, 'Win', 'x64', 'WoW', _binary 0x977df9993e94855ded5e328ba7a2f21f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52301, 'Win', 'x64', 'WoW', _binary 0x821aa3bb237b400b82f44970250539aa);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52393, 'Win', 'x64', 'WoW', _binary 0xb013ed23b7ef51b29a45594d9bbb0d03);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52485, 'Win', 'x64', 'WoW', _binary 0x5805ceb4650730ae489258dd30e34441);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52545, 'Win', 'x64', 'WoW', _binary 0xfb52179a8355a46edbfbdc8e8e5cdafd);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52607, 'Win', 'x64', 'WoW', _binary 0x8f002e4aadcaeabb08abc2880b31ad60);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52649, 'Win', 'x64', 'WoW', _binary 0xd0b779fbecebc1ed5a85d83f03c8a75b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52808, 'Win', 'x64', 'WoW', _binary 0x6276712b6c8aea21cd5d94d52fee70ee);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52902, 'Win', 'x64', 'WoW', _binary 0xd4f0a24cdf165628538c1c387a326af3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52968, 'Win', 'x64', 'WoW', _binary 0x2d247fd440c44d4f1bf80b075b8720f2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(52983, 'Win', 'x64', 'WoW', _binary 0xb1e5ada5fdd06c9ab5e5d8a6983324ac);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(53007, 'Win', 'x64', 'WoW', _binary 0xa21afb4d381c56af471d994258c0eef5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(53040, 'Win', 'x64', 'WoW', _binary 0x2f1283bf7b7f307b70dbbd75cc42d7c3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(53104, 'Win', 'x64', 'WoW', _binary 0xdbd79ec8df044b53c78931b985cab406);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(53162, 'Win', 'x64', 'WoW', _binary 0x8a67511fbf8984eee2b630f7cb23376a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(53212, 'Win', 'x64', 'WoW', _binary 0x08761eff2f9b639364b9a9fbffffb949);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(53262, 'Win', 'x64', 'WoW', _binary 0x614a72d53126348a4927ec0f53fd2b7a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(53441, 'Win', 'x64', 'WoW', _binary 0xbfdd7d0fe87d5f75e6deb4f5c99d7c99);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(53584, 'Win', 'x64', 'WoW', _binary 0xcdd7a93659a03460b5a6ce1c4ace5554);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(53840, 'Win', 'x64', 'WoW', _binary 0xac97d745c60dd3dc5f973e55c0e3649e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(53877, 'Win', 'x64', 'WoW', _binary 0x16320f95b63846a2276e1d2612c34ad4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(53913, 'Win', 'x64', 'WoW', _binary 0x475680680b2192ebcf6744d14f755199);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(53989, 'Win', 'x64', 'WoW', _binary 0x3aeb90acb9e18b88ba1021f52d51b857);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54070, 'Win', 'x64', 'WoW', _binary 0xfda08264b7587250cf78f9b960218169);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54205, 'Win', 'x64', 'WoW', _binary 0x589d59eb3f0d6d77c2175d9302f78fdd);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54358, 'Win', 'x64', 'WoW', _binary 0x89c733d366e845fb9264404cd48cca89);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54499, 'Win', 'x64', 'WoW', _binary 0x6ac1f6180fc4c390f782db933bd83326);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54577, 'Win', 'x64', 'WoW', _binary 0xcbbbbbffb2c652f0f4a7848d86e1b063);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54601, 'Win', 'x64', 'WoW', _binary 0xf8b866cf7db9a12273f35b3929627375);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54604, 'Win', 'x64', 'WoW', _binary 0xa5ff4ce535f69d4d7f638cb2c11f2243);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54630, 'Win', 'x64', 'WoW', _binary 0xf37935510ba6b559363c160e1df18230);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54673, 'Win', 'x64', 'WoW', _binary 0xaf8b9c8a9c6128498e85228b965a004d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54717, 'Win', 'x64', 'WoW', _binary 0x862bba15158dff6b56bcf71c1b34d41a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54736, 'Win', 'x64', 'WoW', _binary 0xfe58f039d91e1c248886a2828127ca2f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54762, 'Win', 'x64', 'WoW', _binary 0x5f7fda560030255445b713456a286cfa);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54847, 'Win', 'x64', 'WoW', _binary 0x32fda0353160ec51eb36195cfacef2b7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54904, 'Win', 'x64', 'WoW', _binary 0x09cbec3c0dea28bca79f1fd9b879b0e3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(54988, 'Win', 'x64', 'WoW', _binary 0x8f2791553226871977b4f9d7f1137311);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55142, 'Win', 'x64', 'WoW', _binary 0x298b99b5ad67ea3d2ab4b3e07a415305);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55165, 'Win', 'x64', 'WoW', _binary 0x26d4d1c01434a8a6723dcabc944b6fd0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55261, 'Win', 'x64', 'WoW', _binary 0x84e153a3dd1f8249274b91047aac7aed);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55461, 'Win', 'x64', 'WoW', _binary 0xc4522674f854efecc76c898ec9545099);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55664, 'Win', 'x64', 'WoW', _binary 0xdbca58486faaa0fe54ea287a3047e923);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55666, 'Win', 'x64', 'WoW', _binary 0xf7e5a88e4d3615b652c8b9d76e7f617c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55792, 'Win', 'x64', 'WoW', _binary 0xc4decdaa44bc548ff09ef3bb837d2147);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55793, 'Win', 'x64', 'WoW', _binary 0xf9cf3232ad1c38c2028668d5bb64198f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55818, 'Win', 'x64', 'WoW', _binary 0x903a9b546248f71b16d9d9b06a072c24);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55824, 'Win', 'x64', 'WoW', _binary 0x8a6f13269a2896067a1e88789fb41ba7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55846, 'Win', 'x64', 'WoW', _binary 0xbb5e1bed705872c226834b95a9e9f8a9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55933, 'Win', 'x64', 'WoW', _binary 0xc34d42cb351c400d1319d221197cf18d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55939, 'Win', 'x64', 'WoW', _binary 0x91529f4ce41de4e54e132660acdcadc5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55959, 'Win', 'x64', 'WoW', _binary 0xed57e0538fd1ce99b171be34823148a9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(55960, 'Win', 'x64', 'WoW', _binary 0x078c056cfc7b371bde1baf308e6c19af);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56008, 'Win', 'x64', 'WoW', _binary 0x00fcd6bffcccba7a8e71e307ea6ebd0c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56110, 'Win', 'x64', 'WoW', _binary 0x800bca228e2fae37ed160f3c09e21f3a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56162, 'Win', 'x64', 'WoW', _binary 0x6f5c93ba436665a94db67ce5361d4ea8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56196, 'Mac', 'A64', 'WoW', _binary 0x778f6a5df79a4ef1b86f651f3b303ce7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56196, 'Win', 'x64', 'WoW', _binary 0x81fc14274bff0347fff9c8b1aa6bed9b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56263, 'Win', 'x64', 'WoW', _binary 0xea8472c99236cc617bf518a924014d56);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56288, 'Mac', 'A64', 'WoW', _binary 0x41710c793ef021721f14b06ec1896d3f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56288, 'Win', 'x64', 'WoW', _binary 0x03544e35d0480938e5c1238b3a26bddd);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56311, 'Mac', 'A64', 'WoW', _binary 0x412d3200715aafdc0522df031a941f0e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56311, 'Win', 'x64', 'WoW', _binary 0xac6415575aee4d32735ffad0c57226b2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56313, 'Mac', 'A64', 'WoW', _binary 0xa83ed19ee659bc95cc322d1e49bdedbb);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56313, 'Win', 'x64', 'WoW', _binary 0xeaf769009a9ad3b1aa0414e1c344074b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56380, 'Win', 'x64', 'WoW', _binary 0xd081784493233e2869933fcc01f1a3c1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56380, 'Win', 'x64', 'WoWC', _binary 0x4fb3d72d89f5ff01dd7f4e028494a4e6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56382, 'Win', 'x64', 'WoW', _binary 0x67c36a3ef655534c58ad50942192bfda);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56382, 'Win', 'x64', 'WoWC', _binary 0xa5bd7a1c33039f58cd45cd5c7ebdf122);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56421, 'Mac', 'A64', 'WoW', _binary 0x5892ffabaefdcecb0cffaaa55d2f9b13);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56421, 'Mac', 'A64', 'WoWC', _binary 0x629666d6d9effe4b73c1edd74638deaa);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56421, 'Mac', 'x64', 'WoW', _binary 0x4f0fcd1113f783c484bf45c98327de62);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56421, 'Mac', 'x64', 'WoWC', _binary 0x4b61e4f4f3b220ff5b48a6988f0ffb42);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56421, 'Win', 'A64', 'WoW', _binary 0x178888c71560707cc9c1c1d6b45b4838);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56421, 'Win', 'x64', 'WoW', _binary 0x3bdfa9aa4b70041f2c8b8cde3c8dc255);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56421, 'Win', 'x64', 'WoWC', _binary 0x0ddb8f8738647f3cd8fd585a3a78ed1b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56461, 'Mac', 'A64', 'WoW', _binary 0xe51fe6eae45322991916f619481db0b1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56461, 'Mac', 'A64', 'WoWC', _binary 0x85447cd695c2dc2f618b23996b4a503c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56461, 'Mac', 'x64', 'WoW', _binary 0xe26878df3437782f6e93e833b4cd843a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56461, 'Mac', 'x64', 'WoWC', _binary 0x8b60b0ddd55907673fd1c11edae58859);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56461, 'Win', 'A64', 'WoW', _binary 0x2f862ab724092b99c8a1f6a7b53f6a9d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56461, 'Win', 'x64', 'WoW', _binary 0x153cd89e30c4d5c3dbe603eecb470fb4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56461, 'Win', 'x64', 'WoWC', _binary 0x79bd4c88012f0da42605d76a153722cc);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56513, 'Mac', 'A64', 'WoW', _binary 0xc7e757e0de67619251f942b6c98a53b7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56513, 'Mac', 'A64', 'WoWC', _binary 0x3cc0640e46d557c4d9a6250aa8d5b387);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56513, 'Mac', 'x64', 'WoW', _binary 0xd1443824e37b73cb1fd993ce2dfaa098);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56513, 'Mac', 'x64', 'WoWC', _binary 0xead9a0b761c4c9c812fad54ce0d96b46);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56513, 'Win', 'A64', 'WoW', _binary 0x753468f753e8d3841b5d6b061e300501);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56513, 'Win', 'x64', 'WoW', _binary 0x9bd8d105049cc6459fe32ec7099ab60e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56513, 'Win', 'x64', 'WoWC', _binary 0xbb5a35c2eb6e2026ffe01202fdebd6e9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56625, 'Mac', 'A64', 'WoW', _binary 0xc7ad97b9970260d0bde7aa03eef87e2d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56625, 'Mac', 'A64', 'WoWC', _binary 0xdebdb4589756730f5ef60b337226e515);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56625, 'Mac', 'x64', 'WoW', _binary 0xeb5665fdc81e3538944ba82e435a53e6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56625, 'Mac', 'x64', 'WoWC', _binary 0xaa5b3910a3d13c89f3d9467058080836);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56625, 'Win', 'A64', 'WoW', _binary 0x684153873e5023671685b270da879668);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56625, 'Win', 'x64', 'WoW', _binary 0x80859c23c3e7f827829d47a08a1b8c92);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56625, 'Win', 'x64', 'WoWC', _binary 0x606914ed212277fddbbae49be6e8ccaf);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56647, 'Mac', 'A64', 'WoW', _binary 0x1911b50fa20e5def8c1e5d3c7479e4e2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56647, 'Mac', 'A64', 'WoWC', _binary 0xf0f2bec3de590ae7a59ccfdb42201d5f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56647, 'Mac', 'x64', 'WoW', _binary 0x022a06825c7cf55528a5ed03e87d6ae4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56647, 'Win', 'A64', 'WoW', _binary 0x0f36c48d68e358598318f0b30fdfcb61);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56647, 'Win', 'x64', 'WoW', _binary 0x2e9c456b66c0d5cad601e8fd7a2fea7a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56647, 'Win', 'x64', 'WoWC', _binary 0x543a69ab802d0873d84ab08dec4d8cac);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56819, 'Mac', 'A64', 'WoW', _binary 0x1553cd215a62e2dc92cd61c4fb5df9c3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56819, 'Mac', 'A64', 'WoWC', _binary 0x1b7ef05d342064f931e53264031e3497);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56819, 'Mac', 'x64', 'WoW', _binary 0x9d5b7e1b5e59e54a3b96e5ccba6ef465);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56819, 'Mac', 'x64', 'WoWC', _binary 0x2bdcd952baa47e6cbd71c780bc8ccd47);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56819, 'Win', 'A64', 'WoW', _binary 0x7dc752479b560884b8289bc5b5c85f3f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56819, 'Win', 'x64', 'WoW', _binary 0x4373f45e9d617636332569671ed5d5e9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(56819, 'Win', 'x64', 'WoWC', _binary 0xb9e422df76da635e193b75bd54add8de);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57292, 'Mac', 'A64', 'WoW', _binary 0xab48cdd3449440eaa6e72d43914a3824);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57292, 'Mac', 'A64', 'WoWC', _binary 0x46e6fc16392b1b0b686bdc12c92a6d18);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57292, 'Mac', 'x64', 'WoW', _binary 0x375b0734567192503cc9f9c8028dc6f3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57292, 'Mac', 'x64', 'WoWC', _binary 0xe59f7530c7bff77cb62e62d4e6d3eec8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57292, 'Win', 'A64', 'WoW', _binary 0xf42b862d0559ccd3204b2df58e995761);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57292, 'Win', 'x64', 'WoW', _binary 0xed8353327d5538f75faf2e0c584d2ef3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57292, 'Win', 'x64', 'WoWC', _binary 0x67fc9d56cc96c6f4ace29151375962f4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57388, 'Mac', 'A64', 'WoW', _binary 0xfa9d6f044063948ab74fb3fde335c0d5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57388, 'Mac', 'A64', 'WoWC', _binary 0x3962974506f57ef33bbbd4c904a82157);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57388, 'Mac', 'x64', 'WoW', _binary 0xe7e3432357bc634ebd7b76ba40d51fd2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57388, 'Mac', 'x64', 'WoWC', _binary 0xbffdd44d892a2143b61bb59e448e348c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57388, 'Win', 'A64', 'WoW', _binary 0x92129de92d2ba5f67581c5de642b1289);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57388, 'Win', 'x64', 'WoW', _binary 0x16f9cb724c662e3e8029a442443c6305);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57388, 'Win', 'x64', 'WoWC', _binary 0xdfd9bffd00fbefecbf0aef0ffc9e8f2d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57534, 'Mac', 'A64', 'WoW', _binary 0x073b823e8991a0df012ae33d661a6060);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57534, 'Mac', 'A64', 'WoWC', _binary 0xc8824559dc24858ea7e3bd0971f98a15);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57534, 'Mac', 'x64', 'WoW', _binary 0x0c7c67aaad4011aa9d81ab838b255cdf);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57534, 'Mac', 'x64', 'WoWC', _binary 0xce9cd9a02b04f0c3b126f3c7e1bf7228);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57534, 'Win', 'A64', 'WoW', _binary 0xcc612f1485f158c8b2730b7dfd926563);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57534, 'Win', 'x64', 'WoW', _binary 0x948857bf76a28fd24c5a06d18b4f2fcf);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57534, 'Win', 'x64', 'WoWC', _binary 0x62b0812a4518c21360685d4422c2a312);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57637, 'Mac', 'A64', 'WoW', _binary 0x25db682bb3b56d01b3780c446811956e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57637, 'Mac', 'A64', 'WoWC', _binary 0x722fca435ae1e916a4d96edf8ddcfb3b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57637, 'Mac', 'x64', 'WoW', _binary 0xcbb255e59e1031f8cbeb098d26b8e2fa);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57637, 'Mac', 'x64', 'WoWC', _binary 0x8da67ecb7268b7fe759ce94f13165b32);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57637, 'Win', 'A64', 'WoW', _binary 0x4b39c74a7035b6a1c799f0f4fc6735d2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57637, 'Win', 'x64', 'WoW', _binary 0x6c4185e973c9cb8382d3721af1060c66);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57637, 'Win', 'x64', 'WoWC', _binary 0x71b57f027872393c902bdcbbddc43a26);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57689, 'Mac', 'A64', 'WoW', _binary 0x5d064f1364c285f07ff804dce98a6cc5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57689, 'Mac', 'A64', 'WoWC', _binary 0xab3df8b79f5bae839764988ee6530101);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57689, 'Mac', 'x64', 'WoW', _binary 0x988459790b4b38301350be4286f979a2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57689, 'Mac', 'x64', 'WoWC', _binary 0xca7ad91741f8e2063ce227d475247212);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57689, 'Win', 'A64', 'WoW', _binary 0x4910e2142a21616934cd4d714691748c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57689, 'Win', 'x64', 'WoW', _binary 0x93b4e50e651a28d8cc4e7ce7447901f6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(57689, 'Win', 'x64', 'WoWC', _binary 0x6aedd8258d4e9701f737cba852728a74);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58123, 'Mac', 'A64', 'WoW', _binary 0x7c63ce8a068940d4d019c7cf999e3dc7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58123, 'Mac', 'A64', 'WoWC', _binary 0xcf2625300da905cc9b6d10379c58b590);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58123, 'Mac', 'x64', 'WoW', _binary 0x1b68981860a6eb24beaa070fd022b3b9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58123, 'Mac', 'x64', 'WoWC', _binary 0x3037fb1c6a73f7468dd11180000bb133);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58123, 'Win', 'A64', 'WoW', _binary 0x84b75c8f0ff380c3b3970eb63afb4962);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58123, 'Win', 'x64', 'WoW', _binary 0x29050aa0d62ef99634ccb7b5f9f6ac1e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58123, 'Win', 'x64', 'WoWC', _binary 0x2d5eeeab57affe31856d0deac73944da);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58162, 'Mac', 'A64', 'WoW', _binary 0x086bb93af9122791e6cda58a5f20aac1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58162, 'Mac', 'A64', 'WoWC', _binary 0x280bd3a4f223e1d8f3cf893bbfaefbc5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58162, 'Mac', 'x64', 'WoW', _binary 0x47586b32bd556fa08c966d7f4fc9ff24);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58162, 'Mac', 'x64', 'WoWC', _binary 0xe861315673972c1b986650c1242196fe);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58162, 'Win', 'A64', 'WoW', _binary 0x5b1f97d43762f0f1bec75e99cdd18d35);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58162, 'Win', 'x64', 'WoW', _binary 0xda3b48b9a60f4486f27ba9d8858d5688);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58162, 'Win', 'x64', 'WoWC', _binary 0x25146ed771dc629f2b8cf58126ba562c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58187, 'Mac', 'A64', 'WoW', _binary 0x88d993926d777dc12059988e009a73d6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58187, 'Mac', 'A64', 'WoWC', _binary 0x9e794fd5cd76eff400837338876ba64f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58187, 'Mac', 'x64', 'WoW', _binary 0xde1377202943c1155607090cf884ff66);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58187, 'Mac', 'x64', 'WoWC', _binary 0xe7777dce18db45b7ed3e7adf23bcb1cb);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58187, 'Win', 'A64', 'WoW', _binary 0xffeac8b1b547fd10efca8bcf30df9f51);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58187, 'Win', 'x64', 'WoW', _binary 0xd92c35d6904b0945992b0801e53822e7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58187, 'Win', 'x64', 'WoWC', _binary 0x8ac21cc640359f276c2f6153faa28638);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58238, 'Mac', 'A64', 'WoW', _binary 0x87705176e4d29cd7dca47a3db8b20ce9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58238, 'Mac', 'A64', 'WoWC', _binary 0xec7206b740d162429b4accc637132c3d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58238, 'Mac', 'x64', 'WoW', _binary 0x1a40852b2f5eeee2eb80497b691c88af);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58238, 'Mac', 'x64', 'WoWC', _binary 0x48e25221e6f84ca49685b91b96e1345a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58238, 'Win', 'A64', 'WoW', _binary 0x6aa610f0820be535ea7017e4c5bd857b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58238, 'Win', 'x64', 'WoW', _binary 0x9d91f6d23c62f0cb538d8d4e4baa4fc1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58238, 'Win', 'x64', 'WoWC', _binary 0x7b4a168dadc9a598a40794d6165ea95c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58533, 'Mac', 'A64', 'WoW', _binary 0xe637aa32d5de914b119af68cc9c9baab);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58533, 'Mac', 'A64', 'WoWC', _binary 0xe693dd275ceee2d682ec973d79251977);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58533, 'Mac', 'x64', 'WoW', _binary 0xde3723ef7eb991a1b27684e6513934d6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58533, 'Mac', 'x64', 'WoWC', _binary 0xa93ef4385174001b69f43ff0df345701);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58533, 'Win', 'A64', 'WoW', _binary 0x3823d2e16d6e314884cd586949524f2c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58533, 'Win', 'x64', 'WoW', _binary 0x18490a077f4fba0973e0b62a489ee664);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58533, 'Win', 'x64', 'WoWC', _binary 0x3dc9e22f553d631a5ca067f7809a3d2d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58608, 'Mac', 'A64', 'WoW', _binary 0x3a3b639b7fc344edb4314860638110f1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58608, 'Mac', 'A64', 'WoWC', _binary 0x8f46148144edf86bd45d23b0f23ce38b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58608, 'Mac', 'x64', 'WoW', _binary 0x29ec11f81992f19ad9707b272419adda);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58608, 'Mac', 'x64', 'WoWC', _binary 0x2bf5613d82ad3a242b5dd0b140ce4416);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58608, 'Win', 'A64', 'WoW', _binary 0x6fd8ad7ccb3b7dad45115ca93d3a68f3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58608, 'Win', 'x64', 'WoW', _binary 0x21b3edeb1a65388dd5988056d2be72b2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58608, 'Win', 'x64', 'WoWC', _binary 0xac65e4dc868efe4362e72bbcdd746853);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58630, 'Mac', 'A64', 'WoW', _binary 0x045a964f3b8d153e273a3ad862c5c38a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58630, 'Mac', 'A64', 'WoWC', _binary 0x3cdc1868fd7bb4e50629421328ed8269);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58630, 'Mac', 'x64', 'WoW', _binary 0x0d58880fa5fa7a7fd5c2466ceb398601);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58630, 'Mac', 'x64', 'WoWC', _binary 0x9745e7626c0d7d0a7f57df1bb1ea4f16);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58630, 'Win', 'A64', 'WoW', _binary 0xf74a9cb9d6918780c813e2eee0f24de0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58630, 'Win', 'x64', 'WoW', _binary 0x8c9cdcc711892eaaea793dbbf3b0c850);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58630, 'Win', 'x64', 'WoWC', _binary 0xc6a3638e0bab3a98f40b8371e1bdaeca);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58680, 'Mac', 'A64', 'WoW', _binary 0x5ee6abe5386e08867f642b3dfd15a9d4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58680, 'Mac', 'A64', 'WoWC', _binary 0x22c636bb4abbc4ad9ae8f30b6d947774);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58680, 'Mac', 'x64', 'WoWC', _binary 0xa5ff81211cdcdd60b53c14f932732969);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58680, 'Win', 'A64', 'WoW', _binary 0x9d6dc8bed265c898836593a9e654a1e1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58680, 'Win', 'x64', 'WoW', _binary 0xc1ceff499f2c2abf1913e55f65cf278c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58680, 'Win', 'x64', 'WoWC', _binary 0x0d6fc77c1d3830aaa871a9e29dcbe380);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58773, 'Mac', 'A64', 'WoW', _binary 0x52d40564b2df8d1dc02ac698f3fcf9c1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58773, 'Mac', 'A64', 'WoWC', _binary 0xf0ebd5ef23a71883af137174e4b1b01a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58773, 'Mac', 'x64', 'WoW', _binary 0xac2a56dcb12639f43f15f43ba9a9f996);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58773, 'Mac', 'x64', 'WoWC', _binary 0x8431c2d85a026e13e3e114c7ae83f0de);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58773, 'Win', 'A64', 'WoW', _binary 0x9adf3b9e70df0176cec196480ba407a3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58773, 'Win', 'x64', 'WoW', _binary 0x648474dee9f16af1c02bd63f7f3e9b01);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58773, 'Win', 'x64', 'WoWC', _binary 0x362c80c4498ffa1de3cc0af243e1337a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58867, 'Mac', 'A64', 'WoW', _binary 0x0ba2958770dfbfdb933851a4aadb4950);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58867, 'Mac', 'A64', 'WoWC', _binary 0x0d747a5931df5b155b5cc4892d63e1d8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58867, 'Mac', 'x64', 'WoW', _binary 0xa3696df215aab11f4f340c5c4393fb89);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58867, 'Mac', 'x64', 'WoWC', _binary 0xb7c65fc1da519ed5304019262fefefa6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58867, 'Win', 'A64', 'WoW', _binary 0xef8c2258197fdbc6da5c39699bdeb7a1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58867, 'Win', 'x64', 'WoW', _binary 0x7c1627a7325c57fad21a29d57bbf80a6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58867, 'Win', 'x64', 'WoWC', _binary 0x3f8e07e581847b644d6f76489477540d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58911, 'Mac', 'A64', 'WoW', _binary 0xdee67d3a0c9d8edd5a94c7bd8fa1e657);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58911, 'Mac', 'A64', 'WoWC', _binary 0x6d3c242b3c76686feee9b18444c113c7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58911, 'Mac', 'x64', 'WoW', _binary 0x78d3576614aed3de8fb8c90aff838f3b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58911, 'Mac', 'x64', 'WoWC', _binary 0xa4c80cdbc805a19fab8ef1baa483db9a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58911, 'Win', 'A64', 'WoW', _binary 0xf02130ba7bff2c0292f25f3c6240b2e8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58911, 'Win', 'x64', 'WoW', _binary 0x5ef341d9f5a27f796d5bd786a5bd5a16);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(58911, 'Win', 'x64', 'WoWC', _binary 0xa9c0bea1b7351665091e6754a0a90a16);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59347, 'Mac', 'A64', 'WoW', _binary 0xc7b81bb6f9207da0ccebfac3186fc073);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59347, 'Mac', 'A64', 'WoWC', _binary 0xbab986a50c7fdb89467aa5613a6ba345);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59347, 'Mac', 'x64', 'WoW', _binary 0x1a11343133bf1abdbf0ff6b287b37c23);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59347, 'Mac', 'x64', 'WoWC', _binary 0x3a624c37ee150cc9b71ca3ad1f4532cf);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59347, 'Win', 'A64', 'WoW', _binary 0x80cac49f6ea99ac68ca9b834466ca5dc);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59347, 'Win', 'x64', 'WoW', _binary 0x63228339538f9552d16855976c64848b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59347, 'Win', 'x64', 'WoWC', _binary 0xbb45fac562eb7cf3fc4c137c1ae93af6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59425, 'Mac', 'A64', 'WoW', _binary 0x14a01bef9e9db7c5a40438ce87e99b85);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59425, 'Mac', 'A64', 'WoWC', _binary 0x38b98da1f8765c927c724cfe4e1d92c2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59425, 'Mac', 'x64', 'WoW', _binary 0x9d230a7c010ba2e5b385cb4e24a59529);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59425, 'Mac', 'x64', 'WoWC', _binary 0xb0bf826891290e30173dca5cf2b39f50);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59425, 'Win', 'A64', 'WoW', _binary 0xf40fed2615a2454e31b044b1ad564b7d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59425, 'Win', 'x64', 'WoW', _binary 0x5fe3e3980a15a1d4ed64240bc0c6932d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59425, 'Win', 'x64', 'WoWC', _binary 0xeca5da344af973b0d25ac1103fb694b8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59466, 'Mac', 'A64', 'WoW', _binary 0xf6cb8eb7ab66f8909adca85052bfae40);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59466, 'Mac', 'A64', 'WoWC', _binary 0x213104ec1bef7656fc3930dce4176184);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59466, 'Mac', 'x64', 'WoW', _binary 0x99075d27ff98a87368a08e87a3f105c3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59466, 'Mac', 'x64', 'WoWC', _binary 0x516115232e1a8b3f1e3ca709f20ea84d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59466, 'Win', 'A64', 'WoW', _binary 0x04f0986c0ead648f8c7b27736a30088a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59466, 'Win', 'x64', 'WoW', _binary 0x118ffd674f5b51c277f5c8505e9479d3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59466, 'Win', 'x64', 'WoWC', _binary 0xc299cb416e332e4bbe5aa1aae905a437);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59679, 'Mac', 'A64', 'WoW', _binary 0x721e18c6bb25d4878a91801985a0d18f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59679, 'Mac', 'A64', 'WoWC', _binary 0x45cb8600b7404b46b032183cce4b340a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59679, 'Mac', 'x64', 'WoW', _binary 0x2e3cd97fd83976bb7d56d3489ce40d79);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59679, 'Mac', 'x64', 'WoWC', _binary 0x4d28de9f333624311d3150f871c472ef);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59679, 'Win', 'A64', 'WoW', _binary 0xe4435ee6e4968b5106e6596b60ee2db6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59679, 'Win', 'x64', 'WoW', _binary 0x54e4c53c5dc1930794de4d1dd0365fe2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(59679, 'Win', 'x64', 'WoWC', _binary 0xb23bfd99ebcd872ea39230e1aabcd19b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60037, 'Mac', 'A64', 'WoW', _binary 0x2d9fe76e6a93dd0c93df0d3d8b192fad);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60037, 'Mac', 'A64', 'WoWC', _binary 0x7ae0e5804dd7dd5d707be74db290c807);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60037, 'Mac', 'x64', 'WoW', _binary 0xbcd051513c5a8db78bf7b0a8ec18e5ec);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60037, 'Mac', 'x64', 'WoWC', _binary 0x64e76df99c69d852656979829d8600ce);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60037, 'Win', 'A64', 'WoW', _binary 0x2a4939ec8440ab977fe9282a2cce3e24);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60037, 'Win', 'x64', 'WoW', _binary 0x474ff52ef47d47521ef138291b43723d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60037, 'Win', 'x64', 'WoWC', _binary 0x75ebbd3c1c1d088f2597e40ca3924b5e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60257, 'Mac', 'A64', 'WoW', _binary 0xb59ebbba00139714d2ca755dba71a58a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60257, 'Mac', 'A64', 'WoWC', _binary 0x01dcfc44c27452f3b7e33ee6f01e067f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60257, 'Mac', 'x64', 'WoW', _binary 0x3a0db5ecbecca5c80b704fa405da5389);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60257, 'Mac', 'x64', 'WoWC', _binary 0x174d184200d89bf13a62dedf6e265827);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60257, 'Win', 'A64', 'WoW', _binary 0x5de295571ba573f16ec0d27f9b256953);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60257, 'Win', 'x64', 'WoW', _binary 0x04863309b886141aab63893cd2414960);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60257, 'Win', 'x64', 'WoWC', _binary 0x6d386fdacbaba88604afae3826fe31fa);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60392, 'Mac', 'A64', 'WoW', _binary 0x2c1fb8ae803bd91c457d08d6df1c6128);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60392, 'Mac', 'A64', 'WoWC', _binary 0xdfce89d38b558a97e34b82d38c6972c9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60392, 'Mac', 'x64', 'WoW', _binary 0xdd8f3f8d4290ba24f006106397dd00fa);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60392, 'Mac', 'x64', 'WoWC', _binary 0xde6a3f2957c68a4e100abaeb8547e127);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60392, 'Win', 'A64', 'WoW', _binary 0xf1fe18ecaf86e0fef417d6ac8f450444);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60392, 'Win', 'x64', 'WoW', _binary 0xd2262204981078ae85e98bdaff11eb41);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60392, 'Win', 'x64', 'WoWC', _binary 0x896ce1badc6cd1d65169ad63803bd51c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60428, 'Mac', 'A64', 'WoW', _binary 0x2e7d82db6d2ab614a9d523b773c1d921);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60428, 'Mac', 'A64', 'WoWC', _binary 0x0da35a86af0709859b22f9cae128cd49);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60428, 'Mac', 'x64', 'WoW', _binary 0xfaf413508f53006209110192cd6c1dcf);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60428, 'Mac', 'x64', 'WoWC', _binary 0x21838345675138fc55002b4e2bb95f37);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60428, 'Win', 'A64', 'WoW', _binary 0x32ac6106995042a6355b1dfdde62bc75);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60428, 'Win', 'x64', 'WoW', _binary 0x264e5a8300cb3fbdd183bf90f4efad4f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60428, 'Win', 'x64', 'WoWC', _binary 0xa70f28aee99ce8d2993b0ab11876c668);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60490, 'Mac', 'A64', 'WoW', _binary 0xb9289c46a7581bcfbb3e4f2da4e88c4a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60490, 'Mac', 'A64', 'WoWC', _binary 0xe2cb722ba3091fb93e11d0a45fde245d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60490, 'Mac', 'x64', 'WoW', _binary 0x0a8d47f840cc05f8e2f37cf9397bb5b2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60490, 'Mac', 'x64', 'WoWC', _binary 0x90845571462ee2250f4b5c572c9188da);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60490, 'Win', 'A64', 'WoW', _binary 0xbd4a878cfff3262669351d582949f2cd);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60490, 'Win', 'x64', 'WoW', _binary 0xbe091c2f2aea1d1800cda7e6875f3665);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60490, 'Win', 'x64', 'WoWC', _binary 0x22822461c16260d124680e05875f9d9d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60568, 'Mac', 'A64', 'WoW', _binary 0x470c274987087337796e8b9e2cae74db);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60568, 'Mac', 'A64', 'WoWC', _binary 0x4cb6793447021056a4d3a4dc0d187aa9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60568, 'Mac', 'x64', 'WoW', _binary 0x97ce8361b5b5f0e63463c3cb028c4553);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60568, 'Mac', 'x64', 'WoWC', _binary 0x215e50b6e560d093731b8d2ea7a9125b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60568, 'Win', 'A64', 'WoW', _binary 0x788b2e434f8f94c2f30912640e1c28e6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60568, 'Win', 'x64', 'WoW', _binary 0x2ea108c13157170527f2cdf2581216a2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(60568, 'Win', 'x64', 'WoWC', _binary 0x2d180d7e0f83bbae38177a02273ac016);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61265, 'Mac', 'A64', 'WoW', _binary 0xdea96215daee2552a432ae1f30753c3d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61265, 'Mac', 'A64', 'WoWC', _binary 0x3aeed019a7b37fc429f0d484b8599d03);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61265, 'Mac', 'x64', 'WoW', _binary 0xdf74d9839dde90d1681c83829bee4904);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61265, 'Mac', 'x64', 'WoWC', _binary 0xa601e42069510e0d5eb08fe1155e21df);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61265, 'Win', 'A64', 'WoW', _binary 0x87d07f5340dec51cb965935e13a035a7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61265, 'Win', 'x64', 'WoW', _binary 0xdac655ecd4795c36e2a7df63ab7e3915);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61265, 'Win', 'x64', 'WoWC', _binary 0xc06106a58586e5b0a13411bc53b8cfa5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61491, 'Mac', 'A64', 'WoW', _binary 0x6a63f9b14228b85af4ee9f6aad2dc108);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61491, 'Mac', 'A64', 'WoWC', _binary 0x0f263aa0c47b7f9af2decc62cfbc87b8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61491, 'Mac', 'x64', 'WoW', _binary 0x42754222fbef4b872ab34f5a53166707);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61491, 'Mac', 'x64', 'WoWC', _binary 0x9513de4cab9e345fe327a216b9c4caf3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61491, 'Win', 'A64', 'WoW', _binary 0xa42e81e60866c0114f59ce5f5f6458d4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61491, 'Win', 'x64', 'WoW', _binary 0xece38e2b4833ba220c3c33eed4c004d1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61491, 'Win', 'x64', 'WoWC', _binary 0x4e106c27490d03932c7985f192ac35e6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61559, 'Mac', 'A64', 'WoW', _binary 0x3c0726c9d66742f43c8d105c015364cf);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61559, 'Mac', 'A64', 'WoWC', _binary 0x32f6ab87e9e9776beaace8b6683a39ba);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61559, 'Mac', 'x64', 'WoW', _binary 0xd2039cb1eee0b59595e145b8a9626001);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61559, 'Mac', 'x64', 'WoWC', _binary 0xe73978c9576833f36694293036e55409);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61559, 'Win', 'A64', 'WoW', _binary 0xaa7ad5624979eb36a6963a9f7de019b9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61559, 'Win', 'x64', 'WoW', _binary 0x17928a7329f53e273891d85a973248c0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61559, 'Win', 'x64', 'WoWC', _binary 0xd9e57238dd0742b44e68f05d59a6234b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61609, 'Mac', 'A64', 'WoW', _binary 0x9d3b5f3d2ddeb29abb6db48ef29d38c9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61609, 'Mac', 'A64', 'WoWC', _binary 0x5949f3ae2b51a3b03155a13952e82f77);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61609, 'Mac', 'x64', 'WoW', _binary 0x7c8665eed3e4c902e8b2fc4972f4636c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61609, 'Mac', 'x64', 'WoWC', _binary 0x36fbcbd0cc7a8e88aaaf9bd3cf14fc81);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61609, 'Win', 'A64', 'WoW', _binary 0x21493f8d8c078fda669e42aea8724351);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61609, 'Win', 'x64', 'WoW', _binary 0x9f18c02cc5868a925cdd4201a8d7f9da);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61609, 'Win', 'x64', 'WoWC', _binary 0x15f4ca6c215113b4b47ec3ab65c65419);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61967, 'Mac', 'A64', 'WoW', _binary 0xdab6f778c37531255ac22f3fb9065eaa);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61967, 'Mac', 'A64', 'WoWC', _binary 0x3f10ff17698d9f938b04707c0b8a7e00);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61967, 'Mac', 'x64', 'WoW', _binary 0x2b9db4f2b70e849871a8f95feef357e9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61967, 'Mac', 'x64', 'WoWC', _binary 0x4de3d440d1d46a38ec32d0d524004aba);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61967, 'Win', 'A64', 'WoW', _binary 0x7b443bb6b4f355b9e389f4f0acb04fe8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61967, 'Win', 'x64', 'WoW', _binary 0x6e194b4b53038e76e01e9538107aff4d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(61967, 'Win', 'x64', 'WoWC', _binary 0x9e135bf0b40bdd210eaf318aeb72801c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62213, 'Mac', 'A64', 'WoW', _binary 0x4eb479a10c122085cfa59633dbcada17);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62213, 'Mac', 'A64', 'WoWC', _binary 0x101f2207c5ab43a29762838fc4c460ba);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62213, 'Mac', 'x64', 'WoW', _binary 0x94d5b0a9620333c4f068a5f7fd5e16c6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62213, 'Mac', 'x64', 'WoWC', _binary 0xbaa3bafc4f9209afb9eda4c89dbb506c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62213, 'Win', 'A64', 'WoW', _binary 0xf565e632cbc04516f235f2a412c61569);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62213, 'Win', 'x64', 'WoW', _binary 0x062594033ea9753e81240476ab4e21bc);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62213, 'Win', 'x64', 'WoWC', _binary 0x8584238f7e35711e8817cd53951478b2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62417, 'Mac', 'A64', 'WoW', _binary 0x020bbba62c6539043095ae1603fc3a1f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62417, 'Mac', 'A64', 'WoWC', _binary 0xda7bb5e78e98856a679eb442eb683dd5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62417, 'Mac', 'x64', 'WoW', _binary 0x8d15525965a59f4c1a886e6bcc09d75a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62417, 'Mac', 'x64', 'WoWC', _binary 0x02c9b276b11f9b175a59021b1eb7f9e3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62417, 'Win', 'A64', 'WoW', _binary 0xdc74af249532ef367023c78f11e6f709);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62417, 'Win', 'x64', 'WoW', _binary 0x702fc86d79262cd311393aeb3f5b88e6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62417, 'Win', 'x64', 'WoWC', _binary 0xb97b257a3d69bba321dec1427591ead6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62438, 'Mac', 'A64', 'WoW', _binary 0x5c974d816f1d4806f77a60d125902b11);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62438, 'Mac', 'A64', 'WoWC', _binary 0x333eef08165d098594d01993fb5566c4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62438, 'Mac', 'x64', 'WoW', _binary 0x8ee8e906f3277b995c3fb76a9472316d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62438, 'Mac', 'x64', 'WoWC', _binary 0x2d92fac97be1600e3cf7c41c260b90e3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62438, 'Win', 'A64', 'WoW', _binary 0x5f43b9c77da61431aaf5e527fc6ba0ba);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62438, 'Win', 'x64', 'WoW', _binary 0x54b80a79b8a5c515e25366ab57f0acb0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62438, 'Win', 'x64', 'WoWC', _binary 0xcae41a1dd7cf9c2e850ce388bb1eef6d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62493, 'Mac', 'A64', 'WoW', _binary 0x35663ef5187f38257e9768481f1894dc);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62493, 'Mac', 'A64', 'WoWC', _binary 0x5a48d3a43278a6ea31b2e3ae0de6e601);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62493, 'Mac', 'x64', 'WoW', _binary 0x1beec427c9f41184efaac048d51c5207);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62493, 'Mac', 'x64', 'WoWC', _binary 0x15b0a1d7ea355891634507cd840b2e16);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62493, 'Win', 'A64', 'WoW', _binary 0x043025d94567792fa8284c282e77e57f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62493, 'Win', 'x64', 'WoW', _binary 0x5b038e707ab60e3a862c2e03a8487220);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62493, 'Win', 'x64', 'WoWC', _binary 0x1a65b9347fd44ef0a77479173d098226);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62876, 'Mac', 'A64', 'WoW', _binary 0x93d9177ae7fcf5d5353cc368882ba6ab);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62876, 'Mac', 'A64', 'WoWC', _binary 0x7eaea45f071d0df95878aa4b6c1e0a3b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62876, 'Mac', 'x64', 'WoW', _binary 0xc981b22c49fe45d1e89f8f85e3f1474e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62876, 'Mac', 'x64', 'WoWC', _binary 0x3405e814b5f2738f5358e7ba95d20783);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62876, 'Win', 'A64', 'WoW', _binary 0xa0be8304e27cb1dde6cae9deadedd2ce);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62876, 'Win', 'x64', 'WoW', _binary 0x477addd4838b7c1017f48ee3c82437ba);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(62876, 'Win', 'x64', 'WoWC', _binary 0xcd36daabf5eff54b47bc25f40b408a54);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63305, 'Mac', 'A64', 'WoW', _binary 0x22e7c05a01ea110efdacffc2ae4b27de);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63305, 'Mac', 'A64', 'WoWC', _binary 0xbeb015f25b21f43ef52af0faa572e6e8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63305, 'Mac', 'x64', 'WoW', _binary 0xfe6d35d91a23b18c3e05c9cf587cb27f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63305, 'Mac', 'x64', 'WoWC', _binary 0x0d600a97c7207828f2dec0dca49bc0a8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63305, 'Win', 'A64', 'WoW', _binary 0xba66efd522eb2cdc8d3ff9184bcd91ca);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63305, 'Win', 'x64', 'WoW', _binary 0x93c43b6a6902ca37f15c68aab8e69321);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63305, 'Win', 'x64', 'WoWC', _binary 0x47bbb811d2ac4da0d74fefc0dd32940e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63506, 'Mac', 'A64', 'WoW', _binary 0xde529c1341ca640ec839ed26bf4e1f15);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63506, 'Mac', 'A64', 'WoWC', _binary 0x77ac8716911dcea2db5f87215a2d6090);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63506, 'Mac', 'x64', 'WoW', _binary 0x3f2314eb0ee2a8a0c2c830e52c9bd5b3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63506, 'Mac', 'x64', 'WoWC', _binary 0x20d2a070b78bfdee73827c80cedbdc16);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63506, 'Win', 'A64', 'WoW', _binary 0x6d5dc638bf4ae6bdc34ab8624aea49a7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63506, 'Win', 'x64', 'WoW', _binary 0x68631e3b12ce5aa4839c46b9c70ef231);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63506, 'Win', 'x64', 'WoWC', _binary 0x2d3d993af54f07cc108463f88016faff);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63660, 'Mac', 'A64', 'WoW', _binary 0xa5fd60b6fe600dcd41dad4dffcf3ca0f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63660, 'Mac', 'A64', 'WoWC', _binary 0xc33a55ffc1ab8c5cb6d2c9175f4d3018);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63660, 'Mac', 'x64', 'WoW', _binary 0x5ba8fc2098bbbd9fb30178b95b616da6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63660, 'Mac', 'x64', 'WoWC', _binary 0x52ba0a6b2432d7584f597afd1638c085);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63660, 'Win', 'A64', 'WoW', _binary 0x58cdf4daaf8ea1211a1514fbc4f668b5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63660, 'Win', 'x64', 'WoW', _binary 0xd613df0cb4be97e954bd4c8f0dcc0b3c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63660, 'Win', 'x64', 'WoWC', _binary 0x767faaf58a1e698927d9226deaabadc3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63704, 'Mac', 'A64', 'WoW', _binary 0x88a6e7fa99d6e842ffb4db126a505da0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63704, 'Mac', 'A64', 'WoWC', _binary 0x0bf4f67cda8d398fa96a6330fd5b331a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63704, 'Mac', 'x64', 'WoW', _binary 0x186ccdafd21b074cbfd5c4960a1397f9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63704, 'Mac', 'x64', 'WoWC', _binary 0xf6ba093ee09b78dc5e70ffa78ecae49c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63704, 'Win', 'A64', 'WoW', _binary 0x855b9cfd0785a946afaeef2cf7b988cc);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63704, 'Win', 'x64', 'WoW', _binary 0x7cb483ebd52970d0cbbb7952036ceafa);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(63704, 'Win', 'x64', 'WoWC', _binary 0x4985eb04d5fe1d78eb0cc7d490ef6e79);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64270, 'Mac', 'A64', 'WoW', _binary 0x928e0021891cf98bc5727c651400435c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64270, 'Mac', 'A64', 'WoWC', _binary 0xea26214831b30acbc2512a01e0e7068d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64270, 'Mac', 'x64', 'WoW', _binary 0x6d60ab2f23453c2366443d74824630c8);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64270, 'Mac', 'x64', 'WoWC', _binary 0x8aab201281bc74f62858cf3493637589);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64270, 'Win', 'A64', 'WoW', _binary 0xe8dd93206beb87858012bc2881822691);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64270, 'Win', 'x64', 'WoW', _binary 0x60ebedb6842317893e4c317eb449a1b7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64270, 'Win', 'x64', 'WoWC', _binary 0x456d3af6c7ec9967b36df439c55bd0ee);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64502, 'Mac', 'A64', 'WoW', _binary 0x9f782c29580703ecf3148e3e78b3b45b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64502, 'Mac', 'A64', 'WoWC', _binary 0x17168e59e27ece41aad719777413668f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64502, 'Mac', 'x64', 'WoW', _binary 0xda795ff3960de8212ad6c97c4619bfd0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64502, 'Mac', 'x64', 'WoWC', _binary 0x6dce3ba9c0acf638ae599680200483ae);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64502, 'Win', 'A64', 'WoW', _binary 0x51df09abe30d38142eb5942ed774301b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64502, 'Win', 'x64', 'WoW', _binary 0x54d307cf2bc84e50e94c2d3a95cd6d7b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64502, 'Win', 'x64', 'WoWC', _binary 0xa968cfa8b0558f433b3e483e844fbfc3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64877, 'Mac', 'A64', 'WoW', _binary 0xb903471c43ebdc5babf6fb604a3a5e69);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64877, 'Mac', 'A64', 'WoWC', _binary 0x3dfedc25e9bdf2c8c30e0e3f0f6eb6d4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64877, 'Mac', 'x64', 'WoW', _binary 0x98464ddffc9a5786da1f053ea520ba32);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64877, 'Mac', 'x64', 'WoWC', _binary 0x01003f46907a168b2bdf036575802098);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64877, 'Win', 'A64', 'WoW', _binary 0x026ed07009997b857bb37dcbb5b11477);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64877, 'Win', 'x64', 'WoW', _binary 0x6ab7c89863a9d6cda9c0fae710feb126);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64877, 'Win', 'x64', 'WoWC', _binary 0xbd52f0d3f7c92642185e963cea424bd3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64978, 'Mac', 'A64', 'WoW', _binary 0x2d3d9a591d1750acbfa38450225218e0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64978, 'Mac', 'A64', 'WoWC', _binary 0x0fa46aa62d9e1dec723f01b16ce26442);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64978, 'Mac', 'x64', 'WoW', _binary 0x8c4d1ba36574c6e68716db455c3b73fd);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64978, 'Mac', 'x64', 'WoWC', _binary 0xd1ee6f8e00507cc771f4aad86b91f7aa);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64978, 'Win', 'A64', 'WoW', _binary 0x04fb74a28b1a31d7a2a3126dd2b71ab7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64978, 'Win', 'x64', 'WoW', _binary 0x706ba57aedd9816b5a58209fa6a3b728);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(64978, 'Win', 'x64', 'WoWC', _binary 0x96b417d4d1f12cf8b0c855a23c674c2c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65299, 'Mac', 'A64', 'WoW', _binary 0x13d67c8b31e6e0438ddd546e6b6089c3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65299, 'Mac', 'A64', 'WoWC', _binary 0x17925bf5662aec818451f0772b811591);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65299, 'Mac', 'x64', 'WoW', _binary 0x5c513a31174cd2e91ce5926bb263c459);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65299, 'Mac', 'x64', 'WoWC', _binary 0xab4cd08c656ffe091adfd470bce0d5f9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65299, 'Win', 'A64', 'WoW', _binary 0xd0802eff536a2e14117dbfe0a555ea47);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65299, 'Win', 'x64', 'WoW', _binary 0x11922598fbb8b92f694511ddae4b065e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65299, 'Win', 'x64', 'WoWC', _binary 0xb608b58a94a4bb567281137b2ed80465);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65560, 'Mac', 'A64', 'WoW', _binary 0x764aedcd3d0598b4b0e4800952f35b21);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65560, 'Mac', 'A64', 'WoWC', _binary 0x6c5142ad00ef0409698e7f15cec59432);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65560, 'Mac', 'x64', 'WoW', _binary 0x8277339be0ce9ef84ef69a88a9986d50);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65560, 'Mac', 'x64', 'WoWC', _binary 0x066f8a98d49d6795583a2152c36a7b9b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65560, 'Win', 'A64', 'WoW', _binary 0xd46670909eaa1861344e421111a4d8ae);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65560, 'Win', 'x64', 'WoW', _binary 0xaa9b762f17cbddf63b367e8a4047e301);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65560, 'Win', 'x64', 'WoWC', _binary 0x438e7ee1e17b986e55b828609fd1773d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65655, 'Mac', 'A64', 'WoW', _binary 0x5fc92211657dc1246aadf3bd3014c0c9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65655, 'Mac', 'A64', 'WoWC', _binary 0xa9acee99fddf226cfc172c3340db0465);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65655, 'Mac', 'x64', 'WoW', _binary 0xc9eb424f23c63a43c1a376216919bdb7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65655, 'Mac', 'x64', 'WoWC', _binary 0x68082f937f8d7d6054c76f7f763f1e73);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65655, 'Win', 'A64', 'WoW', _binary 0x72d550c377b457c06d6d80ac1a10fe6c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65655, 'Win', 'x64', 'WoW', _binary 0x6ad49b69f4fad3568234489dd1908960);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65655, 'Win', 'x64', 'WoWC', _binary 0xb83e762977da190419a418fd4eb9539c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65727, 'Mac', 'A64', 'WoW', _binary 0xdfbce4a4a707a6e40b826bc765cfd2c3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65727, 'Mac', 'A64', 'WoWC', _binary 0xb592e8cc636f8c8d0942273cbd888ed3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65727, 'Mac', 'x64', 'WoW', _binary 0xa2dd238df367395adb4218369057e9af);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65727, 'Mac', 'x64', 'WoWC', _binary 0x6b0b37f8f3d87736fa9c82009acd0cfb);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65727, 'Win', 'A64', 'WoW', _binary 0xefab5eaac583cbf8d5b1f78e3feb7004);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65727, 'Win', 'x64', 'WoW', _binary 0xc2d8fe2ab89a557a0700b53b04b2e152);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65727, 'Win', 'x64', 'WoWC', _binary 0xc25bce27ce4dc62302fac67bb2abcf2a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65818, 'Mac', 'A64', 'WoW', _binary 0xf5f5fdb55355b846d75f9dd662859de6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65818, 'Mac', 'A64', 'WoWC', _binary 0x7c22d043962282e5ae79f4727fdd08a7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65818, 'Mac', 'x64', 'WoW', _binary 0xc9f254309ab02d4de2c69f406caadd6d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65818, 'Mac', 'x64', 'WoWC', _binary 0xd14fa35344953d9b576c776bc6d224a5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65818, 'Win', 'A64', 'WoW', _binary 0xd934e6f9fc8abbbe081ef1cbabb94de6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65818, 'Win', 'x64', 'WoW', _binary 0xf95da20b62a41fd45a4222ad20806cd6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65818, 'Win', 'x64', 'WoWC', _binary 0x31047a65186e5c9d17b73a4d38461705);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65848, 'Mac', 'A64', 'WoW', _binary 0x6045cad5a5e2c05baf489a0c29b589dd);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65848, 'Mac', 'A64', 'WoWC', _binary 0x219d0ee672094f2ed9b6e9494be34eed);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65848, 'Mac', 'x64', 'WoW', _binary 0x39d1a9118ed8cede3534613a0558ab44);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65848, 'Mac', 'x64', 'WoWC', _binary 0x5ee49caaa70bb66a83c2d51e881c1819);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65848, 'Win', 'A64', 'WoW', _binary 0x74bf726beb5ba22e855f0dc6ab72b22c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65848, 'Win', 'x64', 'WoW', _binary 0xfc91d5eb0678a0a537e68e68f92e390d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65848, 'Win', 'x64', 'WoWC', _binary 0x263884ba5e5536fd5012596f10bdc132);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65867, 'Mac', 'A64', 'WoW', _binary 0x09fa621c9c012a9a2a94d9584aa545ae);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65867, 'Mac', 'A64', 'WoWC', _binary 0x0dd10d0707ba2a0ecf88d0660d942c78);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65867, 'Mac', 'x64', 'WoW', _binary 0x2d024d99a63aa2cd7c6717d3a372cdf7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65867, 'Mac', 'x64', 'WoWC', _binary 0x7b7821fd41ab4abcf97621669167d534);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65867, 'Win', 'A64', 'WoW', _binary 0x00c8db00702c2aadaf8520d4581acae4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65867, 'Win', 'x64', 'WoW', _binary 0x2da62bb150688dcd24d757838fda7ba4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65867, 'Win', 'x64', 'WoWC', _binary 0xfa6b7796330ebc6e56f5c80b3b1e0279);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65893, 'Mac', 'A64', 'WoW', _binary 0xf3567c27e5659d41fc511230b827ecd7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65893, 'Mac', 'A64', 'WoWC', _binary 0xb90316206791aba6d47f6d6c39274f92);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65893, 'Mac', 'x64', 'WoW', _binary 0x8b885914b0d6e3855266b230e67fae5d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65893, 'Mac', 'x64', 'WoWC', _binary 0xaf95c1d91de7e6f39547591ec1cd2f84);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65893, 'Win', 'A64', 'WoW', _binary 0x324a883acf36aaeb66661e671e43f347);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65893, 'Win', 'x64', 'WoW', _binary 0x5553755b209786102b0bae410c95db89);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65893, 'Win', 'x64', 'WoWC', _binary 0xb2af8f8de1722f6cc2f0fb597b32523c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65940, 'Mac', 'A64', 'WoW', _binary 0x5a447ab7c835a4b4d5b0024340c53aa0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65940, 'Mac', 'A64', 'WoWC', _binary 0x2dd4e31bf410987c10122cfdb24ed70c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65940, 'Mac', 'x64', 'WoW', _binary 0x90fd0c84e213fa7654a543d8b5f3e9f2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65940, 'Mac', 'x64', 'WoWC', _binary 0xde5d58f115e5ed88522351d8619a1367);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65940, 'Win', 'A64', 'WoW', _binary 0xddc39f5861f0f3df9269181a1aaf1b74);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65940, 'Win', 'x64', 'WoW', _binary 0x98b935d949f5d31a99cdb6545871feb1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(65940, 'Win', 'x64', 'WoWC', _binary 0xf4eedf5c1826a90c8b65c6f823839dde);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66017, 'Mac', 'A64', 'WoW', _binary 0x3a6281bb06d98e0fe3a77e33c1b20a14);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66017, 'Mac', 'A64', 'WoWC', _binary 0x5f819cf149a8fa084138118bb6f3b6f5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66017, 'Mac', 'x64', 'WoW', _binary 0x3ebab7aa582a2dc0142686fbe1b1bc22);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66017, 'Mac', 'x64', 'WoWC', _binary 0x30b479d4d0a2ab34e0f60975d76dadbe);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66017, 'Win', 'A64', 'WoW', _binary 0x4b54e3099abdc90d87fe76c6f6705114);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66017, 'Win', 'x64', 'WoW', _binary 0xace3eabdc640da11f4e44d2e2ab62d2e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66017, 'Win', 'x64', 'WoWC', _binary 0x28494443b571597c180ef82c320324cd);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66044, 'Mac', 'A64', 'WoW', _binary 0x5bf016b4a84f9f4cd865c12ec0a06fa5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66044, 'Mac', 'A64', 'WoWC', _binary 0xb19684f437581ddf1eda5832de5f714c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66044, 'Mac', 'x64', 'WoW', _binary 0x7e8e5b5d073f28869e6d60b45574e34b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66044, 'Mac', 'x64', 'WoWC', _binary 0x1bab06776eafbf6891b246935a49f749);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66044, 'Win', 'A64', 'WoW', _binary 0xb9746f34d79c991a793193f12f0f3f42);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66044, 'Win', 'x64', 'WoW', _binary 0x32ba84e996f83aef4e9b6771fef20243);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66044, 'Win', 'x64', 'WoWC', _binary 0xac494b5b4915af8b2c870be360a81dc2);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66066, 'Mac', 'A64', 'WoW', _binary 0x9cbf3efceffefade1c6068590e9c633d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66066, 'Mac', 'A64', 'WoWC', _binary 0x37f5a699d394afb5654d0ef2d42df893);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66066, 'Mac', 'x64', 'WoW', _binary 0x43c90f4352f8962f06d13699a60850e3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66066, 'Mac', 'x64', 'WoWC', _binary 0xb1c25754b032a581d4c2e73eda58fa1c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66066, 'Win', 'A64', 'WoW', _binary 0x53cc37a17e9e38bef2701be7d3cd25e4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66066, 'Win', 'x64', 'WoW', _binary 0x5a44aeeaf2ff5f680f9ec2dacf721e11);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66066, 'Win', 'x64', 'WoWC', _binary 0xcb403b66db34dc703a318240fd733aa0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66102, 'Mac', 'A64', 'WoW', _binary 0x1f98d6a2d51d171627ff8a57f784cf99);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66102, 'Mac', 'A64', 'WoWC', _binary 0x61f4cc148b68485e601e853e4787f80b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66102, 'Mac', 'x64', 'WoW', _binary 0x8f98eb2a0e4f48dc3a707430df38a2ed);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66102, 'Mac', 'x64', 'WoWC', _binary 0x53450b13738f09e4056d29fa52bb97d1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66102, 'Win', 'A64', 'WoW', _binary 0xbb8094edf49428355cfa2b047534122a);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66102, 'Win', 'x64', 'WoW', _binary 0x9c5e4611b87738d89fe8a27c3ac3f375);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66102, 'Win', 'x64', 'WoWC', _binary 0xbde323dd7628c72bdd953a0253cff53e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66192, 'Mac', 'A64', 'WoW', _binary 0x8a6a4ff9f0aa54e6079f2e0d493b0f88);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66192, 'Mac', 'A64', 'WoWC', _binary 0x68666612063ebc72fb964e50b6813d24);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66192, 'Mac', 'x64', 'WoW', _binary 0x359d0c76f1487223d236d3776d9a4691);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66192, 'Mac', 'x64', 'WoWC', _binary 0xf0e0870a7f9bfba9aedd7fb644b5a374);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66192, 'Win', 'A64', 'WoW', _binary 0x72f1df83d5dfd2f030054b5b2b8e0f29);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66192, 'Win', 'x64', 'WoW', _binary 0xec07b9d9b8c91e1f14192af984d79ce5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66192, 'Win', 'x64', 'WoWC', _binary 0xe8a2b8edcfca47dca085d6ec1eec3471);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66198, 'Mac', 'A64', 'WoW', _binary 0x43e860dfc8eb2af312573058dd4f9f78);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66198, 'Mac', 'A64', 'WoWC', _binary 0xfb8ba2a0ad8a892e73e1f6ad8754f735);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66198, 'Mac', 'x64', 'WoW', _binary 0x4780a4c0158f7efb7ff538fb21192c9c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66198, 'Mac', 'x64', 'WoWC', _binary 0xaef62044240b9657d54ee2ed7b22a2cd);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66198, 'Win', 'A64', 'WoW', _binary 0x684faed34fa60e23854bd1673204e317);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66198, 'Win', 'x64', 'WoW', _binary 0x64c1cbf59bc8ee9b6681fcd5a5a14f7b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66198, 'Win', 'x64', 'WoWC', _binary 0x60b099c9f1ce2a2e48a99920090b3bb5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66263, 'Mac', 'A64', 'WoW', _binary 0x21ae3d9da8dd3d6835c2bbb928821d95);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66263, 'Mac', 'A64', 'WoWC', _binary 0x7a7d31c2ba2e048e04d88be613e2450f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66263, 'Mac', 'x64', 'WoW', _binary 0x9d5d0eae5f86691ab886b48a91313c40);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66263, 'Mac', 'x64', 'WoWC', _binary 0xb4d3757d691fd5c244b029e441b5d000);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66263, 'Win', 'A64', 'WoW', _binary 0xa81104f0dfa3c4ef63c25465c69afdd7);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66263, 'Win', 'x64', 'WoW', _binary 0xd411db36dc1510355b5f9bb6adb459d3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66263, 'Win', 'x64', 'WoWC', _binary 0x0754c5b79f8c25ca337e47158827190f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66337, 'Mac', 'A64', 'WoW', _binary 0xeef9108052a64b5dd11f63297443e43c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66337, 'Mac', 'A64', 'WoWC', _binary 0xa6fbfab9899d6ae4c3adae17f798d265);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66337, 'Mac', 'x64', 'WoW', _binary 0x8b13d4dcd13e77395e9b38fceaa3fcec);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66337, 'Mac', 'x64', 'WoWC', _binary 0x0e3526bf6dcfd4393d9c41d6841f8b19);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66337, 'Win', 'A64', 'WoW', _binary 0x40f91099f5a68c7736db3a36cdcd8f3e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66337, 'Win', 'x64', 'WoW', _binary 0x679204d38b88e9455769e3159e937068);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66337, 'Win', 'x64', 'WoWC', _binary 0xff6da0f5b97aebe3eb56ac2ec1c2a5db);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66384, 'Mac', 'A64', 'WoW', _binary 0x87d16f8ec6a4cba38485316a72c5a478);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66384, 'Mac', 'A64', 'WoWC', _binary 0xbf3bcb512e4ca1917de50ebec1d94043);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66384, 'Mac', 'x64', 'WoW', _binary 0xf8050a3316bb26de89759fa88c6b5beb);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66384, 'Mac', 'x64', 'WoWC', _binary 0x2609fe52c7ae7b34bbb12d20a9996ebd);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66384, 'Win', 'A64', 'WoW', _binary 0x17ec84e86461c73be691f77602f726e1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66384, 'Win', 'x64', 'WoW', _binary 0x08d2d00aef8c36b6701ec255e092e22f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66384, 'Win', 'x64', 'WoWC', _binary 0xaaf50c5d9e54868645dc62babcd17f2c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66431, 'Mac', 'A64', 'WoW', _binary 0x88daaf8ab8c7d7966c9953da6b8891d1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66431, 'Mac', 'A64', 'WoWC', _binary 0x1c8cf7074a759e2e21438177fc9f56c5);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66431, 'Mac', 'x64', 'WoW', _binary 0x7ac8f50fbdbf998b4ed2728cfe62de5d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66431, 'Mac', 'x64', 'WoWC', _binary 0xa6def2b52c483c91534bfa1ff622a694);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66431, 'Win', 'A64', 'WoW', _binary 0x76ec3154e6f38f0db788b47153f12f19);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66431, 'Win', 'x64', 'WoW', _binary 0x5cee32e409deb66cf3fbc62830fcfc5c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66431, 'Win', 'x64', 'WoWC', _binary 0xc72df90134aca394596dfb106682267c);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66527, 'Mac', 'A64', 'WoW', _binary 0xf927750f046450185d353a921e06244d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66527, 'Mac', 'A64', 'WoWC', _binary 0x475c0906f09121cb86d2b225be7f3e6b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66527, 'Mac', 'x64', 'WoW', _binary 0x22aa9b05f64b2117e941e923a5e2452b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66527, 'Mac', 'x64', 'WoWC', _binary 0xf40a1b10e7367be4b742a9e25ca93db9);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66527, 'Win', 'A64', 'WoW', _binary 0xe928e091c823f9127583959f3e688d2e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66527, 'Win', 'x64', 'WoW', _binary 0xcbae2bd108168495cce1af55f6d050b0);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66527, 'Win', 'x64', 'WoWC', _binary 0x949dd36dbb35f4fd024d8f97a5378b19);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66562, 'Mac', 'A64', 'WoW', _binary 0x68422269b293771d8ee7ef57eb8fafd4);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66562, 'Mac', 'A64', 'WoWC', _binary 0x38259127937e9e149b3be3ee3357c40d);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66562, 'Mac', 'x64', 'WoW', _binary 0xd3431c99afc2d768cc71134590bc5ec6);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66562, 'Mac', 'x64', 'WoWC', _binary 0x7084cf7ef6beb8e9ad51b4162db03801);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66562, 'Win', 'A64', 'WoW', _binary 0xb41a779f15eec97ea4843377c6338306);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66562, 'Win', 'x64', 'WoW', _binary 0xe91bd215e3a61567a75e414272af79fd);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66562, 'Win', 'x64', 'WoWC', _binary 0xf785954126005b294ffc373f2767afc1);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66666, 'Mac', 'A64', 'WoW', _binary 0x63da3bc7e84e15ee58c7503863f96c87);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66666, 'Mac', 'A64', 'WoWC', _binary 0x00c4ccab3e1ff64f400fac50f4133f0e);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66666, 'Mac', 'x64', 'WoW', _binary 0xd09cc36f366611321ce3b6e3eb1981eb);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66666, 'Mac', 'x64', 'WoWC', _binary 0x8a98c6903755fd3b4241569b76a92b3f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66666, 'Win', 'A64', 'WoW', _binary 0x5bc22f3e44f9e25c24a6ea4716a19b17);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66666, 'Win', 'x64', 'WoW', _binary 0xae2f669b86bec87f325539f9017e7338);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66666, 'Win', 'x64', 'WoWC', _binary 0xd9bd5a15ed5dcabb77823d9ad30b3e0b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66709, 'Mac', 'A64', 'WoW', _binary 0x396b922d343c50bebebfc74d30ed08c3);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66709, 'Mac', 'A64', 'WoWC', _binary 0x22d9162de5b1812997ae2103db7e0a7b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66709, 'Mac', 'x64', 'WoW', _binary 0x86d1677ae56a5e8081ff6a2da57b1d3f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66709, 'Mac', 'x64', 'WoWC', _binary 0x09fa12ba5effab4991b67c8023859a0f);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66709, 'Win', 'A64', 'WoW', _binary 0x57b21a0711347b6c331700cdb99d8062);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66709, 'Win', 'x64', 'WoW', _binary 0xa5be6d5379cadee2d78ecf1f8d2b655b);
INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES
	(66709, 'Win', 'x64', 'WoWC', _binary 0x3099082d2374a9bdbcef42b00811383a);

CREATE TABLE IF NOT EXISTS `build_executable_hash` (
  `build` int NOT NULL,
  `platform` char(4) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `executableHash` binary(20) NOT NULL,
  PRIMARY KEY (`build`,`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `build_executable_hash` (`build`, `platform`, `executableHash`) VALUES
	(5875, 'OSX', _binary 0x8d173cc381961eebabf336f5e6675b101bb513e5);
INSERT INTO `build_executable_hash` (`build`, `platform`, `executableHash`) VALUES
	(5875, 'Win', _binary 0x95edb27c7823b363cbddab56a392e7cb73fcca20);
INSERT INTO `build_executable_hash` (`build`, `platform`, `executableHash`) VALUES
	(8606, 'OSX', _binary 0xd8b0ecfe534bc1131e19bad1d4c0e813eee4994f);
INSERT INTO `build_executable_hash` (`build`, `platform`, `executableHash`) VALUES
	(8606, 'Win', _binary 0x319afaa3f2559682f9ff658be01456255f456fb1);
INSERT INTO `build_executable_hash` (`build`, `platform`, `executableHash`) VALUES
	(12340, 'OSX', _binary 0xb706d13ff2f4018839729461e3f8a0e2b5fdc034);
INSERT INTO `build_executable_hash` (`build`, `platform`, `executableHash`) VALUES
	(12340, 'Win', _binary 0xcdcbbd5188315e6b4d19449d492dbcfaf156a347);

CREATE TABLE IF NOT EXISTS `build_info` (
  `build` int NOT NULL,
  `majorVersion` int DEFAULT NULL,
  `minorVersion` int DEFAULT NULL,
  `bugfixVersion` int DEFAULT NULL,
  `hotfixVersion` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(5875, 1, 12, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(6005, 1, 12, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(6141, 1, 12, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(8606, 2, 4, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(9947, 3, 1, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(10505, 3, 2, 2, 'a');
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(11159, 3, 3, 0, 'a');
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(11403, 3, 3, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(11723, 3, 3, 3, 'a');
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(12340, 3, 3, 5, 'a');
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(13623, 4, 0, 6, 'a');
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(13930, 3, 3, 5, 'a');
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(14545, 4, 2, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(15595, 4, 3, 4, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(19116, 6, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(19243, 6, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(19342, 6, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(19702, 6, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(19802, 6, 1, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(19831, 6, 1, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(19865, 6, 1, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(20182, 6, 2, 0, 'a');
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(20201, 6, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(20216, 6, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(20253, 6, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(20338, 6, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(20444, 6, 2, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(20490, 6, 2, 2, 'a');
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(20574, 6, 2, 2, 'a');
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(20726, 6, 2, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(20779, 6, 2, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(20886, 6, 2, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(21355, 6, 2, 4, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(21463, 6, 2, 4, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(21742, 6, 2, 4, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22248, 7, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22293, 7, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22345, 7, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22410, 7, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22423, 7, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22498, 7, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22522, 7, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22566, 7, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22594, 7, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22624, 7, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22747, 7, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22810, 7, 0, 3, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22900, 7, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22908, 7, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22950, 7, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22995, 7, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(22996, 7, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(23171, 7, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(23222, 7, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(23360, 7, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(23420, 7, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(23911, 7, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(23937, 7, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(24015, 7, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(24330, 7, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(24367, 7, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(24415, 7, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(24430, 7, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(24461, 7, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(24742, 7, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(25549, 7, 3, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(25996, 7, 3, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(26124, 7, 3, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(26365, 7, 3, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(26654, 7, 3, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(26822, 7, 3, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(26899, 7, 3, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(26972, 7, 3, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(28153, 8, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(30706, 8, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(30993, 8, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(31229, 8, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(31429, 8, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(31478, 8, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(32305, 8, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(32494, 8, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(32580, 8, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(32638, 8, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(32722, 8, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(32750, 8, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(32978, 8, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(33369, 8, 3, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(33528, 8, 3, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(33724, 8, 3, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(33775, 8, 3, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(33941, 8, 3, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(34220, 8, 3, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(34601, 8, 3, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(34769, 8, 3, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(34963, 8, 3, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(35249, 8, 3, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(35284, 8, 3, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(35435, 8, 3, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(35662, 8, 3, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(36753, 9, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(36839, 9, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(36949, 9, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(37142, 9, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(37176, 9, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(37474, 9, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(38134, 9, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(38556, 9, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(39653, 9, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(39804, 9, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(40000, 9, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(40120, 9, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(40443, 9, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(40593, 9, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(40725, 9, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(40906, 9, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(40944, 9, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(40966, 9, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(41031, 9, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(41079, 9, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(41288, 9, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(41323, 9, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(41359, 9, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(41488, 9, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(41793, 9, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(42010, 9, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(42423, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(42488, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(42521, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(42538, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(42560, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(42614, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(42698, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(42825, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(42852, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(42937, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(42979, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(43114, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(43206, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(43340, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(43345, 9, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(43971, 9, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(44015, 9, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(44061, 9, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(44127, 9, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(44232, 9, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(44325, 9, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(44730, 9, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(44908, 9, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(45114, 9, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(45161, 9, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(45338, 9, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(45745, 9, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(46479, 10, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(46658, 10, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(46689, 10, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(46702, 10, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(46741, 10, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(46801, 10, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(46879, 10, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(46924, 10, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(47067, 10, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(47187, 10, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(47213, 10, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(47631, 10, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(47777, 10, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(47799, 10, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(47825, 10, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(47849, 10, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(47871, 10, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(47884, 10, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(47936, 10, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(47967, 10, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(48001, 10, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(48069, 10, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(48317, 10, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(48397, 10, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(48526, 10, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(48676, 10, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(48749, 10, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(48838, 10, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(48865, 10, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(48892, 10, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(48966, 10, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(48999, 10, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(49267, 10, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(49318, 10, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(49343, 10, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(49407, 10, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(49426, 10, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(49444, 10, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(49474, 10, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(49570, 10, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(49679, 10, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(49741, 10, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(49801, 10, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(49890, 10, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(50000, 10, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(50401, 10, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(50438, 10, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(50467, 10, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(50469, 10, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(50504, 10, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(50585, 10, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(50622, 10, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(50747, 10, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(50791, 10, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(51130, 10, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(51187, 10, 1, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(51237, 10, 1, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(51261, 10, 1, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(51313, 10, 1, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(51421, 10, 1, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(51485, 10, 1, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(51536, 10, 1, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(51754, 10, 1, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(51886, 10, 1, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(51972, 10, 1, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52038, 10, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52068, 10, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52095, 10, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52106, 10, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52129, 10, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52148, 10, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52188, 10, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52301, 10, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52393, 10, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52485, 10, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52545, 10, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52607, 10, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52649, 10, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52808, 10, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52902, 10, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52968, 10, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(52983, 10, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(53007, 10, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(53040, 10, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(53104, 10, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(53162, 10, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(53212, 10, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(53262, 10, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(53441, 10, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(53584, 10, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(53840, 10, 2, 6, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(53877, 10, 2, 6, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(53913, 10, 2, 6, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(53989, 10, 2, 6, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54070, 10, 2, 6, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54205, 10, 2, 6, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54358, 10, 2, 6, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54499, 10, 2, 6, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54577, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54601, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54604, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54630, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54673, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54717, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54736, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54762, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54847, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54904, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(54988, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55142, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55165, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55261, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55461, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55664, 10, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55666, 11, 0, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55792, 11, 0, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55793, 11, 0, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55818, 11, 0, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55824, 11, 0, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55846, 11, 0, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55933, 11, 0, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55939, 11, 0, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55959, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(55960, 11, 0, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56008, 11, 0, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56110, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56162, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56196, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56263, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56288, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56311, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56313, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56380, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56382, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56421, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56461, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56513, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56625, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56647, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(56819, 11, 0, 2, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(57292, 11, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(57388, 11, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(57534, 11, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(57637, 11, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(57689, 11, 0, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(58123, 11, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(58162, 11, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(58187, 11, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(58238, 11, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(58533, 11, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(58608, 11, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(58630, 11, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(58680, 11, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(58773, 11, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(58867, 11, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(58911, 11, 0, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(59347, 11, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(59425, 11, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(59466, 11, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(59679, 11, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(60037, 11, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(60257, 11, 1, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(60392, 11, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(60428, 11, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(60490, 11, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(60568, 11, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(61265, 11, 1, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(61491, 11, 1, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(61559, 11, 1, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(61609, 11, 1, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(61967, 11, 1, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(62213, 11, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(62417, 11, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(62438, 11, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(62493, 11, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(62876, 11, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(63305, 11, 2, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(63506, 11, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(63660, 11, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(63704, 11, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(64270, 11, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(64502, 11, 2, 5, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(64877, 11, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(64978, 11, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(65299, 11, 2, 7, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(65560, 12, 0, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(65655, 12, 0, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(65727, 12, 0, 0, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(65818, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(65848, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(65867, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(65893, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(65940, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(66017, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(66044, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(66066, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(66102, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(66192, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(66198, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(66263, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(66337, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(66384, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(66431, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(66527, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(66562, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(66666, 12, 0, 1, NULL);
INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES
	(66709, 12, 0, 1, NULL);

CREATE TABLE IF NOT EXISTS `character_instance` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `instance` int unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint unsigned NOT NULL DEFAULT '0',
  `extendState` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_instance` (`guid`, `instance`, `permanent`, `extendState`) VALUES
	(3, 2, 0, 1);
INSERT INTO `character_instance` (`guid`, `instance`, `permanent`, `extendState`) VALUES
	(7, 3, 0, 1);
INSERT INTO `character_instance` (`guid`, `instance`, `permanent`, `extendState`) VALUES
	(16, 1, 0, 1);
INSERT INTO `character_instance` (`guid`, `instance`, `permanent`, `extendState`) VALUES
	(16, 5, 0, 1);

DELIMITER //
CREATE DEFINER=`root`@`localhost` EVENT `collecting_battle_pets` ON SCHEDULE EVERY 30 SECOND STARTS '2025-11-08 13:52:26' ON COMPLETION NOT PRESERVE ENABLE DO INSERT INTO auth.battle_pets (
    guid,
    battlenetAccountId,
    species,
    breed,
    displayId,
    level,
    exp,
    health,
    quality,
    flags,
    name,
    nameTimestamp,
    owner,
    ownerRealmId
)
SELECT
    (SELECT IFNULL(MAX(auth.battle_pets.guid), 0) FROM auth.battle_pets) + ROW_NUMBER() OVER () AS guid,
    auth.account.battlenet_account AS battlenetAccountId,
    auth.collecting_battle_pets.species,
    auth.collecting_battle_pets.breed,
    auth.collecting_battle_pets.displayId,
    auth.collecting_battle_pets.level,
    auth.collecting_battle_pets.exp,
    auth.collecting_battle_pets.health,
    auth.collecting_battle_pets.quality,
    auth.collecting_battle_pets.flags,
    auth.collecting_battle_pets.name,
    auth.collecting_battle_pets.nameTimestamp,
    auth.collecting_battle_pets.owner,
    auth.collecting_battle_pets.ownerRealmId
FROM auth.collecting_battle_pets
JOIN characters.characters
    ON 1=1
JOIN auth.account
    ON auth.account.id = characters.characters.account
LEFT JOIN characters.character_achievement
    ON auth.collecting_battle_pets.achievement = characters.character_achievement.achievement
   AND characters.character_achievement.guid = characters.characters.guid
LEFT JOIN characters.character_queststatus_rewarded
    ON auth.collecting_battle_pets.quest = characters.character_queststatus_rewarded.quest
   AND characters.character_queststatus_rewarded.guid = characters.characters.guid
LEFT JOIN characters.character_spell
    ON auth.collecting_battle_pets.spell = characters.character_spell.spell
   AND characters.character_spell.guid = characters.characters.guid
LEFT JOIN auth.battle_pets
    ON auth.battle_pets.species = auth.collecting_battle_pets.species
   AND auth.battle_pets.battlenetAccountId = auth.account.battlenet_account
WHERE auth.battle_pets.species IS NULL
  AND (
        (
            (IF(auth.collecting_battle_pets.quest IS NOT NULL, 1, 0)
           + IF(auth.collecting_battle_pets.achievement IS NOT NULL, 1, 0)
           + IF(auth.collecting_battle_pets.spell IS NOT NULL, 1, 0))
        )
        =
        (
            (IF(characters.character_queststatus_rewarded.quest IS NOT NULL, 1, 0)
           + IF(characters.character_achievement.achievement IS NOT NULL, 1, 0)
           + IF(characters.character_spell.spell IS NOT NULL, 1, 0))
        )
      )
  AND (
        (auth.collecting_battle_pets.quest IS NOT NULL
         OR auth.collecting_battle_pets.achievement IS NOT NULL
         OR auth.collecting_battle_pets.spell IS NOT NULL)
      )//
DELIMITER ;

CREATE TABLE IF NOT EXISTS `collecting_battle_pets` (
  `species` int NOT NULL,
  `breed` smallint NOT NULL,
  `displayId` int NOT NULL DEFAULT '0',
  `level` smallint NOT NULL DEFAULT '1',
  `exp` smallint NOT NULL DEFAULT '0',
  `health` int NOT NULL DEFAULT '1',
  `quality` tinyint NOT NULL DEFAULT '0',
  `flags` smallint NOT NULL DEFAULT '0',
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nameTimestamp` bigint NOT NULL DEFAULT '0',
  `owner` bigint DEFAULT NULL,
  `ownerRealmId` int DEFAULT NULL,
  `achievement` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spell` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `npc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(374, 12, 42906, 2, 0, 189, 0, 0, '', 0, NULL, NULL, '776', NULL, '125610', '(Black Lamb) Agneau noir 60649', '(Elwynn Forest) (Forêt d\'Elwynn) 12');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(424, 12, 2177, 6, 0, 467, 3, 0, '', 0, NULL, NULL, '780', NULL, '125610', '(Roach) (Blatte) 61169', '(Redridge Mountains) (Les Carmines) 44');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(459, 3, 5585, 2, 0, 183, 1, 0, '', 0, NULL, NULL, '776', NULL, '125610', '(Cat) (Chat) 62019', '(Elwynn Forest) (Forêt d\'Elwynn) 12');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(386, 3, 1072, 4, 0, 321, 3, 0, '', 0, NULL, NULL, '802', NULL, '125610', '(Prairie Dog) (Chien de prairie) 61141', '(Westfall) (Marche de l\'Ouest) 40');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(401, 3, 32789, 9, 0, 627, 3, 0, '', 0, NULL, NULL, '781', NULL, '125610', '(Strand Crab) (Crabe des rivages) 61312', '(Northern Stranglethorn) (Strangleronce septentrionale) 33');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(388, 3, 45880, 4, 0, 280, 0, 0, '', 0, NULL, NULL, '802', NULL, '125610', '(Shore Crab) (Crabe du rivage) 61158', '(Westfall) (Marche de l\'Ouest) 40');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(379, 3, 134, 1, 0, 147, 1, 0, '', 0, NULL, NULL, NULL, NULL, '125610', '(Squirrel) (Écureuil) 61081', '(Stormwind City) (Hurlevent) 1519');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(447, 3, 654, 2, 0, 202, 2, 0, '', 0, NULL, NULL, '776', NULL, '125610', '(Fawn) (Faon) 61165', '(Elwynn Forest) (Forêt d\'Elwynn) 12');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(406, 3, 7511, 9, 0, 505, 0, 0, '', 0, NULL, NULL, '781', NULL, '125610', '(Beetle) (Hanneton) 61319', '(Northern Stranglethorn) (Strangleronce septentrionale) 33');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(396, 11, 2536, 7, 0, 385, 1, 0, '', 0, NULL, NULL, '778', NULL, '125610', '(Dusk Spiderling) (Jeune araignée de la pénombre) 61253', '(Duskwood) (Bois de la Pénombre) 10');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(407, 3, 44816, 9, 0, 505, 2, 0, '', 0, NULL, NULL, '781', NULL, '125610', '(Forest Spiderling) (Jeune araignée forestière) 61320', '(Northern Stranglethorn) (Strangleronce septentrionale) 33');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(408, 3, 36583, 9, 0, 568, 3, 0, '', 0, NULL, NULL, '781', NULL, '125610', '(Lizard Hatchling) (Jeune lézard) 61321', '(Northern Stranglethorn) (Strangleronce septentrionale) 33');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(400, 3, 35424, 7, 0, 363, 0, 0, '', 0, NULL, NULL, '778', NULL, '125610', '(Widow Spiderling) (Jeune veuve) 61259', '(Duskwood) (Bois de la Pénombre) 10');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(378, 3, 328, 1, 0, 143, 0, 0, '', 0, NULL, NULL, NULL, NULL, '125610', '(Rabbit) (Lapin) 61080', '(Stormwind City) (Hurlevent) 1519');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(391, 3, 328, 6, 0, 381, 1, 0, '', 0, NULL, NULL, '780', NULL, '125610', '(Mountain Cottontail) (Lapin des montagnes) 61167', '(Redridge Mountains) (Les Carmines) 44');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(389, 3, 41886, 4, 0, 298, 1, 0, '', 0, NULL, NULL, '802', NULL, '125610', '(Tiny Harvester) (Minuscule moissonneur) 61160', '(Westfall) (Marche de l\'Ouest) 40');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(397, 3, 16633, 7, 0, 487, 3, 0, '', 0, NULL, NULL, '778', NULL, '125610', '(Skunk) (Mouffette) 61255', '(Duskwood) (Bois de la Pénombre) 10');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(1160, 8, 46941, 18, 0, 865, 0, 0, '', 0, NULL, NULL, '777', NULL, '125610', '(Arcane Eye) (Œil arcanique) 68819', '(Deadwind Pass) (Défilé de Deuillevent) 41');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(395, 3, 41887, 6, 0, 370, 0, 0, '', 0, NULL, NULL, '780', NULL, '125610', '(Fledgling Buzzard) (Petite buse) 61171', '(Redridge Mountains) (Les Carmines) 44');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(419, 3, 6297, 2, 0, 217, 3, 0, '', 0, NULL, NULL, '776', NULL, '125610', '(Small Frog) (Petite grenouille) 61071', '(Elwynn Forest) (Forêt d\'Elwynn) 12');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(439, 9, 45917, 18, 0, 1031, 1, 0, '', 0, NULL, NULL, '777', NULL, '125610', '(Restless Shadeling) (Petite ombre sans repos) 61375', '(Deadwind Pass) (Défilé de Deuillevent) 41');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(421, 3, 36671, 9, 0, 521, 1, 0, '', 0, NULL, NULL, '781', NULL, '125610', '(Crimson Moth) (Phalène cramoisi) 61314', '(Northern Stranglethorn) (Strangleronce septentrionale) 33');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(409, 10, 42509, 9, 0, 433, 0, 0, '', 0, NULL, NULL, '781', NULL, '125610', 'Polly 61322', '(Northern Stranglethorn) (Strangleronce septentrionale) 33');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(646, 3, 304, 2, 0, 185, 0, 0, '', 0, NULL, NULL, '776', NULL, '125610', '(Chicken) (Poulet) 62664', '(Elwynn Forest) (Forêt d\'Elwynn) 12');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(405, 3, 36578, 9, 0, 496, 1, 0, '', 0, NULL, NULL, '781', NULL, '125610', '(Tree Python) (Python des arbres) 61318', '(Northern Stranglethorn) (Strangleronce septentrionale) 33');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(675, 3, 1141, 1, 0, 151, 2, 0, '', 0, NULL, NULL, NULL, NULL, '125610', '(Stormwind Rat) (Rat de Hurlevent) 62954', '(Stormwind City) (Hurlevent) 1519');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(392, 3, 1141, 6, 0, 406, 2, 0, '', 0, NULL, NULL, '780', NULL, '125610', '(Redridge Rat) (Rat des Carmines) 61168', '(Redridge Mountains) (Les Carmines) 44');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(398, 3, 1141, 7, 0, 398, 0, 0, '', 0, NULL, NULL, '778', NULL, '125610', '(Black Rat) (Rat noir) 61257', '(Duskwood) (Bois de la Pénombre) 10');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(387, 3, 1206, 4, 0, 260, 0, 0, '', 0, NULL, NULL, '802', NULL, '125610', '(Snake) (Serpent) 61142', '(Westfall) (Marche de l\'Ouest) 40');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(399, 3, 3126, 7, 0, 436, 2, 0, '', 0, NULL, NULL, '778', NULL, '125610', '(Rat Snake) (Serpent ratier) 61258', '(Duskwood) (Bois de la Pénombre) 10');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(385, 3, 4959, 4, 0, 304, 2, 0, '', 0, NULL, NULL, '802', NULL, '125610', '(Mouse) (Souris) 61143', '(Westfall) (Marche de l\'Ouest) 40');
INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES
	(404, 3, 4959, 9, 0, 559, 2, 0, '', 0, NULL, NULL, '781', NULL, '125610', '(Long-tailed Mole) (Taupe à longue queue) 61317', '(Northern Stranglethorn) (Strangleronce septentrionale) 33');

CREATE TABLE IF NOT EXISTS `group_instance` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `instance` int unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `instance_reset` (
  `mapid` smallint unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `resettime` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`mapid`,`difficulty`),
  KEY `difficulty` (`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(33, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(36, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(249, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(249, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(269, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(409, 9, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(469, 9, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(509, 3, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(531, 9, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(532, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(533, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(533, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(534, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(540, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(542, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(543, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(544, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(545, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(546, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(547, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(548, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(550, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(552, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(553, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(554, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(555, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(556, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(557, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(558, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(560, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(564, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(564, 33, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(565, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(568, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(574, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(575, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(576, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(578, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(580, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(585, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(595, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(598, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(599, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(600, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(601, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(602, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(603, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(603, 33, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(604, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(608, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(615, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(615, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(616, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(616, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(619, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(624, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(624, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(631, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(631, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(631, 5, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(631, 6, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(632, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(643, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(644, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(645, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(649, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(649, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(649, 5, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(649, 6, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(650, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(657, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(658, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(668, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(669, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(669, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(669, 5, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(669, 6, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(670, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(671, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(671, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(671, 5, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(671, 6, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(720, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(720, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(720, 33, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(724, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(724, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(724, 5, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(724, 6, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(725, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(754, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(754, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(754, 5, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(754, 6, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(755, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(757, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(757, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(859, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(938, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(939, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(940, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(959, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(960, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(961, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(962, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(967, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(967, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(967, 5, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(967, 6, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(967, 7, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(994, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(996, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(996, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(996, 5, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(996, 6, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(996, 7, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1001, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1004, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1007, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1008, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1008, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1008, 5, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1008, 6, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1008, 7, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1009, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1009, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1009, 5, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1009, 6, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1009, 7, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1011, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1098, 3, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1098, 4, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1098, 5, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1098, 6, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1098, 7, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1136, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1136, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1136, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1136, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1175, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1175, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1176, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1176, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1182, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1182, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1195, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1195, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1205, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1205, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1205, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1205, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1208, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1208, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1209, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1209, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1228, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1228, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1228, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1228, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1279, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1279, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1358, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1358, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1448, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1448, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1448, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1448, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1456, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1456, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1458, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1458, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1466, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1466, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1477, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1477, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1492, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1492, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1493, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1493, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1501, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1501, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1516, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1520, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1520, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1520, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1520, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1530, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1530, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1530, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1530, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1544, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1544, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1571, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1594, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1594, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1648, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1648, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1648, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1648, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1651, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1676, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1676, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1676, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1676, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1677, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1677, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1712, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1712, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1712, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1712, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1753, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1753, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1754, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1754, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1762, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1762, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1763, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1763, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1771, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1771, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1822, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1822, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1841, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1841, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1861, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1861, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1861, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1861, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1862, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1862, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1864, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1864, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1877, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(1877, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2070, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2070, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2070, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2070, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2096, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2096, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2096, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2096, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2097, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2164, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2164, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2164, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2164, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2217, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2217, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2217, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2217, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2233, 2, 1671073200);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2235, 151, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2284, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2285, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2286, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2287, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2289, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2290, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2291, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2293, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2296, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2296, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2296, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2296, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2441, 23, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2450, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2450, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2450, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2450, 17, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2481, 14, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2481, 15, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2481, 16, 1671246000);
INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES
	(2481, 17, 1671246000);

CREATE TABLE IF NOT EXISTS `instance_scenario_progress` (
  `id` int unsigned NOT NULL,
  `criteria` int unsigned NOT NULL,
  `counter` bigint unsigned NOT NULL,
  `date` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `ip_banned` (
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `bandate` int unsigned NOT NULL,
  `unbandate` int unsigned NOT NULL,
  `bannedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Banned IPs';


CREATE TABLE IF NOT EXISTS `logs` (
  `time` int unsigned NOT NULL,
  `realm` int unsigned NOT NULL,
  `type` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `string` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `logs_ip_actions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique Identifier',
  `account_id` int unsigned NOT NULL COMMENT 'Account ID',
  `character_guid` bigint unsigned NOT NULL COMMENT 'Character Guid',
  `realm_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Realm ID',
  `type` tinyint unsigned NOT NULL,
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `systemnote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Notes inserted by system',
  `unixtime` int unsigned NOT NULL COMMENT 'Unixtime',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Allows users to add a comment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Used to log ips of individual actions';


CREATE TABLE IF NOT EXISTS `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `payment_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `payer_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `payer_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `amount` float(10,2) NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `coins_claimed` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;


CREATE TABLE IF NOT EXISTS `quest_objectives_completion_effect` (
  `ObjectiveID` int NOT NULL,
  `GameEventID` int DEFAULT NULL,
  `SpellID` int DEFAULT NULL,
  `ConversationID` int DEFAULT NULL,
  `UpdatePhaseShift` tinyint(1) DEFAULT '0',
  `UpdateZoneAuras` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ObjectiveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `rbac_account_permissions` (
  `accountId` int unsigned NOT NULL COMMENT 'Account id',
  `permissionId` int unsigned NOT NULL COMMENT 'Permission id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`permissionId`,`realmId`),
  KEY `fk__rbac_account_roles__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_account_permissions__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_roles__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account-Permission relation';


CREATE TABLE IF NOT EXISTS `rbac_default_permissions` (
  `secId` int unsigned NOT NULL COMMENT 'Security Level id',
  `permissionId` int unsigned NOT NULL COMMENT 'permission id',
  `realmId` int NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`secId`,`permissionId`,`realmId`),
  KEY `fk__rbac_default_permissions__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_default_permissions__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Default permission to assign to different account security levels';

INSERT INTO `rbac_default_permissions` (`secId`, `permissionId`, `realmId`) VALUES
	(0, 195, -1);
INSERT INTO `rbac_default_permissions` (`secId`, `permissionId`, `realmId`) VALUES
	(1, 194, -1);
INSERT INTO `rbac_default_permissions` (`secId`, `permissionId`, `realmId`) VALUES
	(2, 193, -1);
INSERT INTO `rbac_default_permissions` (`secId`, `permissionId`, `realmId`) VALUES
	(3, 192, -1);

CREATE TABLE IF NOT EXISTS `rbac_linked_permissions` (
  `id` int unsigned NOT NULL COMMENT 'Permission id',
  `linkedId` int unsigned NOT NULL COMMENT 'Linked Permission id',
  PRIMARY KEY (`id`,`linkedId`),
  KEY `fk__rbac_linked_permissions__rbac_permissions1` (`id`),
  KEY `fk__rbac_linked_permissions__rbac_permissions2` (`linkedId`),
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions1` FOREIGN KEY (`id`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions2` FOREIGN KEY (`linkedId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Permission - Linked Permission relation';

INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 21);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 42);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 43);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 193);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 196);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 776);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 778);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 779);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 780);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 781);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 782);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 783);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 784);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 785);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 786);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 787);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 788);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 789);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 790);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 791);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 792);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 793);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 794);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 795);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 796);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 835);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 844);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 845);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 846);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 847);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 848);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 849);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 850);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 851);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 853);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(192, 854);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 48);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 194);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 197);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 1003);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 1004);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 1360);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 1361);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 1362);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 1363);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 1364);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 1365);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 1398);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 1589);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 2101);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 2102);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 2103);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 2104);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 2105);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 2106);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 2107);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 2108);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 2109);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 2110);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 2111);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 2112);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(193, 3004);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 1);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 2);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 9);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 11);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 12);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 13);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 14);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 15);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 16);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 17);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 18);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 19);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 20);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 22);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 23);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 25);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 26);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 27);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 28);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 29);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 30);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 31);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 32);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 33);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 34);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 35);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 36);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 37);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 38);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 39);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 40);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 41);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 44);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 46);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 47);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 51);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 195);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 198);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 632);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(194, 798);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(195, 3);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(195, 4);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(195, 5);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(195, 6);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(195, 24);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(195, 49);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(195, 199);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 7);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 10);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 202);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 203);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 204);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 205);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 206);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 208);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 212);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 213);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 214);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 215);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 216);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 226);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 227);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 230);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 231);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 233);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 234);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 235);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 238);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 239);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 240);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 241);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 242);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 243);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 244);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 245);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 246);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 247);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 248);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 249);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 250);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 251);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 252);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 253);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 254);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 255);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 256);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 257);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 258);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 259);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 260);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 261);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 262);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 264);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 265);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 266);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 267);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 268);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 269);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 270);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 271);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 272);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 279);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 280);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 283);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 287);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 288);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 289);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 290);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 291);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 292);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 293);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 294);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 295);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 296);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 297);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 298);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 299);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 302);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 303);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 304);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 305);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 306);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 309);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 310);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 314);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 319);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 320);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 321);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 322);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 323);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 324);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 325);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 326);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 327);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 328);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 329);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 330);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 331);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 335);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 336);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 337);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 339);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 340);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 341);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 342);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 343);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 344);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 345);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 346);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 347);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 348);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 349);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 350);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 351);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 352);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 353);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 354);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 355);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 356);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 357);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 358);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 359);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 360);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 361);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 362);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 363);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 364);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 365);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 366);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 373);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 375);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 400);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 401);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 402);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 403);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 404);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 405);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 406);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 407);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 417);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 418);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 419);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 420);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 421);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 422);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 423);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 424);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 425);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 426);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 427);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 428);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 429);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 434);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 435);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 436);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 437);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 438);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 439);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 440);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 441);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 442);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 443);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 444);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 445);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 446);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 447);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 448);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 449);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 450);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 451);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 452);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 453);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 454);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 455);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 456);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 457);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 458);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 459);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 460);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 461);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 463);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 464);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 465);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 472);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 473);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 474);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 475);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 476);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 477);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 478);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 488);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 489);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 491);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 492);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 493);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 495);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 497);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 498);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 499);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 500);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 502);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 503);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 505);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 508);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 511);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 513);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 514);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 516);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 519);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 522);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 523);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 526);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 527);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 529);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 530);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 533);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 535);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 536);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 537);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 538);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 539);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 540);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 541);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 556);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 581);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 582);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 592);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 593);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 596);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 602);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 603);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 604);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 605);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 606);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 607);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 608);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 609);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 610);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 611);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 612);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 613);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 615);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 616);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 617);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 618);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 619);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 620);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 621);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 623);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 624);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 625);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 626);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 627);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 628);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 629);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 630);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 631);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 633);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 634);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 635);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 636);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 637);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 638);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 639);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 640);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 641);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 642);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 643);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 644);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 645);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 646);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 647);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 648);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 649);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 650);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 651);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 652);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 653);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 654);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 655);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 656);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 657);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 658);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 659);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 660);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 661);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 663);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 665);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 666);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 667);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 668);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 669);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 670);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 671);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 672);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 673);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 674);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 675);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 676);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 677);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 678);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 679);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 680);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 681);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 682);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 683);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 684);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 685);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 686);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 687);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 688);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 689);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 690);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 691);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 693);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 694);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 695);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 696);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 697);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 698);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 699);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 700);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 701);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 702);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 703);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 704);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 707);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 708);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 709);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 710);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 711);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 712);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 713);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 714);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 715);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 716);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 717);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 718);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 719);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 721);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 722);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 723);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 724);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 725);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 726);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 727);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 728);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 729);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 730);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 733);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 734);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 735);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 736);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 738);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 739);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 753);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 757);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 773);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 777);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 809);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 817);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 825);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 829);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 830);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 831);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 832);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 833);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 836);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 837);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 838);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 839);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 840);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 842);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 843);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 852);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 866);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 869);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 870);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 871);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 872);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 873);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 875);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 876);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 877);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 878);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 879);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 880);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 881);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 882);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(196, 883);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 232);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 236);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 237);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 273);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 274);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 275);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 276);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 277);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 284);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 285);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 286);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 301);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 311);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 387);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 388);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 389);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 390);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 391);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 392);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 393);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 394);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 395);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 396);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 397);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 398);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 399);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 479);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 480);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 481);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 482);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 485);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 486);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 487);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 494);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 501);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 506);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 509);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 510);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 517);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 518);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 521);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 542);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 543);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 550);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 558);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 568);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 571);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 572);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 573);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 574);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 575);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 576);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 577);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 578);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 579);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 580);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 583);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 584);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 585);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 586);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 587);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 588);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 589);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 590);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 591);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 594);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 595);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 601);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 761);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 762);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 763);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 764);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 765);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 766);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 767);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 768);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 769);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 770);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 771);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 772);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 774);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 775);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 805);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 811);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 813);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 819);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 821);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 827);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 856);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 857);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 858);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 859);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 860);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(197, 865);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 218);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 300);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 312);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 315);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 316);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 317);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 318);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 367);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 368);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 369);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 370);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 371);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 372);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 374);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 376);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 377);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 408);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 409);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 410);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 411);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 412);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 413);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 414);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 415);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 430);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 431);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 432);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 433);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 462);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 466);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 467);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 468);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 469);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 470);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 471);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 483);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 484);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 490);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 504);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 512);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 515);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 520);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 524);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 528);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 531);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 532);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 544);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 545);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 547);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 548);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 549);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 551);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 552);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 553);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 554);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 555);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 557);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 559);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 560);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 561);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 562);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 563);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 564);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 565);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 566);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 567);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 569);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 570);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 597);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 598);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 599);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 600);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 737);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 740);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 741);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 742);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 802);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 803);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 804);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 806);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 807);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 808);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 810);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 812);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 814);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 815);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 816);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 818);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 820);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 822);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 823);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 824);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 826);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 828);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 855);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(198, 868);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 207);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 209);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 210);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 211);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 217);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 221);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 222);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 223);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 225);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 263);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 378);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 379);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 380);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 496);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 507);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 525);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 534);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 797);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1002);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1005);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1006);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1008);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1009);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1010);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1011);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1012);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1013);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1014);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1015);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1016);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1017);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1018);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1019);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1020);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
	(199, 1021);

CREATE TABLE IF NOT EXISTS `rbac_permissions` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Permission id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Permission name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Permission List';

INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1, 'Instant logout');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(2, 'Skip Queue');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(3, 'Join Normal Battleground');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(4, 'Join Random Battleground');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(5, 'Join Arenas');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(6, 'Join Dungeon Finder');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(7, 'Skip idle connection check');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(8, 'Cannot earn achievements');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(9, 'Cannot earn realm first achievements');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(10, 'Use character templates');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(11, 'Log GM trades');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(12, 'Skip character creation demon hunter min level check');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(13, 'Skip Instance required bosses check');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(14, 'Skip character creation team mask check');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(15, 'Skip character creation class mask check');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(16, 'Skip character creation race mask check');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(17, 'Skip character creation reserved name check');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(18, 'Skip character creation death knight min level check');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(19, 'Skip needed requirements to use channel check');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(20, 'Skip disable map check');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(21, 'Skip reset talents when used more than allowed check');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(22, 'Skip spam chat check');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(23, 'Skip over-speed ping check');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(24, 'Two side faction characters on the same account');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(25, 'Allow say chat between factions');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(26, 'Allow channel chat between factions');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(27, 'Two side mail interaction');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(28, 'See two side who list');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(29, 'Add friends of other faction');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(30, 'Save character without delay with .save command');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(31, 'Use params with .unstuck command');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(32, 'Can be assigned tickets with .assign ticket command');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(33, 'Notify if a command was not found');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(34, 'Check if should appear in list using .gm ingame command');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(35, 'See all security levels with who command');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(36, 'Filter whispers');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(37, 'Use staff badge in chat');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(38, 'Resurrect with full Health Points');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(39, 'Restore saved gm setting states');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(40, 'Allows to add a gm to friend list');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(41, 'Use Config option START_GM_LEVEL to assign new character level');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(42, 'Allows to use CMSG_WORLD_TELEPORT opcode');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(43, 'Allows to use CMSG_WHOIS opcode');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(44, 'Receive global GM messages/texts');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(45, 'Join channels without announce');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(46, 'Change channel settings without being channel moderator');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(47, 'Enables lower security than target check');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(48, 'Enable IP, Last Login and EMail output in pinfo');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(49, 'Forces to enter the email for confirmation on password change');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(50, 'Allow user to check his own email with .account');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(51, 'Allow trading between factions');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(192, 'Role: Sec Level Administrator');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(193, 'Role: Sec Level Gamemaster');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(194, 'Role: Sec Level Moderator');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(195, 'Role: Sec Level Player');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(196, 'Role: Administrator Commands');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(197, 'Role: Gamemaster Commands');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(198, 'Role: Moderator Commands');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(199, 'Role: Player Commands');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(200, 'Command: rbac');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(201, 'Command: rbac account');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(202, 'Command: rbac account list');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(203, 'Command: rbac account grant');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(204, 'Command: rbac account deny');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(205, 'Command: rbac account revoke');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(206, 'Command: rbac list');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(207, 'Command: battlenetaccount');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(208, 'Command: battlenetaccount create');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(209, 'Command: battlenetaccount lock country');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(210, 'Command: battlenetaccount lock ip');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(211, 'Command: battlenetaccount password');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(212, 'Command: battlenetaccount set');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(213, 'Command: battlenetaccount set password');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(214, 'Command: bnetaccount link');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(215, 'Command: bnetaccount unlink');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(216, 'Command: bnetaccount gameaccountcreate');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(217, 'Command: account');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(218, 'Command: account addon');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(219, 'Command: account create');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(220, 'Command: account delete');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(221, 'Command: account lock');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(222, 'Command: account lock country');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(223, 'Command: account lock ip');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(224, 'Command: account onlinelist');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(225, 'Command: account password');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(226, 'Command: account set');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(227, 'Command: account set addon');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(228, 'Command: account set gmlevel');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(229, 'Command: account set password');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(230, 'Command: achievement');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(231, 'Command: achievement add');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(232, 'Command: arena');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(233, 'Command: arena captain');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(234, 'Command: arena create');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(235, 'Command: arena disband');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(236, 'Command: arena info');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(237, 'Command: arena lookup');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(238, 'Command: arena rename');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(239, 'Command: ban');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(240, 'Command: ban account');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(241, 'Command: ban character');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(242, 'Command: ban ip');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(243, 'Command: ban playeraccount');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(244, 'Command: baninfo');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(245, 'Command: baninfo account');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(246, 'Command: baninfo character');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(247, 'Command: baninfo ip');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(248, 'Command: banlist');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(249, 'Command: banlist account');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(250, 'Command: banlist character');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(251, 'Command: banlist ip');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(252, 'Command: unban');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(253, 'Command: unban account');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(254, 'Command: unban character');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(255, 'Command: unban ip');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(256, 'Command: unban playeraccount');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(257, 'Command: bf');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(258, 'Command: bf start');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(259, 'Command: bf stop');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(260, 'Command: bf switch');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(261, 'Command: bf timer');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(262, 'Command: bf enable');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(263, 'Command: account email');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(264, 'Command: account set sec');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(265, 'Command: account set sec email');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(266, 'Command: account set sec regmail');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(267, 'Command: cast');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(268, 'Command: cast back');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(269, 'Command: cast dist');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(270, 'Command: cast self');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(271, 'Command: cast target');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(272, 'Command: cast dest');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(273, 'Command: character');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(274, 'Command: character customize');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(275, 'Command: character changefaction');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(276, 'Command: character changerace');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(277, 'Command: character deleted');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(279, 'Command: character deleted list');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(280, 'Command: character deleted restore');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(283, 'Command: character level');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(284, 'Command: character rename');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(285, 'Command: character reputation');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(286, 'Command: character titles');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(287, 'Command: levelup');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(288, 'Command: pdump');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(289, 'Command: pdump load');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(290, 'Command: pdump write');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(291, 'Command: cheat');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(292, 'Command: cheat casttime');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(293, 'Command: cheat cooldown');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(294, 'Command: cheat explore');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(295, 'Command: cheat god');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(296, 'Command: cheat power');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(297, 'Command: cheat status');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(298, 'Command: cheat taxi');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(299, 'Command: cheat waterwalk');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(300, 'Command: debug');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(301, 'Command: debug anim');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(302, 'Command: debug areatriggers');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(303, 'Command: debug arena');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(304, 'Command: debug bg');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(305, 'Command: debug entervehicle');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(306, 'Command: debug getitemstate');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(309, 'Command: debug combat');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(310, 'Command: debug itemexpire');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(311, 'Command: debug lootrecipient');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(312, 'Command: debug los');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(314, 'Command: debug moveflags');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(315, 'Command: debug play');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(316, 'Command: debug play cinematics');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(317, 'Command: debug play movie');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(318, 'Command: debug play sound');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(319, 'Command: debug send');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(320, 'Command: debug send buyerror');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(321, 'Command: debug send channelnotify');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(322, 'Command: debug send chatmessage');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(323, 'Command: debug send equiperror');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(324, 'Command: debug send largepacket');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(325, 'Command: debug send opcode');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(326, 'Command: debug send qinvalidmsg');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(327, 'Command: debug send qpartymsg');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(328, 'Command: debug send sellerror');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(329, 'Command: debug send setphaseshift');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(330, 'Command: debug send spellfail');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(331, 'Command: debug setaurastate');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(335, 'Command: debug setvid');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(336, 'Command: debug spawnvehicle');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(337, 'Command: debug threat');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(339, 'Command: debug worldstate');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(340, 'Command: wpgps');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(341, 'Command: deserter');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(342, 'Command: deserter bg');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(343, 'Command: deserter bg add');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(344, 'Command: deserter bg remove');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(345, 'Command: deserter instance');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(346, 'Command: deserter instance add');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(347, 'Command: deserter instance remove');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(348, 'Command: disable');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(349, 'Command: disable add');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(350, 'Command: disable add criteria');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(351, 'Command: disable add battleground');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(352, 'Command: disable add map');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(353, 'Command: disable add mmap');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(354, 'Command: disable add outdoorpvp');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(355, 'Command: disable add quest');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(356, 'Command: disable add spell');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(357, 'Command: disable add vmap');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(358, 'Command: disable remove');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(359, 'Command: disable remove criteria');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(360, 'Command: disable remove battleground');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(361, 'Command: disable remove map');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(362, 'Command: disable remove mmap');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(363, 'Command: disable remove outdoorpvp');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(364, 'Command: disable remove quest');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(365, 'Command: disable remove spell');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(366, 'Command: disable remove vmap');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(367, 'Command: event info');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(368, 'Command: event activelist');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(369, 'Command: event start');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(370, 'Command: event stop');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(371, 'Command: gm');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(372, 'Command: gm chat');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(373, 'Command: gm fly');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(374, 'Command: gm ingame');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(375, 'Command: gm list');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(376, 'Command: gm visible');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(377, 'Command: go');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(378, 'Command: account 2fa');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(379, 'Command: account 2fa setup');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(380, 'Command: account 2fa remove');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(381, 'Command: account set 2fa');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(387, 'Command: gobject');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(388, 'Command: gobject activate');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(389, 'Command: gobject add');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(390, 'Command: gobject add temp');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(391, 'Command: gobject delete');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(392, 'Command: gobject info');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(393, 'Command: gobject move');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(394, 'Command: gobject near');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(395, 'Command: gobject set');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(396, 'Command: gobject set phase');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(397, 'Command: gobject set state');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(398, 'Command: gobject target');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(399, 'Command: gobject turn');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(400, 'debug transport');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(401, 'Command: guild');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(402, 'Command: guild create');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(403, 'Command: guild delete');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(404, 'Command: guild invite');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(405, 'Command: guild uninvite');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(406, 'Command: guild rank');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(407, 'Command: guild rename');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(408, 'Command: honor');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(409, 'Command: honor add');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(410, 'Command: honor add kill');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(411, 'Command: honor update');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(412, 'Command: instance');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(413, 'Command: instance listbinds');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(414, 'Command: instance unbind');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(415, 'Command: instance stats');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(417, 'Command: learn');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(418, 'Command: learn all');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(419, 'Command: learn all my');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(420, 'Command: learn all my class');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(421, 'Command: learn all my pettalents');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(422, 'Command: learn all my spells');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(423, 'Command: learn all my talents');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(424, 'Command: learn all gm');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(425, 'Command: learn all crafts');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(426, 'Command: learn all default');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(427, 'Command: learn all lang');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(428, 'Command: learn all recipes');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(429, 'Command: unlearn');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(430, 'Command: lfg');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(431, 'Command: lfg player');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(432, 'Command: lfg group');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(433, 'Command: lfg queue');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(434, 'Command: lfg clean');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(435, 'Command: lfg options');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(436, 'Command: list');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(437, 'Command: list creature');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(438, 'Command: list item');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(439, 'Command: list object');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(440, 'Command: list auras');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(441, 'Command: list mail');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(442, 'Command: lookup');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(443, 'Command: lookup area');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(444, 'Command: lookup creature');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(445, 'Command: lookup event');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(446, 'Command: lookup faction');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(447, 'Command: lookup item');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(448, 'Command: lookup itemset');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(449, 'Command: lookup object');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(450, 'Command: lookup quest');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(451, 'Command: lookup player');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(452, 'Command: lookup player ip');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(453, 'Command: lookup player account');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(454, 'Command: lookup player email');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(455, 'Command: lookup skill');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(456, 'Command: lookup spell');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(457, 'Command: lookup spell id');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(458, 'Command: lookup taxinode');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(459, 'Command: lookup tele');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(460, 'Command: lookup title');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(461, 'Command: lookup map');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(462, 'Command: announce');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(463, 'Command: channel');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(464, 'Command: channel set');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(465, 'Command: channel set ownership');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(466, 'Command: gmannounce');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(467, 'Command: gmnameannounce');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(468, 'Command: gmnotify');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(469, 'Command: nameannounce');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(470, 'Command: notify');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(471, 'Command: whispers');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(472, 'Command: group');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(473, 'Command: group leader');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(474, 'Command: group disband');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(475, 'Command: group remove');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(476, 'Command: group join');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(477, 'Command: group list');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(478, 'Command: group summon');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(479, 'Command: pet');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(480, 'Command: pet create');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(481, 'Command: pet learn');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(482, 'Command: pet unlearn');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(483, 'Command: send');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(484, 'Command: send items');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(485, 'Command: send mail');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(486, 'Command: send message');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(487, 'Command: send money');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(488, 'Command: additem');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(489, 'Command: additemset');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(490, 'Command: appear');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(491, 'Command: aura');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(492, 'Command: bank');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(493, 'Command: bindsight');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(494, 'Command: combatstop');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(495, 'Command: cometome');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(496, 'Command: commands');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(497, 'Command: cooldown');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(498, 'Command: damage');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(499, 'Command: dev');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(500, 'Command: die');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(501, 'Command: dismount');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(502, 'Command: distance');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(503, 'Command: flusharenapoints');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(504, 'Command: freeze');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(505, 'Command: gps');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(506, 'Command: guid');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(507, 'Command: help');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(508, 'Command: hidearea');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(509, 'Command: itemmove');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(510, 'Command: kick');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(511, 'Command: linkgrave');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(512, 'Command: listfreeze');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(513, 'Command: maxskill');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(514, 'Command: movegens');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(515, 'Command: mute');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(516, 'Command: neargrave');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(517, 'Command: pinfo');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(518, 'Command: playall');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(519, 'Command: possess');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(520, 'Command: recall');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(521, 'Command: repairitems');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(522, 'Command: respawn');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(523, 'Command: revive');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(524, 'Command: saveall');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(525, 'Command: save');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(526, 'Command: setskill');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(527, 'Command: showarea');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(528, 'Command: summon');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(529, 'Command: unaura');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(530, 'Command: unbindsight');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(531, 'Command: unfreeze');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(532, 'Command: unmute');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(533, 'Command: unpossess');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(534, 'Command: unstuck');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(535, 'Command: wchange');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(536, 'Command: mmap');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(537, 'Command: mmap loadedtiles');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(538, 'Command: mmap loc');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(539, 'Command: mmap path');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(540, 'Command: mmap stats');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(541, 'Command: mmap testarea');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(542, 'Command: morph');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(543, 'Command: demorph');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(544, 'Command: modify');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(545, 'Command: modify arenapoints');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(547, 'Command: modify drunk');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(548, 'Command: modify energy');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(549, 'Command: modify faction');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(550, 'Command: modify gender');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(551, 'Command: modify honor');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(552, 'Command: modify hp');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(553, 'Command: modify mana');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(554, 'Command: modify money');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(555, 'Command: modify mount');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(556, 'Command: modify phase');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(557, 'Command: modify rage');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(558, 'Command: modify reputation');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(559, 'Command: modify runicpower');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(560, 'Command: modify scale');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(561, 'Command: modify speed');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(562, 'Command: modify speed all');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(563, 'Command: modify speed backwalk');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(564, 'Command: modify speed fly');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(565, 'Command: modify speed walk');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(566, 'Command: modify speed swim');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(567, 'Command: modify spell');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(568, 'Command: modify standstate');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(569, 'Command: modify talentpoints');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(570, 'Command: npc');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(571, 'Command: npc add');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(572, 'Command: npc add formation');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(573, 'Command: npc add item');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(574, 'Command: npc add move');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(575, 'Command: npc add temp');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(576, 'Command: npc add delete');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(577, 'Command: npc add delete item');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(578, 'Command: npc add follow');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(579, 'Command: npc add follow stop');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(580, 'Command: npc set');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(581, 'Command: npc set allowmove');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(582, 'Command: npc set entry');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(583, 'Command: npc set factionid');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(584, 'Command: npc set flag');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(585, 'Command: npc set level');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(586, 'Command: npc set link');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(587, 'Command: npc set model');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(588, 'Command: npc set movetype');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(589, 'Command: npc set phase');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(590, 'Command: npc set spawndist');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(591, 'Command: npc set spawntime');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(592, 'Command: npc set data');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(593, 'Command: npc info');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(594, 'Command: npc near');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(595, 'Command: npc move');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(596, 'Command: npc playemote');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(597, 'Command: npc say');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(598, 'Command: npc textemote');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(599, 'Command: npc whisper');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(600, 'Command: npc yell');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(601, 'Command: npc tame');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(602, 'Command: quest');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(603, 'Command: quest add');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(604, 'Command: quest complete');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(605, 'Command: quest remove');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(606, 'Command: quest reward');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(607, 'Command: reload');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(608, 'Command: reload access_requirement');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(609, 'Command: reload criteria_data');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(610, 'Command: reload achievement_reward');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(611, 'Command: reload all');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(612, 'Command: reload all achievement');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(613, 'Command: reload all area');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(615, 'Command: reload all gossips');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(616, 'Command: reload all item');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(617, 'Command: reload all locales');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(618, 'Command: reload all loot');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(619, 'Command: reload all npc');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(620, 'Command: reload all quest');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(621, 'Command: reload all scripts');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(623, 'Command: reload areatrigger_involvedrelation');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(624, 'Command: reload areatrigger_tavern');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(625, 'Command: reload areatrigger_teleport');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(626, 'Command: reload auctions');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(627, 'Command: reload autobroadcast');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(628, 'Command: reload command');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(629, 'Command: reload conditions');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(630, 'Command: reload config');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(631, 'Command: reload battleground_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(632, 'Command: .mutehistory');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(633, 'Command: reload creature_linked_respawn');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(634, 'Command: reload creature_loot_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(635, 'Command: reload creature_onkill_reputation');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(636, 'Command: reload creature_questender');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(637, 'Command: reload creature_queststarter');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(638, 'Command: reload creature_summon_groups');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(639, 'Command: reload creature_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(640, 'Command: reload creature_text');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(641, 'Command: reload disables');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(642, 'Command: reload disenchant_loot_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(643, 'Command: reload event_scripts');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(644, 'Command: reload fishing_loot_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(645, 'Command: reload game_graveyard_zone');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(646, 'Command: reload game_tele');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(647, 'Command: reload gameobject_questender');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(648, 'Command: reload gameobject_loot_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(649, 'Command: reload gameobject_queststarter');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(650, 'Command: reload support');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(651, 'Command: reload gossip_menu');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(652, 'Command: reload gossip_menu_option');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(653, 'Command: reload item_random_bonus_list_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(654, 'Command: reload item_loot_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(655, 'Command: reload item_set_names');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(656, 'Command: reload lfg_dungeon_rewards');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(657, 'Command: reload locales_achievement_reward');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(658, 'Command: reload locales_creature');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(659, 'Command: reload locales_creature_text');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(660, 'Command: reload locales_gameobject');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(661, 'Command: reload locales_gossip_menu_option');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(663, 'Command: reload locales_item_set_name');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(665, 'Command: reload locales_page_text');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(666, 'Command: reload locales_points_of_interest');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(667, 'Command: reload quest_locale');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(668, 'Command: reload mail_level_reward');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(669, 'Command: reload mail_loot_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(670, 'Command: reload milling_loot_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(671, 'Command: reload npc_spellclick_spells');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(672, 'Command: reload npc_trainer');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(673, 'Command: reload npc_vendor');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(674, 'Command: reload page_text');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(675, 'Command: reload pickpocketing_loot_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(676, 'Command: reload points_of_interest');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(677, 'Command: reload prospecting_loot_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(678, 'Command: reload quest_poi');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(679, 'Command: reload quest_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(680, 'Command: reload rbac');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(681, 'Command: reload reference_loot_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(682, 'Command: reload reserved_name');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(683, 'Command: reload reputation_reward_rate');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(684, 'Command: reload reputation_spillover_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(685, 'Command: reload skill_discovery_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(686, 'Command: reload skill_extra_item_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(687, 'Command: reload skill_fishing_base_level');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(688, 'Command: reload skinning_loot_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(689, 'Command: reload smart_scripts');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(690, 'Command: reload spell_required');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(691, 'Command: reload spell_area');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(693, 'Command: reload spell_group');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(694, 'Command: reload spell_learn_spell');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(695, 'Command: reload spell_loot_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(696, 'Command: reload spell_linked_spell');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(697, 'Command: reload spell_pet_auras');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(698, 'Command: character changeaccount');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(699, 'Command: reload spell_proc');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(700, 'Command: reload spell_scripts');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(701, 'Command: reload spell_target_position');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(702, 'Command: reload spell_threats');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(703, 'Command: reload spell_group_stack_rules');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(704, 'Command: reload trinity_string');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(707, 'Command: reload waypoint_path');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(708, 'Command: reload vehicle_accessory');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(709, 'Command: reload vehicle_template_accessory');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(710, 'Command: reset');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(711, 'Command: reset achievements');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(712, 'Command: reset honor');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(713, 'Command: reset level');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(714, 'Command: reset spells');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(715, 'Command: reset stats');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(716, 'Command: reset talents');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(717, 'Command: reset all');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(718, 'Command: server');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(719, 'Command: server corpses');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(720, 'Command: server exit');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(721, 'Command: server idlerestart');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(722, 'Command: server idlerestart cancel');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(723, 'Command: server idleshutdown');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(724, 'Command: server idleshutdown cancel');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(725, 'Command: server info');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(726, 'Command: server plimit');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(727, 'Command: server restart');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(728, 'Command: server restart cancel');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(729, 'Command: server set');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(730, 'Command: server set closed');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(731, 'Command: server set difftime');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(732, 'Command: server set loglevel');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(733, 'Command: server set motd');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(734, 'Command: server shutdown');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(735, 'Command: server shutdown cancel');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(736, 'Command: server motd');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(737, 'Command: tele');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(738, 'Command: tele add');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(739, 'Command: tele del');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(740, 'Command: tele name');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(741, 'Command: tele group');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(742, 'Command: ticket');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(753, 'Command: ticket reset');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(757, 'Command: ticket togglesystem');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(761, 'Command: titles');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(762, 'Command: titles add');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(763, 'Command: titles current');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(764, 'Command: titles remove');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(765, 'Command: titles set');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(766, 'Command: titles set mask');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(767, 'Command: wp');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(768, 'Command: wp add');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(769, 'Command: wp event');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(770, 'Command: wp load');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(771, 'Command: wp modify');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(772, 'Command: wp unload');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(773, 'Command: wp reload');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(774, 'Command: wp show');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(775, 'Command: modify currency');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(776, 'Command: debug phase');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(777, 'Command: mailbox');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(778, 'Command: ahbot');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(779, 'Command: ahbot items');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(780, 'Command: ahbot items gray');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(781, 'Command: ahbot items white');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(782, 'Command: ahbot items green');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(783, 'Command: ahbot items blue');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(784, 'Command: ahbot items purple');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(785, 'Command: ahbot items orange');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(786, 'Command: ahbot items yellow');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(787, 'Command: ahbot ratio');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(788, 'Command: ahbot ratio alliance');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(789, 'Command: ahbot ratio horde');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(790, 'Command: ahbot ratio neutral');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(791, 'Command: ahbot rebuild');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(792, 'Command: ahbot reload');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(793, 'Command: ahbot status');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(794, 'Command: .guild info');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(795, 'Command: instance setbossstate');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(796, 'Command: instance getbossstate');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(797, 'Command: pvpstats');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(798, 'Command: .mod xp');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(802, 'Command: .ticket bug');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(803, 'Command: .ticket complaint');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(804, 'Command: .ticket suggestion');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(805, 'Command: .ticket bug assign');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(806, 'Command: .ticket bug close');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(807, 'Command: .ticket bug closedlist');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(808, 'Command: .ticket bug comment');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(809, 'Command: .ticket bug delete');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(810, 'Command: .ticket bug list');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(811, 'Command: .ticket bug unassign');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(812, 'Command: .ticket bug view');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(813, 'Command: .ticket complaint assign');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(814, 'Command: .ticket complaint close');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(815, 'Command: .ticket complaint closedlist');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(816, 'Command: .ticket complaint comment');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(817, 'Command: .ticket complaint delete');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(818, 'Command: .ticket complaint list');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(819, 'Command: .ticket complaint unassign');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(820, 'Command: .ticket complaint view');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(821, 'Command: .ticket suggestion assign');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(822, 'Command: .ticket suggestion close');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(823, 'Command: .ticket suggestion closedlist');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(824, 'Command: .ticket suggestion comment');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(825, 'Command: .ticket suggestion delete');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(826, 'Command: .ticket suggestion list');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(827, 'Command: .ticket suggestion unassign');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(828, 'Command: .ticket suggestion view');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(829, 'Command: .ticket reset all');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(830, 'Command: .bnetaccount listgameaccounts');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(831, 'Command: .ticket reset bug');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(832, 'Command: .ticket reset complaint');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(833, 'Command: .ticket reset suggestion');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(835, 'Command: debug loadcells');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(836, 'Command: .debug boundary');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(837, 'Command: npc evade');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(838, 'Command: pet level');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(839, 'Command: server shutdown force');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(840, 'Command: server restart force');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(842, 'Command: reload character_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(843, 'Command: reload quest_greeting');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(844, 'Command: scene');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(845, 'Command: scene debug');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(846, 'Command: scene play');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(847, 'Command: scene play package');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(848, 'Command: scene cancel');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(849, 'Command: list scenes');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(850, 'Command: reload scenes');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(851, 'Command: reload areatrigger_templates');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(852, 'Command: debug dummy');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(853, 'Command: .reload conversation_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(854, 'Command: .debug conversation');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(855, 'Command: debug play music');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(856, 'Command: npc spawngroup');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(857, 'Command: npc despawngroup');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(858, 'Command: gobject spawngroup');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(859, 'Command: gobject despawngroup');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(860, 'Command: list respawns');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(865, 'Command: npc showloot');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(866, 'Command: list spawnpoints');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(868, 'Command: modify power');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(869, 'Command: debug send playerchoice');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(870, 'Command: debug threatinfo');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(871, 'Command: debug instancespawn');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(872, 'Command: server debug');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(873, 'Command: reload creature_movement_override');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(874, 'Command: debug asan');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(875, 'Command: lookup map id');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(876, 'Command: lookup item id');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(877, 'Command: lookup quest id');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(878, 'Command: debug questreset');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(879, 'Command: debug poolstatus');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(880, 'Command: pdump copy');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(881, 'Command: reload vehicle_template');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(882, 'Command: reload spell_script_names');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(883, 'Command: quest objective complete');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1002, 'Command: .barber');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1003, 'Command: .castgroup');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1004, 'Command: .castscene');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1005, 'Command: .typing on');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1006, 'Command: .typing off');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1008, 'Command: .disp');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1009, 'Command: .disp head');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1010, 'Command: .disp shoulders');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1011, 'Command: .disp shirt');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1012, 'Command: .disp chest');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1013, 'Command: .disp waist');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1014, 'Command: .disp legs');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1015, 'Command: .disp feet');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1016, 'Command: .disp wrists');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1017, 'Command: .disp hands');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1018, 'Command: .disp back');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1019, 'Command: .disp tabard');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1020, 'Command: .disp mainhand');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1021, 'Command: .disp offhand');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1360, 'Command: .customnpc set displayid');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1361, 'Command: .customnpc set guild');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1362, 'Command: .customnpc set rank');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1363, 'Command: .customnpc set scale');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1364, 'Command: .customnpc set tameable');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1365, 'Command: .customnpc remove variation');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1398, 'Command: .gobject set scale');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1589, 'Command: .npc set scale');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(2101, 'Command: .customnpc create');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(2102, 'Command: .customnpc spawn');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(2103, 'Command: .customnpc set displayname');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(2104, 'Command: .customnpc set face');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(2105, 'Command: .customnpc set gender');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(2106, 'Command: .customnpc set race');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(2107, 'Command: .customnpc set subname');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(2108, 'Command: .customnpc equip armor');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(2109, 'Command: .customnpc equip left');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(2110, 'Command: .customnpc equip ranged');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(2111, 'Command: .customnpc equip right');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(2112, 'Command: .customnpc delete');
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(3004, 'Command: .gob visible');

CREATE TABLE IF NOT EXISTS `realmcharacters` (
  `realmid` int unsigned NOT NULL DEFAULT '0',
  `acctid` int unsigned NOT NULL,
  `numchars` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Realm Character Tracker';

INSERT INTO `realmcharacters` (`realmid`, `acctid`, `numchars`) VALUES
	(1, 1, 13);
INSERT INTO `realmcharacters` (`realmid`, `acctid`, `numchars`) VALUES
	(1, 2, 0);
INSERT INTO `realmcharacters` (`realmid`, `acctid`, `numchars`) VALUES
	(1, 4, 3);
INSERT INTO `realmcharacters` (`realmid`, `acctid`, `numchars`) VALUES
	(1, 5, 1);

CREATE TABLE IF NOT EXISTS `realmlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '127.0.0.1',
  `localAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '127.0.0.1',
  `address3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localSubnetMask` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '255.255.255.0',
  `port` smallint unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint unsigned NOT NULL DEFAULT '0',
  `flag` tinyint unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int unsigned NOT NULL DEFAULT '66709',
  `Region` tinyint unsigned NOT NULL DEFAULT '1',
  `Battlegroup` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Realm System';

INSERT INTO `realmlist` (`id`, `name`, `address`, `localAddress`, `address3`, `address4`, `localSubnetMask`, `port`, `icon`, `flag`, `timezone`, `allowedSecurityLevel`, `population`, `gamebuild`, `Region`, `Battlegroup`) VALUES
	(1, 'The War Within', '72.224.150.4', '127.0.0.1', NULL, NULL, '255.255.255.0', 8085, 0, 2, 1, 0, 0, 66709, 1, 1);

CREATE TABLE IF NOT EXISTS `secret_digest` (
  `id` int unsigned NOT NULL,
  `digest` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `store_history` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `realm` int unsigned NOT NULL,
  `account` int unsigned NOT NULL,
  `bnet_account` int unsigned NOT NULL DEFAULT '0',
  `char_guid` int unsigned NOT NULL DEFAULT '0',
  `char_level` int unsigned NOT NULL DEFAULT '0',
  `art_level` varchar(255) NOT NULL DEFAULT '',
  `guild_name` varchar(255) NOT NULL DEFAULT '',
  `item_guid` int unsigned DEFAULT NULL,
  `item` int NOT NULL DEFAULT '0',
  `bonus` varchar(11) DEFAULT NULL,
  `product` int NOT NULL DEFAULT '0',
  `count` int unsigned NOT NULL DEFAULT '1',
  `token` int unsigned NOT NULL,
  `karma` int unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `type` enum('cp','game') NOT NULL DEFAULT 'game',
  `trans_project` varchar(255) NOT NULL DEFAULT '',
  `trans_realm` int unsigned NOT NULL DEFAULT '0',
  `dt_buy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dt_return` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `item_guid` (`item_guid`) USING BTREE,
  KEY `realm` (`realm`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `bnet_account` (`bnet_account`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `char_guid` (`char_guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;


CREATE TABLE IF NOT EXISTS `store_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` varchar(255) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(1, '139739', 'Chestguard of the Uncrowned', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(2, '139740', 'Footpads of the Uncrowned', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(3, '139741', 'Gloves of the Uncrowned', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(4, '139742', 'Mask of the Uncrowned', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(5, '139743', 'Leggings of the Uncrowned', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(6, '139744', 'Shoulderblades of the Uncrowned', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(7, '139745', 'Belt of the Uncrowned', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(8, '139746', 'Wristbands of the Uncrowned', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(9, '172199', 'Faralos, Empire\'s Dream', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(10, '174105', 'Mish\'un, Blade of Tyrants', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(11, '165566', 'Lord admiral\'s signet', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(12, '165567', 'Seal of the zandalari empire', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(13, '174500', 'Vita-charged titanshard', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(14, '174528', 'Void-twisted titanshard', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(15, '169223', 'Ashjra\'kamas, Shroud of Resolve', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(16, '98543', 'Wraps of the Blood-Soaked Brawler', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(17, '38311', 'Tabard of the Void', 0);
INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES
	(18, '158075', 'Heart Of Azeroth', 0);

CREATE TABLE IF NOT EXISTS `store_products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `category` int NOT NULL DEFAULT '0',
  `item` int NOT NULL DEFAULT '0',
  `bonus` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `quality` tinyint unsigned NOT NULL DEFAULT '0',
  `display` int unsigned NOT NULL DEFAULT '0',
  `slot` int unsigned NOT NULL DEFAULT '0',
  `type` int unsigned NOT NULL DEFAULT '0',
  `token` int unsigned NOT NULL DEFAULT '0',
  `karma` int unsigned NOT NULL DEFAULT '0',
  `enable` tinyint unsigned NOT NULL DEFAULT '1',
  `dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `faction` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique` (`category`,`item`,`bonus`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `category` (`category`) USING BTREE,
  KEY `enable` (`enable`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;


CREATE TABLE IF NOT EXISTS `uptime` (
  `realmid` int unsigned NOT NULL,
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `uptime` int unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Uptime system';

INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1716740448, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1722673871, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1724352273, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1725106265, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1728309176, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1730537319, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1737276696, 1300, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1741019030, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1744037495, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1745620248, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1746036259, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1749819546, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1750450995, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1751274940, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1751706647, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1753477413, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1755296510, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1758368881, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1766769653, 16646, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1766786744, 14693, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1766977523, 6907, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1767493070, 3920, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1767497214, 12965, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1767544854, 31376, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768189140, 94480, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768350561, 14611, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768365629, 2228, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768368237, 89669, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768458288, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768459178, 843, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768460239, 77681, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768538400, 1094, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768539646, 1531, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768541307, 831, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768542225, 86021, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768782308, 15175, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768797952, 1531, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768799516, 1407, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768800938, 81892, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768883394, 2603, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768886586, 921, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1768887863, 150234, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769038229, 17628, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769056003, 92310, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769148921, 152819, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769302276, 934, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769303540, 2123, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769306095, 92128, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769398604, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769399478, 12555, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769412487, 35809, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769448792, 8724, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769457582, 839, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769458603, 7449, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769466375, 119151, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769585750, 84328, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1769670604, 82543, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1770186596, 35398, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1770273276, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1770312145, 43440, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1770355856, 91771, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1770524095, 87829, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1770612465, 90440, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1770875848, 75234, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1771218911, 927, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1771220371, 89532, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1771391929, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1771392826, 2526, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1771395792, 253670, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1771649800, 350749, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1772338383, 2054, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1772344381, 83088, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1772427832, 863, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1772431573, 2593, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1772434572, 83710, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1772521552, 339754, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773033503, 80189, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773113919, 2403, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773292991, 1424, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773294508, 1962, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773378504, 4391, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773383502, 80875, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773464522, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773465623, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773600335, 29114, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773629917, 1731, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773634619, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773722898, 6637, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773730003, 80789, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773813658, 169417, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773983292, 2323, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773985554, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1773986308, 85905, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1775314552, 1909, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1775320363, 15709, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1775742765, 22911, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1776103482, 7901, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1776536135, 11519, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1777393387, 4312, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1779462539, 18123, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1780747706, 30111, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1780828648, 99727, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1781018139, 839, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1782725076, 730, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1782926758, 4888, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1784212117, 13309, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, Release, Static)');

CREATE TABLE `vw_log_history` (
	`First Logged` DATETIME NULL,
	`Last Logged` DATETIME NULL,
	`Occurrences` BIGINT NOT NULL,
	`Realm` VARCHAR(1) NULL COLLATE 'utf8mb4_unicode_ci',
	`type` VARCHAR(1) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	`level` TINYINT UNSIGNED NOT NULL,
	`string` MEDIUMTEXT NULL COLLATE 'utf8mb4_unicode_ci'
);

CREATE TABLE `vw_rbac` (
	`Permission ID` INT UNSIGNED NOT NULL COMMENT 'Linked Permission id',
	`Permission Group` INT UNSIGNED NOT NULL COMMENT 'Permission id',
	`Security Level` VARCHAR(1) NOT NULL COLLATE 'utf8mb3_general_ci',
	`Permission` VARCHAR(1) NULL COMMENT 'Permission name' COLLATE 'utf8mb4_unicode_ci'
);

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `Algarian Stormrider` AFTER INSERT ON `battlenet_accounts` FOR EACH ROW BEGIN
  IF NEW.`id`>0 THEN
  
replace into `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) 
values(NEW.`id`,'417888','0');
REPLACE INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) 
VALUES(NEW.`id`,'424484','0');
  END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

DROP TABLE IF EXISTS `vw_log_history`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_log_history` AS select from_unixtime(min(`logs`.`time`)) AS `First Logged`,from_unixtime(max(`logs`.`time`)) AS `Last Logged`,count(0) AS `Occurrences`,`realmlist`.`name` AS `Realm`,`logs`.`type` AS `type`,`logs`.`level` AS `level`,`logs`.`string` AS `string` from (`logs` left join `realmlist` on((`logs`.`realm` = `realmlist`.`id`))) group by `logs`.`string`,`logs`.`type`,`logs`.`realm`
;

DROP TABLE IF EXISTS `vw_rbac`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_rbac` AS select `t1`.`linkedId` AS `Permission ID`,`t1`.`id` AS `Permission Group`,ifnull(`t2`.`secId`,'linked') AS `Security Level`,`t3`.`name` AS `Permission` from ((`rbac_linked_permissions` `t1` left join `rbac_default_permissions` `t2` on((`t1`.`id` = `t2`.`permissionId`))) left join `rbac_permissions` `t3` on((`t1`.`linkedId` = `t3`.`id`)))
;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
