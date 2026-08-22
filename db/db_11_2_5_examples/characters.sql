
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
  `expansion` tinyint unsigned NOT NULL DEFAULT '9',
  `mutetime` bigint NOT NULL DEFAULT '0',
  `mutereason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `muteby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `locale` tinyint unsigned NOT NULL DEFAULT '0',
  `os` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `recruiter` int unsigned NOT NULL DEFAULT '0',
  `battlenet_account` int unsigned DEFAULT NULL,
  `battlenet_index` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  UNIQUE KEY `uk_bnet_acc` (`battlenet_account`,`battlenet_index`),
  CONSTRAINT `fk_bnet_acc` FOREIGN KEY (`battlenet_account`) REFERENCES `battlenet_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account System';

-- (Table account is empty)


-- ==========================================
-- Table: account_battlepet
-- ==========================================
CREATE TABLE `account_battlepet` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account` int unsigned NOT NULL DEFAULT '0',
  `slot` int NOT NULL DEFAULT '-1',
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '""',
  `nameTimeStamp` int unsigned NOT NULL DEFAULT '0',
  `species` int unsigned NOT NULL DEFAULT '0',
  `quality` int unsigned NOT NULL DEFAULT '0',
  `breed` int unsigned NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '0',
  `xp` int unsigned NOT NULL DEFAULT '0',
  `display` int unsigned NOT NULL DEFAULT '0',
  `health` int NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  `infoPower` int NOT NULL DEFAULT '0',
  `infoMaxHealth` int NOT NULL DEFAULT '0',
  `infoSpeed` int NOT NULL DEFAULT '0',
  `infoGender` int NOT NULL DEFAULT '0',
  `declinedGenitive` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `declinedNative` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `declinedAccusative` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `declinedInstrumental` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `declinedPrepositional` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`account`) USING BTREE,
  KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- (Table account_battlepet is empty)


-- ==========================================
-- Table: account_data
-- ==========================================
CREATE TABLE `account_data` (
  `accountId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `time` bigint NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`accountId`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `account_data` (`accountId`, `type`, `time`, `data`) VALUES (1, 0, 1773808815, 'b\'SET accountNeedsTurnStrafeDialog \"0\"\\r\\nSET playerIdentityDefaultChoices \"v21###$##%h##%h##%h##%h\"\\r\\nSET nameplateShowEnemies \"0\"\\r\\nSET UnitNameNonCombatCreatureName \"1\"\\r\\nSET professionsAllocateBestQualityReagents \"0\"\\r\\nSET auctionDisplayOnCharacter \"1\"\\r\\nSET profanityFilter \"0\"\\r\\nSET xpBarText \"1\"\\r\\nSET guildShowOffline \"0\"\\r\\nSET perksActivitiesLastPoints \"1000\"\\r\\nSET communitiesShowOffline \"0\"\\r\\nSET professionsOrderRecipientDropdown \"2\"\\r\\nSET addFriendInfoShown \"1\"\\r\\nSET closedInfoFramesAccountWide \"\\x02{yIO@DpS\"\\r\\nSET nameplateTargetRadialPosition \"1\"\\r\\nSET actionedAdventureJournalEntries \"v\\x01\"\\r\\nSET timeMgrAlarmTime \"1040\"\\r\\nSET UnitNameOwn \"1\"\\r\\nSET perksActivitiesPendingCompletion \"v21\"\\r\\nSET statusTextDisplay \"NUMERIC\"\\r\\nSET partyBackgroundOpacity \"0.69999998807907\"\\r\\nSET showTutorials \"0\"\\r\\nSET timeMgrUseMilitaryTime \"1\"\\r\\nSET showCreateCharacterRealmConfirmDialog \"0\"\\r\\nSET serviceTypeFilter \"7\"\\r\\nSET flaggedTutorials \"v21###$###%###-###\\\'###(###:###.###Z###E###K###[###)###;###+###8###,###]###D###F###N###=###I###9###J###3###A###B###?###L###@###0###V###Y###C###<###^###O###6###S###5\"\\r\\nSET petJournalFilterVersion \"1\"\\r\\nSET scriptErrors \"1\"\\r\\nSET petJournalTab \"6\"\\r\\nSET encounterTimelineIconographyHiddenMask \"\\x02\"\\r\\nSET Outline \"1\"\\r\\nSET showTargetOfTarget \"1\"\\r\\nSET playerColorOverrides \"v21\"\\r\\nSET mountJournalShowPlayer \"1\"\\r\\nSET toyBoxCollectedFilters \"\\x02\"\\r\\nSET timeMgrUseLocalTime \"1\"\\r\\nSET spellBookMinimize \"1\"\\r\\nSET showNPETutorials \"0\"\\r\\nSET UnitNameNPC \"1\"\\r\\nSET AllowDangerousScripts \"1\"\\r\\nSET statusText \"1\"\\r\\nSET screenEdgeFlash \"0\"\\r\\nSET wardrobeSetsFilters \"\\x02\"\\r\\nSET perksActivitiesCurrentMonth \"19\"\\r\\n\'');


-- ==========================================
-- Table: account_instance_times
-- ==========================================
CREATE TABLE `account_instance_times` (
  `accountId` int unsigned NOT NULL,
  `instanceId` int unsigned NOT NULL DEFAULT '0',
  `releaseTime` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`,`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `account_instance_times` (`accountId`, `instanceId`, `releaseTime`) VALUES (1, 1, 1771312349);


-- ==========================================
-- Table: account_tutorial
-- ==========================================
CREATE TABLE `account_tutorial` (
  `accountId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `tut0` int unsigned NOT NULL DEFAULT '0',
  `tut1` int unsigned NOT NULL DEFAULT '0',
  `tut2` int unsigned NOT NULL DEFAULT '0',
  `tut3` int unsigned NOT NULL DEFAULT '0',
  `tut4` int unsigned NOT NULL DEFAULT '0',
  `tut5` int unsigned NOT NULL DEFAULT '0',
  `tut6` int unsigned NOT NULL DEFAULT '0',
  `tut7` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `account_tutorial` (`accountId`, `tut0`, `tut1`, `tut2`, `tut3`, `tut4`, `tut5`, `tut6`, `tut7`) VALUES (1, 4210071483, 14942439, 0, 0, 0, 0, 0, 0);


-- ==========================================
-- Table: arena_team
-- ==========================================
CREATE TABLE `arena_team` (
  `arenaTeamId` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `captainGuid` bigint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `rating` smallint unsigned NOT NULL DEFAULT '0',
  `seasonGames` smallint unsigned NOT NULL DEFAULT '0',
  `seasonWins` smallint unsigned NOT NULL DEFAULT '0',
  `weekGames` smallint unsigned NOT NULL DEFAULT '0',
  `weekWins` smallint unsigned NOT NULL DEFAULT '0',
  `rank` int unsigned NOT NULL DEFAULT '0',
  `backgroundColor` int unsigned NOT NULL DEFAULT '0',
  `emblemStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `emblemColor` int unsigned NOT NULL DEFAULT '0',
  `borderStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `borderColor` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenaTeamId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table arena_team is empty)


-- ==========================================
-- Table: arena_team_member
-- ==========================================
CREATE TABLE `arena_team_member` (
  `arenaTeamId` int unsigned NOT NULL DEFAULT '0',
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `weekGames` smallint unsigned NOT NULL DEFAULT '0',
  `weekWins` smallint unsigned NOT NULL DEFAULT '0',
  `seasonGames` smallint unsigned NOT NULL DEFAULT '0',
  `seasonWins` smallint unsigned NOT NULL DEFAULT '0',
  `personalRating` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`arenaTeamId`,`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table arena_team_member is empty)


-- ==========================================
-- Table: auction_bidders
-- ==========================================
CREATE TABLE `auction_bidders` (
  `auctionId` int unsigned NOT NULL,
  `playerGuid` bigint unsigned NOT NULL,
  PRIMARY KEY (`auctionId`,`playerGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table auction_bidders is empty)


-- ==========================================
-- Table: auction_items
-- ==========================================
CREATE TABLE `auction_items` (
  `auctionId` int unsigned NOT NULL,
  `itemGuid` bigint unsigned NOT NULL,
  PRIMARY KEY (`auctionId`,`itemGuid`),
  UNIQUE KEY `idx_itemGuid` (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `auction_items` (`auctionId`, `itemGuid`) VALUES (207460, 160918);


-- ==========================================
-- Table: auctionhouse
-- ==========================================
CREATE TABLE `auctionhouse` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `auctionHouseId` int unsigned NOT NULL DEFAULT '0',
  `owner` bigint unsigned NOT NULL DEFAULT '0',
  `bidder` bigint unsigned NOT NULL DEFAULT '0',
  `minBid` bigint unsigned NOT NULL DEFAULT '0',
  `buyoutOrUnitPrice` bigint unsigned NOT NULL DEFAULT '0',
  `deposit` bigint unsigned NOT NULL DEFAULT '0',
  `bidAmount` bigint unsigned NOT NULL DEFAULT '0',
  `startTime` bigint NOT NULL DEFAULT '0',
  `endTime` bigint NOT NULL DEFAULT '0',
  `serverFlags` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `auctionhouse` (`id`, `auctionHouseId`, `owner`, `bidder`, `minBid`, `buyoutOrUnitPrice`, `deposit`, `bidAmount`, `startTime`, `endTime`, `serverFlags`) VALUES (207460, 1, 0, 0, 3188900, 3589700, 0, 0, 1784212246, 1784453446, 0);


-- ==========================================
-- Table: battlenet_accounts
-- ==========================================
CREATE TABLE `battlenet_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `email` varchar(320) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sha_pass_hash` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Account System';

-- (Table battlenet_accounts is empty)


-- ==========================================
-- Table: blackmarket_auctions
-- ==========================================
CREATE TABLE `blackmarket_auctions` (
  `marketId` int NOT NULL DEFAULT '0',
  `currentBid` bigint unsigned NOT NULL DEFAULT '0',
  `time` bigint NOT NULL DEFAULT '0',
  `numBids` int NOT NULL DEFAULT '0',
  `bidder` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`marketId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table blackmarket_auctions is empty)


-- ==========================================
-- Table: bugreport
-- ==========================================
CREATE TABLE `bugreport` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Debug System';

-- (Table bugreport is empty)


-- ==========================================
-- Table: calendar_events
-- ==========================================
CREATE TABLE `calendar_events` (
  `EventID` bigint unsigned NOT NULL DEFAULT '0',
  `Owner` bigint unsigned NOT NULL DEFAULT '0',
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `EventType` tinyint unsigned NOT NULL DEFAULT '4',
  `TextureID` int NOT NULL DEFAULT '-1',
  `Date` bigint NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `LockDate` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`EventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table calendar_events is empty)


-- ==========================================
-- Table: calendar_invites
-- ==========================================
CREATE TABLE `calendar_invites` (
  `InviteID` bigint unsigned NOT NULL DEFAULT '0',
  `EventID` bigint unsigned NOT NULL DEFAULT '0',
  `Invitee` bigint unsigned NOT NULL DEFAULT '0',
  `Sender` bigint unsigned NOT NULL DEFAULT '0',
  `Status` tinyint unsigned NOT NULL DEFAULT '0',
  `ResponseTime` bigint NOT NULL DEFAULT '0',
  `ModerationRank` tinyint unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`InviteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table calendar_invites is empty)


-- ==========================================
-- Table: challenge
-- ==========================================
CREATE TABLE `challenge` (
  `ID` int NOT NULL,
  `GuildID` bigint NOT NULL DEFAULT '0',
  `MapID` mediumint NOT NULL DEFAULT '0',
  `ChallengeID` mediumint NOT NULL DEFAULT '0',
  `RecordTime` int NOT NULL DEFAULT '0',
  `Date` int NOT NULL DEFAULT '0',
  `ChallengeLevel` smallint NOT NULL DEFAULT '0',
  `TimerLevel` smallint NOT NULL DEFAULT '0',
  `Affixes` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ChestID` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`) USING BTREE,
  KEY `mapID` (`MapID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- (Table challenge is empty)


-- ==========================================
-- Table: challenge_key
-- ==========================================
CREATE TABLE `challenge_key` (
  `guid` int NOT NULL DEFAULT '0',
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `Level` tinyint unsigned NOT NULL DEFAULT '0',
  `Affix` tinyint unsigned NOT NULL DEFAULT '0',
  `Affix1` tinyint unsigned NOT NULL DEFAULT '0',
  `Affix2` tinyint unsigned NOT NULL DEFAULT '0',
  `Affix3` tinyint unsigned NOT NULL DEFAULT '0',
  `KeyIsCharded` tinyint unsigned NOT NULL DEFAULT '0',
  `timeReset` int unsigned NOT NULL DEFAULT '0',
  `InstanceID` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`) USING BTREE,
  KEY `guid` (`guid`) USING BTREE,
  KEY `timeReset` (`timeReset`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- (Table challenge_key is empty)


-- ==========================================
-- Table: challenge_member
-- ==========================================
CREATE TABLE `challenge_member` (
  `id` int NOT NULL,
  `member` bigint NOT NULL DEFAULT '0',
  `specID` mediumint NOT NULL DEFAULT '0',
  `ChallengeLevel` smallint NOT NULL DEFAULT '0',
  `Date` int NOT NULL DEFAULT '0',
  `ChestID` int NOT NULL DEFAULT '0',
  KEY `id` (`id`,`member`) USING BTREE,
  KEY `member` (`member`) USING BTREE,
  KEY `Date` (`Date`) USING BTREE,
  KEY `ChallengeLevel` (`ChallengeLevel`) USING BTREE,
  KEY `ChestID` (`ChestID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=COMPACT;

-- (Table challenge_member is empty)


-- ==========================================
-- Table: challenge_oplote_loot
-- ==========================================
CREATE TABLE `challenge_oplote_loot` (
  `guid` int NOT NULL DEFAULT '0',
  `chestListID` varchar(150) NOT NULL DEFAULT '',
  `date` int NOT NULL DEFAULT '0',
  `ChallengeLevel` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- (Table challenge_oplote_loot is empty)


-- ==========================================
-- Table: channels
-- ==========================================
CREATE TABLE `channels` (
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `team` int unsigned NOT NULL,
  `announce` tinyint unsigned NOT NULL DEFAULT '1',
  `ownership` tinyint unsigned NOT NULL DEFAULT '1',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bannedList` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `lastUsed` bigint unsigned NOT NULL,
  PRIMARY KEY (`name`,`team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Channel System';

-- (Table channels is empty)


-- ==========================================
-- Table: char_hunter_stable
-- ==========================================
CREATE TABLE `char_hunter_stable` (
  `pet_id` int unsigned NOT NULL AUTO_INCREMENT,
  `guid` bigint unsigned NOT NULL,
  `creatureId` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`pet_id`),
  KEY `guid` (`guid`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- (Table char_hunter_stable is empty)


-- ==========================================
-- Table: character_account_data
-- ==========================================
CREATE TABLE `character_account_data` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `time` bigint NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`guid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_account_data` (`guid`, `type`, `time`, `data`) VALUES (1, 1, 1770877955, 'b\'SET pvpSelectedRoles \"8\"\\r\\nSET latestSplashScreen \"89\"\\r\\nSET autoQuestPopUps \"v11\"\\r\\nSET collapsedCurrencyCategoryDefaults \"v21###t##$U##%s###%##%^##$O###$##%m##$S###&##%j###8###\\\'##$K###9###:##%c\"\\r\\nSET trackedProfessionRecipes \"v21\"\\r\\nSET trackedInitiativeTasks \"v21\"\\r\\nSET newPvpSeason \"34\"\\r\\nSET hardTrackedWorldQuests \"v21\"\\r\\nSET currencyCategoriesCollapsed \"v21###&###8##$O##%m##%s##%^###%##$K###$##$S##%j###9##%c###\\\'###t###:##$U\"\\r\\nSET trackedPerksActivities \"v21\"\\r\\nSET trackedProfessionRecraftRecipes \"v21\"\\r\\nSET lfgSelectedRoles \"8\"\\r\\nSET trackedWorldQuests \"v21\"\\r\\nSET minimapShapeshiftTracking \"v21\"\\r\\nSET reputationsCollapsed \"v21##/%\"\\r\\nSET notifiedOfNewMail \"1\"\\r\\nSET numReputationHeaders \"28\"\\r\\nSET collapsedReputationHeaderDefaults \"v21##/X##>]##>|##6f##.m##-U##9]##0G##<|##={##2T##/Q##/%##@0\"\\r\\nSET cameraSavedPitch \"11.617927\"\\r\\nSET EJLootClass \"5\"\\r\\nSET enableMultiActionBars \"1\"\\r\\nSET numCurrencyCategories \"23\"\\r\\nSET hardTrackedQuests \"v21#)Ee#*#%\"\\r\\nSET EJSelectedTier \"516\"\\r\\nSET unlockedMajorFactions \"v21##?r##?K##@<\"\\r\\nSET maxLevelSpecsUsed \"\\x02D\"\\r\\nSET cameraSavedDistance \"19.500011\"\\r\\nSET latestTransmogSetSource \"286746\"\\r\\nSET characterNeedsTurnStrafeDialog \"0\"\\r\\nSET closedInfoFrames \"\\x02@@B@@@@@@@@@@@@@@@@`@@@@@hB\"\\r\\nSET showTokenFrame \"1\"\\r\\nSET lastSelectedClubId \"1\"\\r\\nSET trackedAchievements \"v21\"\\r\\n\'');


-- ==========================================
-- Table: character_achievement
-- ==========================================
CREATE TABLE `character_achievement` (
  `guid` bigint unsigned NOT NULL,
  `achievement` int unsigned NOT NULL,
  `date` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`achievement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_achievement` (`guid`, `achievement`, `date`) VALUES (1, 6, 1766788919);


-- ==========================================
-- Table: character_achievement_progress
-- ==========================================
CREATE TABLE `character_achievement_progress` (
  `guid` bigint unsigned NOT NULL,
  `criteria` int unsigned NOT NULL,
  `counter` bigint unsigned NOT NULL,
  `date` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_achievement_progress` (`guid`, `criteria`, `counter`, `date`) VALUES (1, 167, 1, 1766786543);


-- ==========================================
-- Table: character_action
-- ==========================================
CREATE TABLE `character_action` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `spec` tinyint unsigned NOT NULL DEFAULT '0',
  `traitConfigId` int NOT NULL DEFAULT '0',
  `button` tinyint unsigned NOT NULL DEFAULT '0',
  `action` bigint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spec`,`traitConfigId`,`button`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_action` (`guid`, `spec`, `traitConfigId`, `button`, `action`, `type`) VALUES (1, 0, 0, 120, 372608, 0);


-- ==========================================
-- Table: character_arena_stats
-- ==========================================
CREATE TABLE `character_arena_stats` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  `matchMakerRating` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_arena_stats is empty)


-- ==========================================
-- Table: character_aura
-- ==========================================
CREATE TABLE `character_aura` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `casterGuid` binary(16) NOT NULL COMMENT 'Full Global Unique Identifier',
  `itemGuid` binary(16) NOT NULL,
  `spell` int unsigned NOT NULL,
  `effectMask` int unsigned NOT NULL,
  `recalculateMask` int unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `stackCount` tinyint unsigned NOT NULL DEFAULT '1',
  `maxDuration` int NOT NULL DEFAULT '0',
  `remainTime` int NOT NULL DEFAULT '0',
  `remainCharges` tinyint unsigned NOT NULL DEFAULT '0',
  `castItemId` int unsigned NOT NULL DEFAULT '0',
  `castItemLevel` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`guid`,`casterGuid`,`itemGuid`,`spell`,`effectMask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

INSERT INTO `character_aura` (`guid`, `casterGuid`, `itemGuid`, `spell`, `effectMask`, `recalculateMask`, `difficulty`, `stackCount`, `maxDuration`, `remainTime`, `remainCharges`, `castItemId`, `castItemLevel`) VALUES (1, 'b\'\\x01\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x04\\x00\\x08\'', 'b\'\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\'', 303064, 1, 1, 0, 1, -1, -1, 0, 0, -1);


-- ==========================================
-- Table: character_aura_effect
-- ==========================================
CREATE TABLE `character_aura_effect` (
  `guid` bigint unsigned NOT NULL,
  `casterGuid` binary(16) NOT NULL COMMENT 'Full Global Unique Identifier',
  `itemGuid` binary(16) NOT NULL,
  `spell` int unsigned NOT NULL,
  `effectMask` int unsigned NOT NULL,
  `effectIndex` tinyint unsigned NOT NULL,
  `amount` int NOT NULL DEFAULT '0',
  `baseAmount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`casterGuid`,`itemGuid`,`spell`,`effectMask`,`effectIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

INSERT INTO `character_aura_effect` (`guid`, `casterGuid`, `itemGuid`, `spell`, `effectMask`, `effectIndex`, `amount`, `baseAmount`) VALUES (1, 'b\'\\x01\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x04\\x00\\x08\'', 'b\'\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\'', 303064, 1, 0, 0, 0);


-- ==========================================
-- Table: character_aura_stored_location
-- ==========================================
CREATE TABLE `character_aura_stored_location` (
  `Guid` bigint unsigned NOT NULL COMMENT 'Global Unique Identifier of Player',
  `Spell` int unsigned NOT NULL COMMENT 'Spell Identifier',
  `MapId` int unsigned NOT NULL COMMENT 'Map Id',
  `PositionX` float NOT NULL COMMENT 'position x',
  `PositionY` float NOT NULL COMMENT 'position y',
  `PositionZ` float NOT NULL COMMENT 'position z',
  `Orientation` float NOT NULL COMMENT 'Orientation',
  PRIMARY KEY (`Guid`,`Spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_aura_stored_location` (`Guid`, `Spell`, `MapId`, `PositionX`, `PositionY`, `PositionZ`, `Orientation`) VALUES (1, 1262673, 0, -9077.18, 904.547, 68.0433, 2.08568);


-- ==========================================
-- Table: character_bank_tab_settings
-- ==========================================
CREATE TABLE `character_bank_tab_settings` (
  `characterGuid` bigint unsigned NOT NULL,
  `tabId` tinyint unsigned NOT NULL,
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depositFlags` int DEFAULT '0',
  PRIMARY KEY (`characterGuid`,`tabId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_bank_tab_settings is empty)


-- ==========================================
-- Table: character_banned
-- ==========================================
CREATE TABLE `character_banned` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bandate` bigint NOT NULL DEFAULT '0',
  `unbandate` bigint NOT NULL DEFAULT '0',
  `bannedby` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Ban List';

-- (Table character_banned is empty)


-- ==========================================
-- Table: character_battleground_data
-- ==========================================
CREATE TABLE `character_battleground_data` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `instanceId` int unsigned NOT NULL COMMENT 'Instance Identifier',
  `team` smallint unsigned NOT NULL,
  `joinX` float NOT NULL DEFAULT '0',
  `joinY` float NOT NULL DEFAULT '0',
  `joinZ` float NOT NULL DEFAULT '0',
  `joinO` float NOT NULL DEFAULT '0',
  `joinMapId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `taxiStart` int unsigned NOT NULL DEFAULT '0',
  `taxiEnd` int unsigned NOT NULL DEFAULT '0',
  `mountSpell` int unsigned NOT NULL DEFAULT '0',
  `queueId` bigint unsigned DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

INSERT INTO `character_battleground_data` (`guid`, `instanceId`, `team`, `joinX`, `joinY`, `joinZ`, `joinO`, `joinMapId`, `taxiStart`, `taxiEnd`, `mountSpell`, `queueId`) VALUES (1, 0, 0, 0.0, 0.0, 0.0, 0.0, 65535, 0, 0, 0, 2238289014803136512);


-- ==========================================
-- Table: character_battleground_random
-- ==========================================
CREATE TABLE `character_battleground_random` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_battleground_random is empty)


-- ==========================================
-- Table: character_completed_challenges
-- ==========================================
CREATE TABLE `character_completed_challenges` (
  `guid` bigint unsigned NOT NULL,
  `KeyId` int unsigned NOT NULL DEFAULT '0',
  `MapId` int unsigned NOT NULL DEFAULT '0',
  `BestCompletion` int unsigned DEFAULT '0',
  `LastCompletion` int unsigned DEFAULT '0',
  `Medal` int unsigned DEFAULT '0',
  `MedalDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`guid`,`KeyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- (Table character_completed_challenges is empty)


-- ==========================================
-- Table: character_cuf_profiles
-- ==========================================
CREATE TABLE `character_cuf_profiles` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Character Guid',
  `id` tinyint unsigned NOT NULL COMMENT 'Profile Id (0-4)',
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Profile Name',
  `frameHeight` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Frame Height',
  `frameWidth` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Frame Width',
  `sortBy` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame Sort By',
  `healthText` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame Health Text',
  `boolOptions` int unsigned NOT NULL DEFAULT '0' COMMENT 'Many Configurable Bool Options',
  `topPoint` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame top alignment',
  `bottomPoint` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame bottom alignment',
  `leftPoint` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame left alignment',
  `topOffset` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame position offset from top',
  `bottomOffset` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame position offset from bottom',
  `leftOffset` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame position offset from left',
  PRIMARY KEY (`guid`,`id`),
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_cuf_profiles is empty)


-- ==========================================
-- Table: character_currency
-- ==========================================
CREATE TABLE `character_currency` (
  `CharacterGuid` bigint unsigned NOT NULL DEFAULT '0',
  `Currency` smallint unsigned NOT NULL,
  `Quantity` int unsigned NOT NULL,
  `WeeklyQuantity` int unsigned NOT NULL,
  `TrackedQuantity` int unsigned NOT NULL,
  `IncreasedCapQuantity` int unsigned NOT NULL DEFAULT '0',
  `EarnedQuantity` int unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL,
  PRIMARY KEY (`CharacterGuid`,`Currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_currency` (`CharacterGuid`, `Currency`, `Quantity`, `WeeklyQuantity`, `TrackedQuantity`, `IncreasedCapQuantity`, `EarnedQuantity`, `Flags`) VALUES (1, 2003, 43, 0, 0, 0, 0, 0);


-- ==========================================
-- Table: character_customizations
-- ==========================================
CREATE TABLE `character_customizations` (
  `guid` bigint unsigned NOT NULL,
  `chrCustomizationOptionID` int unsigned NOT NULL,
  `chrCustomizationChoiceID` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`chrCustomizationOptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_customizations` (`guid`, `chrCustomizationOptionID`, `chrCustomizationChoiceID`) VALUES (1, 9, 1);


-- ==========================================
-- Table: character_declinedname
-- ==========================================
CREATE TABLE `character_declinedname` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `genitive` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dative` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `accusative` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instrumental` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prepositional` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_declinedname is empty)


-- ==========================================
-- Table: character_equipmentsets
-- ==========================================
CREATE TABLE `character_equipmentsets` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `setguid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `setindex` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iconname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ignore_mask` int unsigned NOT NULL DEFAULT '0',
  `AssignedSpecIndex` int NOT NULL DEFAULT '-1',
  `item0` bigint unsigned NOT NULL DEFAULT '0',
  `item1` bigint unsigned NOT NULL DEFAULT '0',
  `item2` bigint unsigned NOT NULL DEFAULT '0',
  `item3` bigint unsigned NOT NULL DEFAULT '0',
  `item4` bigint unsigned NOT NULL DEFAULT '0',
  `item5` bigint unsigned NOT NULL DEFAULT '0',
  `item6` bigint unsigned NOT NULL DEFAULT '0',
  `item7` bigint unsigned NOT NULL DEFAULT '0',
  `item8` bigint unsigned NOT NULL DEFAULT '0',
  `item9` bigint unsigned NOT NULL DEFAULT '0',
  `item10` bigint unsigned NOT NULL DEFAULT '0',
  `item11` bigint unsigned NOT NULL DEFAULT '0',
  `item12` bigint unsigned NOT NULL DEFAULT '0',
  `item13` bigint unsigned NOT NULL DEFAULT '0',
  `item14` bigint unsigned NOT NULL DEFAULT '0',
  `item15` bigint unsigned NOT NULL DEFAULT '0',
  `item16` bigint unsigned NOT NULL DEFAULT '0',
  `item17` bigint unsigned NOT NULL DEFAULT '0',
  `item18` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`setguid`),
  UNIQUE KEY `idx_set` (`guid`,`setguid`,`setindex`),
  KEY `Idx_setindex` (`setindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_equipmentsets is empty)


-- ==========================================
-- Table: character_favorite_auctions
-- ==========================================
CREATE TABLE `character_favorite_auctions` (
  `guid` bigint unsigned NOT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `itemId` int unsigned NOT NULL DEFAULT '0',
  `itemLevel` int unsigned NOT NULL DEFAULT '0',
  `battlePetSpeciesId` int unsigned NOT NULL DEFAULT '0',
  `suffixItemNameDescriptionId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_favorite_auctions is empty)


-- ==========================================
-- Table: character_fishingsteps
-- ==========================================
CREATE TABLE `character_fishingsteps` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `fishingSteps` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_fishingsteps is empty)


-- ==========================================
-- Table: character_garrison
-- ==========================================
CREATE TABLE `character_garrison` (
  `guid` bigint unsigned NOT NULL,
  `siteLevelId` int unsigned NOT NULL DEFAULT '0',
  `followerActivationsRemainingToday` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_garrison is empty)


-- ==========================================
-- Table: character_garrison_blueprints
-- ==========================================
CREATE TABLE `character_garrison_blueprints` (
  `guid` bigint unsigned NOT NULL,
  `buildingId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`buildingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_garrison_blueprints is empty)


-- ==========================================
-- Table: character_garrison_buildings
-- ==========================================
CREATE TABLE `character_garrison_buildings` (
  `guid` bigint unsigned NOT NULL,
  `plotInstanceId` int unsigned NOT NULL DEFAULT '0',
  `buildingId` int unsigned NOT NULL DEFAULT '0',
  `timeBuilt` bigint NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`plotInstanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_garrison_buildings is empty)


-- ==========================================
-- Table: character_garrison_follower_abilities
-- ==========================================
CREATE TABLE `character_garrison_follower_abilities` (
  `dbId` bigint unsigned NOT NULL,
  `abilityId` int unsigned NOT NULL,
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dbId`,`abilityId`,`slot`),
  CONSTRAINT `fk_foll_dbid` FOREIGN KEY (`dbId`) REFERENCES `character_garrison_followers` (`dbId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_garrison_follower_abilities is empty)


-- ==========================================
-- Table: character_garrison_followers
-- ==========================================
CREATE TABLE `character_garrison_followers` (
  `dbId` bigint unsigned NOT NULL,
  `guid` bigint unsigned NOT NULL,
  `followerId` int unsigned NOT NULL,
  `quality` int unsigned NOT NULL DEFAULT '2',
  `level` int unsigned NOT NULL DEFAULT '90',
  `itemLevelWeapon` int unsigned NOT NULL DEFAULT '600',
  `itemLevelArmor` int unsigned NOT NULL DEFAULT '600',
  `xp` int unsigned NOT NULL DEFAULT '0',
  `currentBuilding` int unsigned NOT NULL DEFAULT '0',
  `currentMission` int unsigned NOT NULL DEFAULT '0',
  `status` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dbId`),
  UNIQUE KEY `idx_guid_id` (`guid`,`followerId`),
  CONSTRAINT `fk_foll_owner` FOREIGN KEY (`guid`) REFERENCES `characters` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_garrison_followers is empty)


-- ==========================================
-- Table: character_garrison_mission_rewards
-- ==========================================
CREATE TABLE `character_garrison_mission_rewards` (
  `dbId` int unsigned NOT NULL,
  `type` tinyint unsigned NOT NULL,
  `itemId` int NOT NULL DEFAULT '0',
  `itemQuantity` int unsigned NOT NULL DEFAULT '0',
  `currencyId` int NOT NULL DEFAULT '0',
  `currencyQuantity` int unsigned NOT NULL DEFAULT '0',
  `FollowerXP` int unsigned NOT NULL DEFAULT '0',
  `BonusAbilityId` int unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- (Table character_garrison_mission_rewards is empty)


-- ==========================================
-- Table: character_garrison_missions
-- ==========================================
CREATE TABLE `character_garrison_missions` (
  `dbId` bigint unsigned NOT NULL,
  `guid` bigint unsigned NOT NULL,
  `garrison_type` tinyint unsigned NOT NULL,
  `missionId` int unsigned NOT NULL,
  `offerTime` int NOT NULL,
  `startTime` int NOT NULL,
  `status` tinyint unsigned NOT NULL,
  PRIMARY KEY (`dbId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- (Table character_garrison_missions is empty)


-- ==========================================
-- Table: character_garrison_shipment
-- ==========================================
CREATE TABLE `character_garrison_shipment` (
  `dbId` bigint NOT NULL,
  `guid` bigint NOT NULL,
  `shipmentID` smallint NOT NULL,
  `GarrTypeId` smallint NOT NULL DEFAULT '0',
  `start` int unsigned NOT NULL DEFAULT '0',
  `end` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`dbId`) USING BTREE,
  KEY `dbId` (`dbId`) USING BTREE,
  KEY `guid` (`guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- (Table character_garrison_shipment is empty)


-- ==========================================
-- Table: character_garrison_talents
-- ==========================================
CREATE TABLE `character_garrison_talents` (
  `guid` bigint NOT NULL,
  `GarrTypeId` int unsigned NOT NULL DEFAULT '0',
  `talentID` int NOT NULL,
  `orderTime` int NOT NULL,
  `flags` int NOT NULL,
  PRIMARY KEY (`guid`,`GarrTypeId`,`talentID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- (Table character_garrison_talents is empty)


-- ==========================================
-- Table: character_gifts
-- ==========================================
CREATE TABLE `character_gifts` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `item_guid` bigint unsigned NOT NULL DEFAULT '0',
  `entry` int unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_gifts is empty)


-- ==========================================
-- Table: character_glyphs
-- ==========================================
CREATE TABLE `character_glyphs` (
  `guid` bigint unsigned NOT NULL,
  `talentGroup` tinyint unsigned NOT NULL DEFAULT '0',
  `glyphId` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`talentGroup`,`glyphId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_glyphs is empty)


-- ==========================================
-- Table: character_homebind
-- ==========================================
CREATE TABLE `character_homebind` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mapId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

INSERT INTO `character_homebind` (`guid`, `mapId`, `zoneId`, `posX`, `posY`, `posZ`, `orientation`) VALUES (1, 0, 9, -8914.57, -133.909, 80.5378, 5.10444);


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
-- Table: character_instance_lock
-- ==========================================
CREATE TABLE `character_instance_lock` (
  `guid` bigint unsigned NOT NULL,
  `mapId` int unsigned NOT NULL,
  `lockId` int unsigned NOT NULL,
  `instanceId` int unsigned DEFAULT NULL,
  `difficulty` tinyint unsigned DEFAULT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `completedEncountersMask` int unsigned DEFAULT NULL,
  `entranceWorldSafeLocId` int unsigned DEFAULT NULL,
  `expiryTime` bigint unsigned DEFAULT NULL,
  `extended` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`guid`,`mapId`,`lockId`),
  UNIQUE KEY `uk_character_instanceId` (`guid`,`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_instance_lock is empty)


-- ==========================================
-- Table: character_inventory
-- ==========================================
CREATE TABLE `character_inventory` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bag` bigint unsigned NOT NULL DEFAULT '0',
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  `item` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Item Global Unique Identifier',
  PRIMARY KEY (`item`),
  UNIQUE KEY `uk_location` (`guid`,`bag`,`slot`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

INSERT INTO `character_inventory` (`guid`, `bag`, `slot`, `item`) VALUES (1, 0, 0, 14201);


-- ==========================================
-- Table: character_pet
-- ==========================================
CREATE TABLE `character_pet` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `entry` int unsigned NOT NULL DEFAULT '0',
  `owner` bigint unsigned NOT NULL DEFAULT '0',
  `modelid` int unsigned DEFAULT '0',
  `CreatedBySpell` int unsigned NOT NULL DEFAULT '0',
  `PetType` tinyint unsigned NOT NULL DEFAULT '0',
  `level` smallint unsigned NOT NULL DEFAULT '1',
  `exp` int unsigned NOT NULL DEFAULT '0',
  `Reactstate` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(21) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pet',
  `renamed` tinyint unsigned NOT NULL DEFAULT '0',
  `slot` smallint NOT NULL DEFAULT '-1',
  `curhealth` int unsigned NOT NULL DEFAULT '1',
  `curmana` int unsigned NOT NULL DEFAULT '0',
  `savetime` int unsigned NOT NULL DEFAULT '0',
  `abdata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `specialization` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `idx_slot` (`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Pet System';

INSERT INTO `character_pet` (`id`, `entry`, `owner`, `modelid`, `CreatedBySpell`, `PetType`, `level`, `exp`, `Reactstate`, `name`, `renamed`, `slot`, `curhealth`, `curmana`, `savetime`, `abdata`, `specialization`) VALUES (2, 417, 5, 77398, 691, 0, 80, 0, 0, 'Droodrom', 1, -1, 250115, 0, 1770357626, '7 2 7 1 7 0 1 19505 193 54049 1 0 1 0 6 2 6 1 6 0 ', 0);


-- ==========================================
-- Table: character_pet_declinedname
-- ==========================================
CREATE TABLE `character_pet_declinedname` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `owner` int unsigned NOT NULL DEFAULT '0',
  `genitive` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `dative` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `accusative` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instrumental` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `prepositional` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `owner_key` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_pet_declinedname is empty)


-- ==========================================
-- Table: character_player_data_element
-- ==========================================
CREATE TABLE `character_player_data_element` (
  `characterGuid` bigint unsigned NOT NULL,
  `playerDataElementCharacterId` int unsigned NOT NULL,
  `floatValue` float DEFAULT NULL,
  `int64Value` bigint DEFAULT NULL,
  PRIMARY KEY (`characterGuid`,`playerDataElementCharacterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_player_data_element is empty)


-- ==========================================
-- Table: character_player_data_flag
-- ==========================================
CREATE TABLE `character_player_data_flag` (
  `characterGuid` bigint unsigned NOT NULL,
  `storageIndex` int unsigned NOT NULL,
  `mask` bigint unsigned NOT NULL,
  PRIMARY KEY (`characterGuid`,`storageIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_player_data_flag is empty)


-- ==========================================
-- Table: character_pvp_talent
-- ==========================================
CREATE TABLE `character_pvp_talent` (
  `guid` bigint unsigned NOT NULL,
  `talentId0` int unsigned NOT NULL,
  `talentId1` int unsigned NOT NULL,
  `talentId2` int unsigned NOT NULL,
  `talentId3` int unsigned NOT NULL,
  `talentGroup` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`talentGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_pvp_talent` (`guid`, `talentId0`, `talentId1`, `talentId2`, `talentId3`, `talentGroup`) VALUES (1, 0, 0, 0, 0, 0);


-- ==========================================
-- Table: character_queststatus
-- ==========================================
CREATE TABLE `character_queststatus` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `quest` int unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `explored` tinyint unsigned NOT NULL DEFAULT '0',
  `acceptTime` bigint NOT NULL DEFAULT '0',
  `endTime` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

INSERT INTO `character_queststatus` (`guid`, `quest`, `status`, `explored`, `acceptTime`, `endTime`) VALUES (1, 55122, 3, 0, 1766788907, 0);


-- ==========================================
-- Table: character_queststatus_daily
-- ==========================================
CREATE TABLE `character_queststatus_daily` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

-- (Table character_queststatus_daily is empty)


-- ==========================================
-- Table: character_queststatus_monthly
-- ==========================================
CREATE TABLE `character_queststatus_monthly` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

-- (Table character_queststatus_monthly is empty)


-- ==========================================
-- Table: character_queststatus_objectives
-- ==========================================
CREATE TABLE `character_queststatus_objectives` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `quest` int unsigned NOT NULL DEFAULT '0',
  `objective` tinyint unsigned NOT NULL DEFAULT '0',
  `data` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`,`objective`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

INSERT INTO `character_queststatus_objectives` (`guid`, `quest`, `objective`, `data`) VALUES (2, 28713, 0, 6);


-- ==========================================
-- Table: character_queststatus_objectives_criteria
-- ==========================================
CREATE TABLE `character_queststatus_objectives_criteria` (
  `guid` bigint unsigned NOT NULL,
  `questObjectiveId` int unsigned NOT NULL,
  PRIMARY KEY (`guid`,`questObjectiveId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

-- (Table character_queststatus_objectives_criteria is empty)


-- ==========================================
-- Table: character_queststatus_objectives_criteria_progress
-- ==========================================
CREATE TABLE `character_queststatus_objectives_criteria_progress` (
  `guid` bigint unsigned NOT NULL,
  `criteriaId` int unsigned NOT NULL,
  `counter` bigint unsigned NOT NULL,
  `date` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`criteriaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

-- (Table character_queststatus_objectives_criteria_progress is empty)


-- ==========================================
-- Table: character_queststatus_objectives_spawn_tracking
-- ==========================================
CREATE TABLE `character_queststatus_objectives_spawn_tracking` (
  `guid` bigint unsigned NOT NULL,
  `quest` int unsigned NOT NULL,
  `objective` tinyint unsigned NOT NULL DEFAULT '0',
  `spawnTrackingId` int unsigned NOT NULL,
  PRIMARY KEY (`guid`,`quest`,`objective`,`spawnTrackingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_queststatus_objectives_spawn_tracking is empty)


-- ==========================================
-- Table: character_queststatus_rewarded
-- ==========================================
CREATE TABLE `character_queststatus_rewarded` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

INSERT INTO `character_queststatus_rewarded` (`guid`, `quest`, `active`) VALUES (1, 0, 1);


-- ==========================================
-- Table: character_queststatus_seasonal
-- ==========================================
CREATE TABLE `character_queststatus_seasonal` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `event` int unsigned NOT NULL DEFAULT '0' COMMENT 'Event Identifier',
  `completedTime` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

-- (Table character_queststatus_seasonal is empty)


-- ==========================================
-- Table: character_queststatus_weekly
-- ==========================================
CREATE TABLE `character_queststatus_weekly` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

-- (Table character_queststatus_weekly is empty)


-- ==========================================
-- Table: character_queststatus_world
-- ==========================================
CREATE TABLE `character_queststatus_world` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `account` int unsigned NOT NULL DEFAULT '0',
  `quest` int unsigned NOT NULL DEFAULT '0',
  `resetTime` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`) USING BTREE,
  KEY `resetTime` (`resetTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- (Table character_queststatus_world is empty)


-- ==========================================
-- Table: character_reputation
-- ==========================================
CREATE TABLE `character_reputation` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  `standing` int NOT NULL DEFAULT '0',
  `flags` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

INSERT INTO `character_reputation` (`guid`, `faction`, `standing`, `flags`) VALUES (1, 21, 0, 64);


-- ==========================================
-- Table: character_skills
-- ==========================================
CREATE TABLE `character_skills` (
  `guid` bigint unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `skill` smallint unsigned NOT NULL,
  `value` smallint unsigned NOT NULL,
  `max` smallint unsigned NOT NULL,
  `professionSlot` tinyint NOT NULL DEFAULT '-1',
  PRIMARY KEY (`guid`,`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

INSERT INTO `character_skills` (`guid`, `skill`, `value`, `max`, `professionSlot`) VALUES (1, 54, 1, 400, -1);


-- ==========================================
-- Table: character_social
-- ==========================================
CREATE TABLE `character_social` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `friend` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Global Unique Identifier',
  `flags` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Flags',
  `note` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Friend Note',
  PRIMARY KEY (`guid`,`friend`,`flags`),
  KEY `friend` (`friend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

-- (Table character_social is empty)


-- ==========================================
-- Table: character_spell
-- ==========================================
CREATE TABLE `character_spell` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

INSERT INTO `character_spell` (`guid`, `spell`, `active`, `disabled`) VALUES (1, 1235595, 1, 0);


-- ==========================================
-- Table: character_spell_charges
-- ==========================================
CREATE TABLE `character_spell_charges` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `categoryId` int unsigned NOT NULL DEFAULT '0' COMMENT 'SpellCategory.dbc Identifier',
  `rechargeStart` bigint NOT NULL DEFAULT '0',
  `rechargeEnd` bigint NOT NULL DEFAULT '0',
  KEY `idx_guid` (`guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_spell_charges` (`guid`, `categoryId`, `rechargeStart`, `rechargeEnd`) VALUES (2, 1581, 1767510402, 1767510409);


-- ==========================================
-- Table: character_spell_cooldown
-- ==========================================
CREATE TABLE `character_spell_cooldown` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `item` int unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `time` bigint NOT NULL DEFAULT '0',
  `categoryId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell category Id',
  `categoryEnd` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_spell_cooldown` (`guid`, `spell`, `item`, `time`, `categoryId`, `categoryEnd`) VALUES (15, 361584, 0, 1782931645, 2193, 1782931645);


-- ==========================================
-- Table: character_spell_favorite
-- ==========================================
CREATE TABLE `character_spell_favorite` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

-- (Table character_spell_favorite is empty)


-- ==========================================
-- Table: character_stats
-- ==========================================
CREATE TABLE `character_stats` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `maxhealth` int unsigned NOT NULL DEFAULT '0',
  `maxpower1` int unsigned NOT NULL DEFAULT '0',
  `maxpower2` int unsigned NOT NULL DEFAULT '0',
  `maxpower3` int unsigned NOT NULL DEFAULT '0',
  `maxpower4` int unsigned NOT NULL DEFAULT '0',
  `maxpower5` int unsigned NOT NULL DEFAULT '0',
  `maxpower6` int unsigned NOT NULL DEFAULT '0',
  `maxpower7` int unsigned NOT NULL DEFAULT '0',
  `maxpower8` int unsigned NOT NULL DEFAULT '0',
  `maxpower9` int unsigned NOT NULL DEFAULT '0',
  `maxpower10` int unsigned NOT NULL DEFAULT '0',
  `strength` int unsigned NOT NULL DEFAULT '0',
  `agility` int unsigned NOT NULL DEFAULT '0',
  `stamina` int unsigned NOT NULL DEFAULT '0',
  `intellect` int unsigned NOT NULL DEFAULT '0',
  `spirit` int unsigned NOT NULL DEFAULT '0',
  `armor` int unsigned NOT NULL DEFAULT '0',
  `resHoly` int unsigned NOT NULL DEFAULT '0',
  `resFire` int unsigned NOT NULL DEFAULT '0',
  `resNature` int unsigned NOT NULL DEFAULT '0',
  `resFrost` int unsigned NOT NULL DEFAULT '0',
  `resShadow` int unsigned NOT NULL DEFAULT '0',
  `resArcane` int unsigned NOT NULL DEFAULT '0',
  `blockPct` float unsigned NOT NULL DEFAULT '0',
  `dodgePct` float unsigned NOT NULL DEFAULT '0',
  `parryPct` float unsigned NOT NULL DEFAULT '0',
  `critPct` float unsigned NOT NULL DEFAULT '0',
  `rangedCritPct` float unsigned NOT NULL DEFAULT '0',
  `spellCritPct` float unsigned NOT NULL DEFAULT '0',
  `attackPower` int unsigned NOT NULL DEFAULT '0',
  `rangedAttackPower` int unsigned NOT NULL DEFAULT '0',
  `spellPower` int unsigned NOT NULL DEFAULT '0',
  `resilience` int unsigned NOT NULL DEFAULT '0',
  `mastery` float NOT NULL DEFAULT '0',
  `versatility` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_stats is empty)


-- ==========================================
-- Table: character_talent
-- ==========================================
CREATE TABLE `character_talent` (
  `guid` bigint unsigned NOT NULL,
  `talentId` int unsigned NOT NULL,
  `talentGroup` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`talentId`,`talentGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_talent is empty)


-- ==========================================
-- Table: character_trait_config
-- ==========================================
CREATE TABLE `character_trait_config` (
  `guid` bigint unsigned NOT NULL,
  `traitConfigId` int NOT NULL,
  `type` int NOT NULL,
  `chrSpecializationId` int DEFAULT NULL,
  `combatConfigFlags` int DEFAULT NULL,
  `localIdentifier` int DEFAULT NULL,
  `skillLineId` int DEFAULT NULL,
  `traitSystemId` int DEFAULT NULL,
  `variationId` int DEFAULT NULL,
  `name` varchar(260) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`,`traitConfigId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_trait_config` (`guid`, `traitConfigId`, `type`, `chrSpecializationId`, `combatConfigFlags`, `localIdentifier`, `skillLineId`, `traitSystemId`, `variationId`, `name`) VALUES (1, 1766769877, 1, 256, 1, 1, NULL, NULL, NULL, 'Discipline');


-- ==========================================
-- Table: character_trait_entry
-- ==========================================
CREATE TABLE `character_trait_entry` (
  `guid` bigint unsigned NOT NULL,
  `traitConfigId` int NOT NULL,
  `traitNodeId` int NOT NULL,
  `traitNodeEntryId` int NOT NULL,
  `rank` int NOT NULL DEFAULT '0',
  `grantedRanks` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`traitConfigId`,`traitNodeId`,`traitNodeEntryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_trait_entry` (`guid`, `traitConfigId`, `traitNodeId`, `traitNodeEntryId`, `rank`, `grantedRanks`) VALUES (1, 1766769877, 82713, 103865, 0, 0);


-- ==========================================
-- Table: character_transmog_outfits
-- ==========================================
CREATE TABLE `character_transmog_outfits` (
  `guid` bigint NOT NULL DEFAULT '0',
  `setguid` bigint NOT NULL AUTO_INCREMENT,
  `setindex` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `iconname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ignore_mask` int NOT NULL DEFAULT '0',
  `appearance0` int NOT NULL DEFAULT '0',
  `appearance1` int NOT NULL DEFAULT '0',
  `appearance2` int NOT NULL DEFAULT '0',
  `appearance3` int NOT NULL DEFAULT '0',
  `appearance4` int NOT NULL DEFAULT '0',
  `appearance5` int NOT NULL DEFAULT '0',
  `appearance6` int NOT NULL DEFAULT '0',
  `appearance7` int NOT NULL DEFAULT '0',
  `appearance8` int NOT NULL DEFAULT '0',
  `appearance9` int NOT NULL DEFAULT '0',
  `appearance10` int NOT NULL DEFAULT '0',
  `appearance11` int NOT NULL DEFAULT '0',
  `appearance12` int NOT NULL DEFAULT '0',
  `appearance13` int NOT NULL DEFAULT '0',
  `appearance14` int NOT NULL DEFAULT '0',
  `appearance15` int NOT NULL DEFAULT '0',
  `appearance16` int NOT NULL DEFAULT '0',
  `appearance17` int NOT NULL DEFAULT '0',
  `appearance18` int NOT NULL DEFAULT '0',
  `mainHandEnchant` int NOT NULL DEFAULT '0',
  `offHandEnchant` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`setguid`),
  UNIQUE KEY `idx_set` (`guid`,`setguid`,`setindex`),
  KEY `Idx_setindex` (`setindex`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_transmog_outfits` (`guid`, `setguid`, `setindex`, `name`, `iconname`, `ignore_mask`, `appearance0`, `appearance1`, `appearance2`, `appearance3`, `appearance4`, `appearance5`, `appearance6`, `appearance7`, `appearance8`, `appearance9`, `appearance10`, `appearance11`, `appearance12`, `appearance13`, `appearance14`, `appearance15`, `appearance16`, `appearance17`, `appearance18`, `mainHandEnchant`, `offHandEnchant`) VALUES (8, 1, 0, 'test', '7392331', 490506, 48846, 0, 300625, 0, 300621, 300626, 300624, 300622, 300627, 300623, 0, 0, 0, 0, 0, 304113, 0, 0, 0, 0, 0);


-- ==========================================
-- Table: characters
-- ==========================================
CREATE TABLE `characters` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `account` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `gender` tinyint unsigned NOT NULL DEFAULT '0',
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `xp` int unsigned NOT NULL DEFAULT '0',
  `money` bigint unsigned NOT NULL DEFAULT '0',
  `inventorySlots` tinyint unsigned NOT NULL DEFAULT '16',
  `inventoryBagFlags` int unsigned NOT NULL DEFAULT '0',
  `bagSlotFlags1` int unsigned NOT NULL DEFAULT '0',
  `bagSlotFlags2` int unsigned NOT NULL DEFAULT '0',
  `bagSlotFlags3` int unsigned NOT NULL DEFAULT '0',
  `bagSlotFlags4` int unsigned NOT NULL DEFAULT '0',
  `bagSlotFlags5` int unsigned NOT NULL DEFAULT '0',
  `bankSlots` tinyint unsigned NOT NULL DEFAULT '0',
  `bankTabs` tinyint unsigned NOT NULL DEFAULT '0',
  `bankBagFlags` int unsigned NOT NULL DEFAULT '0',
  `restState` tinyint unsigned NOT NULL DEFAULT '0',
  `playerFlags` int unsigned NOT NULL DEFAULT '0',
  `playerFlagsEx` int unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `instance_id` int unsigned NOT NULL DEFAULT '0',
  `dungeonDifficulty` tinyint unsigned NOT NULL DEFAULT '1',
  `raidDifficulty` tinyint unsigned NOT NULL DEFAULT '14',
  `legacyRaidDifficulty` tinyint unsigned NOT NULL DEFAULT '3',
  `orientation` float NOT NULL DEFAULT '0',
  `taximask` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `online` tinyint unsigned NOT NULL DEFAULT '0',
  `createTime` bigint NOT NULL DEFAULT '0',
  `createMode` tinyint NOT NULL DEFAULT '0',
  `cinematic` tinyint unsigned NOT NULL DEFAULT '0',
  `totaltime` int unsigned NOT NULL DEFAULT '0',
  `leveltime` int unsigned NOT NULL DEFAULT '0',
  `logout_time` bigint NOT NULL DEFAULT '0',
  `is_logout_resting` tinyint unsigned NOT NULL DEFAULT '0',
  `rest_bonus` float NOT NULL DEFAULT '0',
  `resettalents_cost` int unsigned NOT NULL DEFAULT '0',
  `resettalents_time` bigint NOT NULL DEFAULT '0',
  `numRespecs` tinyint unsigned NOT NULL DEFAULT '0',
  `primarySpecialization` int unsigned NOT NULL DEFAULT '0',
  `trans_x` float NOT NULL DEFAULT '0',
  `trans_y` float NOT NULL DEFAULT '0',
  `trans_z` float NOT NULL DEFAULT '0',
  `trans_o` float NOT NULL DEFAULT '0',
  `transguid` bigint unsigned NOT NULL DEFAULT '0',
  `extra_flags` smallint unsigned NOT NULL DEFAULT '0',
  `summonedPetNumber` int unsigned NOT NULL DEFAULT '0',
  `at_login` smallint unsigned NOT NULL DEFAULT '0',
  `zone` smallint unsigned NOT NULL DEFAULT '0',
  `death_expire_time` bigint NOT NULL DEFAULT '0',
  `taxi_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `totalKills` int unsigned NOT NULL DEFAULT '0',
  `todayKills` smallint unsigned NOT NULL DEFAULT '0',
  `yesterdayKills` smallint unsigned NOT NULL DEFAULT '0',
  `chosenTitle` int unsigned NOT NULL DEFAULT '0',
  `watchedFaction` int unsigned NOT NULL DEFAULT '0',
  `drunk` tinyint unsigned NOT NULL DEFAULT '0',
  `health` int unsigned NOT NULL DEFAULT '0',
  `power1` int unsigned NOT NULL DEFAULT '0',
  `power2` int unsigned NOT NULL DEFAULT '0',
  `power3` int unsigned NOT NULL DEFAULT '0',
  `power4` int unsigned NOT NULL DEFAULT '0',
  `power5` int unsigned NOT NULL DEFAULT '0',
  `power6` int unsigned NOT NULL DEFAULT '0',
  `power7` int unsigned NOT NULL DEFAULT '0',
  `power8` int unsigned NOT NULL DEFAULT '0',
  `power9` int unsigned NOT NULL DEFAULT '0',
  `power10` int unsigned NOT NULL DEFAULT '0',
  `latency` int unsigned NOT NULL DEFAULT '0',
  `activeTalentGroup` tinyint unsigned NOT NULL DEFAULT '0',
  `lootSpecId` int unsigned NOT NULL DEFAULT '0',
  `exploredZones` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `equipmentCache` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `knownTitles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `actionBars` tinyint unsigned NOT NULL DEFAULT '0',
  `deleteInfos_Account` int unsigned DEFAULT NULL,
  `deleteInfos_Name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleteDate` bigint DEFAULT NULL,
  `honor` int unsigned NOT NULL DEFAULT '0',
  `honorLevel` int unsigned NOT NULL DEFAULT '1',
  `honorRestState` tinyint unsigned NOT NULL DEFAULT '2',
  `honorRestBonus` float NOT NULL DEFAULT '0',
  `lastLoginBuild` int unsigned NOT NULL DEFAULT '0',
  `personalTabardEmblemStyle` int NOT NULL DEFAULT '-1',
  `personalTabardEmblemColor` int NOT NULL DEFAULT '-1',
  `personalTabardBorderStyle` int NOT NULL DEFAULT '-1',
  `personalTabardBorderColor` int NOT NULL DEFAULT '-1',
  `personalTabardBackgroundColor` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `idx_name` (`name`),
  KEY `idx_account` (`account`),
  KEY `idx_online` (`online`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

INSERT INTO `characters` (`guid`, `account`, `name`, `slot`, `race`, `class`, `gender`, `level`, `xp`, `money`, `inventorySlots`, `inventoryBagFlags`, `bagSlotFlags1`, `bagSlotFlags2`, `bagSlotFlags3`, `bagSlotFlags4`, `bagSlotFlags5`, `bankSlots`, `bankTabs`, `bankBagFlags`, `restState`, `playerFlags`, `playerFlagsEx`, `position_x`, `position_y`, `position_z`, `map`, `instance_id`, `dungeonDifficulty`, `raidDifficulty`, `legacyRaidDifficulty`, `orientation`, `taximask`, `online`, `createTime`, `createMode`, `cinematic`, `totaltime`, `leveltime`, `logout_time`, `is_logout_resting`, `rest_bonus`, `resettalents_cost`, `resettalents_time`, `numRespecs`, `primarySpecialization`, `trans_x`, `trans_y`, `trans_z`, `trans_o`, `transguid`, `extra_flags`, `summonedPetNumber`, `at_login`, `zone`, `death_expire_time`, `taxi_path`, `totalKills`, `todayKills`, `yesterdayKills`, `chosenTitle`, `watchedFaction`, `drunk`, `health`, `power1`, `power2`, `power3`, `power4`, `power5`, `power6`, `power7`, `power8`, `power9`, `power10`, `latency`, `activeTalentGroup`, `lootSpecId`, `exploredZones`, `equipmentCache`, `knownTitles`, `actionBars`, `deleteInfos_Account`, `deleteInfos_Name`, `deleteDate`, `honor`, `honorLevel`, `honorRestState`, `honorRestBonus`, `lastLoginBuild`, `personalTabardEmblemStyle`, `personalTabardEmblemColor`, `personalTabardBorderStyle`, `personalTabardBorderColor`, `personalTabardBackgroundColor`) VALUES (1, 1, 'Sicalicious', 1, 1, 5, 0, 80, 0, 4237800, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 268435466, 0, 233.922, -2755.23, 1411.74, 2444, 0, 1, 14, 3, 0.774583, '34 0 0 6 0 0 1 0 0 0 0 32 8 0 0 0 0 0 0 0 0 0 0 0 0 0 16 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 128 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32 16 0 0 0 140 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', 0, 1766786543, 1, 1, 9369, 6962, 1770881729, 0, 0.0, 0, 0, 0, 1452, 0.0, 0.0, 0.0, 0.0, 0, 9, 0, 0, 13801, 0, '', 0, 0, 0, 0, 4294967295, 0, 1744660, 50000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 4, 0, '1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 512 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 65664 0 0 0 0 128 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4096 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 8 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 4 0 0 4194304 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 536870912 0 0 0 0 3145728 0 4325376 0 0 0 0 270532608 0 ', '1 194938 0 1 0 2 0 0 0 0 3 184108 0 1 0 0 0 0 0 0 20 184102 0 1 0 6 184109 0 1 0 7 191564 0 1 0 8 191565 0 1 0 9 191566 0 1 0 10 191567 0 1 0 11 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 17 472 0 10 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', '', 1, NULL, NULL, NULL, 0, 1, 2, 0.0, 120000, -1, -1, -1, -1, -1);


-- ==========================================
-- Table: corpse
-- ==========================================
CREATE TABLE `corpse` (
  `guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `displayId` int unsigned NOT NULL DEFAULT '0',
  `itemCache` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `gender` tinyint unsigned NOT NULL DEFAULT '0',
  `flags` tinyint unsigned NOT NULL DEFAULT '0',
  `dynFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `corpseType` tinyint unsigned NOT NULL DEFAULT '0',
  `instanceId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`),
  KEY `idx_type` (`corpseType`),
  KEY `idx_instance` (`instanceId`),
  KEY `idx_time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Death System';

INSERT INTO `corpse` (`guid`, `posX`, `posY`, `posZ`, `orientation`, `mapId`, `displayId`, `itemCache`, `race`, `class`, `gender`, `flags`, `dynFlags`, `time`, `corpseType`, `instanceId`) VALUES (16, 1383.39, 582.9, 1339.86, 5.51731, 2694, 116687, '0 0 0 0 84601139 101341649 118118851 134896059 151711269 168450489 0 0 0 0 0 252328874 0 0 0 ', 86, 3, 1, 0, 0, 1775745951, 1, 0);


-- ==========================================
-- Table: corpse_customizations
-- ==========================================
CREATE TABLE `corpse_customizations` (
  `ownerGuid` bigint unsigned NOT NULL,
  `chrCustomizationOptionID` int unsigned NOT NULL,
  `chrCustomizationChoiceID` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ownerGuid`,`chrCustomizationOptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `corpse_customizations` (`ownerGuid`, `chrCustomizationOptionID`, `chrCustomizationChoiceID`) VALUES (16, 8702, 59396);


-- ==========================================
-- Table: corpse_phases
-- ==========================================
CREATE TABLE `corpse_phases` (
  `OwnerGuid` bigint unsigned NOT NULL DEFAULT '0',
  `PhaseId` int unsigned NOT NULL,
  PRIMARY KEY (`OwnerGuid`,`PhaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `corpse_phases` (`OwnerGuid`, `PhaseId`) VALUES (16, 45716);


-- ==========================================
-- Table: custom_transmog
-- ==========================================
CREATE TABLE `custom_transmog` (
  `guid` bigint unsigned NOT NULL,
  `slot` tinyint unsigned NOT NULL,
  `itemId` int unsigned NOT NULL,
  PRIMARY KEY (`guid`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- (Table custom_transmog is empty)


-- ==========================================
-- Table: custom_transmog_active
-- ==========================================
CREATE TABLE `custom_transmog_active` (
  `guid` bigint unsigned NOT NULL,
  `slot` tinyint unsigned NOT NULL,
  `itemId` int unsigned NOT NULL,
  PRIMARY KEY (`guid`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- (Table custom_transmog_active is empty)


-- ==========================================
-- Table: custom_transmog_appearances
-- ==========================================
CREATE TABLE `custom_transmog_appearances` (
  `guid` bigint unsigned NOT NULL,
  `itemId` int unsigned NOT NULL,
  `slot` tinyint unsigned NOT NULL,
  PRIMARY KEY (`guid`,`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `custom_transmog_appearances` (`guid`, `itemId`, `slot`) VALUES (8, 93622, 0);


-- ==========================================
-- Table: custom_transmog_enchant
-- ==========================================
CREATE TABLE `custom_transmog_enchant` (
  `guid` bigint unsigned NOT NULL,
  `slot` tinyint unsigned NOT NULL,
  `enchantId` int unsigned NOT NULL,
  PRIMARY KEY (`guid`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- (Table custom_transmog_enchant is empty)


-- ==========================================
-- Table: custom_transmog_sets
-- ==========================================
CREATE TABLE `custom_transmog_sets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `guid` bigint unsigned NOT NULL,
  `name` varchar(64) NOT NULL,
  `slots` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- (Table custom_transmog_sets is empty)


-- ==========================================
-- Table: game_event_condition_save
-- ==========================================
CREATE TABLE `game_event_condition_save` (
  `eventEntry` tinyint unsigned NOT NULL,
  `condition_id` int unsigned NOT NULL DEFAULT '0',
  `done` float DEFAULT '0',
  PRIMARY KEY (`eventEntry`,`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table game_event_condition_save is empty)


-- ==========================================
-- Table: game_event_save
-- ==========================================
CREATE TABLE `game_event_save` (
  `eventEntry` tinyint unsigned NOT NULL,
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `next_start` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table game_event_save is empty)


-- ==========================================
-- Table: gm_bug
-- ==========================================
CREATE TABLE `gm_bug` (
  `id` int unsigned NOT NULL,
  `playerGuid` bigint unsigned NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createTime` bigint NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `facing` float NOT NULL DEFAULT '0',
  `closedBy` bigint NOT NULL DEFAULT '0',
  `assignedTo` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table gm_bug is empty)


-- ==========================================
-- Table: gm_complaint
-- ==========================================
CREATE TABLE `gm_complaint` (
  `id` int unsigned NOT NULL,
  `playerGuid` bigint unsigned NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createTime` bigint NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `facing` float NOT NULL DEFAULT '0',
  `targetCharacterGuid` bigint unsigned NOT NULL,
  `reportType` int NOT NULL DEFAULT '0',
  `reportMajorCategory` int NOT NULL DEFAULT '0',
  `reportMinorCategoryFlags` int NOT NULL DEFAULT '0',
  `reportLineIndex` int NOT NULL,
  `closedBy` bigint NOT NULL DEFAULT '0',
  `assignedTo` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table gm_complaint is empty)


-- ==========================================
-- Table: gm_complaint_chatlog
-- ==========================================
CREATE TABLE `gm_complaint_chatlog` (
  `complaintId` int unsigned NOT NULL,
  `lineId` int unsigned NOT NULL,
  `timestamp` bigint NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`complaintId`,`lineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table gm_complaint_chatlog is empty)


-- ==========================================
-- Table: gm_suggestion
-- ==========================================
CREATE TABLE `gm_suggestion` (
  `id` int unsigned NOT NULL,
  `playerGuid` bigint unsigned NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `createTime` bigint NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `facing` float NOT NULL DEFAULT '0',
  `closedBy` bigint NOT NULL DEFAULT '0',
  `assignedTo` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table gm_suggestion is empty)


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
-- Table: group_member
-- ==========================================
CREATE TABLE `group_member` (
  `guid` int unsigned NOT NULL,
  `memberGuid` bigint unsigned NOT NULL,
  `memberFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `subgroup` tinyint unsigned NOT NULL DEFAULT '0',
  `roles` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`memberGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Groups';

-- (Table group_member is empty)


-- ==========================================
-- Table: groups
-- ==========================================
CREATE TABLE `groups` (
  `guid` int unsigned NOT NULL,
  `leaderGuid` bigint unsigned NOT NULL,
  `lootMethod` tinyint unsigned NOT NULL,
  `looterGuid` bigint unsigned NOT NULL,
  `lootThreshold` tinyint unsigned NOT NULL,
  `icon1` binary(16) NOT NULL,
  `icon2` binary(16) NOT NULL,
  `icon3` binary(16) NOT NULL,
  `icon4` binary(16) NOT NULL,
  `icon5` binary(16) NOT NULL,
  `icon6` binary(16) NOT NULL,
  `icon7` binary(16) NOT NULL,
  `icon8` binary(16) NOT NULL,
  `groupType` smallint unsigned NOT NULL,
  `difficulty` tinyint unsigned NOT NULL DEFAULT '1',
  `raidDifficulty` tinyint unsigned NOT NULL DEFAULT '14',
  `legacyRaidDifficulty` tinyint unsigned NOT NULL DEFAULT '3',
  `masterLooterGuid` bigint unsigned NOT NULL,
  `pingRestriction` tinyint NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `leaderGuid` (`leaderGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Groups';

-- (Table groups is empty)


-- ==========================================
-- Table: guild
-- ==========================================
CREATE TABLE `guild` (
  `guildid` bigint unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `leaderguid` bigint unsigned NOT NULL DEFAULT '0',
  `EmblemStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `EmblemColor` tinyint unsigned NOT NULL DEFAULT '0',
  `BorderStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `BorderColor` tinyint unsigned NOT NULL DEFAULT '0',
  `BackgroundColor` tinyint unsigned NOT NULL DEFAULT '0',
  `info` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `motd` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `createdate` int unsigned NOT NULL DEFAULT '0',
  `BankMoney` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guild System';

INSERT INTO `guild` (`guildid`, `name`, `leaderguid`, `EmblemStyle`, `EmblemColor`, `BorderStyle`, `BorderColor`, `BackgroundColor`, `info`, `motd`, `createdate`, `BankMoney`) VALUES (1, 'Testers', 1, 0, 0, 0, 0, 0, '', 'Test Test 1 2 1 2', 1768190644, 0);


-- ==========================================
-- Table: guild_achievement
-- ==========================================
CREATE TABLE `guild_achievement` (
  `guildId` bigint unsigned NOT NULL,
  `achievement` int unsigned NOT NULL,
  `date` bigint NOT NULL DEFAULT '0',
  `guids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`guildId`,`achievement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table guild_achievement is empty)


-- ==========================================
-- Table: guild_achievement_progress
-- ==========================================
CREATE TABLE `guild_achievement_progress` (
  `guildId` bigint unsigned NOT NULL,
  `criteria` int unsigned NOT NULL,
  `counter` bigint unsigned NOT NULL,
  `date` bigint NOT NULL DEFAULT '0',
  `completedGuid` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildId`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table guild_achievement_progress is empty)


-- ==========================================
-- Table: guild_bank_eventlog
-- ==========================================
CREATE TABLE `guild_bank_eventlog` (
  `guildid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Guild Identificator',
  `LogGuid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Log record identificator - auxiliary column',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Guild bank TabId',
  `EventType` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Event type',
  `PlayerGuid` bigint unsigned NOT NULL DEFAULT '0',
  `ItemOrMoney` bigint unsigned NOT NULL DEFAULT '0',
  `ItemStackCount` smallint unsigned NOT NULL DEFAULT '0',
  `DestTabId` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Destination Tab Id',
  `TimeStamp` bigint NOT NULL DEFAULT '0' COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`,`TabId`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_PlayerGuid` (`PlayerGuid`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table guild_bank_eventlog is empty)


-- ==========================================
-- Table: guild_bank_item
-- ==========================================
CREATE TABLE `guild_bank_item` (
  `guildid` bigint unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0',
  `SlotId` tinyint unsigned NOT NULL DEFAULT '0',
  `item_guid` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`SlotId`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_item_guid` (`item_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table guild_bank_item is empty)


-- ==========================================
-- Table: guild_bank_right
-- ==========================================
CREATE TABLE `guild_bank_right` (
  `guildid` bigint unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0',
  `rid` tinyint unsigned NOT NULL DEFAULT '0',
  `gbright` tinyint NOT NULL DEFAULT '0',
  `SlotPerDay` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`rid`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table guild_bank_right is empty)


-- ==========================================
-- Table: guild_bank_tab
-- ==========================================
CREATE TABLE `guild_bank_tab` (
  `guildid` bigint unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0',
  `TabName` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `TabIcon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `TabText` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`guildid`,`TabId`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table guild_bank_tab is empty)


-- ==========================================
-- Table: guild_eventlog
-- ==========================================
CREATE TABLE `guild_eventlog` (
  `guildid` bigint unsigned NOT NULL COMMENT 'Guild Identificator',
  `LogGuid` int unsigned NOT NULL COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint unsigned NOT NULL COMMENT 'Event type',
  `PlayerGuid1` bigint unsigned NOT NULL COMMENT 'Player 1',
  `PlayerGuid2` bigint unsigned NOT NULL COMMENT 'Player 2',
  `NewRank` tinyint unsigned NOT NULL COMMENT 'New rank(in case promotion/demotion)',
  `TimeStamp` bigint NOT NULL COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`),
  KEY `Idx_PlayerGuid1` (`PlayerGuid1`),
  KEY `Idx_PlayerGuid2` (`PlayerGuid2`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guild Eventlog';

INSERT INTO `guild_eventlog` (`guildid`, `LogGuid`, `EventType`, `PlayerGuid1`, `PlayerGuid2`, `NewRank`, `TimeStamp`) VALUES (1, 0, 2, 1, 0, 0, 1768190644);


-- ==========================================
-- Table: guild_member
-- ==========================================
CREATE TABLE `guild_member` (
  `guildid` bigint unsigned NOT NULL COMMENT 'Guild Identificator',
  `guid` bigint unsigned NOT NULL,
  `rank` tinyint unsigned NOT NULL,
  `pnote` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `offnote` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `guid_key` (`guid`),
  KEY `guildid_key` (`guildid`),
  KEY `guildid_rank_key` (`guildid`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guild System';

INSERT INTO `guild_member` (`guildid`, `guid`, `rank`, `pnote`, `offnote`) VALUES (1, 1, 0, '', '');


-- ==========================================
-- Table: guild_member_withdraw
-- ==========================================
CREATE TABLE `guild_member_withdraw` (
  `guid` bigint unsigned NOT NULL,
  `tab0` int unsigned NOT NULL DEFAULT '0',
  `tab1` int unsigned NOT NULL DEFAULT '0',
  `tab2` int unsigned NOT NULL DEFAULT '0',
  `tab3` int unsigned NOT NULL DEFAULT '0',
  `tab4` int unsigned NOT NULL DEFAULT '0',
  `tab5` int unsigned NOT NULL DEFAULT '0',
  `tab6` int unsigned NOT NULL DEFAULT '0',
  `tab7` int unsigned NOT NULL DEFAULT '0',
  `money` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guild Member Daily Withdraws';

-- (Table guild_member_withdraw is empty)


-- ==========================================
-- Table: guild_newslog
-- ==========================================
CREATE TABLE `guild_newslog` (
  `guildid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Guild Identificator',
  `LogGuid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Event type',
  `PlayerGuid` bigint unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `Value` int unsigned NOT NULL DEFAULT '0',
  `TimeStamp` bigint NOT NULL DEFAULT '0' COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_PlayerGuid` (`PlayerGuid`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table guild_newslog is empty)


-- ==========================================
-- Table: guild_rank
-- ==========================================
CREATE TABLE `guild_rank` (
  `guildid` bigint unsigned NOT NULL DEFAULT '0',
  `rid` tinyint unsigned NOT NULL,
  `RankOrder` tinyint unsigned NOT NULL DEFAULT '0',
  `rname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rights` int unsigned NOT NULL DEFAULT '0',
  `BankMoneyPerDay` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`rid`),
  KEY `Idx_rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guild System';

INSERT INTO `guild_rank` (`guildid`, `rid`, `RankOrder`, `rname`, `rights`, `BankMoneyPerDay`) VALUES (1, 0, 0, 'Guild Master', 14548927, 0);


-- ==========================================
-- Table: instance
-- ==========================================
CREATE TABLE `instance` (
  `instanceId` int unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `completedEncountersMask` int unsigned DEFAULT NULL,
  `entranceWorldSafeLocId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table instance is empty)


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
-- Table: item_instance
-- ==========================================
CREATE TABLE `item_instance` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `itemEntry` int unsigned NOT NULL DEFAULT '0',
  `owner_guid` bigint unsigned NOT NULL DEFAULT '0',
  `creatorGuid` bigint unsigned NOT NULL DEFAULT '0',
  `giftCreatorGuid` bigint unsigned NOT NULL DEFAULT '0',
  `count` int unsigned NOT NULL DEFAULT '1',
  `duration` int NOT NULL DEFAULT '0',
  `charges` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `flags` int unsigned NOT NULL DEFAULT '0',
  `enchantments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `randomBonusListId` int unsigned NOT NULL DEFAULT '0',
  `durability` smallint unsigned NOT NULL DEFAULT '0',
  `playedTime` int unsigned NOT NULL DEFAULT '0',
  `createTime` bigint NOT NULL DEFAULT '0',
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `battlePetSpeciesId` int unsigned NOT NULL DEFAULT '0',
  `battlePetBreedData` int unsigned NOT NULL DEFAULT '0',
  `battlePetLevel` smallint unsigned NOT NULL DEFAULT '0',
  `battlePetDisplayId` int unsigned NOT NULL DEFAULT '0',
  `context` tinyint unsigned NOT NULL DEFAULT '0',
  `bonusListIDs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`guid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Item System';

INSERT INTO `item_instance` (`guid`, `itemEntry`, `owner_guid`, `creatorGuid`, `giftCreatorGuid`, `count`, `duration`, `charges`, `flags`, `enchantments`, `randomBonusListId`, `durability`, `playedTime`, `createTime`, `text`, `battlePetSpeciesId`, `battlePetBreedData`, `battlePetLevel`, `battlePetDisplayId`, `context`, `bonusListIDs`) VALUES (5788, 35, 1, 0, 0, 1, 0, '', 1, '0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ', 0, 40, 0, 1766786543, '', 0, 0, 0, 0, 75, '');


-- ==========================================
-- Table: item_instance_artifact
-- ==========================================
CREATE TABLE `item_instance_artifact` (
  `itemGuid` bigint unsigned NOT NULL,
  `xp` bigint unsigned NOT NULL DEFAULT '0',
  `artifactAppearanceId` int unsigned NOT NULL DEFAULT '0',
  `artifactTierId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_instance_artifact is empty)


-- ==========================================
-- Table: item_instance_artifact_powers
-- ==========================================
CREATE TABLE `item_instance_artifact_powers` (
  `itemGuid` bigint unsigned NOT NULL,
  `artifactPowerId` int unsigned NOT NULL,
  `purchasedRank` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`itemGuid`,`artifactPowerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_instance_artifact_powers is empty)


-- ==========================================
-- Table: item_instance_azerite
-- ==========================================
CREATE TABLE `item_instance_azerite` (
  `itemGuid` bigint unsigned NOT NULL,
  `xp` bigint unsigned NOT NULL DEFAULT '0',
  `level` int unsigned NOT NULL DEFAULT '1',
  `knowledgeLevel` int unsigned NOT NULL DEFAULT '0',
  `selectedAzeriteEssences1specId` int unsigned DEFAULT '0',
  `selectedAzeriteEssences1azeriteEssenceId1` int unsigned DEFAULT '0',
  `selectedAzeriteEssences1azeriteEssenceId2` int unsigned DEFAULT '0',
  `selectedAzeriteEssences1azeriteEssenceId3` int unsigned DEFAULT '0',
  `selectedAzeriteEssences1azeriteEssenceId4` int unsigned DEFAULT '0',
  `selectedAzeriteEssences2specId` int unsigned DEFAULT '0',
  `selectedAzeriteEssences2azeriteEssenceId1` int unsigned DEFAULT '0',
  `selectedAzeriteEssences2azeriteEssenceId2` int unsigned DEFAULT '0',
  `selectedAzeriteEssences2azeriteEssenceId3` int unsigned DEFAULT '0',
  `selectedAzeriteEssences2azeriteEssenceId4` int unsigned DEFAULT '0',
  `selectedAzeriteEssences3specId` int unsigned DEFAULT '0',
  `selectedAzeriteEssences3azeriteEssenceId1` int unsigned DEFAULT '0',
  `selectedAzeriteEssences3azeriteEssenceId2` int unsigned DEFAULT '0',
  `selectedAzeriteEssences3azeriteEssenceId3` int unsigned DEFAULT '0',
  `selectedAzeriteEssences3azeriteEssenceId4` int unsigned DEFAULT '0',
  `selectedAzeriteEssences4specId` int unsigned DEFAULT '0',
  `selectedAzeriteEssences4azeriteEssenceId1` int unsigned DEFAULT '0',
  `selectedAzeriteEssences4azeriteEssenceId2` int unsigned DEFAULT '0',
  `selectedAzeriteEssences4azeriteEssenceId3` int unsigned DEFAULT '0',
  `selectedAzeriteEssences4azeriteEssenceId4` int unsigned DEFAULT '0',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_instance_azerite is empty)


-- ==========================================
-- Table: item_instance_azerite_empowered
-- ==========================================
CREATE TABLE `item_instance_azerite_empowered` (
  `itemGuid` bigint unsigned NOT NULL,
  `azeritePowerId1` int NOT NULL,
  `azeritePowerId2` int NOT NULL,
  `azeritePowerId3` int NOT NULL,
  `azeritePowerId4` int NOT NULL,
  `azeritePowerId5` int NOT NULL,
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_instance_azerite_empowered is empty)


-- ==========================================
-- Table: item_instance_azerite_milestone_power
-- ==========================================
CREATE TABLE `item_instance_azerite_milestone_power` (
  `itemGuid` bigint unsigned NOT NULL,
  `azeriteItemMilestonePowerId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemGuid`,`azeriteItemMilestonePowerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_instance_azerite_milestone_power is empty)


-- ==========================================
-- Table: item_instance_azerite_unlocked_essence
-- ==========================================
CREATE TABLE `item_instance_azerite_unlocked_essence` (
  `itemGuid` bigint unsigned NOT NULL,
  `azeriteEssenceId` int unsigned NOT NULL DEFAULT '0',
  `rank` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemGuid`,`azeriteEssenceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_instance_azerite_unlocked_essence is empty)


-- ==========================================
-- Table: item_instance_gems
-- ==========================================
CREATE TABLE `item_instance_gems` (
  `itemGuid` bigint unsigned NOT NULL,
  `gemItemId1` int unsigned NOT NULL DEFAULT '0',
  `gemBonuses1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gemContext1` tinyint unsigned NOT NULL DEFAULT '0',
  `gemScalingLevel1` int unsigned NOT NULL DEFAULT '0',
  `gemItemId2` int unsigned NOT NULL DEFAULT '0',
  `gemBonuses2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gemContext2` tinyint unsigned NOT NULL DEFAULT '0',
  `gemScalingLevel2` int unsigned NOT NULL DEFAULT '0',
  `gemItemId3` int unsigned NOT NULL DEFAULT '0',
  `gemBonuses3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gemContext3` tinyint unsigned NOT NULL DEFAULT '0',
  `gemScalingLevel3` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_instance_gems is empty)


-- ==========================================
-- Table: item_instance_modifiers
-- ==========================================
CREATE TABLE `item_instance_modifiers` (
  `itemGuid` bigint unsigned NOT NULL,
  `fixedScalingLevel` int unsigned DEFAULT '0',
  `artifactKnowledgeLevel` int unsigned DEFAULT '0',
  `craftingModifiedStat1` int unsigned DEFAULT '0',
  `craftingModifiedStat2` int unsigned DEFAULT '0',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_instance_modifiers` (`itemGuid`, `fixedScalingLevel`, `artifactKnowledgeLevel`, `craftingModifiedStat1`, `craftingModifiedStat2`) VALUES (14197, 62, 0, 0, 0);


-- ==========================================
-- Table: item_instance_transmog
-- ==========================================
CREATE TABLE `item_instance_transmog` (
  `itemGuid` bigint unsigned NOT NULL,
  `itemModifiedAppearanceAllSpecs` int NOT NULL DEFAULT '0',
  `itemModifiedAppearanceSpec1` int NOT NULL DEFAULT '0',
  `itemModifiedAppearanceSpec2` int NOT NULL DEFAULT '0',
  `itemModifiedAppearanceSpec3` int NOT NULL DEFAULT '0',
  `itemModifiedAppearanceSpec4` int NOT NULL DEFAULT '0',
  `itemModifiedAppearanceSpec5` int NOT NULL DEFAULT '0',
  `spellItemEnchantmentAllSpecs` int NOT NULL DEFAULT '0',
  `spellItemEnchantmentSpec1` int NOT NULL DEFAULT '0',
  `spellItemEnchantmentSpec2` int NOT NULL DEFAULT '0',
  `spellItemEnchantmentSpec3` int NOT NULL DEFAULT '0',
  `spellItemEnchantmentSpec4` int NOT NULL DEFAULT '0',
  `spellItemEnchantmentSpec5` int NOT NULL DEFAULT '0',
  `secondaryItemModifiedAppearanceAllSpecs` int NOT NULL DEFAULT '0',
  `secondaryItemModifiedAppearanceSpec1` int NOT NULL DEFAULT '0',
  `secondaryItemModifiedAppearanceSpec2` int NOT NULL DEFAULT '0',
  `secondaryItemModifiedAppearanceSpec3` int NOT NULL DEFAULT '0',
  `secondaryItemModifiedAppearanceSpec4` int NOT NULL DEFAULT '0',
  `secondaryItemModifiedAppearanceSpec5` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_instance_transmog` (`itemGuid`, `itemModifiedAppearanceAllSpecs`, `itemModifiedAppearanceSpec1`, `itemModifiedAppearanceSpec2`, `itemModifiedAppearanceSpec3`, `itemModifiedAppearanceSpec4`, `itemModifiedAppearanceSpec5`, `spellItemEnchantmentAllSpecs`, `spellItemEnchantmentSpec1`, `spellItemEnchantmentSpec2`, `spellItemEnchantmentSpec3`, `spellItemEnchantmentSpec4`, `spellItemEnchantmentSpec5`, `secondaryItemModifiedAppearanceAllSpecs`, `secondaryItemModifiedAppearanceSpec1`, `secondaryItemModifiedAppearanceSpec2`, `secondaryItemModifiedAppearanceSpec3`, `secondaryItemModifiedAppearanceSpec4`, `secondaryItemModifiedAppearanceSpec5`) VALUES (22943, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


-- ==========================================
-- Table: item_loot_items
-- ==========================================
CREATE TABLE `item_loot_items` (
  `container_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'guid of container (item_instance.guid)',
  `item_type` tinyint NOT NULL DEFAULT '0' COMMENT 'item or currency',
  `item_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'loot item entry (item_instance.itemEntry)',
  `item_count` int NOT NULL DEFAULT '0' COMMENT 'stack size',
  `item_index` int unsigned NOT NULL DEFAULT '0',
  `follow_rules` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'follow loot rules',
  `ffa` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'free-for-all',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  `counted` tinyint(1) NOT NULL DEFAULT '0',
  `under_threshold` tinyint(1) NOT NULL DEFAULT '0',
  `needs_quest` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'quest drop',
  `rnd_bonus` int unsigned NOT NULL DEFAULT '0' COMMENT 'random bonus list added when originally rolled',
  `context` tinyint unsigned NOT NULL DEFAULT '0',
  `bonus_list_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Space separated list of bonus list ids',
  PRIMARY KEY (`container_id`,`item_type`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_loot_items is empty)


-- ==========================================
-- Table: item_loot_money
-- ==========================================
CREATE TABLE `item_loot_money` (
  `container_id` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'guid of container (item_instance.guid)',
  `money` int unsigned NOT NULL DEFAULT '0' COMMENT 'money loot (in copper)',
  PRIMARY KEY (`container_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_loot_money is empty)


-- ==========================================
-- Table: item_refund_instance
-- ==========================================
CREATE TABLE `item_refund_instance` (
  `item_guid` bigint unsigned NOT NULL COMMENT 'Item GUID',
  `player_guid` bigint unsigned NOT NULL COMMENT 'Player GUID',
  `paidMoney` bigint unsigned NOT NULL DEFAULT '0',
  `paidExtendedCost` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`,`player_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Item Refund System';

-- (Table item_refund_instance is empty)


-- ==========================================
-- Table: item_soulbound_trade_data
-- ==========================================
CREATE TABLE `item_soulbound_trade_data` (
  `itemGuid` bigint unsigned NOT NULL COMMENT 'Item GUID',
  `allowedPlayers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Space separated GUID list of players who can receive this item in trade',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Item Refund System';

-- (Table item_soulbound_trade_data is empty)


-- ==========================================
-- Table: lfg_data
-- ==========================================
CREATE TABLE `lfg_data` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `dungeon` int unsigned NOT NULL DEFAULT '0',
  `state` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='LFG Data';

-- (Table lfg_data is empty)


-- ==========================================
-- Table: mail
-- ==========================================
CREATE TABLE `mail` (
  `id` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `messageType` tinyint unsigned NOT NULL DEFAULT '0',
  `stationery` tinyint NOT NULL DEFAULT '41',
  `mailTemplateId` smallint unsigned NOT NULL DEFAULT '0',
  `sender` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `receiver` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `subject` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `has_items` tinyint unsigned NOT NULL DEFAULT '0',
  `expire_time` bigint NOT NULL DEFAULT '0',
  `deliver_time` bigint NOT NULL DEFAULT '0',
  `money` bigint unsigned NOT NULL DEFAULT '0',
  `cod` bigint unsigned NOT NULL DEFAULT '0',
  `checked` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Mail System';

-- (Table mail is empty)


-- ==========================================
-- Table: mail_items
-- ==========================================
CREATE TABLE `mail_items` (
  `mail_id` bigint unsigned NOT NULL DEFAULT '0',
  `item_guid` bigint unsigned NOT NULL DEFAULT '0',
  `receiver` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  PRIMARY KEY (`item_guid`),
  KEY `idx_receiver` (`receiver`),
  KEY `idx_mail_id` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table mail_items is empty)


-- ==========================================
-- Table: pet_aura
-- ==========================================
CREATE TABLE `pet_aura` (
  `guid` int unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `casterGuid` binary(16) NOT NULL COMMENT 'Full Global Unique Identifier',
  `spell` int unsigned NOT NULL,
  `effectMask` int unsigned NOT NULL,
  `recalculateMask` int unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `stackCount` tinyint unsigned NOT NULL DEFAULT '1',
  `maxDuration` int NOT NULL DEFAULT '0',
  `remainTime` int NOT NULL DEFAULT '0',
  `remainCharges` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`,`effectMask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Pet System';

-- (Table pet_aura is empty)


-- ==========================================
-- Table: pet_aura_effect
-- ==========================================
CREATE TABLE `pet_aura_effect` (
  `guid` int unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `casterGuid` binary(16) NOT NULL COMMENT 'Full Global Unique Identifier',
  `spell` int unsigned NOT NULL,
  `effectMask` int unsigned NOT NULL,
  `effectIndex` tinyint unsigned NOT NULL,
  `amount` int NOT NULL DEFAULT '0',
  `baseAmount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`casterGuid`,`spell`,`effectMask`,`effectIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Pet System';

-- (Table pet_aura_effect is empty)


-- ==========================================
-- Table: pet_spell
-- ==========================================
CREATE TABLE `pet_spell` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Pet System';

INSERT INTO `pet_spell` (`guid`, `spell`, `active`) VALUES (2, 19505, 1);


-- ==========================================
-- Table: pet_spell_charges
-- ==========================================
CREATE TABLE `pet_spell_charges` (
  `guid` int unsigned NOT NULL,
  `categoryId` int unsigned NOT NULL DEFAULT '0' COMMENT 'SpellCategory.dbc Identifier',
  `rechargeStart` bigint NOT NULL DEFAULT '0',
  `rechargeEnd` bigint NOT NULL DEFAULT '0',
  KEY `idx_guid` (`guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table pet_spell_charges is empty)


-- ==========================================
-- Table: pet_spell_cooldown
-- ==========================================
CREATE TABLE `pet_spell_cooldown` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `time` bigint NOT NULL DEFAULT '0',
  `categoryId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Spell category Id',
  `categoryEnd` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pet_spell_cooldown` (`guid`, `spell`, `time`, `categoryId`, `categoryEnd`) VALUES (5, 89792, 1768457924, 0, 1768457904);


-- ==========================================
-- Table: petition
-- ==========================================
CREATE TABLE `petition` (
  `ownerguid` bigint unsigned NOT NULL,
  `petitionguid` bigint unsigned DEFAULT '0',
  `name` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ownerguid`),
  UNIQUE KEY `index_ownerguid_petitionguid` (`ownerguid`,`petitionguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guild System';

-- (Table petition is empty)


-- ==========================================
-- Table: petition_sign
-- ==========================================
CREATE TABLE `petition_sign` (
  `ownerguid` bigint unsigned NOT NULL,
  `petitionguid` bigint unsigned NOT NULL DEFAULT '0',
  `playerguid` bigint unsigned NOT NULL DEFAULT '0',
  `player_account` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petitionguid`,`playerguid`),
  KEY `Idx_playerguid` (`playerguid`),
  KEY `Idx_ownerguid` (`ownerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Guild System';

-- (Table petition_sign is empty)


-- ==========================================
-- Table: pool_quest_save
-- ==========================================
CREATE TABLE `pool_quest_save` (
  `pool_id` int unsigned NOT NULL DEFAULT '0',
  `quest_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pool_id`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pool_quest_save` (`pool_id`, `quest_id`) VALUES (348, 24635);


-- ==========================================
-- Table: pvpstats_battlegrounds
-- ==========================================
CREATE TABLE `pvpstats_battlegrounds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `winner_faction` tinyint NOT NULL,
  `bracket_id` tinyint unsigned NOT NULL,
  `type` int unsigned NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table pvpstats_battlegrounds is empty)


-- ==========================================
-- Table: pvpstats_players
-- ==========================================
CREATE TABLE `pvpstats_players` (
  `battleground_id` bigint unsigned NOT NULL,
  `character_guid` bigint unsigned NOT NULL,
  `winner` bit(1) NOT NULL,
  `score_killing_blows` int unsigned NOT NULL,
  `score_deaths` int unsigned NOT NULL,
  `score_honorable_kills` int unsigned NOT NULL,
  `score_bonus_honor` int unsigned NOT NULL,
  `score_damage_done` int unsigned NOT NULL,
  `score_healing_done` int unsigned NOT NULL,
  `attr_1` int unsigned NOT NULL DEFAULT '0',
  `attr_2` int unsigned NOT NULL DEFAULT '0',
  `attr_3` int unsigned NOT NULL DEFAULT '0',
  `attr_4` int unsigned NOT NULL DEFAULT '0',
  `attr_5` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`battleground_id`,`character_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table pvpstats_players is empty)


-- ==========================================
-- Table: quest_tracker
-- ==========================================
CREATE TABLE `quest_tracker` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `character_guid` bigint unsigned NOT NULL DEFAULT '0',
  `quest_accept_time` datetime NOT NULL,
  `quest_complete_time` datetime DEFAULT NULL,
  `quest_abandon_time` datetime DEFAULT NULL,
  `completed_by_gm` tinyint(1) NOT NULL DEFAULT '0',
  `core_hash` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `core_revision` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`character_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table quest_tracker is empty)


-- ==========================================
-- Table: reserved_name
-- ==========================================
CREATE TABLE `reserved_name` (
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player Reserved Names';

-- (Table reserved_name is empty)


-- ==========================================
-- Table: respawn
-- ==========================================
CREATE TABLE `respawn` (
  `type` smallint unsigned NOT NULL,
  `spawnId` bigint unsigned NOT NULL,
  `respawnTime` bigint NOT NULL,
  `mapId` smallint unsigned NOT NULL,
  `instanceId` int unsigned NOT NULL,
  PRIMARY KEY (`type`,`spawnId`,`instanceId`),
  KEY `idx_instance` (`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Stored respawn times';

INSERT INTO `respawn` (`type`, `spawnId`, `respawnTime`, `mapId`, `instanceId`) VALUES (0, 1050168, 1772522859, 2175, 0);


-- ==========================================
-- Table: warden_action
-- ==========================================
CREATE TABLE `warden_action` (
  `wardenId` smallint unsigned NOT NULL,
  `action` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`wardenId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table warden_action is empty)


-- ==========================================
-- Table: world_quest
-- ==========================================
CREATE TABLE `world_quest` (
  `id` int unsigned NOT NULL,
  `rewardid` int unsigned NOT NULL,
  `starttime` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `world_quest` (`id`, `rewardid`, `starttime`) VALUES (39424, 1, 1671579286);


-- ==========================================
-- Table: world_state_value
-- ==========================================
CREATE TABLE `world_state_value` (
  `Id` int NOT NULL,
  `Value` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `world_state_value` (`Id`, `Value`) VALUES (17042, 10);


-- ==========================================
-- Table: world_variable
-- ==========================================
CREATE TABLE `world_variable` (
  `ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Value` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `world_variable` (`ID`, `Value`) VALUES ('NextBGRandomDailyResetTime', 1784257200);


-- ==========================================
-- Table: worldstate_data
-- ==========================================
CREATE TABLE `worldstate_data` (
  `VariableID` int unsigned NOT NULL DEFAULT '0' COMMENT 'WorldState ID (can be 0)',
  `InstanceID` int unsigned NOT NULL DEFAULT '0' COMMENT 'WorldState instance',
  `Type` int unsigned NOT NULL DEFAULT '0' COMMENT 'WorldStatesData::Types',
  `ConditionID` int unsigned NOT NULL DEFAULT '0' COMMENT 'Condition (dependent from type)',
  `Flags` int unsigned NOT NULL DEFAULT '0' COMMENT 'Current flags see WorldStatesData::Falgs',
  `Value` int unsigned NOT NULL DEFAULT '0',
  `RenewTime` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Time of last renew of WorldState',
  PRIMARY KEY (`VariableID`,`InstanceID`,`Type`,`ConditionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 PACK_KEYS=0 COMMENT='WorldState data storage';

-- (Table worldstate_data is empty)

