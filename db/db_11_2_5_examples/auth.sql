
-- ==========================================
-- Table: account
-- ==========================================
CREATE TABLE `account` (
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

INSERT INTO `account` (`id`, `username`, `salt`, `verifier`, `session_key_auth`, `session_key_bnet`, `totp_secret`, `email`, `reg_mail`, `joindate`, `last_ip`, `last_attempt_ip`, `failed_logins`, `locked`, `lock_country`, `last_login`, `online`, `expansion`, `mutetime`, `mutereason`, `muteby`, `client_build`, `locale`, `os`, `timezone_offset`, `recruiter`, `battlenet_account`, `battlenet_index`) VALUES (1, '1#1', 'b\'\\xe6\\r`\\xe1\\x8b\\x08\\xe9\\xa9>J}t\\x1d\\x00\\xa8\\xca_\\x91m{\\x97\\xed>\\xf1Z\\x1f\\xa7\\xb9^Z\\xe72\'', 'b\'<\\x04\\xa4\\x8d>\\r$\\x96?\\xbf\\x8e\\x82\\xba\\xfeP\\xde%W9\\xac\\x97\\xff\\x8b\\xb1},5:\\xe7\\xcf\\x81(\'', NULL, 'b\'8k9c\\x0c\\x07\\x14\\xce\\xe2\\x1f\\x8e\\xabi\\xa2\\x02\\xe3N\\xc9\\xb9\\xbf9\\xff\\x1d\\x10\\xd6\\xd6\\x1eF\\xee\\xea#\\x89x\\xb3\\x90\\xd0\\x80\\xd1\\xf3\\xdb\'', NULL, 'GM@GM', 'GM@GM', '2024-05-26 19:22:41', '127.0.0.1', '127.0.0.1', 0, 0, '00', '2026-03-20 19:01:44', 0, 11, 0, '', '', 66384, 0, 'Wn64', -300, 0, 1, 1);


-- ==========================================
-- Table: account_access
-- ==========================================
CREATE TABLE `account_access` (
  `AccountID` int unsigned NOT NULL,
  `SecurityLevel` tinyint unsigned NOT NULL,
  `RealmID` int NOT NULL DEFAULT '-1',
  `Comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AccountID`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `account_access` (`AccountID`, `SecurityLevel`, `RealmID`, `Comment`) VALUES (1, 3, -1, NULL);


-- ==========================================
-- Table: account_banned
-- ==========================================
CREATE TABLE `account_banned` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int unsigned NOT NULL DEFAULT '0',
  `unbandate` int unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Ban List';

-- (Table account_banned is empty)


-- ==========================================
-- Table: account_last_played_character
-- ==========================================
CREATE TABLE `account_last_played_character` (
  `accountId` int unsigned NOT NULL,
  `region` tinyint unsigned NOT NULL,
  `battlegroup` tinyint unsigned NOT NULL,
  `realmId` int unsigned DEFAULT NULL,
  `characterName` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `characterGUID` bigint unsigned DEFAULT NULL,
  `lastPlayedTime` int unsigned DEFAULT NULL,
  PRIMARY KEY (`accountId`,`region`,`battlegroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `account_last_played_character` (`accountId`, `region`, `battlegroup`, `realmId`, `characterName`, `characterGUID`, `lastPlayedTime`) VALUES (1, 1, 1, 1, 'Awemeo', 14, 1774023143);


-- ==========================================
-- Table: account_muted
-- ==========================================
CREATE TABLE `account_muted` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mutedate` int unsigned NOT NULL DEFAULT '0',
  `mutetime` int unsigned NOT NULL DEFAULT '0',
  `mutedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mutereason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`guid`,`mutedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='mute List';

-- (Table account_muted is empty)


-- ==========================================
-- Table: account_warband_group_members
-- ==========================================
CREATE TABLE `account_warband_group_members` (
  `groupId` bigint unsigned NOT NULL,
  `characterGuid` bigint unsigned NOT NULL,
  `placementId` int unsigned NOT NULL,
  `type` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupId`,`characterGuid`),
  CONSTRAINT `fk_warband_group` FOREIGN KEY (`groupId`) REFERENCES `account_warband_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `account_warband_group_members` (`groupId`, `characterGuid`, `placementId`, `type`) VALUES (1, 1, 1, 0);


-- ==========================================
-- Table: account_warband_groups
-- ==========================================
CREATE TABLE `account_warband_groups` (
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

INSERT INTO `account_warband_groups` (`id`, `accountId`, `realmId`, `orderIndex`, `name`, `warbandSceneId`, `flags`) VALUES (1, 1, 1, 0, 'Favorites', 1, 0);


-- ==========================================
-- Table: autobroadcast
-- ==========================================
CREATE TABLE `autobroadcast` (
  `realmid` int NOT NULL DEFAULT '-1',
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint unsigned DEFAULT '1',
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`realmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table autobroadcast is empty)


-- ==========================================
-- Table: battle_pet_declinedname
-- ==========================================
CREATE TABLE `battle_pet_declinedname` (
  `guid` bigint NOT NULL,
  `genitive` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dative` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `accusative` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instrumental` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prepositional` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`),
  CONSTRAINT `fk_battle_pet__battle_pet_declinedname` FOREIGN KEY (`guid`) REFERENCES `battle_pets` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table battle_pet_declinedname is empty)


-- ==========================================
-- Table: battle_pet_slots
-- ==========================================
CREATE TABLE `battle_pet_slots` (
  `id` tinyint NOT NULL,
  `battlenetAccountId` int NOT NULL,
  `battlePetGuid` bigint NOT NULL,
  `locked` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`battlenetAccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battle_pet_slots` (`id`, `battlenetAccountId`, `battlePetGuid`, `locked`) VALUES (0, 1, 0, 1);


-- ==========================================
-- Table: battle_pets
-- ==========================================
CREATE TABLE `battle_pets` (
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

-- (Table battle_pets is empty)


-- ==========================================
-- Table: battlenet_account_bans
-- ==========================================
CREATE TABLE `battlenet_account_bans` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int unsigned NOT NULL DEFAULT '0',
  `unbandate` int unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Ban List';

-- (Table battlenet_account_bans is empty)


-- ==========================================
-- Table: battlenet_account_heirlooms
-- ==========================================
CREATE TABLE `battlenet_account_heirlooms` (
  `accountId` int unsigned NOT NULL,
  `itemId` int unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table battlenet_account_heirlooms is empty)


-- ==========================================
-- Table: battlenet_account_mounts
-- ==========================================
CREATE TABLE `battlenet_account_mounts` (
  `battlenetAccountId` int unsigned NOT NULL,
  `mountSpellId` int unsigned NOT NULL,
  `flags` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`mountSpellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battlenet_account_mounts` (`battlenetAccountId`, `mountSpellId`, `flags`) VALUES (1, 5784, 0);


-- ==========================================
-- Table: battlenet_account_player_data_element
-- ==========================================
CREATE TABLE `battlenet_account_player_data_element` (
  `battlenetAccountId` int unsigned NOT NULL,
  `playerDataElementAccountId` int unsigned NOT NULL,
  `floatValue` float DEFAULT NULL,
  `int64Value` bigint DEFAULT NULL,
  PRIMARY KEY (`battlenetAccountId`,`playerDataElementAccountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table battlenet_account_player_data_element is empty)


-- ==========================================
-- Table: battlenet_account_player_data_flag
-- ==========================================
CREATE TABLE `battlenet_account_player_data_flag` (
  `battlenetAccountId` int unsigned NOT NULL,
  `storageIndex` int unsigned NOT NULL,
  `mask` bigint unsigned NOT NULL,
  PRIMARY KEY (`battlenetAccountId`,`storageIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table battlenet_account_player_data_flag is empty)


-- ==========================================
-- Table: battlenet_account_toys
-- ==========================================
CREATE TABLE `battlenet_account_toys` (
  `accountId` int unsigned NOT NULL,
  `itemId` int NOT NULL DEFAULT '0',
  `isFavourite` tinyint(1) DEFAULT '0',
  `hasFanfare` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`accountId`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table battlenet_account_toys is empty)


-- ==========================================
-- Table: battlenet_account_transmog_illusions
-- ==========================================
CREATE TABLE `battlenet_account_transmog_illusions` (
  `battlenetAccountId` int unsigned NOT NULL,
  `blobIndex` smallint unsigned NOT NULL,
  `illusionMask` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`blobIndex`),
  CONSTRAINT `battlenet_account_transmog_illusions_ibfk_1` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battlenet_account_transmog_illusions` (`battlenetAccountId`, `blobIndex`, `illusionMask`) VALUES (1, 0, 4294967292);


-- ==========================================
-- Table: battlenet_account_warband_scenes
-- ==========================================
CREATE TABLE `battlenet_account_warband_scenes` (
  `battlenetAccountId` int unsigned NOT NULL,
  `warbandSceneId` int NOT NULL DEFAULT '0',
  `isFavorite` tinyint(1) DEFAULT '0',
  `hasFanfare` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`warbandSceneId`),
  CONSTRAINT `fk_battlenet_account_warband_scenes__accountId` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battlenet_account_warband_scenes` (`battlenetAccountId`, `warbandSceneId`, `isFavorite`, `hasFanfare`) VALUES (1, 1, 0, 0);


-- ==========================================
-- Table: battlenet_accounts
-- ==========================================
CREATE TABLE `battlenet_accounts` (
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

INSERT INTO `battlenet_accounts` (`id`, `email`, `srp_version`, `salt`, `verifier`, `joindate`, `last_ip`, `failed_logins`, `locked`, `lock_country`, `last_login`, `online`, `locale`, `os`, `LastCharacterUndelete`, `LoginTicket`, `LoginTicketExpiry`) VALUES (1, 'GM@GM', 2, 'b\'\\xef\\xc1\\xb4\\x9f\\xe1y\\x86F,\\x98\\x8fTa\\xde\\xf2#h\\x91\\xfb\\x86\\xba\\x87?\\xefVB\\xe1\\x1aN\\x12\\xc3\\xdf\'', 'b\"\\x1c9^!\\xba\\x88\\xa0\\xe5\\xad\\x94\\x1b\\xbd\\xf4\\x8dY\\x1c\\xc2\\xc2D\\x8e\\n\\xca\\x0e\\xe3\\xe9\\xeb\'/\\xe7\\x91R\\x1d\\x8f\\xf3Z^\\xbd\\x90P\\x14S\\x9d\\xbf1\\x8e\\xe1sqx\\xa8; \\xb9\\x05\\xdc\\xb5::4T\\xdf\\r\\xe6\\x19\\x1f\\xe3\\xb1\\xeb\\xdc\\xa66\\x9a1%M\\xb2\\xc7\\x03\\x9c\\xc1=<!\\x13]0^\\xbdsK\\x116_\\xc5V\\xb9\\xb8[\\xab\\x81\\xcc\\xad\\xc8H\\x7f\\x08{\\x1c\\x87q\\xa6\\x8b*g\\xd3\\xb1L\\x82\\xa4\\x98B\\xb5\\x8b\\xa9\\xed\\xeb\\xda\\x90\\xef\\x9d\\xf0\\x82\\xe7\\xf1\\xfc^lpGw{PU\\x92^\\x81\\x97\\x81wn2A\\xd1\\xf9 \\xcar\\xfa\\xb0\\xc2\\x0c\\x10\\xdf\\x1c\\x89\\x1f1\\xf7\\xa0\\xf2\\xe6ly\\xc7P66\\xa6\\x07\\xfc\\x1e\\xa7{\\x9c\\xf5vG\\xccJb\\x0f\\xf3\\x15\\xf2\\xf0\\x9a\\x9a\\xa6\\x1c\\x13Y=bdo\\xc6\\xc8Q2\\xd0\\xfc\\x88\\xd3l\\xe0{\\xde\\x83\\x14vu\\xa9\\x8c\\xac\\x1dY\\\\V\\x18)}7L\\xe5\\xda8\\xa1\\xael\\xfen[\\x99\\x86\\x81s\\x1a\\x0c:O\\x1f\\xd2\\x05\\x19\\x82e\"', '2024-05-26 19:22:41', '127.0.0.1', 0, 0, '00', '2026-03-20 09:05:48', 0, 0, 'Wn64', 0, 'TC-8BC02FAAA48CFA6EA7058710B44DEDFED7C1BBCE', 1773990331);


-- ==========================================
-- Table: battlenet_item_appearances
-- ==========================================
CREATE TABLE `battlenet_item_appearances` (
  `battlenetAccountId` int unsigned NOT NULL,
  `blobIndex` smallint unsigned NOT NULL,
  `appearanceMask` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`blobIndex`),
  CONSTRAINT `fk_battlenet_item_appearances` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES (1, 0, 65536);


-- ==========================================
-- Table: battlenet_item_favorite_appearances
-- ==========================================
CREATE TABLE `battlenet_item_favorite_appearances` (
  `battlenetAccountId` int unsigned NOT NULL,
  `itemModifiedAppearanceId` int unsigned NOT NULL,
  PRIMARY KEY (`battlenetAccountId`,`itemModifiedAppearanceId`),
  CONSTRAINT `fk_battlenet_item_favorite_appearances` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table battlenet_item_favorite_appearances is empty)


-- ==========================================
-- Table: battlenet_transmog_illusions
-- ==========================================
CREATE TABLE `battlenet_transmog_illusions` (
  `battlenetAccountId` int unsigned NOT NULL,
  `blobIndex` smallint unsigned NOT NULL,
  `illusionMask` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battlenetAccountId`,`blobIndex`),
  CONSTRAINT `fk_battlenet_transmog_illusions` FOREIGN KEY (`battlenetAccountId`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- (Table battlenet_transmog_illusions is empty)


-- ==========================================
-- Table: build_auth_key
-- ==========================================
CREATE TABLE `build_auth_key` (
  `build` int NOT NULL,
  `platform` char(4) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `arch` char(4) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `type` char(4) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `key` binary(16) NOT NULL,
  PRIMARY KEY (`build`,`platform`,`arch`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `build_auth_key` (`build`, `platform`, `arch`, `type`, `key`) VALUES (25549, 'Mac', 'x64', 'WoW', 'b\'f\\xfc^\\t\\xb8pa&y_\\x14\\x03\\x08\\xc8\\xc1\\xd8\'');


-- ==========================================
-- Table: build_executable_hash
-- ==========================================
CREATE TABLE `build_executable_hash` (
  `build` int NOT NULL,
  `platform` char(4) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `executableHash` binary(20) NOT NULL,
  PRIMARY KEY (`build`,`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `build_executable_hash` (`build`, `platform`, `executableHash`) VALUES (5875, 'OSX', 'b\'\\x8d\\x17<\\xc3\\x81\\x96\\x1e\\xeb\\xab\\xf36\\xf5\\xe6g[\\x10\\x1b\\xb5\\x13\\xe5\'');


-- ==========================================
-- Table: build_info
-- ==========================================
CREATE TABLE `build_info` (
  `build` int NOT NULL,
  `majorVersion` int DEFAULT NULL,
  `minorVersion` int DEFAULT NULL,
  `bugfixVersion` int DEFAULT NULL,
  `hotfixVersion` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `build_info` (`build`, `majorVersion`, `minorVersion`, `bugfixVersion`, `hotfixVersion`) VALUES (5875, 1, 12, 1, NULL);


-- ==========================================
-- Table: character_instance
-- ==========================================
CREATE TABLE `character_instance` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `instance` int unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint unsigned NOT NULL DEFAULT '0',
  `extendState` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_instance` (`guid`, `instance`, `permanent`, `extendState`) VALUES (3, 2, 0, 1);


-- ==========================================
-- Table: collecting_battle_pets
-- ==========================================
CREATE TABLE `collecting_battle_pets` (
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

INSERT INTO `collecting_battle_pets` (`species`, `breed`, `displayId`, `level`, `exp`, `health`, `quality`, `flags`, `name`, `nameTimestamp`, `owner`, `ownerRealmId`, `achievement`, `quest`, `spell`, `npc`, `zone`) VALUES (374, 12, 42906, 2, 0, 189, 0, 0, '', 0, NULL, NULL, '776', NULL, '125610', '(Black Lamb) Agneau noir 60649', '(Elwynn Forest) (Forêt d\'Elwynn) 12');


-- ==========================================
-- Table: group_instance
-- ==========================================
CREATE TABLE `group_instance` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `instance` int unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table group_instance is empty)


-- ==========================================
-- Table: instance_reset
-- ==========================================
CREATE TABLE `instance_reset` (
  `mapid` smallint unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `resettime` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`mapid`,`difficulty`),
  KEY `difficulty` (`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `instance_reset` (`mapid`, `difficulty`, `resettime`) VALUES (33, 2, 1671073200);


-- ==========================================
-- Table: instance_scenario_progress
-- ==========================================
CREATE TABLE `instance_scenario_progress` (
  `id` int unsigned NOT NULL,
  `criteria` int unsigned NOT NULL,
  `counter` bigint unsigned NOT NULL,
  `date` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table instance_scenario_progress is empty)


-- ==========================================
-- Table: ip_banned
-- ==========================================
CREATE TABLE `ip_banned` (
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `bandate` int unsigned NOT NULL,
  `unbandate` int unsigned NOT NULL,
  `bannedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Banned IPs';

-- (Table ip_banned is empty)


-- ==========================================
-- Table: logs
-- ==========================================
CREATE TABLE `logs` (
  `time` int unsigned NOT NULL,
  `realm` int unsigned NOT NULL,
  `type` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `string` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table logs is empty)


-- ==========================================
-- Table: logs_ip_actions
-- ==========================================
CREATE TABLE `logs_ip_actions` (
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

-- (Table logs_ip_actions is empty)


-- ==========================================
-- Table: payments
-- ==========================================
CREATE TABLE `payments` (
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

-- (Table payments is empty)


-- ==========================================
-- Table: quest_objectives_completion_effect
-- ==========================================
CREATE TABLE `quest_objectives_completion_effect` (
  `ObjectiveID` int NOT NULL,
  `GameEventID` int DEFAULT NULL,
  `SpellID` int DEFAULT NULL,
  `ConversationID` int DEFAULT NULL,
  `UpdatePhaseShift` tinyint(1) DEFAULT '0',
  `UpdateZoneAuras` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ObjectiveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table quest_objectives_completion_effect is empty)


-- ==========================================
-- Table: rbac_account_permissions
-- ==========================================
CREATE TABLE `rbac_account_permissions` (
  `accountId` int unsigned NOT NULL COMMENT 'Account id',
  `permissionId` int unsigned NOT NULL COMMENT 'Permission id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`permissionId`,`realmId`),
  KEY `fk__rbac_account_roles__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_account_permissions__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_roles__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account-Permission relation';

-- (Table rbac_account_permissions is empty)


-- ==========================================
-- Table: rbac_default_permissions
-- ==========================================
CREATE TABLE `rbac_default_permissions` (
  `secId` int unsigned NOT NULL COMMENT 'Security Level id',
  `permissionId` int unsigned NOT NULL COMMENT 'permission id',
  `realmId` int NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`secId`,`permissionId`,`realmId`),
  KEY `fk__rbac_default_permissions__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_default_permissions__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Default permission to assign to different account security levels';

INSERT INTO `rbac_default_permissions` (`secId`, `permissionId`, `realmId`) VALUES (3, 192, -1);


-- ==========================================
-- Table: rbac_linked_permissions
-- ==========================================
CREATE TABLE `rbac_linked_permissions` (
  `id` int unsigned NOT NULL COMMENT 'Permission id',
  `linkedId` int unsigned NOT NULL COMMENT 'Linked Permission id',
  PRIMARY KEY (`id`,`linkedId`),
  KEY `fk__rbac_linked_permissions__rbac_permissions1` (`id`),
  KEY `fk__rbac_linked_permissions__rbac_permissions2` (`linkedId`),
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions1` FOREIGN KEY (`id`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_linked_permissions__rbac_permissions2` FOREIGN KEY (`linkedId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Permission - Linked Permission relation';

INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES (192, 21);


-- ==========================================
-- Table: rbac_permissions
-- ==========================================
CREATE TABLE `rbac_permissions` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Permission id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Permission name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Permission List';

INSERT INTO `rbac_permissions` (`id`, `name`) VALUES (1, 'Instant logout');


-- ==========================================
-- Table: realmcharacters
-- ==========================================
CREATE TABLE `realmcharacters` (
  `realmid` int unsigned NOT NULL DEFAULT '0',
  `acctid` int unsigned NOT NULL,
  `numchars` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Realm Character Tracker';

INSERT INTO `realmcharacters` (`realmid`, `acctid`, `numchars`) VALUES (1, 1, 13);


-- ==========================================
-- Table: realmlist
-- ==========================================
CREATE TABLE `realmlist` (
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

INSERT INTO `realmlist` (`id`, `name`, `address`, `localAddress`, `address3`, `address4`, `localSubnetMask`, `port`, `icon`, `flag`, `timezone`, `allowedSecurityLevel`, `population`, `gamebuild`, `Region`, `Battlegroup`) VALUES (1, 'The War Within', '72.224.150.4', '127.0.0.1', NULL, NULL, '255.255.255.0', 8085, 0, 2, 1, 0, 0.0, 66709, 1, 1);


-- ==========================================
-- Table: secret_digest
-- ==========================================
CREATE TABLE `secret_digest` (
  `id` int unsigned NOT NULL,
  `digest` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table secret_digest is empty)


-- ==========================================
-- Table: store_history
-- ==========================================
CREATE TABLE `store_history` (
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

-- (Table store_history is empty)


-- ==========================================
-- Table: store_items
-- ==========================================
CREATE TABLE `store_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` varchar(255) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

INSERT INTO `store_items` (`id`, `item_id`, `item_name`, `price`) VALUES (1, '139739', 'Chestguard of the Uncrowned', '0');


-- ==========================================
-- Table: store_products
-- ==========================================
CREATE TABLE `store_products` (
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

-- (Table store_products is empty)


-- ==========================================
-- Table: uptime
-- ==========================================
CREATE TABLE `uptime` (
  `realmid` int unsigned NOT NULL,
  `starttime` int unsigned NOT NULL DEFAULT '0',
  `uptime` int unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Uptime system';

INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES (1, 1716740448, 0, 0, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Win64, Release, Static)');

