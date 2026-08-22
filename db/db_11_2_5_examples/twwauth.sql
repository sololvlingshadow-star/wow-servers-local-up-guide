
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
  `last_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `last_attempt_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int unsigned NOT NULL DEFAULT '0',
  `locked` tinyint unsigned NOT NULL DEFAULT '0',
  `lock_country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00',
  `last_login` timestamp NULL DEFAULT NULL,
  `online` tinyint unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint unsigned NOT NULL DEFAULT '10',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account System';

INSERT INTO `account` (`id`, `username`, `salt`, `verifier`, `session_key_auth`, `session_key_bnet`, `totp_secret`, `email`, `reg_mail`, `joindate`, `last_ip`, `last_attempt_ip`, `failed_logins`, `locked`, `lock_country`, `last_login`, `online`, `expansion`, `mutetime`, `mutereason`, `muteby`, `client_build`, `locale`, `os`, `timezone_offset`, `recruiter`, `battlenet_account`, `battlenet_index`) VALUES (1, '1#1', 'b\'\\xd67x\\xff}\\x14G\\xffZ]\\x8b%,y\\x99\\xdcN#,\\x13\\x0c\\x8c\\xf3d\\xb6\\xe1\\x92f\\x10ll&\'', 'b\'\\x1a\\xb6\\xa3\\xc9+\\xea\\x8b\\x8asX\\xbaH\\x9e7\\xd3\\x86\\x92\\xb4h\\xb6\\xe2\\xc0\\xcf\\x1f\\x97\\x03\\x1a\\xe0\\x13\\xde)K\'', NULL, 'b\'\\x14\\xbb\\x9e$\\x9a\\xb2\\xf4\\xa4Pa\\x86\\xe1\\xd5\\x96\\t\\x942\\xdb\\xc0\\x1a\\r\\x03\\x1e\\x90`\\x9e\\xedVG6y\\x8b\\xc8g\\x10\\xd7\\n9\\xbdf\'', NULL, 'A@A', 'A@A', '2026-07-17 23:59:21', '127.0.0.1', '127.0.0.1', 0, 0, '00', '2026-07-18 00:00:43', 0, 10, 0, '', '', 63704, 0, 'Wn64', 120, 0, 1, 1);


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

INSERT INTO `account_last_played_character` (`accountId`, `region`, `battlegroup`, `realmId`, `characterName`, `characterGUID`, `lastPlayedTime`) VALUES (1, 1, 1, 1, 'Marinovan', 1, 1784323294);


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
  `orderIndex` tinyint unsigned NOT NULL,
  `name` varchar(257) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warbandSceneId` int unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account` (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `account_warband_groups` (`id`, `accountId`, `orderIndex`, `name`, `warbandSceneId`, `flags`) VALUES (1, 1, 0, 'Favorites', 1, 0);


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
  `last_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account System';

INSERT INTO `battlenet_accounts` (`id`, `email`, `srp_version`, `salt`, `verifier`, `joindate`, `last_ip`, `failed_logins`, `locked`, `lock_country`, `last_login`, `online`, `locale`, `os`, `LastCharacterUndelete`, `LoginTicket`, `LoginTicketExpiry`) VALUES (1, 'A@A', 2, 'b\'#Nd\\xc9\\xf0P\\xd8y\\xabI\\x18V\\xae\\xf9\\xd7,)\\xa9\\xec\\x91\\x94r\\x0f9\\x01\\x1fR\\x1atU\\\\_\'', 'b\'\\xe0_/h\\xe4E\\xa9\\xff\\xc5\\xc8\\xab\\xf9\\xfd\\x7fA\\x86H\\xe4\\x8c\\xdd\\x96\\xf23\\xb8\\xd9\\xf7\\x1c\\x19\\x0f\\x1c8\\x0f\\xa3e\\xb1x\\x9a\\x07\\x07\\xcc=\\xba\\nY\\xe0\\xe5\\x81w$\\xaa4\\xdd\\xc1\\x1b\\xf2\\xc8\\xf1\\x1b\\xac\\x1e\\xec\\xd5\\xfcc\\xb0\\xa8<\\x05\\x0b\\xb1\\xcb/\\xe7p\\x01\\x80\\xb2\\xdc\\xb8\\xb5\\x8a\\xc3\\x8d\\xca\\xfc6\\x10\\xaa~!\\xceF\\x90\\x05\\x1e\\xb9\\nhD\\xc8?0\\xddE\\xb0K\\xe5!t9u\\tp\\xad\\x8d\\xf3N)s{s/\\x1d0\\xd3m\\xf7\\xf2P\\x1a\"\\x1d\\xed\\xb4\\xb7\\x84\\xa3\\xc5\\xea\\xbf\\xdf\\x80C\\x84\\xb7YNs(\\x14<\\xbb\\xf6\\x10)?\\xf4\\xa1\\xa5~\\xee\\xeb^\\xfb\\xd3\\xb7\\x07\\xde]\\xdf\\x9a\\xc7\\xc0[\\x9eS=\\x00\\xc8\\x11\\x99\\xf3\\xf5\\xc2\\xbcg\\xbc\\x90kp\\x9c\\x87\\xecn\\xa8v=\\xab\\xc9\\x90\\x7f\\xces\\xb6Fb\\x82\\xf1]\\x94\\x1a\\xb9\\xe2#iO\\xd6\\xa0\\xd14\\x13E\\xb4Ku\\xdd\\x16\\xd6\\x1cQ\\xb4q\\xc71\\xf1{Tw\\xae\\xd0\\xf7\\xdcD9\\x04\\xca\\x87\\xc6\\x17>/\\xed7t\"\\x13\'', '2026-07-17 23:59:21', '127.0.0.1', 0, 0, '00', '2026-07-18 00:00:40', 0, 0, 'Wn64', 0, 'TC-3C687B3300743D46E29BF0A81FC935D15094D1F2', 1784325640);


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

INSERT INTO `battlenet_item_appearances` (`battlenetAccountId`, `blobIndex`, `appearanceMask`) VALUES (1, 258, 131072);


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
-- Table: ip_banned
-- ==========================================
CREATE TABLE `ip_banned` (
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
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
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `systemnote` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Notes inserted by system',
  `unixtime` int unsigned NOT NULL COMMENT 'Unixtime',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Allows users to add a comment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Used to log ips of individual actions';

-- (Table logs_ip_actions is empty)


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

INSERT INTO `realmcharacters` (`realmid`, `acctid`, `numchars`) VALUES (1, 1, 1);


-- ==========================================
-- Table: realmlist
-- ==========================================
CREATE TABLE `realmlist` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `localAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `address3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `localSubnetMask` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '255.255.255.0',
  `port` smallint unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint unsigned NOT NULL DEFAULT '0',
  `flag` tinyint unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `population` float NOT NULL DEFAULT '0',
  `gamebuild` int unsigned NOT NULL DEFAULT '64502',
  `Region` tinyint unsigned NOT NULL DEFAULT '1',
  `Battlegroup` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Realm System';

INSERT INTO `realmlist` (`id`, `name`, `address`, `localAddress`, `address3`, `address4`, `localSubnetMask`, `port`, `icon`, `flag`, `timezone`, `allowedSecurityLevel`, `population`, `gamebuild`, `Region`, `Battlegroup`) VALUES (1, 'Trinity', '127.0.0.1', '127.0.0.1', NULL, NULL, '255.255.255.0', 8085, 0, 0, 1, 0, 0.0, 63704, 1, 1);


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
-- Table: updates
-- ==========================================
CREATE TABLE `updates` (
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int unsigned NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of all applied updates in this database.';

INSERT INTO `updates` (`name`, `hash`, `state`, `timestamp`, `speed`) VALUES ('2014_10_04_00_auth.sql', 'C3BC70A6EC381474B7308F442346F1E721176BC6', 'ARCHIVED', '2015-03-21 19:55:52', 0);


-- ==========================================
-- Table: updates_include
-- ==========================================
CREATE TABLE `updates_include` (
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of directories where we want to include sql updates.';

INSERT INTO `updates_include` (`path`, `state`) VALUES ('$/sql/custom/auth', 'RELEASED');


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

INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES (1, 1784321646, 1493, 1, 'TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)');

