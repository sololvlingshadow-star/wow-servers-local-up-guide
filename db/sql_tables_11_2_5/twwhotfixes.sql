
-- ==========================================
-- Table: access_requirement
-- ==========================================
CREATE TABLE `access_requirement` (
  `mapId` int unsigned NOT NULL,
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `level_min` tinyint unsigned NOT NULL DEFAULT '0',
  `level_max` tinyint unsigned NOT NULL DEFAULT '0',
  `item` int unsigned NOT NULL DEFAULT '0',
  `item2` int unsigned NOT NULL DEFAULT '0',
  `quest_done_A` int unsigned NOT NULL DEFAULT '0',
  `quest_done_H` int unsigned NOT NULL DEFAULT '0',
  `completed_achievement` int unsigned NOT NULL DEFAULT '0',
  `quest_failed_text` mediumtext COLLATE utf8mb4_unicode_ci,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`mapId`,`difficulty`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Access Requirements';

INSERT INTO `access_requirement` (`mapId`, `difficulty`, `level_min`, `level_max`, `item`, `item2`, `quest_done_A`, `quest_done_H`, `completed_achievement`, `quest_failed_text`, `comment`) VALUES (33, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 'Shadowfang Keep (Entrance)');


-- ==========================================
-- Table: achievement
-- ==========================================
CREATE TABLE `achievement` (
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Title` text COLLATE utf8mb4_unicode_ci,
  `Reward` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `InstanceID` smallint NOT NULL DEFAULT '0',
  `Faction` tinyint NOT NULL DEFAULT '0',
  `Supercedes` int NOT NULL DEFAULT '0',
  `Category` smallint NOT NULL DEFAULT '0',
  `MinimumCriteria` tinyint NOT NULL DEFAULT '0',
  `Points` tinyint NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `UiOrder` smallint unsigned NOT NULL DEFAULT '0',
  `IconFileID` int NOT NULL DEFAULT '0',
  `RewardItemID` int NOT NULL DEFAULT '0',
  `CriteriaTree` int unsigned NOT NULL DEFAULT '0',
  `SharesCriteria` smallint NOT NULL DEFAULT '0',
  `CovenantID` int NOT NULL DEFAULT '0',
  `HiddenBeforeDisplaySeason` int NOT NULL DEFAULT '0',
  `LegacyAfterTimeEvent` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `achievement` (`Description`, `Title`, `Reward`, `ID`, `InstanceID`, `Faction`, `Supercedes`, `Category`, `MinimumCriteria`, `Points`, `Flags`, `UiOrder`, `IconFileID`, `RewardItemID`, `CriteriaTree`, `SharesCriteria`, `CovenantID`, `HiddenBeforeDisplaySeason`, `LegacyAfterTimeEvent`, `VerifiedBuild`) VALUES ('Participated in the realm first defeat of Sartharion the Onyx Guardian in 25-player mode.', 'Realm First! Obsidian Slayer', 'Title: Obsidian Slayer', 456, 615, -1, 0, 81, 0, 0, 2816, 140, 236471, 0, 10281, 0, 0, 0, 0, 61609);


-- ==========================================
-- Table: achievement_category
-- ==========================================
CREATE TABLE `achievement_category` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Parent` smallint NOT NULL DEFAULT '0',
  `UiOrder` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table achievement_category is empty)


-- ==========================================
-- Table: achievement_category_locale
-- ==========================================
CREATE TABLE `achievement_category_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table achievement_category_locale is empty)


-- ==========================================
-- Table: achievement_dbc
-- ==========================================
CREATE TABLE `achievement_dbc` (
  `ID` int unsigned NOT NULL,
  `requiredFaction` int NOT NULL DEFAULT '-1',
  `mapID` int NOT NULL DEFAULT '-1',
  `points` int unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  `count` int unsigned NOT NULL DEFAULT '0',
  `refAchievement` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `achievement_dbc` (`ID`, `requiredFaction`, `mapID`, `points`, `flags`, `count`, `refAchievement`) VALUES (3376, -1, -1, 0, 2, 1, 0);


-- ==========================================
-- Table: achievement_locale
-- ==========================================
CREATE TABLE `achievement_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `Title_lang` text COLLATE utf8mb4_unicode_ci,
  `Reward_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `achievement_locale` (`ID`, `locale`, `Description_lang`, `Title_lang`, `Reward_lang`, `VerifiedBuild`) VALUES (456, 'deDE', 'An der ersten Vernichtung von Sartharion dem Onyxwächter im 25-Spieler-Modus auf dem Realm teilgenommen.', 'Erster Obsidianvernichter des Realms!', 'Titel: Obsidianvernichter(in)', 61609);


-- ==========================================
-- Table: achievement_reward
-- ==========================================
CREATE TABLE `achievement_reward` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TitleA` int unsigned NOT NULL DEFAULT '0',
  `TitleH` int unsigned NOT NULL DEFAULT '0',
  `ItemID` int unsigned NOT NULL DEFAULT '0',
  `Sender` int unsigned NOT NULL DEFAULT '0',
  `Subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Body` mediumtext COLLATE utf8mb4_unicode_ci,
  `MailTemplateID` int unsigned DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=FIXED COMMENT='Loot System';

INSERT INTO `achievement_reward` (`ID`, `TitleA`, `TitleH`, `ItemID`, `Sender`, `Subject`, `Body`, `MailTemplateID`) VALUES (45, 0, 0, 43348, 28070, 'You\'ve Been Around!', 'Well, look at ye!$B$BAnd I thought I had seen some things in this icy place! It seems obvious to this dwarf that you have the fire of the explorer burning in your eyes.$B$BWear this tabard with pride. That way your friends will know who to ask for directions when the time comes!$B$BKeep on the move!$B$BBrann Bronzebeard', 0);


-- ==========================================
-- Table: achievement_reward_locale
-- ==========================================
CREATE TABLE `achievement_reward_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Subject` mediumtext COLLATE utf8mb4_unicode_ci,
  `Body` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`,`Locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `achievement_reward_locale` (`ID`, `Locale`, `Subject`, `Body`) VALUES (13, 'deDE', 'Glückwunsch', 'Viele Glückwunsche bezüglich eurer Überzeugung, auch die 80. Saison der Abenteurer zu erreichen. Ihr seit zweifellos dem Ziel ergben, Azeroth vom Bösen zu befreien.$B$BObwohl der Weg hierher keine Kleinigkeit war, steht der wahre Kampf erst noch bevor.$B$BKämpft weiter!$B$BRhonin');


-- ==========================================
-- Table: adventure_journal
-- ==========================================
CREATE TABLE `adventure_journal` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `ButtonText` text COLLATE utf8mb4_unicode_ci,
  `RewardDescription` text COLLATE utf8mb4_unicode_ci,
  `ContinueDescription` text COLLATE utf8mb4_unicode_ci,
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ButtonActionType` tinyint unsigned NOT NULL DEFAULT '0',
  `TextureFileDataID` int NOT NULL DEFAULT '0',
  `LfgDungeonID` smallint unsigned NOT NULL DEFAULT '0',
  `QuestID` int NOT NULL DEFAULT '0',
  `BattleMasterListID` smallint unsigned NOT NULL DEFAULT '0',
  `PriorityMin` tinyint unsigned NOT NULL DEFAULT '0',
  `PriorityMax` tinyint unsigned NOT NULL DEFAULT '0',
  `CurrencyType` smallint unsigned NOT NULL DEFAULT '0',
  `CurrencyQuantity` int unsigned NOT NULL DEFAULT '0',
  `UiMapID` smallint unsigned NOT NULL DEFAULT '0',
  `BonusPlayerConditionID1` int unsigned NOT NULL DEFAULT '0',
  `BonusPlayerConditionID2` int unsigned NOT NULL DEFAULT '0',
  `BonusValue1` tinyint unsigned NOT NULL DEFAULT '0',
  `BonusValue2` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table adventure_journal is empty)


-- ==========================================
-- Table: adventure_journal_locale
-- ==========================================
CREATE TABLE `adventure_journal_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `ButtonText_lang` text COLLATE utf8mb4_unicode_ci,
  `RewardDescription_lang` text COLLATE utf8mb4_unicode_ci,
  `ContinueDescription_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table adventure_journal_locale is empty)


-- ==========================================
-- Table: adventure_map_poi
-- ==========================================
CREATE TABLE `adventure_map_poi` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Title` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `WorldPositionX` float NOT NULL DEFAULT '0',
  `WorldPositionY` float NOT NULL DEFAULT '0',
  `Type` tinyint NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `QuestID` int unsigned NOT NULL DEFAULT '0',
  `LfgDungeonID` int unsigned NOT NULL DEFAULT '0',
  `RewardItemID` int NOT NULL DEFAULT '0',
  `UiTextureAtlasMemberID` int unsigned NOT NULL DEFAULT '0',
  `UiTextureKitID` int unsigned NOT NULL DEFAULT '0',
  `MapID` int NOT NULL DEFAULT '0',
  `AreaTableID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table adventure_map_poi is empty)


-- ==========================================
-- Table: adventure_map_poi_locale
-- ==========================================
CREATE TABLE `adventure_map_poi_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Title_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table adventure_map_poi_locale is empty)


-- ==========================================
-- Table: anim_kit
-- ==========================================
CREATE TABLE `anim_kit` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `OneShotDuration` int unsigned NOT NULL DEFAULT '0',
  `OneShotStopAnimKitID` smallint unsigned NOT NULL DEFAULT '0',
  `LowDefAnimKitID` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `anim_kit` (`ID`, `OneShotDuration`, `OneShotStopAnimKitID`, `LowDefAnimKitID`, `VerifiedBuild`) VALUES (32976, 0, 0, 0, 62493);


-- ==========================================
-- Table: animation_data
-- ==========================================
CREATE TABLE `animation_data` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Fallback` smallint unsigned NOT NULL DEFAULT '0',
  `BehaviorTier` tinyint NOT NULL DEFAULT '0',
  `BehaviorID` smallint NOT NULL DEFAULT '0',
  `Flags1` int NOT NULL DEFAULT '0',
  `Flags2` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table animation_data is empty)


-- ==========================================
-- Table: area_group_member
-- ==========================================
CREATE TABLE `area_group_member` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `AreaID` smallint unsigned NOT NULL DEFAULT '0',
  `AreaGroupID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `area_group_member` (`ID`, `AreaID`, `AreaGroupID`, `VerifiedBuild`) VALUES (40540, 14838, 8866, 62493);


-- ==========================================
-- Table: area_table
-- ==========================================
CREATE TABLE `area_table` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ZoneName` text COLLATE utf8mb4_unicode_ci,
  `AreaName` text COLLATE utf8mb4_unicode_ci,
  `ContinentID` smallint unsigned NOT NULL DEFAULT '0',
  `ParentAreaID` smallint unsigned NOT NULL DEFAULT '0',
  `AreaBit` smallint NOT NULL DEFAULT '0',
  `SoundProviderPref` tinyint unsigned NOT NULL DEFAULT '0',
  `SoundProviderPrefUnderwater` tinyint unsigned NOT NULL DEFAULT '0',
  `AmbienceID` smallint unsigned NOT NULL DEFAULT '0',
  `UwAmbience` smallint unsigned NOT NULL DEFAULT '0',
  `ZoneMusic` smallint unsigned NOT NULL DEFAULT '0',
  `UwZoneMusic` smallint unsigned NOT NULL DEFAULT '0',
  `IntroSound` smallint unsigned NOT NULL DEFAULT '0',
  `UwIntroSound` int unsigned NOT NULL DEFAULT '0',
  `FactionGroupMask` tinyint unsigned NOT NULL DEFAULT '0',
  `AmbientMultiplier` float NOT NULL DEFAULT '0',
  `MountFlags` int NOT NULL DEFAULT '0',
  `PvpCombatWorldStateID` int NOT NULL DEFAULT '0',
  `WildBattlePetLevelMin` tinyint unsigned NOT NULL DEFAULT '0',
  `WildBattlePetLevelMax` tinyint unsigned NOT NULL DEFAULT '0',
  `WindSettingsID` tinyint unsigned NOT NULL DEFAULT '0',
  `ContentTuningID` int NOT NULL DEFAULT '0',
  `Flags1` int NOT NULL DEFAULT '0',
  `Flags2` int NOT NULL DEFAULT '0',
  `LiquidTypeID1` smallint unsigned NOT NULL DEFAULT '0',
  `LiquidTypeID2` smallint unsigned NOT NULL DEFAULT '0',
  `LiquidTypeID3` smallint unsigned NOT NULL DEFAULT '0',
  `LiquidTypeID4` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `area_table` (`ID`, `ZoneName`, `AreaName`, `ContinentID`, `ParentAreaID`, `AreaBit`, `SoundProviderPref`, `SoundProviderPrefUnderwater`, `AmbienceID`, `UwAmbience`, `ZoneMusic`, `UwZoneMusic`, `IntroSound`, `UwIntroSound`, `FactionGroupMask`, `AmbientMultiplier`, `MountFlags`, `PvpCombatWorldStateID`, `WildBattlePetLevelMin`, `WildBattlePetLevelMax`, `WindSettingsID`, `ContentTuningID`, `Flags1`, `Flags2`, `LiquidTypeID1`, `LiquidTypeID2`, `LiquidTypeID3`, `LiquidTypeID4`, `VerifiedBuild`) VALUES (13643, '102Tree', 'Emerald Dream', 2444, 0, 12727, 0, 0, 2635, 2480, 2821, 0, 0, 0, 0, 0.0, 15, 0, 25, 25, 0, 0, 1088952416, 0, 0, 0, 0, 0, 0);


-- ==========================================
-- Table: area_table_locale
-- ==========================================
CREATE TABLE `area_table_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AreaName_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table area_table_locale is empty)


-- ==========================================
-- Table: area_trigger
-- ==========================================
CREATE TABLE `area_trigger` (
  `PosX` float NOT NULL DEFAULT '0',
  `PosY` float NOT NULL DEFAULT '0',
  `PosZ` float NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ContinentID` smallint unsigned NOT NULL DEFAULT '0',
  `PhaseUseFlags` int NOT NULL DEFAULT '0',
  `PhaseID` smallint NOT NULL DEFAULT '0',
  `PhaseGroupID` smallint NOT NULL DEFAULT '0',
  `Radius` float NOT NULL DEFAULT '0',
  `BoxLength` float NOT NULL DEFAULT '0',
  `BoxWidth` float NOT NULL DEFAULT '0',
  `BoxHeight` float NOT NULL DEFAULT '0',
  `BoxYaw` float NOT NULL DEFAULT '0',
  `ShapeType` tinyint NOT NULL DEFAULT '0',
  `ShapeID` smallint NOT NULL DEFAULT '0',
  `AreaTriggerActionSetID` int NOT NULL DEFAULT '0',
  `Flags` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table area_trigger is empty)


-- ==========================================
-- Table: area_trigger_action_set
-- ==========================================
CREATE TABLE `area_trigger_action_set` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `area_trigger_action_set` (`ID`, `Flags`, `VerifiedBuild`) VALUES (25212, 4112, 59888);


-- ==========================================
-- Table: areatrigger_involvedrelation
-- ==========================================
CREATE TABLE `areatrigger_involvedrelation` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Trigger System';

INSERT INTO `areatrigger_involvedrelation` (`id`, `quest`) VALUES (78, 155);


-- ==========================================
-- Table: areatrigger_teleport
-- ==========================================
CREATE TABLE `areatrigger_teleport` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PortLocID` int unsigned NOT NULL DEFAULT '0',
  `Name` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  FULLTEXT KEY `name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Trigger System';

INSERT INTO `areatrigger_teleport` (`ID`, `PortLocID`, `Name`) VALUES (45, 4078, 'Scarlet Monastery Entrance Target');


-- ==========================================
-- Table: areatrigger_template
-- ==========================================
CREATE TABLE `areatrigger_template` (
  `Id` int unsigned NOT NULL,
  `IsCustom` tinyint unsigned NOT NULL,
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `ActionSetId` int unsigned NOT NULL DEFAULT '0',
  `ActionSetFlags` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`,`IsCustom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `areatrigger_template` (`Id`, `IsCustom`, `Flags`, `ActionSetId`, `ActionSetFlags`, `VerifiedBuild`) VALUES (1, 1, 1, 0, 0, 0);


-- ==========================================
-- Table: armor_location
-- ==========================================
CREATE TABLE `armor_location` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Clothmodifier` float NOT NULL DEFAULT '0',
  `Leathermodifier` float NOT NULL DEFAULT '0',
  `Chainmodifier` float NOT NULL DEFAULT '0',
  `Platemodifier` float NOT NULL DEFAULT '0',
  `Modifier` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table armor_location is empty)


-- ==========================================
-- Table: artifact
-- ==========================================
CREATE TABLE `artifact` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `UiTextureKitID` smallint unsigned NOT NULL DEFAULT '0',
  `UiNameColor` int NOT NULL DEFAULT '0',
  `UiBarOverlayColor` int NOT NULL DEFAULT '0',
  `UiBarBackgroundColor` int NOT NULL DEFAULT '0',
  `ChrSpecializationID` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `ArtifactCategoryID` tinyint unsigned NOT NULL DEFAULT '0',
  `UiModelSceneID` int unsigned NOT NULL DEFAULT '0',
  `SpellVisualKitID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table artifact is empty)


-- ==========================================
-- Table: artifact_appearance
-- ==========================================
CREATE TABLE `artifact_appearance` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ArtifactAppearanceSetID` smallint unsigned NOT NULL DEFAULT '0',
  `DisplayIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `UnlockPlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `ItemAppearanceModifierID` tinyint unsigned NOT NULL DEFAULT '0',
  `UiSwatchColor` int NOT NULL DEFAULT '0',
  `UiModelSaturation` float NOT NULL DEFAULT '0',
  `UiModelOpacity` float NOT NULL DEFAULT '0',
  `OverrideShapeshiftFormID` tinyint unsigned NOT NULL DEFAULT '0',
  `OverrideShapeshiftDisplayID` int unsigned NOT NULL DEFAULT '0',
  `UiItemAppearanceID` int unsigned NOT NULL DEFAULT '0',
  `UiAltItemAppearanceID` int unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `UiCameraID` smallint unsigned NOT NULL DEFAULT '0',
  `UsablePlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `artifact_appearance` (`Name`, `ID`, `ArtifactAppearanceSetID`, `DisplayIndex`, `UnlockPlayerConditionID`, `ItemAppearanceModifierID`, `UiSwatchColor`, `UiModelSaturation`, `UiModelOpacity`, `OverrideShapeshiftFormID`, `OverrideShapeshiftDisplayID`, `UiItemAppearanceID`, `UiAltItemAppearanceID`, `Flags`, `UiCameraID`, `UsablePlayerConditionID`, `VerifiedBuild`) VALUES (NULL, 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0);


-- ==========================================
-- Table: artifact_appearance_locale
-- ==========================================
CREATE TABLE `artifact_appearance_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table artifact_appearance_locale is empty)


-- ==========================================
-- Table: artifact_appearance_set
-- ==========================================
CREATE TABLE `artifact_appearance_set` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DisplayIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `UiCameraID` smallint unsigned NOT NULL DEFAULT '0',
  `AltHandUICameraID` smallint unsigned NOT NULL DEFAULT '0',
  `ForgeAttachmentOverride` tinyint NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `ArtifactID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table artifact_appearance_set is empty)


-- ==========================================
-- Table: artifact_appearance_set_locale
-- ==========================================
CREATE TABLE `artifact_appearance_set_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table artifact_appearance_set_locale is empty)


-- ==========================================
-- Table: artifact_category
-- ==========================================
CREATE TABLE `artifact_category` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `XpMultCurrencyID` smallint NOT NULL DEFAULT '0',
  `XpMultCurveID` smallint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table artifact_category is empty)


-- ==========================================
-- Table: artifact_locale
-- ==========================================
CREATE TABLE `artifact_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table artifact_locale is empty)


-- ==========================================
-- Table: artifact_power
-- ==========================================
CREATE TABLE `artifact_power` (
  `DisplayPosX` float NOT NULL DEFAULT '0',
  `DisplayPosY` float NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ArtifactID` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxPurchasableRank` tinyint unsigned NOT NULL DEFAULT '0',
  `Label` int NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `Tier` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table artifact_power is empty)


-- ==========================================
-- Table: artifact_power_link
-- ==========================================
CREATE TABLE `artifact_power_link` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PowerA` smallint unsigned NOT NULL DEFAULT '0',
  `PowerB` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table artifact_power_link is empty)


-- ==========================================
-- Table: artifact_power_picker
-- ==========================================
CREATE TABLE `artifact_power_picker` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table artifact_power_picker is empty)


-- ==========================================
-- Table: artifact_power_rank
-- ==========================================
CREATE TABLE `artifact_power_rank` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `RankIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `ItemBonusListID` smallint unsigned NOT NULL DEFAULT '0',
  `AuraPointsOverride` float NOT NULL DEFAULT '0',
  `ArtifactPowerID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table artifact_power_rank is empty)


-- ==========================================
-- Table: artifact_quest_xp
-- ==========================================
CREATE TABLE `artifact_quest_xp` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Difficulty1` int unsigned NOT NULL DEFAULT '0',
  `Difficulty2` int unsigned NOT NULL DEFAULT '0',
  `Difficulty3` int unsigned NOT NULL DEFAULT '0',
  `Difficulty4` int unsigned NOT NULL DEFAULT '0',
  `Difficulty5` int unsigned NOT NULL DEFAULT '0',
  `Difficulty6` int unsigned NOT NULL DEFAULT '0',
  `Difficulty7` int unsigned NOT NULL DEFAULT '0',
  `Difficulty8` int unsigned NOT NULL DEFAULT '0',
  `Difficulty9` int unsigned NOT NULL DEFAULT '0',
  `Difficulty10` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table artifact_quest_xp is empty)


-- ==========================================
-- Table: artifact_tier
-- ==========================================
CREATE TABLE `artifact_tier` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ArtifactTier` int unsigned NOT NULL DEFAULT '0',
  `MaxNumTraits` int unsigned NOT NULL DEFAULT '0',
  `MaxArtifactKnowledge` int unsigned NOT NULL DEFAULT '0',
  `KnowledgePlayerCondition` int unsigned NOT NULL DEFAULT '0',
  `MinimumEmpowerKnowledge` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table artifact_tier is empty)


-- ==========================================
-- Table: artifact_unlock
-- ==========================================
CREATE TABLE `artifact_unlock` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PowerID` int unsigned NOT NULL DEFAULT '0',
  `PowerRank` tinyint unsigned NOT NULL DEFAULT '0',
  `ItemBonusListID` smallint unsigned NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `ArtifactID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table artifact_unlock is empty)


-- ==========================================
-- Table: auction_house
-- ==========================================
CREATE TABLE `auction_house` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `FactionID` smallint unsigned NOT NULL DEFAULT '0',
  `DepositRate` tinyint unsigned NOT NULL DEFAULT '0',
  `ConsignmentRate` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table auction_house is empty)


-- ==========================================
-- Table: auction_house_locale
-- ==========================================
CREATE TABLE `auction_house_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table auction_house_locale is empty)


-- ==========================================
-- Table: azerite_empowered_item
-- ==========================================
CREATE TABLE `azerite_empowered_item` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemID` int NOT NULL DEFAULT '0',
  `AzeriteTierUnlockSetID` int unsigned NOT NULL DEFAULT '0',
  `AzeritePowerSetID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table azerite_empowered_item is empty)


-- ==========================================
-- Table: azerite_essence
-- ==========================================
CREATE TABLE `azerite_essence` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `SpecSetID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table azerite_essence is empty)


-- ==========================================
-- Table: azerite_essence_locale
-- ==========================================
CREATE TABLE `azerite_essence_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table azerite_essence_locale is empty)


-- ==========================================
-- Table: azerite_essence_power
-- ==========================================
CREATE TABLE `azerite_essence_power` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SourceAlliance` text COLLATE utf8mb4_unicode_ci,
  `SourceHorde` text COLLATE utf8mb4_unicode_ci,
  `AzeriteEssenceID` int NOT NULL DEFAULT '0',
  `Tier` tinyint unsigned NOT NULL DEFAULT '0',
  `MajorPowerDescription` int NOT NULL DEFAULT '0',
  `MinorPowerDescription` int NOT NULL DEFAULT '0',
  `MajorPowerActual` int NOT NULL DEFAULT '0',
  `MinorPowerActual` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table azerite_essence_power is empty)


-- ==========================================
-- Table: azerite_essence_power_locale
-- ==========================================
CREATE TABLE `azerite_essence_power_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SourceAlliance_lang` text COLLATE utf8mb4_unicode_ci,
  `SourceHorde_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table azerite_essence_power_locale is empty)


-- ==========================================
-- Table: azerite_item
-- ==========================================
CREATE TABLE `azerite_item` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table azerite_item is empty)


-- ==========================================
-- Table: azerite_item_milestone_power
-- ==========================================
CREATE TABLE `azerite_item_milestone_power` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `RequiredLevel` int NOT NULL DEFAULT '0',
  `AzeritePowerID` int NOT NULL DEFAULT '0',
  `Type` int NOT NULL DEFAULT '0',
  `AutoUnlock` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table azerite_item_milestone_power is empty)


-- ==========================================
-- Table: azerite_knowledge_multiplier
-- ==========================================
CREATE TABLE `azerite_knowledge_multiplier` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Multiplier` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table azerite_knowledge_multiplier is empty)


-- ==========================================
-- Table: azerite_level_info
-- ==========================================
CREATE TABLE `azerite_level_info` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `BaseExperienceToNextLevel` bigint unsigned NOT NULL DEFAULT '0',
  `MinimumExperienceToNextLevel` bigint unsigned NOT NULL DEFAULT '0',
  `ItemLevel` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table azerite_level_info is empty)


-- ==========================================
-- Table: azerite_power
-- ==========================================
CREATE TABLE `azerite_power` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `ItemBonusListID` int NOT NULL DEFAULT '0',
  `SpecSetID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table azerite_power is empty)


-- ==========================================
-- Table: azerite_power_set_member
-- ==========================================
CREATE TABLE `azerite_power_set_member` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `AzeritePowerSetID` int unsigned NOT NULL DEFAULT '0',
  `AzeritePowerID` int NOT NULL DEFAULT '0',
  `Class` tinyint NOT NULL DEFAULT '0',
  `Tier` tinyint unsigned NOT NULL DEFAULT '0',
  `OrderIndex` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table azerite_power_set_member is empty)


-- ==========================================
-- Table: azerite_tier_unlock
-- ==========================================
CREATE TABLE `azerite_tier_unlock` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemCreationContext` tinyint unsigned NOT NULL DEFAULT '0',
  `Tier` tinyint unsigned NOT NULL DEFAULT '0',
  `AzeriteLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `AzeriteTierUnlockSetID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table azerite_tier_unlock is empty)


-- ==========================================
-- Table: azerite_tier_unlock_set
-- ==========================================
CREATE TABLE `azerite_tier_unlock_set` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table azerite_tier_unlock_set is empty)


-- ==========================================
-- Table: azerite_unlock_mapping
-- ==========================================
CREATE TABLE `azerite_unlock_mapping` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemLevel` int NOT NULL DEFAULT '0',
  `ItemBonusListHead` int NOT NULL DEFAULT '0',
  `ItemBonusListShoulders` int NOT NULL DEFAULT '0',
  `ItemBonusListChest` int NOT NULL DEFAULT '0',
  `AzeriteUnlockMappingSetID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table azerite_unlock_mapping is empty)


-- ==========================================
-- Table: bank_tab
-- ==========================================
CREATE TABLE `bank_tab` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Cost` bigint unsigned NOT NULL DEFAULT '0',
  `BankType` tinyint unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `PurchasePromptTitle` int NOT NULL DEFAULT '0',
  `PurchasePromptBody` int NOT NULL DEFAULT '0',
  `PurchasePromptConfirmation` int NOT NULL DEFAULT '0',
  `TabCleanupConfirmation` int NOT NULL DEFAULT '0',
  `TabNameEditBoxHeader` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table bank_tab is empty)


-- ==========================================
-- Table: banned_addons
-- ==========================================
CREATE TABLE `banned_addons` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Version` text COLLATE utf8mb4_unicode_ci,
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table banned_addons is empty)


-- ==========================================
-- Table: barber_shop_style
-- ==========================================
CREATE TABLE `barber_shop_style` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DisplayName` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `CostModifier` float NOT NULL DEFAULT '0',
  `Race` tinyint NOT NULL DEFAULT '0',
  `Sex` tinyint NOT NULL DEFAULT '0',
  `Data` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table barber_shop_style is empty)


-- ==========================================
-- Table: barber_shop_style_locale
-- ==========================================
CREATE TABLE `barber_shop_style_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DisplayName_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table barber_shop_style_locale is empty)


-- ==========================================
-- Table: battle_pet_ability
-- ==========================================
CREATE TABLE `battle_pet_ability` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `IconFileDataID` int NOT NULL DEFAULT '0',
  `PetTypeEnum` tinyint NOT NULL DEFAULT '0',
  `Cooldown` int unsigned NOT NULL DEFAULT '0',
  `BattlePetVisualID` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table battle_pet_ability is empty)


-- ==========================================
-- Table: battle_pet_ability_locale
-- ==========================================
CREATE TABLE `battle_pet_ability_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table battle_pet_ability_locale is empty)


-- ==========================================
-- Table: battle_pet_breed_quality
-- ==========================================
CREATE TABLE `battle_pet_breed_quality` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MaxQualityRoll` int NOT NULL DEFAULT '0',
  `StateMultiplier` float NOT NULL DEFAULT '0',
  `QualityEnum` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table battle_pet_breed_quality is empty)


-- ==========================================
-- Table: battle_pet_breed_state
-- ==========================================
CREATE TABLE `battle_pet_breed_state` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `BattlePetStateID` int NOT NULL DEFAULT '0',
  `Value` smallint unsigned NOT NULL DEFAULT '0',
  `BattlePetBreedID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table battle_pet_breed_state is empty)


-- ==========================================
-- Table: battle_pet_breeds
-- ==========================================
CREATE TABLE `battle_pet_breeds` (
  `speciesId` int unsigned NOT NULL DEFAULT '0',
  `breedId` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`speciesId`,`breedId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battle_pet_breeds` (`speciesId`, `breedId`) VALUES (39, 11);


-- ==========================================
-- Table: battle_pet_quality
-- ==========================================
CREATE TABLE `battle_pet_quality` (
  `speciesId` int unsigned NOT NULL DEFAULT '0',
  `quality` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`speciesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battle_pet_quality` (`speciesId`, `quality`) VALUES (39, 2);


-- ==========================================
-- Table: battle_pet_species
-- ==========================================
CREATE TABLE `battle_pet_species` (
  `Description` text COLLATE utf8mb4_unicode_ci,
  `SourceText` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `CreatureID` int NOT NULL DEFAULT '0',
  `SummonSpellID` int NOT NULL DEFAULT '0',
  `IconFileDataID` int NOT NULL DEFAULT '0',
  `PetTypeEnum` tinyint NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `SourceTypeEnum` tinyint NOT NULL DEFAULT '0',
  `CardUIModelSceneID` int NOT NULL DEFAULT '0',
  `LoadoutUIModelSceneID` int NOT NULL DEFAULT '0',
  `CovenantID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battle_pet_species` (`Description`, `SourceText`, `ID`, `CreatureID`, `SummonSpellID`, `IconFileDataID`, `PetTypeEnum`, `Flags`, `SourceTypeEnum`, `CardUIModelSceneID`, `LoadoutUIModelSceneID`, `CovenantID`, `VerifiedBuild`) VALUES ('Gorillion possesses the strength of not one, but FIVE gorillas.', '|cFFFFD200Quest: |rInoperative Gorillion|n|cFFFFD200Zone: |rUndermine', 4642, 231451, 471935, 5904911, 9, 18, 1, 6, 7, 0, 59888);


-- ==========================================
-- Table: battle_pet_species_locale
-- ==========================================
CREATE TABLE `battle_pet_species_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `SourceText_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `battle_pet_species_locale` (`ID`, `locale`, `Description_lang`, `SourceText_lang`, `VerifiedBuild`) VALUES (4642, 'deDE', 'Gorillion hat die Kraft nicht nur eines, sondern ganzer FÜNF Gorillas.', '|cFFFFD200Quest: |rFunktionsunfähiger Gorillion|n|cFFFFD200Zone: |rLorenhall', 59888);


-- ==========================================
-- Table: battle_pet_species_state
-- ==========================================
CREATE TABLE `battle_pet_species_state` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `BattlePetStateID` smallint unsigned NOT NULL DEFAULT '0',
  `Value` int NOT NULL DEFAULT '0',
  `BattlePetSpeciesID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table battle_pet_species_state is empty)


-- ==========================================
-- Table: battlefield_template
-- ==========================================
CREATE TABLE `battlefield_template` (
  `TypeId` tinyint unsigned NOT NULL,
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`TypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battlefield_template` (`TypeId`, `ScriptName`, `comment`) VALUES (1, 'battlefield_wg', NULL);


-- ==========================================
-- Table: battlemaster_list
-- ==========================================
CREATE TABLE `battlemaster_list` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `GameType` text COLLATE utf8mb4_unicode_ci,
  `ShortDescription` text COLLATE utf8mb4_unicode_ci,
  `LongDescription` text COLLATE utf8mb4_unicode_ci,
  `PvpType` int NOT NULL DEFAULT '0',
  `MinLevel` tinyint NOT NULL DEFAULT '0',
  `MaxLevel` tinyint NOT NULL DEFAULT '0',
  `RatedPlayers` tinyint NOT NULL DEFAULT '0',
  `MinPlayers` tinyint NOT NULL DEFAULT '0',
  `MaxPlayers` int NOT NULL DEFAULT '0',
  `GroupsAllowed` tinyint NOT NULL DEFAULT '0',
  `MaxGroupSize` tinyint NOT NULL DEFAULT '0',
  `HolidayWorldState` smallint NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `IconFileDataID` int NOT NULL DEFAULT '0',
  `RequiredPlayerConditionID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battlemaster_list` (`ID`, `Name`, `GameType`, `ShortDescription`, `LongDescription`, `PvpType`, `MinLevel`, `MaxLevel`, `RatedPlayers`, `MinPlayers`, `MaxPlayers`, `GroupsAllowed`, `MaxGroupSize`, `HolidayWorldState`, `Flags`, `IconFileDataID`, `RequiredPlayerConditionID`, `VerifiedBuild`) VALUES (6, 'All Arenas', '', '', '', 1, 20, 80, 5, 0, 5, 1, 3, 0, 8, 525915, 0, 64270);


-- ==========================================
-- Table: battlemaster_list_locale
-- ==========================================
CREATE TABLE `battlemaster_list_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `GameType_lang` text COLLATE utf8mb4_unicode_ci,
  `ShortDescription_lang` text COLLATE utf8mb4_unicode_ci,
  `LongDescription_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `battlemaster_list_locale` (`ID`, `locale`, `Name_lang`, `GameType_lang`, `ShortDescription_lang`, `LongDescription_lang`, `VerifiedBuild`) VALUES (1117, 'deDE', 'Käfig des Gemetzels', '', '', '', 59888);


-- ==========================================
-- Table: battlemaster_list_x_map
-- ==========================================
CREATE TABLE `battlemaster_list_x_map` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MapID` int NOT NULL DEFAULT '0',
  `BattlemasterListID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battlemaster_list_x_map` (`ID`, `MapID`, `BattlemasterListID`, `VerifiedBuild`) VALUES (1124, 2759, 6, 59888);


-- ==========================================
-- Table: broadcast_text
-- ==========================================
CREATE TABLE `broadcast_text` (
  `Text` text COLLATE utf8mb4_unicode_ci,
  `Text1` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `LanguageID` int NOT NULL DEFAULT '0',
  `ConditionID` int NOT NULL DEFAULT '0',
  `EmotesID` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ChatBubbleDurationMs` int unsigned NOT NULL DEFAULT '0',
  `VoiceOverPriorityID` int NOT NULL DEFAULT '0',
  `SoundKitID1` int unsigned NOT NULL DEFAULT '0',
  `SoundKitID2` int unsigned NOT NULL DEFAULT '0',
  `EmoteID1` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteID2` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteID3` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `broadcast_text` (`Text`, `Text1`, `ID`, `LanguageID`, `ConditionID`, `EmotesID`, `Flags`, `ChatBubbleDurationMs`, `VoiceOverPriorityID`, `SoundKitID1`, `SoundKitID2`, `EmoteID1`, `EmoteID2`, `EmoteID3`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `VerifiedBuild`) VALUES ('Help help!  I\'m being repressed!', '', 1, 0, 0, 0, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60568);


-- ==========================================
-- Table: broadcast_text_duration
-- ==========================================
CREATE TABLE `broadcast_text_duration` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID` int unsigned NOT NULL DEFAULT '0',
  `Locale` int NOT NULL DEFAULT '0',
  `Duration` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table broadcast_text_duration is empty)


-- ==========================================
-- Table: broadcast_text_locale
-- ==========================================
CREATE TABLE `broadcast_text_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Text_lang` text COLLATE utf8mb4_unicode_ci,
  `Text1_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`, `Text1_lang`, `VerifiedBuild`) VALUES (1, 'deDE', 'Hilfe, Hilfe! Ich werde bedrängt!', '', 60568);


-- ==========================================
-- Table: cfg_categories
-- ==========================================
CREATE TABLE `cfg_categories` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `LocaleMask` smallint unsigned NOT NULL DEFAULT '0',
  `CreateCharsetMask` tinyint unsigned NOT NULL DEFAULT '0',
  `ExistingCharsetMask` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `Order` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `cfg_categories` (`ID`, `Name`, `LocaleMask`, `CreateCharsetMask`, `ExistingCharsetMask`, `Flags`, `Order`, `VerifiedBuild`) VALUES (171, 'Seasonal', 0, 1, 1, 0, -127, 64270);


-- ==========================================
-- Table: cfg_categories_locale
-- ==========================================
CREATE TABLE `cfg_categories_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table cfg_categories_locale is empty)


-- ==========================================
-- Table: cfg_regions
-- ==========================================
CREATE TABLE `cfg_regions` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Tag` text COLLATE utf8mb4_unicode_ci,
  `RegionID` smallint unsigned NOT NULL DEFAULT '0',
  `Raidorigin` int unsigned NOT NULL DEFAULT '0',
  `RegionGroupMask` tinyint unsigned NOT NULL DEFAULT '0',
  `ChallengeOrigin` int unsigned NOT NULL DEFAULT '0',
  `TimeEventRegionGroupID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `cfg_regions` (`ID`, `Tag`, `RegionID`, `Raidorigin`, `RegionGroupMask`, `ChallengeOrigin`, `TimeEventRegionGroupID`, `VerifiedBuild`) VALUES (1, 'US', 1, 1127228400, 1, 1135695600, 0, 59888);


-- ==========================================
-- Table: challenge_mode_item_bonus_override
-- ==========================================
CREATE TABLE `challenge_mode_item_bonus_override` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemBonusTreeGroupID` int NOT NULL DEFAULT '0',
  `DstItemBonusTreeID` int NOT NULL DEFAULT '0',
  `Value` int NOT NULL DEFAULT '0',
  `RequiredTimeEventPassed` int NOT NULL DEFAULT '0',
  `RequiredTimeEventNotPassed` int NOT NULL DEFAULT '0',
  `SrcItemBonusTreeID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `challenge_mode_item_bonus_override` (`ID`, `ItemBonusTreeGroupID`, `DstItemBonusTreeID`, `Value`, `RequiredTimeEventPassed`, `RequiredTimeEventNotPassed`, `SrcItemBonusTreeID`, `VerifiedBuild`) VALUES (1081, 0, 4990, -1, 575, 0, 4749, 59888);


-- ==========================================
-- Table: char_base_info
-- ==========================================
CREATE TABLE `char_base_info` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `RaceID` tinyint NOT NULL DEFAULT '0',
  `ClassID` tinyint NOT NULL DEFAULT '0',
  `OtherFactionRaceID` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `char_base_info` (`ID`, `RaceID`, `ClassID`, `OtherFactionRaceID`, `VerifiedBuild`) VALUES (10000, 86, 1, 0, 0);


-- ==========================================
-- Table: char_titles
-- ==========================================
CREATE TABLE `char_titles` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Name1` text COLLATE utf8mb4_unicode_ci,
  `MaskID` smallint NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `char_titles` (`ID`, `Name`, `Name1`, `MaskID`, `Flags`, `VerifiedBuild`) VALUES (421, '\"Conservationist\" %s', '\"Conservationist\" %s', 284, 0, 64270);


-- ==========================================
-- Table: char_titles_locale
-- ==========================================
CREATE TABLE `char_titles_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Name1_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table char_titles_locale is empty)


-- ==========================================
-- Table: character_loadout
-- ==========================================
CREATE TABLE `character_loadout` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `RaceMask` bigint NOT NULL DEFAULT '0',
  `ChrClassID` tinyint NOT NULL DEFAULT '0',
  `Purpose` int NOT NULL DEFAULT '0',
  `ItemContext` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_loadout` (`ID`, `RaceMask`, `ChrClassID`, `Purpose`, `ItemContext`, `VerifiedBuild`) VALUES (2171, 0, 10, 23, 62, 62493);


-- ==========================================
-- Table: character_loadout_item
-- ==========================================
CREATE TABLE `character_loadout_item` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `CharacterLoadoutID` smallint unsigned NOT NULL DEFAULT '0',
  `ItemID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `character_loadout_item` (`ID`, `CharacterLoadoutID`, `ItemID`, `VerifiedBuild`) VALUES (35177, 2196, 243235, 62493);


-- ==========================================
-- Table: chat_channels
-- ==========================================
CREATE TABLE `chat_channels` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Shortcut` text COLLATE utf8mb4_unicode_ci,
  `Flags` int NOT NULL DEFAULT '0',
  `FactionGroup` tinyint unsigned NOT NULL DEFAULT '0',
  `Ruleset` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table chat_channels is empty)


-- ==========================================
-- Table: chat_channels_locale
-- ==========================================
CREATE TABLE `chat_channels_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Shortcut_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table chat_channels_locale is empty)


-- ==========================================
-- Table: chr_class_ui_display
-- ==========================================
CREATE TABLE `chr_class_ui_display` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ChrClassesID` tinyint NOT NULL DEFAULT '0',
  `AdvGuidePlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `SplashPlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table chr_class_ui_display is empty)


-- ==========================================
-- Table: chr_classes
-- ==========================================
CREATE TABLE `chr_classes` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Filename` text COLLATE utf8mb4_unicode_ci,
  `NameMale` text COLLATE utf8mb4_unicode_ci,
  `NameFemale` text COLLATE utf8mb4_unicode_ci,
  `PetNameToken` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `RoleInfoString` text COLLATE utf8mb4_unicode_ci,
  `DisabledString` text COLLATE utf8mb4_unicode_ci,
  `HyphenatedNameMale` text COLLATE utf8mb4_unicode_ci,
  `HyphenatedNameFemale` text COLLATE utf8mb4_unicode_ci,
  `CreateScreenFileDataID` int unsigned NOT NULL DEFAULT '0',
  `SelectScreenFileDataID` int unsigned NOT NULL DEFAULT '0',
  `IconFileDataID` int unsigned NOT NULL DEFAULT '0',
  `LowResScreenFileDataID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `StartingLevel` int NOT NULL DEFAULT '0',
  `SpellTextureBlobFileDataID` int unsigned NOT NULL DEFAULT '0',
  `ArmorTypeMask` int unsigned NOT NULL DEFAULT '0',
  `CharStartKitUnknown901` int NOT NULL DEFAULT '0',
  `MaleCharacterCreationVisualFallback` int NOT NULL DEFAULT '0',
  `MaleCharacterCreationIdleVisualFallback` int NOT NULL DEFAULT '0',
  `FemaleCharacterCreationVisualFallback` int NOT NULL DEFAULT '0',
  `FemaleCharacterCreationIdleVisualFallback` int NOT NULL DEFAULT '0',
  `CharacterCreationIdleGroundVisualFallback` int NOT NULL DEFAULT '0',
  `CharacterCreationGroundVisualFallback` int NOT NULL DEFAULT '0',
  `AlteredFormCharacterCreationIdleVisualFallback` int NOT NULL DEFAULT '0',
  `CharacterCreationAnimLoopWaitTimeMsFallback` int NOT NULL DEFAULT '0',
  `CinematicSequenceID` smallint unsigned NOT NULL DEFAULT '0',
  `DefaultSpec` smallint unsigned NOT NULL DEFAULT '0',
  `ID` tinyint unsigned NOT NULL DEFAULT '0',
  `HasStrengthBonus` tinyint unsigned NOT NULL DEFAULT '0',
  `PrimaryStatPriority` tinyint NOT NULL DEFAULT '0',
  `DisplayPower` tinyint NOT NULL DEFAULT '0',
  `RangedAttackPowerPerAgility` tinyint unsigned NOT NULL DEFAULT '0',
  `AttackPowerPerAgility` tinyint unsigned NOT NULL DEFAULT '0',
  `AttackPowerPerStrength` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellClassSet` tinyint unsigned NOT NULL DEFAULT '0',
  `ClassColorR` tinyint unsigned NOT NULL DEFAULT '0',
  `ClassColorG` tinyint unsigned NOT NULL DEFAULT '0',
  `ClassColorB` tinyint unsigned NOT NULL DEFAULT '0',
  `RolesMask` tinyint unsigned NOT NULL DEFAULT '0',
  `DamageBonusStat` tinyint unsigned NOT NULL DEFAULT '0',
  `HasRelicSlot` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table chr_classes is empty)


-- ==========================================
-- Table: chr_classes_locale
-- ==========================================
CREATE TABLE `chr_classes_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `NameMale_lang` text COLLATE utf8mb4_unicode_ci,
  `NameFemale_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `RoleInfoString_lang` text COLLATE utf8mb4_unicode_ci,
  `DisabledString_lang` text COLLATE utf8mb4_unicode_ci,
  `HyphenatedNameMale_lang` text COLLATE utf8mb4_unicode_ci,
  `HyphenatedNameFemale_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table chr_classes_locale is empty)


-- ==========================================
-- Table: chr_classes_x_power_types
-- ==========================================
CREATE TABLE `chr_classes_x_power_types` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PowerType` tinyint NOT NULL DEFAULT '0',
  `ClassID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table chr_classes_x_power_types is empty)


-- ==========================================
-- Table: chr_customization_choice
-- ==========================================
CREATE TABLE `chr_customization_choice` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ChrCustomizationOptionID` int unsigned NOT NULL DEFAULT '0',
  `ChrCustomizationReqID` int NOT NULL DEFAULT '0',
  `ChrCustomizationVisReqID` int NOT NULL DEFAULT '0',
  `SortOrder` smallint unsigned NOT NULL DEFAULT '0',
  `UiOrderIndex` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `AddedInPatch` int NOT NULL DEFAULT '0',
  `SoundKitID` int NOT NULL DEFAULT '0',
  `SwatchColor1` int NOT NULL DEFAULT '0',
  `SwatchColor2` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `chr_customization_choice` (`Name`, `ID`, `ChrCustomizationOptionID`, `ChrCustomizationReqID`, `ChrCustomizationVisReqID`, `SortOrder`, `UiOrderIndex`, `Flags`, `AddedInPatch`, `SoundKitID`, `SwatchColor1`, `SwatchColor2`, `VerifiedBuild`) VALUES ('', 11, 9, 141, 0, 10, 100, 0, 90001, 0, 11961695, 0, 0);


-- ==========================================
-- Table: chr_customization_choice_locale
-- ==========================================
CREATE TABLE `chr_customization_choice_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table chr_customization_choice_locale is empty)


-- ==========================================
-- Table: chr_customization_display_info
-- ==========================================
CREATE TABLE `chr_customization_display_info` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ShapeshiftFormID` int NOT NULL DEFAULT '0',
  `DisplayID` int NOT NULL DEFAULT '0',
  `BarberShopMinCameraDistance` float NOT NULL DEFAULT '0',
  `BarberShopHeightOffset` float NOT NULL DEFAULT '0',
  `BarberShopCameraZoomOffset` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table chr_customization_display_info is empty)


-- ==========================================
-- Table: chr_customization_element
-- ==========================================
CREATE TABLE `chr_customization_element` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ChrCustomizationChoiceID` int NOT NULL DEFAULT '0',
  `RelatedChrCustomizationChoiceID` int NOT NULL DEFAULT '0',
  `ChrCustomizationGeosetID` int NOT NULL DEFAULT '0',
  `ChrCustomizationSkinnedModelID` int NOT NULL DEFAULT '0',
  `ChrCustomizationMaterialID` int NOT NULL DEFAULT '0',
  `ChrCustomizationBoneSetID` int NOT NULL DEFAULT '0',
  `ChrCustomizationCondModelID` int NOT NULL DEFAULT '0',
  `ChrCustomizationDisplayInfoID` int NOT NULL DEFAULT '0',
  `ChrCustItemGeoModifyID` int NOT NULL DEFAULT '0',
  `ChrCustomizationVoiceID` int NOT NULL DEFAULT '0',
  `AnimKitID` int NOT NULL DEFAULT '0',
  `ParticleColorID` int NOT NULL DEFAULT '0',
  `ChrCustGeoComponentLinkID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table chr_customization_element is empty)


-- ==========================================
-- Table: chr_customization_material
-- ==========================================
CREATE TABLE `chr_customization_material` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ChrModelTextureTargetID` int NOT NULL DEFAULT '0',
  `MaterialResourcesID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table chr_customization_material is empty)


-- ==========================================
-- Table: chr_customization_option
-- ==========================================
CREATE TABLE `chr_customization_option` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SecondaryID` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ChrModelID` int unsigned NOT NULL DEFAULT '0',
  `SortIndex` int NOT NULL DEFAULT '0',
  `ChrCustomizationCategoryID` int NOT NULL DEFAULT '0',
  `OptionType` int NOT NULL DEFAULT '0',
  `BarberShopCostModifier` float NOT NULL DEFAULT '0',
  `ChrCustomizationID` int NOT NULL DEFAULT '0',
  `ChrCustomizationReqID` int NOT NULL DEFAULT '0',
  `UiOrderIndex` int NOT NULL DEFAULT '0',
  `AddedInPatch` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table chr_customization_option is empty)


-- ==========================================
-- Table: chr_customization_option_locale
-- ==========================================
CREATE TABLE `chr_customization_option_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table chr_customization_option_locale is empty)


-- ==========================================
-- Table: chr_customization_req
-- ==========================================
CREATE TABLE `chr_customization_req` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `RaceMask` bigint NOT NULL DEFAULT '0',
  `ReqSource` text COLLATE utf8mb4_unicode_ci,
  `Flags` int NOT NULL DEFAULT '0',
  `ClassMask` int NOT NULL DEFAULT '0',
  `RegionGroupMask` int NOT NULL DEFAULT '0',
  `AchievementID` int NOT NULL DEFAULT '0',
  `QuestID` int NOT NULL DEFAULT '0',
  `OverrideArchive` int NOT NULL DEFAULT '0',
  `ItemModifiedAppearanceID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `chr_customization_req` (`ID`, `RaceMask`, `ReqSource`, `Flags`, `ClassMask`, `RegionGroupMask`, `AchievementID`, `QuestID`, `OverrideArchive`, `ItemModifiedAppearanceID`, `VerifiedBuild`) VALUES (4488, -1, 'Sir Finley Mrrgglton in Dornogal', 3, -1, 0, 0, 82168, -1, 0, 59888);


-- ==========================================
-- Table: chr_customization_req_choice
-- ==========================================
CREATE TABLE `chr_customization_req_choice` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ChrCustomizationChoiceID` int NOT NULL DEFAULT '0',
  `ChrCustomizationReqID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table chr_customization_req_choice is empty)


-- ==========================================
-- Table: chr_customization_req_locale
-- ==========================================
CREATE TABLE `chr_customization_req_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ReqSource_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `chr_customization_req_locale` (`ID`, `locale`, `ReqSource_lang`, `VerifiedBuild`) VALUES (4488, 'deDE', 'Sir Finley Mrrgglton in Dornogal', 59888);


-- ==========================================
-- Table: chr_model
-- ==========================================
CREATE TABLE `chr_model` (
  `FaceCustomizationOffset1` float NOT NULL DEFAULT '0',
  `FaceCustomizationOffset2` float NOT NULL DEFAULT '0',
  `FaceCustomizationOffset3` float NOT NULL DEFAULT '0',
  `CustomizeOffset1` float NOT NULL DEFAULT '0',
  `CustomizeOffset2` float NOT NULL DEFAULT '0',
  `CustomizeOffset3` float NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Sex` tinyint NOT NULL DEFAULT '0',
  `DisplayID` int unsigned NOT NULL DEFAULT '0',
  `CharComponentTextureLayoutID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `SkeletonFileDataID` int NOT NULL DEFAULT '0',
  `ModelFallbackChrModelID` int NOT NULL DEFAULT '0',
  `TextureFallbackChrModelID` int NOT NULL DEFAULT '0',
  `HelmVisFallbackChrModelID` int NOT NULL DEFAULT '0',
  `CustomizeScale` float NOT NULL DEFAULT '0',
  `CustomizeFacing` float NOT NULL DEFAULT '0',
  `CameraDistanceOffset` float NOT NULL DEFAULT '0',
  `BarberShopCameraOffsetScale` float NOT NULL DEFAULT '0',
  `BarberShopCameraHeightOffsetScale` float NOT NULL DEFAULT '0',
  `BarberShopCameraRotationOffset` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table chr_model is empty)


-- ==========================================
-- Table: chr_race_racial_ability
-- ==========================================
CREATE TABLE `chr_race_racial_ability` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `DescriptionShort` text COLLATE utf8mb4_unicode_ci,
  `Icon` int NOT NULL DEFAULT '0',
  `Order` int NOT NULL DEFAULT '0',
  `ChrRacesID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table chr_race_racial_ability is empty)


-- ==========================================
-- Table: chr_race_racial_ability_locale
-- ==========================================
CREATE TABLE `chr_race_racial_ability_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `DescriptionShort_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table chr_race_racial_ability_locale is empty)


-- ==========================================
-- Table: chr_race_x_chr_model
-- ==========================================
CREATE TABLE `chr_race_x_chr_model` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ChrRacesID` tinyint unsigned NOT NULL DEFAULT '0',
  `ChrModelID` int NOT NULL DEFAULT '0',
  `Sex` tinyint NOT NULL DEFAULT '0',
  `AllowedTransmogSlots` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `chr_race_x_chr_model` (`ID`, `ChrRacesID`, `ChrModelID`, `Sex`, `AllowedTransmogSlots`, `VerifiedBuild`) VALUES (50000, 86, 200, 0, 0, 0);


-- ==========================================
-- Table: chr_races
-- ==========================================
CREATE TABLE `chr_races` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ClientPrefix` text COLLATE utf8mb4_unicode_ci,
  `ClientFileString` text COLLATE utf8mb4_unicode_ci,
  `Name` text COLLATE utf8mb4_unicode_ci,
  `NameFemale` text COLLATE utf8mb4_unicode_ci,
  `NameLowercase` text COLLATE utf8mb4_unicode_ci,
  `NameFemaleLowercase` text COLLATE utf8mb4_unicode_ci,
  `LoreName` text COLLATE utf8mb4_unicode_ci,
  `LoreNameFemale` text COLLATE utf8mb4_unicode_ci,
  `LoreNameLower` text COLLATE utf8mb4_unicode_ci,
  `LoreNameLowerFemale` text COLLATE utf8mb4_unicode_ci,
  `LoreDescription` text COLLATE utf8mb4_unicode_ci,
  `ShortName` text COLLATE utf8mb4_unicode_ci,
  `ShortNameFemale` text COLLATE utf8mb4_unicode_ci,
  `ShortNameLower` text COLLATE utf8mb4_unicode_ci,
  `ShortNameLowerFemale` text COLLATE utf8mb4_unicode_ci,
  `Flags` int NOT NULL DEFAULT '0',
  `FactionID` int NOT NULL DEFAULT '0',
  `CinematicSequenceID` int NOT NULL DEFAULT '0',
  `ResSicknessSpellID` int NOT NULL DEFAULT '0',
  `SplashSoundID` int NOT NULL DEFAULT '0',
  `CreateScreenFileDataID` int NOT NULL DEFAULT '0',
  `SelectScreenFileDataID` int NOT NULL DEFAULT '0',
  `LowResScreenFileDataID` int NOT NULL DEFAULT '0',
  `AlteredFormStartVisualKitID1` int NOT NULL DEFAULT '0',
  `AlteredFormStartVisualKitID2` int NOT NULL DEFAULT '0',
  `AlteredFormStartVisualKitID3` int NOT NULL DEFAULT '0',
  `AlteredFormFinishVisualKitID1` int NOT NULL DEFAULT '0',
  `AlteredFormFinishVisualKitID2` int NOT NULL DEFAULT '0',
  `AlteredFormFinishVisualKitID3` int NOT NULL DEFAULT '0',
  `HeritageArmorAchievementID` int NOT NULL DEFAULT '0',
  `StartingLevel` int NOT NULL DEFAULT '0',
  `UiDisplayOrder` int NOT NULL DEFAULT '0',
  `PlayableRaceBit` int NOT NULL DEFAULT '0',
  `TransmogrifyDisabledSlotMask` int NOT NULL DEFAULT '0',
  `AlteredFormCustomizeOffsetFallback1` float NOT NULL DEFAULT '0',
  `AlteredFormCustomizeOffsetFallback2` float NOT NULL DEFAULT '0',
  `AlteredFormCustomizeOffsetFallback3` float NOT NULL DEFAULT '0',
  `AlteredFormCustomizeRotationFallback` float NOT NULL DEFAULT '0',
  `Unknown910_11` float NOT NULL DEFAULT '0',
  `Unknown910_12` float NOT NULL DEFAULT '0',
  `Unknown910_13` float NOT NULL DEFAULT '0',
  `Unknown910_21` float NOT NULL DEFAULT '0',
  `Unknown910_22` float NOT NULL DEFAULT '0',
  `Unknown910_23` float NOT NULL DEFAULT '0',
  `BaseLanguage` tinyint NOT NULL DEFAULT '0',
  `CreatureType` tinyint unsigned NOT NULL DEFAULT '0',
  `Alliance` tinyint NOT NULL DEFAULT '0',
  `RaceRelated` tinyint NOT NULL DEFAULT '0',
  `UnalteredVisualRaceID` tinyint NOT NULL DEFAULT '0',
  `DefaultClassID` tinyint NOT NULL DEFAULT '0',
  `NeutralRaceID` tinyint NOT NULL DEFAULT '0',
  `MaleModelFallbackRaceID` tinyint NOT NULL DEFAULT '0',
  `MaleModelFallbackSex` tinyint NOT NULL DEFAULT '0',
  `FemaleModelFallbackRaceID` tinyint NOT NULL DEFAULT '0',
  `FemaleModelFallbackSex` tinyint NOT NULL DEFAULT '0',
  `MaleTextureFallbackRaceID` tinyint NOT NULL DEFAULT '0',
  `MaleTextureFallbackSex` tinyint NOT NULL DEFAULT '0',
  `FemaleTextureFallbackRaceID` tinyint NOT NULL DEFAULT '0',
  `FemaleTextureFallbackSex` tinyint NOT NULL DEFAULT '0',
  `HelmetAnimScalingRaceID` tinyint NOT NULL DEFAULT '0',
  `UnalteredVisualCustomizationRaceID` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `chr_races` (`ID`, `ClientPrefix`, `ClientFileString`, `Name`, `NameFemale`, `NameLowercase`, `NameFemaleLowercase`, `LoreName`, `LoreNameFemale`, `LoreNameLower`, `LoreNameLowerFemale`, `LoreDescription`, `ShortName`, `ShortNameFemale`, `ShortNameLower`, `ShortNameLowerFemale`, `Flags`, `FactionID`, `CinematicSequenceID`, `ResSicknessSpellID`, `SplashSoundID`, `CreateScreenFileDataID`, `SelectScreenFileDataID`, `LowResScreenFileDataID`, `AlteredFormStartVisualKitID1`, `AlteredFormStartVisualKitID2`, `AlteredFormStartVisualKitID3`, `AlteredFormFinishVisualKitID1`, `AlteredFormFinishVisualKitID2`, `AlteredFormFinishVisualKitID3`, `HeritageArmorAchievementID`, `StartingLevel`, `UiDisplayOrder`, `PlayableRaceBit`, `TransmogrifyDisabledSlotMask`, `AlteredFormCustomizeOffsetFallback1`, `AlteredFormCustomizeOffsetFallback2`, `AlteredFormCustomizeOffsetFallback3`, `AlteredFormCustomizeRotationFallback`, `Unknown910_11`, `Unknown910_12`, `Unknown910_13`, `Unknown910_21`, `Unknown910_22`, `Unknown910_23`, `BaseLanguage`, `CreatureType`, `Alliance`, `RaceRelated`, `UnalteredVisualRaceID`, `DefaultClassID`, `NeutralRaceID`, `MaleModelFallbackRaceID`, `MaleModelFallbackSex`, `FemaleModelFallbackRaceID`, `FemaleModelFallbackSex`, `MaleTextureFallbackRaceID`, `MaleTextureFallbackSex`, `FemaleTextureFallbackRaceID`, `FemaleTextureFallbackSex`, `HelmetAnimScalingRaceID`, `UnalteredVisualCustomizationRaceID`, `VerifiedBuild`) VALUES (86, 'Hr', 'Harronir	', 'Haranir', NULL, 'haranir', NULL, 'Haranir', NULL, 'haranir', NULL, 'Deep from the bowels of Sica\'s pc emerge this Temu version of a new race', 'Haranir', NULL, 'haranir', NULL, 6290572, 3, 2, 15007, 1096, 623714, 0, 651558, 0, 0, 0, 0, 0, 0, 0, 1, 0, -1, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 7, 7, 0, 0, 0, 0, 0, 5, 1, 0, -1, 5, 0, 0, -1, 1, 0, 59000);


-- ==========================================
-- Table: chr_races_locale
-- ==========================================
CREATE TABLE `chr_races_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `NameFemale_lang` text COLLATE utf8mb4_unicode_ci,
  `NameLowercase_lang` text COLLATE utf8mb4_unicode_ci,
  `NameFemaleLowercase_lang` text COLLATE utf8mb4_unicode_ci,
  `LoreName_lang` text COLLATE utf8mb4_unicode_ci,
  `LoreNameFemale_lang` text COLLATE utf8mb4_unicode_ci,
  `LoreNameLower_lang` text COLLATE utf8mb4_unicode_ci,
  `LoreNameLowerFemale_lang` text COLLATE utf8mb4_unicode_ci,
  `LoreDescription_lang` text COLLATE utf8mb4_unicode_ci,
  `ShortName_lang` text COLLATE utf8mb4_unicode_ci,
  `ShortNameFemale_lang` text COLLATE utf8mb4_unicode_ci,
  `ShortNameLower_lang` text COLLATE utf8mb4_unicode_ci,
  `ShortNameLowerFemale_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table chr_races_locale is empty)


-- ==========================================
-- Table: chr_specialization
-- ==========================================
CREATE TABLE `chr_specialization` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `FemaleName` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ClassID` tinyint unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint NOT NULL DEFAULT '0',
  `PetTalentType` tinyint NOT NULL DEFAULT '0',
  `Role` tinyint NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `SpellIconFileID` int NOT NULL DEFAULT '0',
  `PrimaryStatPriority` tinyint NOT NULL DEFAULT '0',
  `AnimReplacements` int NOT NULL DEFAULT '0',
  `MasterySpellID1` int NOT NULL DEFAULT '0',
  `MasterySpellID2` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `chr_specialization` (`Name`, `FemaleName`, `Description`, `ID`, `ClassID`, `OrderIndex`, `PetTalentType`, `Role`, `Flags`, `SpellIconFileID`, `PrimaryStatPriority`, `AnimReplacements`, `MasterySpellID1`, `MasterySpellID2`, `VerifiedBuild`) VALUES ('Arcane', 'Arcane', 'Manipulates raw Arcane magic, destroying enemies with overwhelming power.

Preferred Weapon: Staff, Wand, Dagger, Sword', 62, 8, 0, 0, 2, 3, 135932, 0, 362, 190740, 0, 0);


-- ==========================================
-- Table: chr_specialization_locale
-- ==========================================
CREATE TABLE `chr_specialization_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `FemaleName_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table chr_specialization_locale is empty)


-- ==========================================
-- Table: cinematic_camera
-- ==========================================
CREATE TABLE `cinematic_camera` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `OriginX` float NOT NULL DEFAULT '0',
  `OriginY` float NOT NULL DEFAULT '0',
  `OriginZ` float NOT NULL DEFAULT '0',
  `SoundID` int unsigned NOT NULL DEFAULT '0',
  `OriginFacing` float NOT NULL DEFAULT '0',
  `FileDataID` int unsigned NOT NULL DEFAULT '0',
  `ConversationID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table cinematic_camera is empty)


-- ==========================================
-- Table: cinematic_sequences
-- ==========================================
CREATE TABLE `cinematic_sequences` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SoundID` int unsigned NOT NULL DEFAULT '0',
  `Camera1` smallint unsigned NOT NULL DEFAULT '0',
  `Camera2` smallint unsigned NOT NULL DEFAULT '0',
  `Camera3` smallint unsigned NOT NULL DEFAULT '0',
  `Camera4` smallint unsigned NOT NULL DEFAULT '0',
  `Camera5` smallint unsigned NOT NULL DEFAULT '0',
  `Camera6` smallint unsigned NOT NULL DEFAULT '0',
  `Camera7` smallint unsigned NOT NULL DEFAULT '0',
  `Camera8` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table cinematic_sequences is empty)


-- ==========================================
-- Table: conditional_chr_model
-- ==========================================
CREATE TABLE `conditional_chr_model` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ChrModelID` int unsigned NOT NULL DEFAULT '0',
  `ChrCustomizationReqID` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ChrCustomizationCategoryID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table conditional_chr_model is empty)


-- ==========================================
-- Table: conditional_content_tuning
-- ==========================================
CREATE TABLE `conditional_content_tuning` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `OrderIndex` int NOT NULL DEFAULT '0',
  `RedirectContentTuningID` int NOT NULL DEFAULT '0',
  `RedirectFlag` int NOT NULL DEFAULT '0',
  `ParentContentTuningID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `conditional_content_tuning` (`ID`, `OrderIndex`, `RedirectContentTuningID`, `RedirectFlag`, `ParentContentTuningID`, `VerifiedBuild`) VALUES (245, 1, 1707, 2, 1324, 61609);


-- ==========================================
-- Table: content_tuning
-- ==========================================
CREATE TABLE `content_tuning` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ExpansionID` int NOT NULL DEFAULT '0',
  `HealthItemLevelCurveID` int NOT NULL DEFAULT '0',
  `DamageItemLevelCurveID` int NOT NULL DEFAULT '0',
  `HealthPrimaryStatCurveID` int NOT NULL DEFAULT '0',
  `DamagePrimaryStatCurveID` int NOT NULL DEFAULT '0',
  `PrimaryStatScalingModPlayerDataElementCharacterID` int NOT NULL DEFAULT '0',
  `PrimaryStatScalingModPlayerDataElementCharacterMultiplier` float NOT NULL DEFAULT '0',
  `MinLevel` int NOT NULL DEFAULT '0',
  `MaxLevel` int NOT NULL DEFAULT '0',
  `MinLevelType` int NOT NULL DEFAULT '0',
  `MaxLevelType` int NOT NULL DEFAULT '0',
  `TargetLevelDelta` int NOT NULL DEFAULT '0',
  `TargetLevelMaxDelta` int NOT NULL DEFAULT '0',
  `TargetLevelMin` int NOT NULL DEFAULT '0',
  `TargetLevelMax` int NOT NULL DEFAULT '0',
  `MinItemLevel` int NOT NULL DEFAULT '0',
  `QuestXpMultiplier` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `content_tuning` (`ID`, `Flags`, `ExpansionID`, `HealthItemLevelCurveID`, `DamageItemLevelCurveID`, `HealthPrimaryStatCurveID`, `DamagePrimaryStatCurveID`, `PrimaryStatScalingModPlayerDataElementCharacterID`, `PrimaryStatScalingModPlayerDataElementCharacterMultiplier`, `MinLevel`, `MaxLevel`, `MinLevelType`, `MaxLevelType`, `TargetLevelDelta`, `TargetLevelMaxDelta`, `TargetLevelMin`, `TargetLevelMax`, `MinItemLevel`, `QuestXpMultiplier`, `VerifiedBuild`) VALUES (298, 0, -3, 84931, 84932, 0, 0, 0, 0.0, 0, 0, 10, 0, 0, 2, 0, 255, 0, 0.0, 64270);


-- ==========================================
-- Table: content_tuning_x_expected
-- ==========================================
CREATE TABLE `content_tuning_x_expected` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ExpectedStatModID` int NOT NULL DEFAULT '0',
  `MinMythicPlusSeasonID` int NOT NULL DEFAULT '0',
  `MaxMythicPlusSeasonID` int NOT NULL DEFAULT '0',
  `ContentTuningID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `content_tuning_x_expected` (`ID`, `ExpectedStatModID`, `MinMythicPlusSeasonID`, `MaxMythicPlusSeasonID`, `ContentTuningID`, `VerifiedBuild`) VALUES (1527, 341, 103, 0, 1279, 59888);


-- ==========================================
-- Table: content_tuning_x_label
-- ==========================================
CREATE TABLE `content_tuning_x_label` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `LabelID` int NOT NULL DEFAULT '0',
  `ContentTuningID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table content_tuning_x_label is empty)


-- ==========================================
-- Table: conversation_line
-- ==========================================
CREATE TABLE `conversation_line` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID` int unsigned NOT NULL DEFAULT '0',
  `Unused1020` int unsigned NOT NULL DEFAULT '0',
  `SpellVisualKitID` int unsigned NOT NULL DEFAULT '0',
  `AdditionalDuration` int NOT NULL DEFAULT '0',
  `NextConversationLineID` smallint unsigned NOT NULL DEFAULT '0',
  `AnimKitID` smallint unsigned NOT NULL DEFAULT '0',
  `SpeechType` tinyint unsigned NOT NULL DEFAULT '0',
  `StartAnimation` tinyint unsigned NOT NULL DEFAULT '0',
  `EndAnimation` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `conversation_line` (`ID`, `BroadcastTextID`, `Unused1020`, `SpellVisualKitID`, `AdditionalDuration`, `NextConversationLineID`, `AnimKitID`, `SpeechType`, `StartAnimation`, `EndAnimation`, `VerifiedBuild`) VALUES (90783, 291321, 0, 0, 0, 25248, 0, 0, 60, 60, 64270);


-- ==========================================
-- Table: corruption_effects
-- ==========================================
CREATE TABLE `corruption_effects` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MinCorruption` float NOT NULL DEFAULT '0',
  `Aura` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table corruption_effects is empty)


-- ==========================================
-- Table: crafting_data
-- ==========================================
CREATE TABLE `crafting_data` (
  `ID` int unsigned NOT NULL,
  `Type` int NOT NULL DEFAULT '0',
  `CraftingDifficultyID` int NOT NULL DEFAULT '0',
  `CraftedItemID` int NOT NULL DEFAULT '0',
  `ItemBonusTreeID` int NOT NULL DEFAULT '0',
  `CraftingDifficulty` int NOT NULL DEFAULT '0',
  `Field_10_0_0_44649_005` float NOT NULL DEFAULT '0',
  `CraftSkillBonusPercent` float NOT NULL DEFAULT '0',
  `ReCraftSkillBonusPercent` float NOT NULL DEFAULT '0',
  `InspirationSkillBonusPercent` float NOT NULL DEFAULT '0',
  `Field_10_0_0_44649_009` float NOT NULL DEFAULT '0',
  `Field_10_0_0_45141_011` float NOT NULL DEFAULT '0',
  `FirstCraftFlagQuestID` int NOT NULL DEFAULT '0',
  `FirstCraftTreasureID` int NOT NULL DEFAULT '0',
  `Field_10_2_5_52432_014` int NOT NULL DEFAULT '0',
  `CraftedTreasureID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table crafting_data is empty)


-- ==========================================
-- Table: crafting_data_item_quality
-- ==========================================
CREATE TABLE `crafting_data_item_quality` (
  `ID` int unsigned NOT NULL,
  `ItemID` int NOT NULL DEFAULT '0',
  `CraftingDataID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table crafting_data_item_quality is empty)


-- ==========================================
-- Table: crafting_difficulty
-- ==========================================
CREATE TABLE `crafting_difficulty` (
  `ID` int unsigned NOT NULL,
  `MaxRandomSkillBonusPercent` float NOT NULL DEFAULT '0',
  `CraftSkillBonusPercent` float NOT NULL DEFAULT '0',
  `ReCraftSkillBonusPercent` float NOT NULL DEFAULT '0',
  `InspirationSkillBonusPercent` float NOT NULL DEFAULT '0',
  `Field_10_0_0_44649_004` float NOT NULL DEFAULT '0',
  `ConcentrationSkillCurveID` int NOT NULL DEFAULT '0',
  `ConcentrationDifficultyCurveID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table crafting_difficulty is empty)


-- ==========================================
-- Table: crafting_difficulty_quality
-- ==========================================
CREATE TABLE `crafting_difficulty_quality` (
  `ID` int unsigned NOT NULL,
  `Order` int NOT NULL DEFAULT '0',
  `CraftingQualityID` int NOT NULL DEFAULT '0',
  `QualityPercentage` float NOT NULL DEFAULT '0',
  `Field_10_0_0_44895_004` float NOT NULL DEFAULT '0',
  `CraftingDifficultyID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table crafting_difficulty_quality is empty)


-- ==========================================
-- Table: crafting_quality
-- ==========================================
CREATE TABLE `crafting_quality` (
  `ID` int unsigned NOT NULL,
  `QualityTier` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table crafting_quality is empty)


-- ==========================================
-- Table: crafting_reagent_quality
-- ==========================================
CREATE TABLE `crafting_reagent_quality` (
  `ID` int unsigned NOT NULL,
  `OrderIndex` int NOT NULL DEFAULT '0',
  `ItemID` int NOT NULL DEFAULT '0',
  `MaxDifficultyAdjustment` float NOT NULL DEFAULT '0',
  `ReagentEffectPct` float NOT NULL DEFAULT '0',
  `ModifiedCraftingCategoryID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table crafting_reagent_quality is empty)


-- ==========================================
-- Table: creature
-- ==========================================
CREATE TABLE `creature` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `ItemID1` mediumint unsigned NOT NULL DEFAULT '0',
  `ItemID2` mediumint unsigned NOT NULL DEFAULT '0',
  `ItemID3` mediumint unsigned NOT NULL DEFAULT '0',
  `Mount` mediumint unsigned NOT NULL DEFAULT '0',
  `DisplayID1` mediumint unsigned NOT NULL DEFAULT '0',
  `DisplayID2` mediumint unsigned NOT NULL DEFAULT '0',
  `DisplayID3` mediumint unsigned NOT NULL DEFAULT '0',
  `DisplayID4` mediumint unsigned NOT NULL DEFAULT '0',
  `DisplayIDProbability1` float NOT NULL DEFAULT '0',
  `DisplayIDProbability2` float NOT NULL DEFAULT '0',
  `DisplayIDProbability3` float NOT NULL DEFAULT '0',
  `DisplayIDProbability4` float NOT NULL DEFAULT '0',
  `Name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `FemaleName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `SubName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `FemaleSubName` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` mediumint unsigned NOT NULL DEFAULT '0',
  `Family` tinyint unsigned NOT NULL DEFAULT '0',
  `Classification` tinyint unsigned NOT NULL DEFAULT '0',
  `InhabitType` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table creature is empty)


-- ==========================================
-- Table: creature_difficulty
-- ==========================================
CREATE TABLE `creature_difficulty` (
  `ID` mediumint unsigned NOT NULL DEFAULT '0',
  `CreatureID` mediumint unsigned NOT NULL DEFAULT '0',
  `Flags1` int unsigned NOT NULL DEFAULT '0',
  `Flags2` int unsigned NOT NULL DEFAULT '0',
  `Flags3` int unsigned NOT NULL DEFAULT '0',
  `Flags4` int unsigned NOT NULL DEFAULT '0',
  `Flags5` int unsigned NOT NULL DEFAULT '0',
  `Flags6` int unsigned NOT NULL DEFAULT '0',
  `Flags7` int unsigned NOT NULL DEFAULT '0',
  `FactionTemplateID` smallint unsigned NOT NULL DEFAULT '0',
  `Expansion` tinyint NOT NULL DEFAULT '0',
  `MinLevel` tinyint NOT NULL DEFAULT '0',
  `MaxLevel` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table creature_difficulty is empty)


-- ==========================================
-- Table: creature_display_info
-- ==========================================
CREATE TABLE `creature_display_info` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ModelID` smallint unsigned NOT NULL DEFAULT '0',
  `SoundID` smallint unsigned NOT NULL DEFAULT '0',
  `SizeClass` tinyint NOT NULL DEFAULT '0',
  `CreatureModelScale` float NOT NULL DEFAULT '0',
  `CreatureModelAlpha` tinyint unsigned NOT NULL DEFAULT '0',
  `BloodID` tinyint unsigned NOT NULL DEFAULT '0',
  `ExtendedDisplayInfoID` int NOT NULL DEFAULT '0',
  `NPCSoundID` smallint unsigned NOT NULL DEFAULT '0',
  `ParticleColorID` smallint unsigned NOT NULL DEFAULT '0',
  `PortraitCreatureDisplayInfoID` int NOT NULL DEFAULT '0',
  `PortraitTextureFileDataID` int NOT NULL DEFAULT '0',
  `ObjectEffectPackageID` smallint unsigned NOT NULL DEFAULT '0',
  `AnimReplacementSetID` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `StateSpellVisualKitID` int NOT NULL DEFAULT '0',
  `PlayerOverrideScale` float NOT NULL DEFAULT '0',
  `PetInstanceScale` float NOT NULL DEFAULT '0',
  `UnarmedWeaponType` tinyint NOT NULL DEFAULT '0',
  `MountPoofSpellVisualKitID` int NOT NULL DEFAULT '0',
  `DissolveEffectID` int NOT NULL DEFAULT '0',
  `Gender` tinyint NOT NULL DEFAULT '0',
  `DissolveOutEffectID` int NOT NULL DEFAULT '0',
  `CreatureModelMinLod` tinyint NOT NULL DEFAULT '0',
  `ConditionalCreatureModelID` smallint unsigned NOT NULL DEFAULT '0',
  `Unknown_1100_1` float NOT NULL DEFAULT '0',
  `Unknown_1100_2` smallint unsigned NOT NULL DEFAULT '0',
  `TextureVariationFileDataID1` int NOT NULL DEFAULT '0',
  `TextureVariationFileDataID2` int NOT NULL DEFAULT '0',
  `TextureVariationFileDataID3` int NOT NULL DEFAULT '0',
  `TextureVariationFileDataID4` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_display_info` (`ID`, `ModelID`, `SoundID`, `SizeClass`, `CreatureModelScale`, `CreatureModelAlpha`, `BloodID`, `ExtendedDisplayInfoID`, `NPCSoundID`, `ParticleColorID`, `PortraitCreatureDisplayInfoID`, `PortraitTextureFileDataID`, `ObjectEffectPackageID`, `AnimReplacementSetID`, `Flags`, `StateSpellVisualKitID`, `PlayerOverrideScale`, `PetInstanceScale`, `UnarmedWeaponType`, `MountPoofSpellVisualKitID`, `DissolveEffectID`, `Gender`, `DissolveOutEffectID`, `CreatureModelMinLod`, `ConditionalCreatureModelID`, `Unknown_1100_1`, `Unknown_1100_2`, `TextureVariationFileDataID1`, `TextureVariationFileDataID2`, `TextureVariationFileDataID3`, `TextureVariationFileDataID4`, `VerifiedBuild`) VALUES (36800, 3141, 0, 0, 1.0, 255, 0, 24258, 344, 0, 0, 0, 0, 0, 0, 0, 0.0, 1.0, -1, 0, 0, 0, 0, 0, 0, 45.0, 0, 0, 0, 0, 0, 64270);


-- ==========================================
-- Table: creature_display_info_extra
-- ==========================================
CREATE TABLE `creature_display_info_extra` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DisplayRaceID` tinyint NOT NULL DEFAULT '0',
  `DisplaySexID` tinyint NOT NULL DEFAULT '0',
  `DisplayClassID` tinyint NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `BakeMaterialResourcesID` int NOT NULL DEFAULT '0',
  `HDBakeMaterialResourcesID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_display_info_extra` (`ID`, `DisplayRaceID`, `DisplaySexID`, `DisplayClassID`, `Flags`, `BakeMaterialResourcesID`, `HDBakeMaterialResourcesID`, `VerifiedBuild`) VALUES (139247, 1, 0, 0, 0, 0, 355301, 64270);


-- ==========================================
-- Table: creature_display_info_option
-- ==========================================
CREATE TABLE `creature_display_info_option` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ChrCustomizationOptionID` int NOT NULL DEFAULT '0',
  `ChrCustomizationChoiceID` int NOT NULL DEFAULT '0',
  `CreatureDisplayInfoExtraID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table creature_display_info_option is empty)


-- ==========================================
-- Table: creature_family
-- ==========================================
CREATE TABLE `creature_family` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `MinScale` float NOT NULL DEFAULT '0',
  `MinScaleLevel` tinyint NOT NULL DEFAULT '0',
  `MaxScale` float NOT NULL DEFAULT '0',
  `MaxScaleLevel` tinyint NOT NULL DEFAULT '0',
  `PetFoodMask` smallint NOT NULL DEFAULT '0',
  `PetTalentType` tinyint NOT NULL DEFAULT '0',
  `CategoryEnumID` int NOT NULL DEFAULT '0',
  `IconFileID` int NOT NULL DEFAULT '0',
  `SkillLine1` smallint NOT NULL DEFAULT '0',
  `SkillLine2` smallint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table creature_family is empty)


-- ==========================================
-- Table: creature_family_locale
-- ==========================================
CREATE TABLE `creature_family_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table creature_family_locale is empty)


-- ==========================================
-- Table: creature_label
-- ==========================================
CREATE TABLE `creature_label` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `LabelID` int NOT NULL DEFAULT '0',
  `CreatureDifficultyID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_label` (`ID`, `LabelID`, `CreatureDifficultyID`, `VerifiedBuild`) VALUES (69541, 955, 237173, 59888);


-- ==========================================
-- Table: creature_model_data
-- ==========================================
CREATE TABLE `creature_model_data` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `GeoBox1` float NOT NULL DEFAULT '0',
  `GeoBox2` float NOT NULL DEFAULT '0',
  `GeoBox3` float NOT NULL DEFAULT '0',
  `GeoBox4` float NOT NULL DEFAULT '0',
  `GeoBox5` float NOT NULL DEFAULT '0',
  `GeoBox6` float NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `FileDataID` int unsigned NOT NULL DEFAULT '0',
  `WalkSpeed` float NOT NULL DEFAULT '0',
  `RunSpeed` float NOT NULL DEFAULT '0',
  `BloodID` int unsigned NOT NULL DEFAULT '0',
  `FootprintTextureID` int unsigned NOT NULL DEFAULT '0',
  `FootprintTextureLength` float NOT NULL DEFAULT '0',
  `FootprintTextureWidth` float NOT NULL DEFAULT '0',
  `FootprintParticleScale` float NOT NULL DEFAULT '0',
  `FoleyMaterialID` int unsigned NOT NULL DEFAULT '0',
  `FootstepCameraEffectID` int unsigned NOT NULL DEFAULT '0',
  `DeathThudCameraEffectID` int unsigned NOT NULL DEFAULT '0',
  `SoundID` int unsigned NOT NULL DEFAULT '0',
  `SizeClass` tinyint NOT NULL DEFAULT '0',
  `CollisionWidth` float NOT NULL DEFAULT '0',
  `CollisionHeight` float NOT NULL DEFAULT '0',
  `WorldEffectScale` float NOT NULL DEFAULT '0',
  `CreatureGeosetDataID` int unsigned NOT NULL DEFAULT '0',
  `HoverHeight` float NOT NULL DEFAULT '0',
  `AttachedEffectScale` float NOT NULL DEFAULT '0',
  `ModelScale` float NOT NULL DEFAULT '0',
  `MissileCollisionRadius` float NOT NULL DEFAULT '0',
  `MissileCollisionPush` float NOT NULL DEFAULT '0',
  `MissileCollisionRaise` float NOT NULL DEFAULT '0',
  `MountHeight` float NOT NULL DEFAULT '0',
  `OverrideLootEffectScale` float NOT NULL DEFAULT '0',
  `OverrideNameScale` float NOT NULL DEFAULT '0',
  `OverrideSelectionRadius` float NOT NULL DEFAULT '0',
  `TamedPetBaseScale` float NOT NULL DEFAULT '0',
  `MountScaleOtherIndex` tinyint NOT NULL DEFAULT '0',
  `MountScaleSelf` float NOT NULL DEFAULT '0',
  `Unknown1100` smallint unsigned NOT NULL DEFAULT '0',
  `MountScaleOther1` float NOT NULL DEFAULT '0',
  `MountScaleOther2` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_model_data` (`ID`, `GeoBox1`, `GeoBox2`, `GeoBox3`, `GeoBox4`, `GeoBox5`, `GeoBox6`, `Flags`, `FileDataID`, `WalkSpeed`, `RunSpeed`, `BloodID`, `FootprintTextureID`, `FootprintTextureLength`, `FootprintTextureWidth`, `FootprintParticleScale`, `FoleyMaterialID`, `FootstepCameraEffectID`, `DeathThudCameraEffectID`, `SoundID`, `SizeClass`, `CollisionWidth`, `CollisionHeight`, `WorldEffectScale`, `CreatureGeosetDataID`, `HoverHeight`, `AttachedEffectScale`, `ModelScale`, `MissileCollisionRadius`, `MissileCollisionPush`, `MissileCollisionRaise`, `MountHeight`, `OverrideLootEffectScale`, `OverrideNameScale`, `OverrideSelectionRadius`, `TamedPetBaseScale`, `MountScaleOtherIndex`, `MountScaleSelf`, `Unknown1100`, `MountScaleOther1`, `MountScaleOther2`, `VerifiedBuild`) VALUES (11944, -1.07716, -1.05374, -0.00839614, 0.776545, 0.88593, 0.28952, 0, 200137, 0.0, 0.0, 1, 0, 18.0, 12.0, 1.0, 0, 0, 0, 9417, 0, 1.61422, 0.29218, 1.0, 0, 0.0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0, 1.0, 0, 1.0, 1.0, 59888);


-- ==========================================
-- Table: creature_type
-- ==========================================
CREATE TABLE `creature_type` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table creature_type is empty)


-- ==========================================
-- Table: creature_type_locale
-- ==========================================
CREATE TABLE `creature_type_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table creature_type_locale is empty)


-- ==========================================
-- Table: criteria
-- ==========================================
CREATE TABLE `criteria` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Type` smallint NOT NULL DEFAULT '0',
  `Asset` int NOT NULL DEFAULT '0',
  `ModifierTreeId` int unsigned NOT NULL DEFAULT '0',
  `StartEvent` int NOT NULL DEFAULT '0',
  `StartAsset` int NOT NULL DEFAULT '0',
  `StartTimer` smallint unsigned NOT NULL DEFAULT '0',
  `FailEvent` int NOT NULL DEFAULT '0',
  `FailAsset` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `EligibilityWorldStateID` smallint NOT NULL DEFAULT '0',
  `EligibilityWorldStateValue` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `criteria` (`ID`, `Type`, `Asset`, `ModifierTreeId`, `StartEvent`, `StartAsset`, `StartTimer`, `FailEvent`, `FailAsset`, `Flags`, `EligibilityWorldStateID`, `EligibilityWorldStateValue`, `VerifiedBuild`) VALUES (14811, 126, 0, 425333, 0, 0, 0, 0, 0, 0, 0, 0, 64270);


-- ==========================================
-- Table: criteria_tree
-- ==========================================
CREATE TABLE `criteria_tree` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Parent` int unsigned NOT NULL DEFAULT '0',
  `Amount` int unsigned NOT NULL DEFAULT '0',
  `Operator` int NOT NULL DEFAULT '0',
  `CriteriaID` int unsigned NOT NULL DEFAULT '0',
  `OrderIndex` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `criteria_tree` (`ID`, `Description`, `Parent`, `Amount`, `Operator`, `CriteriaID`, `OrderIndex`, `Flags`, `VerifiedBuild`) VALUES (16693, 'Ready for Raiding', 16690, 0, 0, 16041, 15, 0, 59888);


-- ==========================================
-- Table: criteria_tree_locale
-- ==========================================
CREATE TABLE `criteria_tree_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `criteria_tree_locale` (`ID`, `locale`, `Description_lang`, `VerifiedBuild`) VALUES (16693, 'deDE', 'Allzeit schlachtzugsbereit', 59888);


-- ==========================================
-- Table: currency_container
-- ==========================================
CREATE TABLE `currency_container` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ContainerName` text COLLATE utf8mb4_unicode_ci,
  `ContainerDescription` text COLLATE utf8mb4_unicode_ci,
  `MinAmount` int NOT NULL DEFAULT '0',
  `MaxAmount` int NOT NULL DEFAULT '0',
  `ContainerIconID` int NOT NULL DEFAULT '0',
  `ContainerQuality` tinyint NOT NULL DEFAULT '0',
  `OnLootSpellVisualKitID` int NOT NULL DEFAULT '0',
  `CurrencyTypesID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table currency_container is empty)


-- ==========================================
-- Table: currency_container_locale
-- ==========================================
CREATE TABLE `currency_container_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ContainerName_lang` text COLLATE utf8mb4_unicode_ci,
  `ContainerDescription_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table currency_container_locale is empty)


-- ==========================================
-- Table: currency_types
-- ==========================================
CREATE TABLE `currency_types` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `CategoryID` int NOT NULL DEFAULT '0',
  `InventoryIconFileID` int NOT NULL DEFAULT '0',
  `SpellWeight` int unsigned NOT NULL DEFAULT '0',
  `SpellCategory` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxQty` int unsigned NOT NULL DEFAULT '0',
  `MaxEarnablePerWeek` int unsigned NOT NULL DEFAULT '0',
  `Quality` tinyint NOT NULL DEFAULT '0',
  `FactionID` int NOT NULL DEFAULT '0',
  `ItemGroupSoundsID` int NOT NULL DEFAULT '0',
  `XpQuestDifficulty` int NOT NULL DEFAULT '0',
  `AwardConditionID` int NOT NULL DEFAULT '0',
  `MaxQtyWorldStateID` int NOT NULL DEFAULT '0',
  `RechargingAmountPerCycle` int unsigned NOT NULL DEFAULT '0',
  `RechargingCycleDurationMS` int unsigned NOT NULL DEFAULT '0',
  `AccountTransferPercentage` float NOT NULL DEFAULT '0',
  `OrderIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags1` int NOT NULL DEFAULT '0',
  `Flags2` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `currency_types` (`ID`, `Name`, `Description`, `CategoryID`, `InventoryIconFileID`, `SpellWeight`, `SpellCategory`, `MaxQty`, `MaxEarnablePerWeek`, `Quality`, `FactionID`, `ItemGroupSoundsID`, `XpQuestDifficulty`, `AwardConditionID`, `MaxQtyWorldStateID`, `RechargingAmountPerCycle`, `RechargingCycleDurationMS`, `AccountTransferPercentage`, `OrderIndex`, `Flags1`, `Flags2`, `VerifiedBuild`) VALUES (42, 'Badge of Justice', NULL, 1, 135884, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0.0, 0, 0, 0, 0);


-- ==========================================
-- Table: currency_types_locale
-- ==========================================
CREATE TABLE `currency_types_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `currency_types_locale` (`ID`, `locale`, `Name_lang`, `Description_lang`, `VerifiedBuild`) VALUES (2803, 'deDE', 'Lorenmünze', 'Eine Währung, die oft von Entdeckern verwendet wird, um Geheimnisse und Erzählungen von Wert zu tauschen.', 59888);


-- ==========================================
-- Table: curve
-- ==========================================
CREATE TABLE `curve` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `curve` (`ID`, `Type`, `Flags`, `VerifiedBuild`) VALUES (1828, 0, 2, 64270);


-- ==========================================
-- Table: curve_point
-- ==========================================
CREATE TABLE `curve_point` (
  `PosX` float NOT NULL DEFAULT '0',
  `PosY` float NOT NULL DEFAULT '0',
  `PreSLSquishPosX` float NOT NULL DEFAULT '0',
  `PreSLSquishPosY` float NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `CurveID` int unsigned NOT NULL DEFAULT '0',
  `OrderIndex` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `curve_point` (`PosX`, `PosY`, `PreSLSquishPosX`, `PreSLSquishPosY`, `ID`, `CurveID`, `OrderIndex`, `VerifiedBuild`) VALUES (1.0, 15.0, 0.0, 0.0, 169586, 61270, 3, 59888);


-- ==========================================
-- Table: destructible_model_data
-- ==========================================
CREATE TABLE `destructible_model_data` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `State0ImpactEffectDoodadSet` tinyint NOT NULL DEFAULT '0',
  `State0AmbientDoodadSet` tinyint unsigned NOT NULL DEFAULT '0',
  `State1Wmo` int NOT NULL DEFAULT '0',
  `State1DestructionDoodadSet` tinyint NOT NULL DEFAULT '0',
  `State1ImpactEffectDoodadSet` tinyint NOT NULL DEFAULT '0',
  `State1AmbientDoodadSet` tinyint unsigned NOT NULL DEFAULT '0',
  `State2Wmo` int NOT NULL DEFAULT '0',
  `State2DestructionDoodadSet` tinyint NOT NULL DEFAULT '0',
  `State2ImpactEffectDoodadSet` tinyint NOT NULL DEFAULT '0',
  `State2AmbientDoodadSet` tinyint unsigned NOT NULL DEFAULT '0',
  `State3Wmo` int NOT NULL DEFAULT '0',
  `State3InitDoodadSet` tinyint unsigned NOT NULL DEFAULT '0',
  `State3AmbientDoodadSet` tinyint unsigned NOT NULL DEFAULT '0',
  `EjectDirection` tinyint unsigned NOT NULL DEFAULT '0',
  `DoNotHighlight` tinyint unsigned NOT NULL DEFAULT '0',
  `State0Wmo` int NOT NULL DEFAULT '0',
  `HealEffect` tinyint unsigned NOT NULL DEFAULT '0',
  `HealEffectSpeed` smallint unsigned NOT NULL DEFAULT '0',
  `State0NameSet` tinyint NOT NULL DEFAULT '0',
  `State1NameSet` tinyint NOT NULL DEFAULT '0',
  `State2NameSet` tinyint NOT NULL DEFAULT '0',
  `State3NameSet` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table destructible_model_data is empty)


-- ==========================================
-- Table: difficulty
-- ==========================================
CREATE TABLE `difficulty` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `InstanceType` tinyint unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `OldEnumValue` tinyint NOT NULL DEFAULT '0',
  `FallbackDifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `MinPlayers` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxPlayers` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` smallint unsigned NOT NULL DEFAULT '0',
  `ItemContext` tinyint unsigned NOT NULL DEFAULT '0',
  `ToggleDifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `GroupSizeHealthCurveID` int unsigned NOT NULL DEFAULT '0',
  `GroupSizeDmgCurveID` int unsigned NOT NULL DEFAULT '0',
  `GroupSizeSpellPointsCurveID` int unsigned NOT NULL DEFAULT '0',
  `Unknown1105` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table difficulty is empty)


-- ==========================================
-- Table: difficulty_locale
-- ==========================================
CREATE TABLE `difficulty_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table difficulty_locale is empty)


-- ==========================================
-- Table: dungeon_encounter
-- ==========================================
CREATE TABLE `dungeon_encounter` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MapID` smallint unsigned NOT NULL DEFAULT '0',
  `DifficultyID` int NOT NULL DEFAULT '0',
  `OrderIndex` int NOT NULL DEFAULT '0',
  `CompleteWorldStateID` int NOT NULL DEFAULT '0',
  `Bit` tinyint NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `SpellIconFileID` int NOT NULL DEFAULT '0',
  `Faction` int NOT NULL DEFAULT '0',
  `Unknown1115` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `dungeon_encounter` (`Name`, `ID`, `MapID`, `DifficultyID`, `OrderIndex`, `CompleteWorldStateID`, `Bit`, `Flags`, `SpellIconFileID`, `Faction`, `Unknown1115`, `VerifiedBuild`) VALUES ('Bloodlord Mandokir', 1179, 859, 0, 1000, 5810, 1, 4, 0, -1, 0, 59888);


-- ==========================================
-- Table: dungeon_encounter_locale
-- ==========================================
CREATE TABLE `dungeon_encounter_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `dungeon_encounter_locale` (`ID`, `locale`, `Name_lang`, `VerifiedBuild`) VALUES (1179, 'deDE', 'Blutfürst Mandokir', 59888);


-- ==========================================
-- Table: durability_costs
-- ==========================================
CREATE TABLE `durability_costs` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost1` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost2` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost3` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost4` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost5` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost6` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost7` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost8` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost9` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost10` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost11` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost12` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost13` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost14` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost15` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost16` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost17` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost18` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost19` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost20` smallint unsigned NOT NULL DEFAULT '0',
  `WeaponSubClassCost21` smallint unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost1` smallint unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost2` smallint unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost3` smallint unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost4` smallint unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost5` smallint unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost6` smallint unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost7` smallint unsigned NOT NULL DEFAULT '0',
  `ArmorSubClassCost8` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table durability_costs is empty)


-- ==========================================
-- Table: durability_quality
-- ==========================================
CREATE TABLE `durability_quality` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Data` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table durability_quality is empty)


-- ==========================================
-- Table: emotes
-- ==========================================
CREATE TABLE `emotes` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `RaceMask` bigint NOT NULL DEFAULT '0',
  `EmoteSlashCommand` text COLLATE utf8mb4_unicode_ci,
  `AnimID` smallint NOT NULL DEFAULT '0',
  `EmoteFlags` int NOT NULL DEFAULT '0',
  `EmoteSpecProc` int NOT NULL DEFAULT '0',
  `EmoteSpecProcParam` int unsigned NOT NULL DEFAULT '0',
  `EventSoundID` int unsigned NOT NULL DEFAULT '0',
  `SpellVisualKitID` int unsigned NOT NULL DEFAULT '0',
  `ClassMask` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table emotes is empty)


-- ==========================================
-- Table: emotes_text
-- ==========================================
CREATE TABLE `emotes_text` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `EmoteID` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table emotes_text is empty)


-- ==========================================
-- Table: emotes_text_sound
-- ==========================================
CREATE TABLE `emotes_text_sound` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `RaceID` tinyint NOT NULL DEFAULT '0',
  `ClassID` tinyint NOT NULL DEFAULT '0',
  `SexID` tinyint NOT NULL DEFAULT '0',
  `SoundID` int unsigned NOT NULL DEFAULT '0',
  `EmotesTextID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table emotes_text_sound is empty)


-- ==========================================
-- Table: expected_stat
-- ==========================================
CREATE TABLE `expected_stat` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ExpansionID` int NOT NULL DEFAULT '0',
  `CreatureHealth` float NOT NULL DEFAULT '0',
  `PlayerHealth` float NOT NULL DEFAULT '0',
  `CreatureAutoAttackDps` float NOT NULL DEFAULT '0',
  `CreatureArmor` float NOT NULL DEFAULT '0',
  `PlayerMana` float NOT NULL DEFAULT '0',
  `PlayerPrimaryStat` float NOT NULL DEFAULT '0',
  `PlayerSecondaryStat` float NOT NULL DEFAULT '0',
  `ArmorConstant` float NOT NULL DEFAULT '0',
  `CreatureSpellDamage` float NOT NULL DEFAULT '0',
  `ContentSetID` int NOT NULL DEFAULT '0',
  `Lvl` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table expected_stat is empty)


-- ==========================================
-- Table: expected_stat_mod
-- ==========================================
CREATE TABLE `expected_stat_mod` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `CreatureHealthMod` float NOT NULL DEFAULT '0',
  `PlayerHealthMod` float NOT NULL DEFAULT '0',
  `CreatureAutoAttackDPSMod` float NOT NULL DEFAULT '0',
  `CreatureArmorMod` float NOT NULL DEFAULT '0',
  `PlayerManaMod` float NOT NULL DEFAULT '0',
  `PlayerPrimaryStatMod` float NOT NULL DEFAULT '0',
  `PlayerSecondaryStatMod` float NOT NULL DEFAULT '0',
  `ArmorConstantMod` float NOT NULL DEFAULT '0',
  `CreatureSpellDamageMod` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `expected_stat_mod` (`ID`, `CreatureHealthMod`, `PlayerHealthMod`, `CreatureAutoAttackDPSMod`, `CreatureArmorMod`, `PlayerManaMod`, `PlayerPrimaryStatMod`, `PlayerSecondaryStatMod`, `ArmorConstantMod`, `CreatureSpellDamageMod`, `VerifiedBuild`) VALUES (280, 2.4, 1.0, 2.204, 1.0, 1.0, 1.0, 1.0, 1.0, 2.204, 62493);


-- ==========================================
-- Table: faction
-- ==========================================
CREATE TABLE `faction` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ReputationRaceMask1` bigint NOT NULL DEFAULT '0',
  `ReputationRaceMask2` bigint NOT NULL DEFAULT '0',
  `ReputationRaceMask3` bigint NOT NULL DEFAULT '0',
  `ReputationRaceMask4` bigint NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `ReputationIndex` smallint NOT NULL DEFAULT '0',
  `ParentFactionID` smallint unsigned NOT NULL DEFAULT '0',
  `Expansion` tinyint unsigned NOT NULL DEFAULT '0',
  `FriendshipRepID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ParagonFactionID` smallint unsigned NOT NULL DEFAULT '0',
  `RenownFactionID` int NOT NULL DEFAULT '0',
  `RenownCurrencyID` int NOT NULL DEFAULT '0',
  `ReputationClassMask1` smallint NOT NULL DEFAULT '0',
  `ReputationClassMask2` smallint NOT NULL DEFAULT '0',
  `ReputationClassMask3` smallint NOT NULL DEFAULT '0',
  `ReputationClassMask4` smallint NOT NULL DEFAULT '0',
  `ReputationFlags1` smallint unsigned NOT NULL DEFAULT '0',
  `ReputationFlags2` smallint unsigned NOT NULL DEFAULT '0',
  `ReputationFlags3` smallint unsigned NOT NULL DEFAULT '0',
  `ReputationFlags4` smallint unsigned NOT NULL DEFAULT '0',
  `ReputationBase1` int NOT NULL DEFAULT '0',
  `ReputationBase2` int NOT NULL DEFAULT '0',
  `ReputationBase3` int NOT NULL DEFAULT '0',
  `ReputationBase4` int NOT NULL DEFAULT '0',
  `ReputationMax1` int NOT NULL DEFAULT '0',
  `ReputationMax2` int NOT NULL DEFAULT '0',
  `ReputationMax3` int NOT NULL DEFAULT '0',
  `ReputationMax4` int NOT NULL DEFAULT '0',
  `ParentFactionMod1` float NOT NULL DEFAULT '0',
  `ParentFactionMod2` float NOT NULL DEFAULT '0',
  `ParentFactionCap1` tinyint unsigned NOT NULL DEFAULT '0',
  `ParentFactionCap2` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table faction is empty)


-- ==========================================
-- Table: faction_locale
-- ==========================================
CREATE TABLE `faction_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table faction_locale is empty)


-- ==========================================
-- Table: faction_template
-- ==========================================
CREATE TABLE `faction_template` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Faction` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `FactionGroup` tinyint unsigned NOT NULL DEFAULT '0',
  `FriendGroup` tinyint unsigned NOT NULL DEFAULT '0',
  `EnemyGroup` tinyint unsigned NOT NULL DEFAULT '0',
  `Enemies1` smallint unsigned NOT NULL DEFAULT '0',
  `Enemies2` smallint unsigned NOT NULL DEFAULT '0',
  `Enemies3` smallint unsigned NOT NULL DEFAULT '0',
  `Enemies4` smallint unsigned NOT NULL DEFAULT '0',
  `Enemies5` smallint unsigned NOT NULL DEFAULT '0',
  `Enemies6` smallint unsigned NOT NULL DEFAULT '0',
  `Enemies7` smallint unsigned NOT NULL DEFAULT '0',
  `Enemies8` smallint unsigned NOT NULL DEFAULT '0',
  `Friend1` smallint unsigned NOT NULL DEFAULT '0',
  `Friend2` smallint unsigned NOT NULL DEFAULT '0',
  `Friend3` smallint unsigned NOT NULL DEFAULT '0',
  `Friend4` smallint unsigned NOT NULL DEFAULT '0',
  `Friend5` smallint unsigned NOT NULL DEFAULT '0',
  `Friend6` smallint unsigned NOT NULL DEFAULT '0',
  `Friend7` smallint unsigned NOT NULL DEFAULT '0',
  `Friend8` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table faction_template is empty)


-- ==========================================
-- Table: flight_capability
-- ==========================================
CREATE TABLE `flight_capability` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `AirFriction` float NOT NULL DEFAULT '0',
  `MaxVel` float NOT NULL DEFAULT '0',
  `Unknown1000_2` float NOT NULL DEFAULT '0',
  `DoubleJumpVelMod` float NOT NULL DEFAULT '0',
  `LiftCoefficient` float NOT NULL DEFAULT '0',
  `GlideStartMinHeight` float NOT NULL DEFAULT '0',
  `AddImpulseMaxSpeed` float NOT NULL DEFAULT '0',
  `BankingRateMin` float NOT NULL DEFAULT '0',
  `BankingRateMax` float NOT NULL DEFAULT '0',
  `PitchingRateDownMin` float NOT NULL DEFAULT '0',
  `PitchingRateDownMax` float NOT NULL DEFAULT '0',
  `PitchingRateUpMin` float NOT NULL DEFAULT '0',
  `PitchingRateUpMax` float NOT NULL DEFAULT '0',
  `TurnVelocityThresholdMin` float NOT NULL DEFAULT '0',
  `TurnVelocityThresholdMax` float NOT NULL DEFAULT '0',
  `SurfaceFriction` float NOT NULL DEFAULT '0',
  `OverMaxDeceleration` float NOT NULL DEFAULT '0',
  `Unknown1000_17` float NOT NULL DEFAULT '0',
  `Unknown1000_18` float NOT NULL DEFAULT '0',
  `Unknown1000_19` float NOT NULL DEFAULT '0',
  `Unknown1000_20` float NOT NULL DEFAULT '0',
  `Unknown1000_21` float NOT NULL DEFAULT '0',
  `LaunchSpeedCoefficient` float NOT NULL DEFAULT '0',
  `VigorRegenMaxVelCoefficient` float NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table flight_capability is empty)


-- ==========================================
-- Table: friendship_rep_reaction
-- ==========================================
CREATE TABLE `friendship_rep_reaction` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Reaction` text COLLATE utf8mb4_unicode_ci,
  `FriendshipRepID` int unsigned NOT NULL DEFAULT '0',
  `ReactionThreshold` int NOT NULL DEFAULT '0',
  `OverrideColor` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table friendship_rep_reaction is empty)


-- ==========================================
-- Table: friendship_rep_reaction_locale
-- ==========================================
CREATE TABLE `friendship_rep_reaction_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Reaction_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table friendship_rep_reaction_locale is empty)


-- ==========================================
-- Table: friendship_reputation
-- ==========================================
CREATE TABLE `friendship_reputation` (
  `Description` text COLLATE utf8mb4_unicode_ci,
  `StandingModified` text COLLATE utf8mb4_unicode_ci,
  `StandingChanged` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `FactionID` int NOT NULL DEFAULT '0',
  `TextureFileID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table friendship_reputation is empty)


-- ==========================================
-- Table: friendship_reputation_locale
-- ==========================================
CREATE TABLE `friendship_reputation_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `StandingModified_lang` text COLLATE utf8mb4_unicode_ci,
  `StandingChanged_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table friendship_reputation_locale is empty)


-- ==========================================
-- Table: game_tips
-- ==========================================
CREATE TABLE `game_tips` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Text` text COLLATE utf8mb4_unicode_ci,
  `SortIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `MinLevel` int NOT NULL DEFAULT '0',
  `MaxLevel` int NOT NULL DEFAULT '0',
  `ContentTuningID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table game_tips is empty)


-- ==========================================
-- Table: game_tips_locale
-- ==========================================
CREATE TABLE `game_tips_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Text_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table game_tips_locale is empty)


-- ==========================================
-- Table: gameobject_art_kit
-- ==========================================
CREATE TABLE `gameobject_art_kit` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `AttachModelFileID` int NOT NULL DEFAULT '0',
  `TextureVariationFileID1` int NOT NULL DEFAULT '0',
  `TextureVariationFileID2` int NOT NULL DEFAULT '0',
  `TextureVariationFileID3` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table gameobject_art_kit is empty)


-- ==========================================
-- Table: gameobject_display_info
-- ==========================================
CREATE TABLE `gameobject_display_info` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `GeoBoxMinX` float NOT NULL DEFAULT '0',
  `GeoBoxMinY` float NOT NULL DEFAULT '0',
  `GeoBoxMinZ` float NOT NULL DEFAULT '0',
  `GeoBoxMaxX` float NOT NULL DEFAULT '0',
  `GeoBoxMaxY` float NOT NULL DEFAULT '0',
  `GeoBoxMaxZ` float NOT NULL DEFAULT '0',
  `FileDataID` int NOT NULL DEFAULT '0',
  `ObjectEffectPackageID` smallint NOT NULL DEFAULT '0',
  `OverrideLootEffectScale` float NOT NULL DEFAULT '0',
  `OverrideNameScale` float NOT NULL DEFAULT '0',
  `AlternateDisplayType` int NOT NULL DEFAULT '0',
  `ClientCreatureDisplayInfoID` int NOT NULL DEFAULT '0',
  `ClientItemID` int NOT NULL DEFAULT '0',
  `Unknown1100` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gameobject_display_info` (`ID`, `GeoBoxMinX`, `GeoBoxMinY`, `GeoBoxMinZ`, `GeoBoxMaxX`, `GeoBoxMaxY`, `GeoBoxMaxZ`, `FileDataID`, `ObjectEffectPackageID`, `OverrideLootEffectScale`, `OverrideNameScale`, `AlternateDisplayType`, `ClientCreatureDisplayInfoID`, `ClientItemID`, `Unknown1100`, `VerifiedBuild`) VALUES (104148, -2.94441, -3.6108, -1.18649, 2.94441, 3.6108, 1.18649, 2842077, 0, 0.0, 0.0, 0, 0, 0, 0, 59888);


-- ==========================================
-- Table: gameobject_label
-- ==========================================
CREATE TABLE `gameobject_label` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `LabelID` int NOT NULL DEFAULT '0',
  `GameObjectID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table gameobject_label is empty)


-- ==========================================
-- Table: gameobjects
-- ==========================================
CREATE TABLE `gameobjects` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `PosX` float NOT NULL DEFAULT '0',
  `PosY` float NOT NULL DEFAULT '0',
  `PosZ` float NOT NULL DEFAULT '0',
  `Rot1` float NOT NULL DEFAULT '0',
  `Rot2` float NOT NULL DEFAULT '0',
  `Rot3` float NOT NULL DEFAULT '0',
  `Rot4` float NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `OwnerID` int unsigned NOT NULL DEFAULT '0',
  `DisplayID` int NOT NULL DEFAULT '0',
  `Scale` float NOT NULL DEFAULT '0',
  `TypeID` int NOT NULL DEFAULT '0',
  `PhaseUseFlags` int NOT NULL DEFAULT '0',
  `PhaseID` int NOT NULL DEFAULT '0',
  `PhaseGroupID` int NOT NULL DEFAULT '0',
  `Unknown1100` smallint unsigned NOT NULL DEFAULT '0',
  `PropValue1` int NOT NULL DEFAULT '0',
  `PropValue2` int NOT NULL DEFAULT '0',
  `PropValue3` int NOT NULL DEFAULT '0',
  `PropValue4` int NOT NULL DEFAULT '0',
  `PropValue5` int NOT NULL DEFAULT '0',
  `PropValue6` int NOT NULL DEFAULT '0',
  `PropValue7` int NOT NULL DEFAULT '0',
  `PropValue8` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gameobjects` (`Name`, `PosX`, `PosY`, `PosZ`, `Rot1`, `Rot2`, `Rot3`, `Rot4`, `ID`, `OwnerID`, `DisplayID`, `Scale`, `TypeID`, `PhaseUseFlags`, `PhaseID`, `PhaseGroupID`, `Unknown1100`, `PropValue1`, `PropValue2`, `PropValue3`, `PropValue4`, `PropValue5`, `PropValue6`, `PropValue7`, `PropValue8`, `VerifiedBuild`) VALUES ('Councilward\'s Rise', 3082.1, -2996.55, 367.846, 0.0, 0.0, -0.70711, 0.707103, 439808, 2552, 87262, 1.0, 5, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 64270);


-- ==========================================
-- Table: gameobjects_locale
-- ==========================================
CREATE TABLE `gameobjects_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `gameobjects_locale` (`ID`, `locale`, `Name_lang`, `VerifiedBuild`) VALUES (464953, 'deDE', 'Verkleidung', 59888);


-- ==========================================
-- Table: garr_ability
-- ==========================================
CREATE TABLE `garr_ability` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `GarrAbilityCategoryID` tinyint unsigned NOT NULL DEFAULT '0',
  `GarrFollowerTypeID` tinyint NOT NULL DEFAULT '0',
  `IconFileDataID` int NOT NULL DEFAULT '0',
  `FactionChangeGarrAbilityID` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table garr_ability is empty)


-- ==========================================
-- Table: garr_ability_locale
-- ==========================================
CREATE TABLE `garr_ability_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table garr_ability_locale is empty)


-- ==========================================
-- Table: garr_building
-- ==========================================
CREATE TABLE `garr_building` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `HordeName` text COLLATE utf8mb4_unicode_ci,
  `AllianceName` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Tooltip` text COLLATE utf8mb4_unicode_ci,
  `GarrTypeID` tinyint NOT NULL DEFAULT '0',
  `BuildingType` tinyint unsigned NOT NULL DEFAULT '0',
  `HordeGameObjectID` int NOT NULL DEFAULT '0',
  `AllianceGameObjectID` int NOT NULL DEFAULT '0',
  `GarrSiteID` int NOT NULL DEFAULT '0',
  `UpgradeLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `BuildSeconds` int NOT NULL DEFAULT '0',
  `CurrencyTypeID` smallint unsigned NOT NULL DEFAULT '0',
  `CurrencyQty` int NOT NULL DEFAULT '0',
  `HordeUiTextureKitID` smallint unsigned NOT NULL DEFAULT '0',
  `AllianceUiTextureKitID` smallint unsigned NOT NULL DEFAULT '0',
  `IconFileDataID` int NOT NULL DEFAULT '0',
  `AllianceSceneScriptPackageID` smallint unsigned NOT NULL DEFAULT '0',
  `HordeSceneScriptPackageID` smallint unsigned NOT NULL DEFAULT '0',
  `MaxAssignments` int NOT NULL DEFAULT '0',
  `ShipmentCapacity` tinyint unsigned NOT NULL DEFAULT '0',
  `GarrAbilityID` smallint unsigned NOT NULL DEFAULT '0',
  `BonusGarrAbilityID` smallint unsigned NOT NULL DEFAULT '0',
  `GoldCost` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table garr_building is empty)


-- ==========================================
-- Table: garr_building_locale
-- ==========================================
CREATE TABLE `garr_building_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HordeName_lang` text COLLATE utf8mb4_unicode_ci,
  `AllianceName_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `Tooltip_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table garr_building_locale is empty)


-- ==========================================
-- Table: garr_building_plot_inst
-- ==========================================
CREATE TABLE `garr_building_plot_inst` (
  `MapOffsetX` float NOT NULL DEFAULT '0',
  `MapOffsetY` float NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `GarrBuildingID` tinyint unsigned NOT NULL DEFAULT '0',
  `GarrSiteLevelPlotInstID` smallint unsigned NOT NULL DEFAULT '0',
  `UiTextureAtlasMemberID` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table garr_building_plot_inst is empty)


-- ==========================================
-- Table: garr_class_spec
-- ==========================================
CREATE TABLE `garr_class_spec` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ClassSpec` text COLLATE utf8mb4_unicode_ci,
  `ClassSpecMale` text COLLATE utf8mb4_unicode_ci,
  `ClassSpecFemale` text COLLATE utf8mb4_unicode_ci,
  `UiTextureAtlasMemberID` smallint unsigned NOT NULL DEFAULT '0',
  `GarrFollItemSetID` smallint unsigned NOT NULL DEFAULT '0',
  `FollowerClassLimit` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table garr_class_spec is empty)


-- ==========================================
-- Table: garr_class_spec_locale
-- ==========================================
CREATE TABLE `garr_class_spec_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClassSpec_lang` text COLLATE utf8mb4_unicode_ci,
  `ClassSpecMale_lang` text COLLATE utf8mb4_unicode_ci,
  `ClassSpecFemale_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table garr_class_spec_locale is empty)


-- ==========================================
-- Table: garr_follower
-- ==========================================
CREATE TABLE `garr_follower` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `HordeSourceText` text COLLATE utf8mb4_unicode_ci,
  `AllianceSourceText` text COLLATE utf8mb4_unicode_ci,
  `TitleName` text COLLATE utf8mb4_unicode_ci,
  `GarrTypeID` tinyint NOT NULL DEFAULT '0',
  `GarrFollowerTypeID` tinyint NOT NULL DEFAULT '0',
  `HordeCreatureID` int NOT NULL DEFAULT '0',
  `AllianceCreatureID` int NOT NULL DEFAULT '0',
  `HordeGarrFollRaceID` tinyint unsigned NOT NULL DEFAULT '0',
  `AllianceGarrFollRaceID` tinyint unsigned NOT NULL DEFAULT '0',
  `HordeGarrClassSpecID` int NOT NULL DEFAULT '0',
  `AllianceGarrClassSpecID` int NOT NULL DEFAULT '0',
  `Quality` int NOT NULL DEFAULT '0',
  `FollowerLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `ItemLevelWeapon` smallint unsigned NOT NULL DEFAULT '0',
  `ItemLevelArmor` smallint unsigned NOT NULL DEFAULT '0',
  `HordeSourceTypeEnum` tinyint NOT NULL DEFAULT '0',
  `AllianceSourceTypeEnum` tinyint NOT NULL DEFAULT '0',
  `HordeIconFileDataID` int NOT NULL DEFAULT '0',
  `AllianceIconFileDataID` int NOT NULL DEFAULT '0',
  `HordeGarrFollItemSetID` smallint unsigned NOT NULL DEFAULT '0',
  `AllianceGarrFollItemSetID` smallint unsigned NOT NULL DEFAULT '0',
  `HordeUITextureKitID` smallint unsigned NOT NULL DEFAULT '0',
  `AllianceUITextureKitID` smallint unsigned NOT NULL DEFAULT '0',
  `Vitality` tinyint unsigned NOT NULL DEFAULT '0',
  `HordeFlavorGarrStringID` tinyint unsigned NOT NULL DEFAULT '0',
  `AllianceFlavorGarrStringID` tinyint unsigned NOT NULL DEFAULT '0',
  `HordeSlottingBroadcastTextID` int unsigned NOT NULL DEFAULT '0',
  `AllySlottingBroadcastTextID` int unsigned NOT NULL DEFAULT '0',
  `ChrClassID` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `Gender` tinyint NOT NULL DEFAULT '0',
  `AutoCombatantID` int NOT NULL DEFAULT '0',
  `CovenantID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table garr_follower is empty)


-- ==========================================
-- Table: garr_follower_locale
-- ==========================================
CREATE TABLE `garr_follower_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `HordeSourceText_lang` text COLLATE utf8mb4_unicode_ci,
  `AllianceSourceText_lang` text COLLATE utf8mb4_unicode_ci,
  `TitleName_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table garr_follower_locale is empty)


-- ==========================================
-- Table: garr_follower_x_ability
-- ==========================================
CREATE TABLE `garr_follower_x_ability` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `FactionIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `GarrAbilityID` smallint unsigned NOT NULL DEFAULT '0',
  `GarrFollowerID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table garr_follower_x_ability is empty)


-- ==========================================
-- Table: garr_mission
-- ==========================================
CREATE TABLE `garr_mission` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Location` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `MapPosX` float NOT NULL DEFAULT '0',
  `MapPosY` float NOT NULL DEFAULT '0',
  `WorldPosX` float NOT NULL DEFAULT '0',
  `WorldPosY` float NOT NULL DEFAULT '0',
  `GarrTypeID` tinyint NOT NULL DEFAULT '0',
  `GarrMissionTypeID` tinyint unsigned NOT NULL DEFAULT '0',
  `GarrFollowerTypeID` tinyint NOT NULL DEFAULT '0',
  `MaxFollowers` tinyint unsigned NOT NULL DEFAULT '0',
  `MissionCost` int unsigned NOT NULL DEFAULT '0',
  `MissionCostCurrencyTypesID` smallint unsigned NOT NULL DEFAULT '0',
  `OfferedGarrMissionTextureID` tinyint unsigned NOT NULL DEFAULT '0',
  `UiTextureKitID` smallint unsigned NOT NULL DEFAULT '0',
  `EnvGarrMechanicID` int unsigned NOT NULL DEFAULT '0',
  `EnvGarrMechanicTypeID` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `GarrMissionSetID` int unsigned NOT NULL DEFAULT '0',
  `TargetLevel` tinyint NOT NULL DEFAULT '0',
  `TargetItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `MissionDuration` int NOT NULL DEFAULT '0',
  `TravelDuration` int NOT NULL DEFAULT '0',
  `OfferDuration` int unsigned NOT NULL DEFAULT '0',
  `BaseCompletionChance` tinyint unsigned NOT NULL DEFAULT '0',
  `BaseFollowerXP` int unsigned NOT NULL DEFAULT '0',
  `OvermaxRewardPackID` int unsigned NOT NULL DEFAULT '0',
  `FollowerDeathChance` tinyint unsigned NOT NULL DEFAULT '0',
  `AreaID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `AutoMissionScalar` float NOT NULL DEFAULT '0',
  `AutoMissionScalarCurveID` int NOT NULL DEFAULT '0',
  `AutoCombatantEnvCasterID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table garr_mission is empty)


-- ==========================================
-- Table: garr_mission_locale
-- ==========================================
CREATE TABLE `garr_mission_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Location_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table garr_mission_locale is empty)


-- ==========================================
-- Table: garr_plot
-- ==========================================
CREATE TABLE `garr_plot` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `PlotType` tinyint unsigned NOT NULL DEFAULT '0',
  `HordeConstructObjID` int NOT NULL DEFAULT '0',
  `AllianceConstructObjID` int NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `UiCategoryID` tinyint unsigned NOT NULL DEFAULT '0',
  `UpgradeRequirement1` int unsigned NOT NULL DEFAULT '0',
  `UpgradeRequirement2` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table garr_plot is empty)


-- ==========================================
-- Table: garr_plot_building
-- ==========================================
CREATE TABLE `garr_plot_building` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `GarrPlotID` tinyint unsigned NOT NULL DEFAULT '0',
  `GarrBuildingID` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table garr_plot_building is empty)


-- ==========================================
-- Table: garr_plot_instance
-- ==========================================
CREATE TABLE `garr_plot_instance` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `GarrPlotID` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table garr_plot_instance is empty)


-- ==========================================
-- Table: garr_site_level
-- ==========================================
CREATE TABLE `garr_site_level` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TownHallUiPosX` float NOT NULL DEFAULT '0',
  `TownHallUiPosY` float NOT NULL DEFAULT '0',
  `GarrSiteID` int unsigned NOT NULL DEFAULT '0',
  `GarrLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `MapID` smallint unsigned NOT NULL DEFAULT '0',
  `UpgradeMovieID` smallint unsigned NOT NULL DEFAULT '0',
  `UiTextureKitID` smallint unsigned NOT NULL DEFAULT '0',
  `MaxBuildingLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `UpgradeCost` smallint unsigned NOT NULL DEFAULT '0',
  `UpgradeGoldCost` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table garr_site_level is empty)


-- ==========================================
-- Table: garr_site_level_plot_inst
-- ==========================================
CREATE TABLE `garr_site_level_plot_inst` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `UiMarkerPosX` float NOT NULL DEFAULT '0',
  `UiMarkerPosY` float NOT NULL DEFAULT '0',
  `GarrSiteLevelID` smallint unsigned NOT NULL DEFAULT '0',
  `GarrPlotInstanceID` tinyint unsigned NOT NULL DEFAULT '0',
  `UiMarkerSize` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table garr_site_level_plot_inst is empty)


-- ==========================================
-- Table: garr_talent_tree
-- ==========================================
CREATE TABLE `garr_talent_tree` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `GarrTypeID` tinyint NOT NULL DEFAULT '0',
  `ClassID` int NOT NULL DEFAULT '0',
  `MaxTiers` tinyint NOT NULL DEFAULT '0',
  `UiOrder` tinyint NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `UiTextureKitID` smallint unsigned NOT NULL DEFAULT '0',
  `GarrTalentTreeType` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `FeatureTypeIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `FeatureSubtypeIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `CurrencyID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table garr_talent_tree is empty)


-- ==========================================
-- Table: garr_talent_tree_locale
-- ==========================================
CREATE TABLE `garr_talent_tree_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table garr_talent_tree_locale is empty)


-- ==========================================
-- Table: gem_properties
-- ==========================================
CREATE TABLE `gem_properties` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `EnchantId` smallint unsigned NOT NULL DEFAULT '0',
  `Type` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table gem_properties is empty)


-- ==========================================
-- Table: global_curve
-- ==========================================
CREATE TABLE `global_curve` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `CurveID` int NOT NULL DEFAULT '0',
  `Type` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table global_curve is empty)


-- ==========================================
-- Table: global_strings
-- ==========================================
CREATE TABLE `global_strings` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `BaseTag` text COLLATE utf8mb4_unicode_ci,
  `TagText` text COLLATE utf8mb4_unicode_ci,
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table global_strings is empty)


-- ==========================================
-- Table: global_strings_locale
-- ==========================================
CREATE TABLE `global_strings_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `TagText_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table global_strings_locale is empty)


-- ==========================================
-- Table: glyph_bindable_spell
-- ==========================================
CREATE TABLE `glyph_bindable_spell` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `GlyphPropertiesID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table glyph_bindable_spell is empty)


-- ==========================================
-- Table: glyph_properties
-- ==========================================
CREATE TABLE `glyph_properties` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `GlyphType` tinyint unsigned NOT NULL DEFAULT '0',
  `GlyphExclusiveCategoryID` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellIconFileDataID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table glyph_properties is empty)


-- ==========================================
-- Table: glyph_required_spec
-- ==========================================
CREATE TABLE `glyph_required_spec` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ChrSpecializationID` smallint unsigned NOT NULL DEFAULT '0',
  `GlyphPropertiesID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table glyph_required_spec is empty)


-- ==========================================
-- Table: gossip_npc_option
-- ==========================================
CREATE TABLE `gossip_npc_option` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `GossipNpcOption` int NOT NULL DEFAULT '0',
  `LFGDungeonsID` int NOT NULL DEFAULT '0',
  `TrainerID` int NOT NULL DEFAULT '0',
  `GarrFollowerTypeID` tinyint NOT NULL DEFAULT '0',
  `CharShipmentID` int NOT NULL DEFAULT '0',
  `GarrTalentTreeID` int NOT NULL DEFAULT '0',
  `UiMapID` int NOT NULL DEFAULT '0',
  `UiItemInteractionID` int NOT NULL DEFAULT '0',
  `Unknown_1000_8` int NOT NULL DEFAULT '0',
  `Unknown_1000_9` int NOT NULL DEFAULT '0',
  `CovenantID` int NOT NULL DEFAULT '0',
  `GossipOptionID` int NOT NULL DEFAULT '0',
  `TraitTreeID` int NOT NULL DEFAULT '0',
  `ProfessionID` int NOT NULL DEFAULT '0',
  `Unknown_1002_14` int NOT NULL DEFAULT '0',
  `SkillLineID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gossip_npc_option` (`ID`, `GossipNpcOption`, `LFGDungeonsID`, `TrainerID`, `GarrFollowerTypeID`, `CharShipmentID`, `GarrTalentTreeID`, `UiMapID`, `UiItemInteractionID`, `Unknown_1000_8`, `Unknown_1000_9`, `CovenantID`, `GossipOptionID`, `TraitTreeID`, `ProfessionID`, `Unknown_1002_14`, `SkillLineID`, `VerifiedBuild`) VALUES (60188, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 137543, 0, 0, 0, 0, 64270);


-- ==========================================
-- Table: guild_color_background
-- ==========================================
CREATE TABLE `guild_color_background` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Red` tinyint unsigned NOT NULL DEFAULT '0',
  `Blue` tinyint unsigned NOT NULL DEFAULT '0',
  `Green` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table guild_color_background is empty)


-- ==========================================
-- Table: guild_color_border
-- ==========================================
CREATE TABLE `guild_color_border` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Red` tinyint unsigned NOT NULL DEFAULT '0',
  `Blue` tinyint unsigned NOT NULL DEFAULT '0',
  `Green` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table guild_color_border is empty)


-- ==========================================
-- Table: guild_color_emblem
-- ==========================================
CREATE TABLE `guild_color_emblem` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Red` tinyint unsigned NOT NULL DEFAULT '0',
  `Blue` tinyint unsigned NOT NULL DEFAULT '0',
  `Green` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table guild_color_emblem is empty)


-- ==========================================
-- Table: guild_perk_spells
-- ==========================================
CREATE TABLE `guild_perk_spells` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table guild_perk_spells is empty)


-- ==========================================
-- Table: heirloom
-- ==========================================
CREATE TABLE `heirloom` (
  `SourceText` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemID` int NOT NULL DEFAULT '0',
  `LegacyUpgradedItemID` int NOT NULL DEFAULT '0',
  `StaticUpgradedItemID` int NOT NULL DEFAULT '0',
  `SourceTypeEnum` tinyint NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `LegacyItemID` int NOT NULL DEFAULT '0',
  `UpgradeItemID1` int NOT NULL DEFAULT '0',
  `UpgradeItemID2` int NOT NULL DEFAULT '0',
  `UpgradeItemID3` int NOT NULL DEFAULT '0',
  `UpgradeItemID4` int NOT NULL DEFAULT '0',
  `UpgradeItemID5` int NOT NULL DEFAULT '0',
  `UpgradeItemID6` int NOT NULL DEFAULT '0',
  `UpgradeItemBonusListID1` smallint unsigned NOT NULL DEFAULT '0',
  `UpgradeItemBonusListID2` smallint unsigned NOT NULL DEFAULT '0',
  `UpgradeItemBonusListID3` smallint unsigned NOT NULL DEFAULT '0',
  `UpgradeItemBonusListID4` smallint unsigned NOT NULL DEFAULT '0',
  `UpgradeItemBonusListID5` smallint unsigned NOT NULL DEFAULT '0',
  `UpgradeItemBonusListID6` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table heirloom is empty)


-- ==========================================
-- Table: heirloom_locale
-- ==========================================
CREATE TABLE `heirloom_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SourceText_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table heirloom_locale is empty)


-- ==========================================
-- Table: holidays
-- ==========================================
CREATE TABLE `holidays` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Region` smallint unsigned NOT NULL DEFAULT '0',
  `Looping` tinyint unsigned NOT NULL DEFAULT '0',
  `HolidayNameID` int unsigned NOT NULL DEFAULT '0',
  `HolidayDescriptionID` int unsigned NOT NULL DEFAULT '0',
  `Priority` tinyint unsigned NOT NULL DEFAULT '0',
  `CalendarFilterType` tinyint NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `Duration1` smallint unsigned NOT NULL DEFAULT '0',
  `Duration2` smallint unsigned NOT NULL DEFAULT '0',
  `Duration3` smallint unsigned NOT NULL DEFAULT '0',
  `Duration4` smallint unsigned NOT NULL DEFAULT '0',
  `Duration5` smallint unsigned NOT NULL DEFAULT '0',
  `Duration6` smallint unsigned NOT NULL DEFAULT '0',
  `Duration7` smallint unsigned NOT NULL DEFAULT '0',
  `Duration8` smallint unsigned NOT NULL DEFAULT '0',
  `Duration9` smallint unsigned NOT NULL DEFAULT '0',
  `Duration10` smallint unsigned NOT NULL DEFAULT '0',
  `Date1` int unsigned NOT NULL DEFAULT '0',
  `Date2` int unsigned NOT NULL DEFAULT '0',
  `Date3` int unsigned NOT NULL DEFAULT '0',
  `Date4` int unsigned NOT NULL DEFAULT '0',
  `Date5` int unsigned NOT NULL DEFAULT '0',
  `Date6` int unsigned NOT NULL DEFAULT '0',
  `Date7` int unsigned NOT NULL DEFAULT '0',
  `Date8` int unsigned NOT NULL DEFAULT '0',
  `Date9` int unsigned NOT NULL DEFAULT '0',
  `Date10` int unsigned NOT NULL DEFAULT '0',
  `Date11` int unsigned NOT NULL DEFAULT '0',
  `Date12` int unsigned NOT NULL DEFAULT '0',
  `Date13` int unsigned NOT NULL DEFAULT '0',
  `Date14` int unsigned NOT NULL DEFAULT '0',
  `Date15` int unsigned NOT NULL DEFAULT '0',
  `Date16` int unsigned NOT NULL DEFAULT '0',
  `Date17` int unsigned NOT NULL DEFAULT '0',
  `Date18` int unsigned NOT NULL DEFAULT '0',
  `Date19` int unsigned NOT NULL DEFAULT '0',
  `Date20` int unsigned NOT NULL DEFAULT '0',
  `Date21` int unsigned NOT NULL DEFAULT '0',
  `Date22` int unsigned NOT NULL DEFAULT '0',
  `Date23` int unsigned NOT NULL DEFAULT '0',
  `Date24` int unsigned NOT NULL DEFAULT '0',
  `Date25` int unsigned NOT NULL DEFAULT '0',
  `Date26` int unsigned NOT NULL DEFAULT '0',
  `CalendarFlags1` tinyint unsigned NOT NULL DEFAULT '0',
  `CalendarFlags2` tinyint unsigned NOT NULL DEFAULT '0',
  `CalendarFlags3` tinyint unsigned NOT NULL DEFAULT '0',
  `CalendarFlags4` tinyint unsigned NOT NULL DEFAULT '0',
  `CalendarFlags5` tinyint unsigned NOT NULL DEFAULT '0',
  `CalendarFlags6` tinyint unsigned NOT NULL DEFAULT '0',
  `CalendarFlags7` tinyint unsigned NOT NULL DEFAULT '0',
  `CalendarFlags8` tinyint unsigned NOT NULL DEFAULT '0',
  `CalendarFlags9` tinyint unsigned NOT NULL DEFAULT '0',
  `CalendarFlags10` tinyint unsigned NOT NULL DEFAULT '0',
  `TextureFileDataID1` int NOT NULL DEFAULT '0',
  `TextureFileDataID2` int NOT NULL DEFAULT '0',
  `TextureFileDataID3` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `holidays` (`ID`, `Region`, `Looping`, `HolidayNameID`, `HolidayDescriptionID`, `Priority`, `CalendarFilterType`, `Flags`, `Duration1`, `Duration2`, `Duration3`, `Duration4`, `Duration5`, `Duration6`, `Duration7`, `Duration8`, `Duration9`, `Duration10`, `Date1`, `Date2`, `Date3`, `Date4`, `Date5`, `Date6`, `Date7`, `Date8`, `Date9`, `Date10`, `Date11`, `Date12`, `Date13`, `Date14`, `Date15`, `Date16`, `Date17`, `Date18`, `Date19`, `Date20`, `Date21`, `Date22`, `Date23`, `Date24`, `Date25`, `Date26`, `CalendarFlags1`, `CalendarFlags2`, `CalendarFlags3`, `CalendarFlags4`, `CalendarFlags5`, `CalendarFlags6`, `CalendarFlags7`, `CalendarFlags8`, `CalendarFlags9`, `CalendarFlags10`, `TextureFileDataID1`, `TextureFileDataID2`, `TextureFileDataID3`, `VerifiedBuild`) VALUES (561, 961, 0, 238, 221, 0, 0, 13, 167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 412563968, 414579136, 420657600, 422705664, 424065536, 425736704, 426850816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1129680, 1129679, 1129678, 61609);


-- ==========================================
-- Table: hotfix_blob
-- ==========================================
CREATE TABLE `hotfix_blob` (
  `TableHash` int unsigned NOT NULL,
  `RecordId` int NOT NULL,
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Blob` blob,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TableHash`,`RecordId`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hotfix_blob` (`TableHash`, `RecordId`, `locale`, `Blob`, `VerifiedBuild`) VALUES (13326836, 1500, 'enUS', 'b\',\\x01\\x00\\x00\\xfe\\x16\\x00\\x00\\t\\x00\\x00\\x00\'', 64270);


-- ==========================================
-- Table: hotfix_data
-- ==========================================
CREATE TABLE `hotfix_data` (
  `Id` int NOT NULL,
  `UniqueId` int unsigned NOT NULL DEFAULT '0',
  `TableHash` int unsigned NOT NULL,
  `RecordId` int NOT NULL,
  `Status` tinyint unsigned NOT NULL DEFAULT '3',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`,`TableHash`,`RecordId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hotfix_data` (`Id`, `UniqueId`, `TableHash`, `RecordId`, `Status`, `VerifiedBuild`) VALUES (11, 11, 1746734909, 11, 1, 0);


-- ==========================================
-- Table: hotfix_optional_data
-- ==========================================
CREATE TABLE `hotfix_optional_data` (
  `TableHash` int unsigned NOT NULL,
  `RecordId` int unsigned NOT NULL,
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Key` int unsigned NOT NULL,
  `Data` blob NOT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hotfix_optional_data` (`TableHash`, `RecordId`, `locale`, `Key`, `Data`, `VerifiedBuild`) VALUES (35137211, 212428, 'enUS', 3744420815, 'b\'\\x8eY\\xea\\x8b\\x8a\\xcb_\\xc5\\xaeY\\xdd\\x7f\\xa8\\xce\\x1eIbm\\xd1\\xbb\\xd9&\\xf74\'', 58162);


-- ==========================================
-- Table: import_price_armor
-- ==========================================
CREATE TABLE `import_price_armor` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ClothModifier` float NOT NULL DEFAULT '0',
  `LeatherModifier` float NOT NULL DEFAULT '0',
  `ChainModifier` float NOT NULL DEFAULT '0',
  `PlateModifier` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table import_price_armor is empty)


-- ==========================================
-- Table: import_price_quality
-- ==========================================
CREATE TABLE `import_price_quality` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Data` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table import_price_quality is empty)


-- ==========================================
-- Table: import_price_shield
-- ==========================================
CREATE TABLE `import_price_shield` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Data` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table import_price_shield is empty)


-- ==========================================
-- Table: import_price_weapon
-- ==========================================
CREATE TABLE `import_price_weapon` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Data` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table import_price_weapon is empty)


-- ==========================================
-- Table: item
-- ==========================================
CREATE TABLE `item` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ClassID` int NOT NULL DEFAULT '0',
  `SubclassID` tinyint unsigned NOT NULL DEFAULT '0',
  `Material` tinyint unsigned NOT NULL DEFAULT '0',
  `InventoryType` tinyint NOT NULL DEFAULT '0',
  `SheatheType` tinyint unsigned NOT NULL DEFAULT '0',
  `SoundOverrideSubclassID` tinyint NOT NULL DEFAULT '0',
  `IconFileDataID` int NOT NULL DEFAULT '0',
  `ItemGroupSoundsID` int unsigned NOT NULL DEFAULT '0',
  `ContentTuningID` int NOT NULL DEFAULT '0',
  `ModifiedCraftingReagentItemID` int NOT NULL DEFAULT '0',
  `CraftingQualityID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item` (`ID`, `ClassID`, `SubclassID`, `Material`, `InventoryType`, `SheatheType`, `SoundOverrideSubclassID`, `IconFileDataID`, `ItemGroupSoundsID`, `ContentTuningID`, `ModifiedCraftingReagentItemID`, `CraftingQualityID`, `VerifiedBuild`) VALUES (2300, 4, 2, 8, 5, 0, -1, 132724, 7, 0, 0, 0, 59888);


-- ==========================================
-- Table: item_appearance
-- ==========================================
CREATE TABLE `item_appearance` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DisplayType` tinyint NOT NULL DEFAULT '0',
  `ItemDisplayInfoID` int NOT NULL DEFAULT '0',
  `DefaultIconFileDataID` int NOT NULL DEFAULT '0',
  `UiOrder` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_appearance is empty)


-- ==========================================
-- Table: item_armor_quality
-- ==========================================
CREATE TABLE `item_armor_quality` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Qualitymod1` float NOT NULL DEFAULT '0',
  `Qualitymod2` float NOT NULL DEFAULT '0',
  `Qualitymod3` float NOT NULL DEFAULT '0',
  `Qualitymod4` float NOT NULL DEFAULT '0',
  `Qualitymod5` float NOT NULL DEFAULT '0',
  `Qualitymod6` float NOT NULL DEFAULT '0',
  `Qualitymod7` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_armor_quality is empty)


-- ==========================================
-- Table: item_armor_shield
-- ==========================================
CREATE TABLE `item_armor_shield` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Quality1` float NOT NULL DEFAULT '0',
  `Quality2` float NOT NULL DEFAULT '0',
  `Quality3` float NOT NULL DEFAULT '0',
  `Quality4` float NOT NULL DEFAULT '0',
  `Quality5` float NOT NULL DEFAULT '0',
  `Quality6` float NOT NULL DEFAULT '0',
  `Quality7` float NOT NULL DEFAULT '0',
  `ItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_armor_shield is empty)


-- ==========================================
-- Table: item_armor_total
-- ==========================================
CREATE TABLE `item_armor_total` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint NOT NULL DEFAULT '0',
  `Cloth` float NOT NULL DEFAULT '0',
  `Leather` float NOT NULL DEFAULT '0',
  `Mail` float NOT NULL DEFAULT '0',
  `Plate` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_armor_total is empty)


-- ==========================================
-- Table: item_bag_family
-- ==========================================
CREATE TABLE `item_bag_family` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_bag_family is empty)


-- ==========================================
-- Table: item_bag_family_locale
-- ==========================================
CREATE TABLE `item_bag_family_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table item_bag_family_locale is empty)


-- ==========================================
-- Table: item_bonus
-- ==========================================
CREATE TABLE `item_bonus` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Value1` int NOT NULL DEFAULT '0',
  `Value2` int NOT NULL DEFAULT '0',
  `Value3` int NOT NULL DEFAULT '0',
  `Value4` int NOT NULL DEFAULT '0',
  `ParentItemBonusListID` smallint unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_bonus` (`ID`, `Value1`, `Value2`, `Value3`, `Value4`, `ParentItemBonusListID`, `Type`, `OrderIndex`, `VerifiedBuild`) VALUES (24994, 440, 973, 0, 0, 11981, 34, 0, 59888);


-- ==========================================
-- Table: item_bonus_list_group_entry
-- ==========================================
CREATE TABLE `item_bonus_list_group_entry` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemBonusListGroupID` int unsigned NOT NULL DEFAULT '0',
  `ItemBonusListID` int NOT NULL DEFAULT '0',
  `ItemLevelSelectorID` int NOT NULL DEFAULT '0',
  `SequenceValue` int NOT NULL DEFAULT '0',
  `ItemExtendedCostID` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ItemLogicalCostGroupID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_bonus_list_group_entry` (`ID`, `ItemBonusListGroupID`, `ItemBonusListID`, `ItemLevelSelectorID`, `SequenceValue`, `ItemExtendedCostID`, `PlayerConditionID`, `Flags`, `ItemLogicalCostGroupID`, `VerifiedBuild`) VALUES (3495, 437, 11942, 1947, 1, 0, 0, 2, 0, 59888);


-- ==========================================
-- Table: item_bonus_list_level_delta
-- ==========================================
CREATE TABLE `item_bonus_list_level_delta` (
  `ItemLevelDelta` smallint NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_bonus_list_level_delta is empty)


-- ==========================================
-- Table: item_bonus_tree
-- ==========================================
CREATE TABLE `item_bonus_tree` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `InventoryTypeSlotMask` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_bonus_tree is empty)


-- ==========================================
-- Table: item_bonus_tree_node
-- ==========================================
CREATE TABLE `item_bonus_tree_node` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemContext` tinyint unsigned NOT NULL DEFAULT '0',
  `ChildItemBonusTreeID` smallint unsigned NOT NULL DEFAULT '0',
  `ChildItemBonusListID` smallint unsigned NOT NULL DEFAULT '0',
  `ChildItemLevelSelectorID` smallint unsigned NOT NULL DEFAULT '0',
  `ChildItemBonusListGroupID` int NOT NULL DEFAULT '0',
  `IblGroupPointsModSetID` int NOT NULL DEFAULT '0',
  `MinMythicPlusLevel` int NOT NULL DEFAULT '0',
  `MaxMythicPlusLevel` int NOT NULL DEFAULT '0',
  `ItemCreationContextGroupID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ParentItemBonusTreeID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_bonus_tree_node` (`ID`, `ItemContext`, `ChildItemBonusTreeID`, `ChildItemBonusListID`, `ChildItemLevelSelectorID`, `ChildItemBonusListGroupID`, `IblGroupPointsModSetID`, `MinMythicPlusLevel`, `MaxMythicPlusLevel`, `ItemCreationContextGroupID`, `Flags`, `ParentItemBonusTreeID`, `VerifiedBuild`) VALUES (20279, 134, 0, 0, 0, 331, 2965, 0, 0, 0, 0, 4303, 59888);


-- ==========================================
-- Table: item_child_equipment
-- ==========================================
CREATE TABLE `item_child_equipment` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ParentItemID` int unsigned NOT NULL DEFAULT '0',
  `ChildItemID` int NOT NULL DEFAULT '0',
  `ChildItemEquipSlot` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_child_equipment is empty)


-- ==========================================
-- Table: item_class
-- ==========================================
CREATE TABLE `item_class` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ClassName` text COLLATE utf8mb4_unicode_ci,
  `ClassID` tinyint NOT NULL DEFAULT '0',
  `PriceModifier` float NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_class is empty)


-- ==========================================
-- Table: item_class_locale
-- ==========================================
CREATE TABLE `item_class_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ClassName_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table item_class_locale is empty)


-- ==========================================
-- Table: item_context_picker_entry
-- ==========================================
CREATE TABLE `item_context_picker_entry` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemCreationContext` tinyint unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `PVal` int NOT NULL DEFAULT '0',
  `LabelID` int NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `ItemContextPickerID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_context_picker_entry is empty)


-- ==========================================
-- Table: item_creation_context
-- ==========================================
CREATE TABLE `item_creation_context` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemContext` tinyint unsigned NOT NULL DEFAULT '0',
  `ItemCreationContextGroupID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_creation_context is empty)


-- ==========================================
-- Table: item_currency_cost
-- ==========================================
CREATE TABLE `item_currency_cost` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_currency_cost` (`ID`, `ItemID`, `VerifiedBuild`) VALUES (25, 34925, 0);


-- ==========================================
-- Table: item_damage_ammo
-- ==========================================
CREATE TABLE `item_damage_ammo` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `Quality1` float NOT NULL DEFAULT '0',
  `Quality2` float NOT NULL DEFAULT '0',
  `Quality3` float NOT NULL DEFAULT '0',
  `Quality4` float NOT NULL DEFAULT '0',
  `Quality5` float NOT NULL DEFAULT '0',
  `Quality6` float NOT NULL DEFAULT '0',
  `Quality7` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_damage_ammo is empty)


-- ==========================================
-- Table: item_damage_one_hand
-- ==========================================
CREATE TABLE `item_damage_one_hand` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `Quality1` float NOT NULL DEFAULT '0',
  `Quality2` float NOT NULL DEFAULT '0',
  `Quality3` float NOT NULL DEFAULT '0',
  `Quality4` float NOT NULL DEFAULT '0',
  `Quality5` float NOT NULL DEFAULT '0',
  `Quality6` float NOT NULL DEFAULT '0',
  `Quality7` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_damage_one_hand is empty)


-- ==========================================
-- Table: item_damage_one_hand_caster
-- ==========================================
CREATE TABLE `item_damage_one_hand_caster` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `Quality1` float NOT NULL DEFAULT '0',
  `Quality2` float NOT NULL DEFAULT '0',
  `Quality3` float NOT NULL DEFAULT '0',
  `Quality4` float NOT NULL DEFAULT '0',
  `Quality5` float NOT NULL DEFAULT '0',
  `Quality6` float NOT NULL DEFAULT '0',
  `Quality7` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_damage_one_hand_caster is empty)


-- ==========================================
-- Table: item_damage_two_hand
-- ==========================================
CREATE TABLE `item_damage_two_hand` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `Quality1` float NOT NULL DEFAULT '0',
  `Quality2` float NOT NULL DEFAULT '0',
  `Quality3` float NOT NULL DEFAULT '0',
  `Quality4` float NOT NULL DEFAULT '0',
  `Quality5` float NOT NULL DEFAULT '0',
  `Quality6` float NOT NULL DEFAULT '0',
  `Quality7` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_damage_two_hand is empty)


-- ==========================================
-- Table: item_damage_two_hand_caster
-- ==========================================
CREATE TABLE `item_damage_two_hand_caster` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `Quality1` float NOT NULL DEFAULT '0',
  `Quality2` float NOT NULL DEFAULT '0',
  `Quality3` float NOT NULL DEFAULT '0',
  `Quality4` float NOT NULL DEFAULT '0',
  `Quality5` float NOT NULL DEFAULT '0',
  `Quality6` float NOT NULL DEFAULT '0',
  `Quality7` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_damage_two_hand_caster is empty)


-- ==========================================
-- Table: item_disenchant_loot
-- ==========================================
CREATE TABLE `item_disenchant_loot` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Subclass` tinyint NOT NULL DEFAULT '0',
  `Quality` tinyint unsigned NOT NULL DEFAULT '0',
  `MinLevel` smallint unsigned NOT NULL DEFAULT '0',
  `MaxLevel` smallint unsigned NOT NULL DEFAULT '0',
  `SkillRequired` smallint unsigned NOT NULL DEFAULT '0',
  `ExpansionID` tinyint NOT NULL DEFAULT '0',
  `Class` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_disenchant_loot is empty)


-- ==========================================
-- Table: item_display_info
-- ==========================================
CREATE TABLE `item_display_info` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `GeosetGroupOverride` int NOT NULL DEFAULT '0',
  `ItemVisual` int NOT NULL DEFAULT '0',
  `ParticleColorID` int NOT NULL DEFAULT '0',
  `ItemRangedDisplayInfoID` int unsigned NOT NULL DEFAULT '0',
  `OverrideSwooshSoundKitID` int unsigned NOT NULL DEFAULT '0',
  `SheatheTransformMatrixID` int NOT NULL DEFAULT '0',
  `StateSpellVisualKitID` int NOT NULL DEFAULT '0',
  `SheathedSpellVisualKitID` int NOT NULL DEFAULT '0',
  `UnsheathedSpellVisualKitID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ModelResourcesID1` int unsigned NOT NULL DEFAULT '0',
  `ModelResourcesID2` int unsigned NOT NULL DEFAULT '0',
  `ModelMaterialResourcesID1` int NOT NULL DEFAULT '0',
  `ModelMaterialResourcesID2` int NOT NULL DEFAULT '0',
  `ModelType1` int NOT NULL DEFAULT '0',
  `ModelType2` int NOT NULL DEFAULT '0',
  `GeosetGroup1` int NOT NULL DEFAULT '0',
  `GeosetGroup2` int NOT NULL DEFAULT '0',
  `GeosetGroup3` int NOT NULL DEFAULT '0',
  `GeosetGroup4` int NOT NULL DEFAULT '0',
  `GeosetGroup5` int NOT NULL DEFAULT '0',
  `GeosetGroup6` int NOT NULL DEFAULT '0',
  `AttachmentGeosetGroup1` int NOT NULL DEFAULT '0',
  `AttachmentGeosetGroup2` int NOT NULL DEFAULT '0',
  `AttachmentGeosetGroup3` int NOT NULL DEFAULT '0',
  `AttachmentGeosetGroup4` int NOT NULL DEFAULT '0',
  `AttachmentGeosetGroup5` int NOT NULL DEFAULT '0',
  `AttachmentGeosetGroup6` int NOT NULL DEFAULT '0',
  `HelmetGeosetVis1` int NOT NULL DEFAULT '0',
  `HelmetGeosetVis2` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_display_info is empty)


-- ==========================================
-- Table: item_effect
-- ==========================================
CREATE TABLE `item_effect` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `LegacySlotIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `TriggerType` tinyint NOT NULL DEFAULT '0',
  `Charges` smallint NOT NULL DEFAULT '0',
  `CoolDownMSec` int NOT NULL DEFAULT '0',
  `CategoryCoolDownMSec` int NOT NULL DEFAULT '0',
  `SpellCategoryID` smallint unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `ChrSpecializationID` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_effect` (`ID`, `LegacySlotIndex`, `TriggerType`, `Charges`, `CoolDownMSec`, `CategoryCoolDownMSec`, `SpellCategoryID`, `SpellID`, `ChrSpecializationID`, `VerifiedBuild`) VALUES (167547, 0, 1, 0, -1, -1, 0, 287137, 0, 0);


-- ==========================================
-- Table: item_extended_cost
-- ==========================================
CREATE TABLE `item_extended_cost` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `RequiredArenaRating` smallint unsigned NOT NULL DEFAULT '0',
  `ArenaBracket` tinyint NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `MinFactionID` tinyint unsigned NOT NULL DEFAULT '0',
  `MinReputation` int NOT NULL DEFAULT '0',
  `RequiredAchievement` tinyint unsigned NOT NULL DEFAULT '0',
  `ItemID1` int NOT NULL DEFAULT '0',
  `ItemID2` int NOT NULL DEFAULT '0',
  `ItemID3` int NOT NULL DEFAULT '0',
  `ItemID4` int NOT NULL DEFAULT '0',
  `ItemID5` int NOT NULL DEFAULT '0',
  `ItemCount1` smallint unsigned NOT NULL DEFAULT '0',
  `ItemCount2` smallint unsigned NOT NULL DEFAULT '0',
  `ItemCount3` smallint unsigned NOT NULL DEFAULT '0',
  `ItemCount4` smallint unsigned NOT NULL DEFAULT '0',
  `ItemCount5` smallint unsigned NOT NULL DEFAULT '0',
  `CurrencyID1` smallint unsigned NOT NULL DEFAULT '0',
  `CurrencyID2` smallint unsigned NOT NULL DEFAULT '0',
  `CurrencyID3` smallint unsigned NOT NULL DEFAULT '0',
  `CurrencyID4` smallint unsigned NOT NULL DEFAULT '0',
  `CurrencyID5` smallint unsigned NOT NULL DEFAULT '0',
  `CurrencyCount1` int unsigned NOT NULL DEFAULT '0',
  `CurrencyCount2` int unsigned NOT NULL DEFAULT '0',
  `CurrencyCount3` int unsigned NOT NULL DEFAULT '0',
  `CurrencyCount4` int unsigned NOT NULL DEFAULT '0',
  `CurrencyCount5` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_extended_cost` (`ID`, `RequiredArenaRating`, `ArenaBracket`, `Flags`, `MinFactionID`, `MinReputation`, `RequiredAchievement`, `ItemID1`, `ItemID2`, `ItemID3`, `ItemID4`, `ItemID5`, `ItemCount1`, `ItemCount2`, `ItemCount3`, `ItemCount4`, `ItemCount5`, `CurrencyID1`, `CurrencyID2`, `CurrencyID3`, `CurrencyID4`, `CurrencyID5`, `CurrencyCount1`, `CurrencyCount2`, `CurrencyCount3`, `CurrencyCount4`, `CurrencyCount5`, `VerifiedBuild`) VALUES (9229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1792, 0, 0, 0, 0, 175, 0, 0, 0, 0, 59888);


-- ==========================================
-- Table: item_level_selector
-- ==========================================
CREATE TABLE `item_level_selector` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MinItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `ItemLevelSelectorQualitySetID` smallint unsigned NOT NULL DEFAULT '0',
  `AzeriteUnlockMappingSet` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_level_selector` (`ID`, `MinItemLevel`, `ItemLevelSelectorQualitySetID`, `AzeriteUnlockMappingSet`, `VerifiedBuild`) VALUES (1988, 671, 135, 0, 59888);


-- ==========================================
-- Table: item_level_selector_quality
-- ==========================================
CREATE TABLE `item_level_selector_quality` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `QualityItemBonusListID` int NOT NULL DEFAULT '0',
  `Quality` tinyint NOT NULL DEFAULT '0',
  `ParentILSQualitySetID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_level_selector_quality is empty)


-- ==========================================
-- Table: item_level_selector_quality_set
-- ==========================================
CREATE TABLE `item_level_selector_quality_set` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `IlvlRare` smallint NOT NULL DEFAULT '0',
  `IlvlEpic` smallint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_level_selector_quality_set is empty)


-- ==========================================
-- Table: item_limit_category
-- ==========================================
CREATE TABLE `item_limit_category` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Quantity` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_limit_category is empty)


-- ==========================================
-- Table: item_limit_category_condition
-- ==========================================
CREATE TABLE `item_limit_category_condition` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `AddQuantity` tinyint NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `ParentItemLimitCategoryID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_limit_category_condition is empty)


-- ==========================================
-- Table: item_limit_category_locale
-- ==========================================
CREATE TABLE `item_limit_category_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table item_limit_category_locale is empty)


-- ==========================================
-- Table: item_modified_appearance
-- ==========================================
CREATE TABLE `item_modified_appearance` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemID` int unsigned NOT NULL DEFAULT '0',
  `ItemAppearanceModifierID` int NOT NULL DEFAULT '0',
  `ItemAppearanceID` int NOT NULL DEFAULT '0',
  `OrderIndex` int NOT NULL DEFAULT '0',
  `TransmogSourceTypeEnum` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_modified_appearance` (`ID`, `ItemID`, `ItemAppearanceModifierID`, `ItemAppearanceID`, `OrderIndex`, `TransmogSourceTypeEnum`, `Flags`, `VerifiedBuild`) VALUES (194665, 212171, 0, 83359, 0, 1, 0, 59888);


-- ==========================================
-- Table: item_modified_appearance_extra
-- ==========================================
CREATE TABLE `item_modified_appearance_extra` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `IconFileDataID` int NOT NULL DEFAULT '0',
  `UnequippedIconFileDataID` int NOT NULL DEFAULT '0',
  `SheatheType` tinyint unsigned NOT NULL DEFAULT '0',
  `DisplayWeaponSubclassID` tinyint NOT NULL DEFAULT '0',
  `DisplayInventoryType` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_modified_appearance_extra is empty)


-- ==========================================
-- Table: item_name_description
-- ==========================================
CREATE TABLE `item_name_description` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Color` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_name_description is empty)


-- ==========================================
-- Table: item_name_description_locale
-- ==========================================
CREATE TABLE `item_name_description_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table item_name_description_locale is empty)


-- ==========================================
-- Table: item_offset_curve
-- ==========================================
CREATE TABLE `item_offset_curve` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `CurveID` int NOT NULL DEFAULT '0',
  `Offset` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_offset_curve is empty)


-- ==========================================
-- Table: item_price_base
-- ==========================================
CREATE TABLE `item_price_base` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `Armor` float NOT NULL DEFAULT '0',
  `Weapon` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_price_base is empty)


-- ==========================================
-- Table: item_scaling_config
-- ==========================================
CREATE TABLE `item_scaling_config` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemOffsetCurveID` int NOT NULL DEFAULT '0',
  `ItemLevel` int NOT NULL DEFAULT '0',
  `RequiredLevel` int NOT NULL DEFAULT '0',
  `Unknown1125` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_scaling_config is empty)


-- ==========================================
-- Table: item_search_name
-- ==========================================
CREATE TABLE `item_search_name` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `AllowableRace` bigint NOT NULL DEFAULT '0',
  `Display` text COLLATE utf8mb4_unicode_ci,
  `OverallQualityID` tinyint unsigned NOT NULL DEFAULT '0',
  `ExpansionID` int NOT NULL DEFAULT '0',
  `MinFactionID` smallint unsigned NOT NULL DEFAULT '0',
  `MinReputation` int NOT NULL DEFAULT '0',
  `AllowableClass` int NOT NULL DEFAULT '0',
  `RequiredLevel` tinyint NOT NULL DEFAULT '0',
  `RequiredSkill` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredAbility` int unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `Flags1` int NOT NULL DEFAULT '0',
  `Flags2` int NOT NULL DEFAULT '0',
  `Flags3` int NOT NULL DEFAULT '0',
  `Flags4` int NOT NULL DEFAULT '0',
  `Flags5` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_search_name` (`ID`, `AllowableRace`, `Display`, `OverallQualityID`, `ExpansionID`, `MinFactionID`, `MinReputation`, `AllowableClass`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `RequiredAbility`, `ItemLevel`, `Flags1`, `Flags2`, `Flags3`, `Flags4`, `Flags5`, `VerifiedBuild`) VALUES (2300, -1, 'Embossed Leather Vest', 2, 0, 0, 0, -1, 3, 0, 0, 0, 6, 0, 24576, 0, 0, 0, 59888);


-- ==========================================
-- Table: item_search_name_locale
-- ==========================================
CREATE TABLE `item_search_name_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Display_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `item_search_name_locale` (`ID`, `locale`, `Display_lang`, `VerifiedBuild`) VALUES (2300, 'deDE', 'Geprägte Lederweste', 59888);


-- ==========================================
-- Table: item_set
-- ==========================================
CREATE TABLE `item_set` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `SetFlags` int unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` int unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint unsigned NOT NULL DEFAULT '0',
  `ItemID1` int unsigned NOT NULL DEFAULT '0',
  `ItemID2` int unsigned NOT NULL DEFAULT '0',
  `ItemID3` int unsigned NOT NULL DEFAULT '0',
  `ItemID4` int unsigned NOT NULL DEFAULT '0',
  `ItemID5` int unsigned NOT NULL DEFAULT '0',
  `ItemID6` int unsigned NOT NULL DEFAULT '0',
  `ItemID7` int unsigned NOT NULL DEFAULT '0',
  `ItemID8` int unsigned NOT NULL DEFAULT '0',
  `ItemID9` int unsigned NOT NULL DEFAULT '0',
  `ItemID10` int unsigned NOT NULL DEFAULT '0',
  `ItemID11` int unsigned NOT NULL DEFAULT '0',
  `ItemID12` int unsigned NOT NULL DEFAULT '0',
  `ItemID13` int unsigned NOT NULL DEFAULT '0',
  `ItemID14` int unsigned NOT NULL DEFAULT '0',
  `ItemID15` int unsigned NOT NULL DEFAULT '0',
  `ItemID16` int unsigned NOT NULL DEFAULT '0',
  `ItemID17` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_set is empty)


-- ==========================================
-- Table: item_set_locale
-- ==========================================
CREATE TABLE `item_set_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table item_set_locale is empty)


-- ==========================================
-- Table: item_set_spell
-- ==========================================
CREATE TABLE `item_set_spell` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ChrSpecID` smallint unsigned NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `TraitSubTreeID` smallint unsigned NOT NULL DEFAULT '0',
  `Threshold` tinyint unsigned NOT NULL DEFAULT '0',
  `ItemSetID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_set_spell is empty)


-- ==========================================
-- Table: item_sparse
-- ==========================================
CREATE TABLE `item_sparse` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `AllowableRace` bigint NOT NULL DEFAULT '0',
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Display3` text COLLATE utf8mb4_unicode_ci,
  `Display2` text COLLATE utf8mb4_unicode_ci,
  `Display1` text COLLATE utf8mb4_unicode_ci,
  `Display` text COLLATE utf8mb4_unicode_ci,
  `ExpansionID` int NOT NULL DEFAULT '0',
  `DmgVariance` float NOT NULL DEFAULT '0',
  `LimitCategory` int NOT NULL DEFAULT '0',
  `DurationInInventory` int unsigned NOT NULL DEFAULT '0',
  `QualityModifier` float NOT NULL DEFAULT '0',
  `BagFamily` int unsigned NOT NULL DEFAULT '0',
  `StartQuestID` int NOT NULL DEFAULT '0',
  `LanguageID` int NOT NULL DEFAULT '0',
  `ItemRange` float NOT NULL DEFAULT '0',
  `StatPercentageOfSocket1` float NOT NULL DEFAULT '0',
  `StatPercentageOfSocket2` float NOT NULL DEFAULT '0',
  `StatPercentageOfSocket3` float NOT NULL DEFAULT '0',
  `StatPercentageOfSocket4` float NOT NULL DEFAULT '0',
  `StatPercentageOfSocket5` float NOT NULL DEFAULT '0',
  `StatPercentageOfSocket6` float NOT NULL DEFAULT '0',
  `StatPercentageOfSocket7` float NOT NULL DEFAULT '0',
  `StatPercentageOfSocket8` float NOT NULL DEFAULT '0',
  `StatPercentageOfSocket9` float NOT NULL DEFAULT '0',
  `StatPercentageOfSocket10` float NOT NULL DEFAULT '0',
  `StatPercentEditor1` int NOT NULL DEFAULT '0',
  `StatPercentEditor2` int NOT NULL DEFAULT '0',
  `StatPercentEditor3` int NOT NULL DEFAULT '0',
  `StatPercentEditor4` int NOT NULL DEFAULT '0',
  `StatPercentEditor5` int NOT NULL DEFAULT '0',
  `StatPercentEditor6` int NOT NULL DEFAULT '0',
  `StatPercentEditor7` int NOT NULL DEFAULT '0',
  `StatPercentEditor8` int NOT NULL DEFAULT '0',
  `StatPercentEditor9` int NOT NULL DEFAULT '0',
  `StatPercentEditor10` int NOT NULL DEFAULT '0',
  `StatModifierBonusStat1` int NOT NULL DEFAULT '0',
  `StatModifierBonusStat2` int NOT NULL DEFAULT '0',
  `StatModifierBonusStat3` int NOT NULL DEFAULT '0',
  `StatModifierBonusStat4` int NOT NULL DEFAULT '0',
  `StatModifierBonusStat5` int NOT NULL DEFAULT '0',
  `StatModifierBonusStat6` int NOT NULL DEFAULT '0',
  `StatModifierBonusStat7` int NOT NULL DEFAULT '0',
  `StatModifierBonusStat8` int NOT NULL DEFAULT '0',
  `StatModifierBonusStat9` int NOT NULL DEFAULT '0',
  `StatModifierBonusStat10` int NOT NULL DEFAULT '0',
  `Stackable` int NOT NULL DEFAULT '0',
  `MaxCount` int NOT NULL DEFAULT '0',
  `MinReputation` int NOT NULL DEFAULT '0',
  `RequiredAbility` int unsigned NOT NULL DEFAULT '0',
  `SellPrice` int unsigned NOT NULL DEFAULT '0',
  `BuyPrice` int unsigned NOT NULL DEFAULT '0',
  `VendorStackCount` int unsigned NOT NULL DEFAULT '0',
  `PriceVariance` float NOT NULL DEFAULT '0',
  `PriceRandomValue` float NOT NULL DEFAULT '0',
  `Flags1` int NOT NULL DEFAULT '0',
  `Flags2` int NOT NULL DEFAULT '0',
  `Flags3` int NOT NULL DEFAULT '0',
  `Flags4` int NOT NULL DEFAULT '0',
  `Flags5` int NOT NULL DEFAULT '0',
  `FactionRelated` int NOT NULL DEFAULT '0',
  `ModifiedCraftingReagentItemID` int NOT NULL DEFAULT '0',
  `ContentTuningID` int NOT NULL DEFAULT '0',
  `PlayerLevelToItemLevelCurveID` int NOT NULL DEFAULT '0',
  `ItemLevelOffsetCurveID` int NOT NULL DEFAULT '0',
  `ItemLevelOffsetItemLevel` int NOT NULL DEFAULT '0',
  `ItemNameDescriptionID` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredTransmogHoliday` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredHoliday` smallint unsigned NOT NULL DEFAULT '0',
  `GemProperties` smallint unsigned NOT NULL DEFAULT '0',
  `SocketMatchEnchantmentId` smallint unsigned NOT NULL DEFAULT '0',
  `TotemCategoryID` smallint unsigned NOT NULL DEFAULT '0',
  `InstanceBound` smallint unsigned NOT NULL DEFAULT '0',
  `ZoneBound1` smallint unsigned NOT NULL DEFAULT '0',
  `ZoneBound2` smallint unsigned NOT NULL DEFAULT '0',
  `ItemSet` smallint unsigned NOT NULL DEFAULT '0',
  `LockID` smallint unsigned NOT NULL DEFAULT '0',
  `PageID` smallint unsigned NOT NULL DEFAULT '0',
  `ItemDelay` smallint unsigned NOT NULL DEFAULT '0',
  `MinFactionID` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` smallint unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `AllowableClass` smallint NOT NULL DEFAULT '0',
  `ArtifactID` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellWeight` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellWeightCategory` tinyint unsigned NOT NULL DEFAULT '0',
  `SocketType1` tinyint unsigned NOT NULL DEFAULT '0',
  `SocketType2` tinyint unsigned NOT NULL DEFAULT '0',
  `SocketType3` tinyint unsigned NOT NULL DEFAULT '0',
  `SheatheType` tinyint unsigned NOT NULL DEFAULT '0',
  `Material` tinyint unsigned NOT NULL DEFAULT '0',
  `PageMaterialID` tinyint unsigned NOT NULL DEFAULT '0',
  `Bonding` tinyint unsigned NOT NULL DEFAULT '0',
  `DamageDamageType` tinyint unsigned NOT NULL DEFAULT '0',
  `ContainerSlots` tinyint unsigned NOT NULL DEFAULT '0',
  `RequiredPVPMedal` tinyint unsigned NOT NULL DEFAULT '0',
  `RequiredPVPRank` tinyint NOT NULL DEFAULT '0',
  `RequiredLevel` tinyint NOT NULL DEFAULT '0',
  `InventoryType` tinyint NOT NULL DEFAULT '0',
  `OverallQualityID` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_sparse` (`ID`, `AllowableRace`, `Description`, `Display3`, `Display2`, `Display1`, `Display`, `ExpansionID`, `DmgVariance`, `LimitCategory`, `DurationInInventory`, `QualityModifier`, `BagFamily`, `StartQuestID`, `LanguageID`, `ItemRange`, `StatPercentageOfSocket1`, `StatPercentageOfSocket2`, `StatPercentageOfSocket3`, `StatPercentageOfSocket4`, `StatPercentageOfSocket5`, `StatPercentageOfSocket6`, `StatPercentageOfSocket7`, `StatPercentageOfSocket8`, `StatPercentageOfSocket9`, `StatPercentageOfSocket10`, `StatPercentEditor1`, `StatPercentEditor2`, `StatPercentEditor3`, `StatPercentEditor4`, `StatPercentEditor5`, `StatPercentEditor6`, `StatPercentEditor7`, `StatPercentEditor8`, `StatPercentEditor9`, `StatPercentEditor10`, `StatModifierBonusStat1`, `StatModifierBonusStat2`, `StatModifierBonusStat3`, `StatModifierBonusStat4`, `StatModifierBonusStat5`, `StatModifierBonusStat6`, `StatModifierBonusStat7`, `StatModifierBonusStat8`, `StatModifierBonusStat9`, `StatModifierBonusStat10`, `Stackable`, `MaxCount`, `MinReputation`, `RequiredAbility`, `SellPrice`, `BuyPrice`, `VendorStackCount`, `PriceVariance`, `PriceRandomValue`, `Flags1`, `Flags2`, `Flags3`, `Flags4`, `Flags5`, `FactionRelated`, `ModifiedCraftingReagentItemID`, `ContentTuningID`, `PlayerLevelToItemLevelCurveID`, `ItemLevelOffsetCurveID`, `ItemLevelOffsetItemLevel`, `ItemNameDescriptionID`, `RequiredTransmogHoliday`, `RequiredHoliday`, `GemProperties`, `SocketMatchEnchantmentId`, `TotemCategoryID`, `InstanceBound`, `ZoneBound1`, `ZoneBound2`, `ItemSet`, `LockID`, `PageID`, `ItemDelay`, `MinFactionID`, `RequiredSkillRank`, `RequiredSkill`, `ItemLevel`, `AllowableClass`, `ArtifactID`, `SpellWeight`, `SpellWeightCategory`, `SocketType1`, `SocketType2`, `SocketType3`, `SheatheType`, `Material`, `PageMaterialID`, `Bonding`, `DamageDamageType`, `ContainerSlots`, `RequiredPVPMedal`, `RequiredPVPRank`, `RequiredLevel`, `InventoryType`, `OverallQualityID`, `VerifiedBuild`) VALUES (906, -1, 'TEMP', '', '', '', 'TEMP', 4, 0.0, 0, 0, 0.0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 0, 0, 0, 0, 0, 1, 1.0, 0.9552, 4, 24576, 131072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, -1, 0, 0, 0, 0, 0, 0, 0, 3, 0, 1, 0, 0, 0, 0, 1, 0, 4, 54673);


-- ==========================================
-- Table: item_sparse_locale
-- ==========================================
CREATE TABLE `item_sparse_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `Display3_lang` text COLLATE utf8mb4_unicode_ci,
  `Display2_lang` text COLLATE utf8mb4_unicode_ci,
  `Display1_lang` text COLLATE utf8mb4_unicode_ci,
  `Display_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `item_sparse_locale` (`ID`, `locale`, `Description_lang`, `Display3_lang`, `Display2_lang`, `Display1_lang`, `Display_lang`, `VerifiedBuild`) VALUES (2300, 'deDE', '', '', '', '', 'Geprägte Lederweste', 59888);


-- ==========================================
-- Table: item_spec
-- ==========================================
CREATE TABLE `item_spec` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MinLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `ItemType` tinyint unsigned NOT NULL DEFAULT '0',
  `PrimaryStat` tinyint unsigned NOT NULL DEFAULT '0',
  `SecondaryStat` tinyint unsigned NOT NULL DEFAULT '0',
  `SpecializationID` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table item_spec is empty)


-- ==========================================
-- Table: item_spec_override
-- ==========================================
CREATE TABLE `item_spec_override` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpecID` smallint unsigned NOT NULL DEFAULT '0',
  `ItemID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_spec_override` (`ID`, `SpecID`, `ItemID`, `VerifiedBuild`) VALUES (148307, 253, 230199, 59888);


-- ==========================================
-- Table: item_x_bonus_tree
-- ==========================================
CREATE TABLE `item_x_bonus_tree` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemBonusTreeID` smallint unsigned NOT NULL DEFAULT '0',
  `ItemID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_x_bonus_tree` (`ID`, `ItemBonusTreeID`, `ItemID`, `VerifiedBuild`) VALUES (302010, 4738, 220376, 59888);


-- ==========================================
-- Table: item_x_item_effect
-- ==========================================
CREATE TABLE `item_x_item_effect` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemEffectID` int NOT NULL DEFAULT '0',
  `ItemID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `item_x_item_effect` (`ID`, `ItemEffectID`, `ItemID`, `VerifiedBuild`) VALUES (119216, 183903, 219381, 59888);


-- ==========================================
-- Table: journal_encounter
-- ==========================================
CREATE TABLE `journal_encounter` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `MapX` float NOT NULL DEFAULT '0',
  `MapY` float NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `JournalInstanceID` smallint unsigned NOT NULL DEFAULT '0',
  `DungeonEncounterID` smallint unsigned NOT NULL DEFAULT '0',
  `OrderIndex` int unsigned NOT NULL DEFAULT '0',
  `FirstSectionID` smallint unsigned NOT NULL DEFAULT '0',
  `UiMapID` smallint unsigned NOT NULL DEFAULT '0',
  `MapDisplayConditionID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `DifficultyMask` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `journal_encounter` (`Name`, `Description`, `MapX`, `MapY`, `ID`, `JournalInstanceID`, `DungeonEncounterID`, `OrderIndex`, `FirstSectionID`, `UiMapID`, `MapDisplayConditionID`, `Flags`, `DifficultyMask`, `VerifiedBuild`) VALUES ('Cauldron of Carnage', 'Throughout history there have been many epic wars, but none more explosive than the rivalry between the galvanic gorilla Torq the Tempest, and the molten mechasaur Flarendo the Furious. Tonight, all bets are off when these two champions clash in the cauldron for a showdown that threatens to tear Undermine in two! Witness the carnage or be the shame of goblin kind.', 0.506024, 0.188253, 2640, 1296, 3010, 2, 30331, 2406, 0, 0, -1, 59888);


-- ==========================================
-- Table: journal_encounter_locale
-- ==========================================
CREATE TABLE `journal_encounter_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `journal_encounter_locale` (`ID`, `locale`, `Name_lang`, `Description_lang`, `VerifiedBuild`) VALUES (2640, 'deDE', 'Kessel des Gemetzels', 'Im Lauf der Geschichte kam es zu vielen epischen Schlachten, doch keine davon war auch nur annähernd so explosiv wie die Rivalität zwischen dem galvanischen Gorilla Torq dem Tobenden und dem geschmolzenen Mechasaurus Leuchtendo dem Lodernden. Heute Nacht ist alles möglich, wenn diese beiden Champions im Kessel für einen Showdown aufeinandertreffen, der droht, Lorenhall in Stücke zu reißen! Werdet Zeuge des Gemetzels oder erntet den Spott aller Goblins.', 59888);


-- ==========================================
-- Table: journal_encounter_section
-- ==========================================
CREATE TABLE `journal_encounter_section` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Title` text COLLATE utf8mb4_unicode_ci,
  `BodyText` text COLLATE utf8mb4_unicode_ci,
  `JournalEncounterID` smallint unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `ParentSectionID` smallint unsigned NOT NULL DEFAULT '0',
  `FirstChildSectionID` smallint unsigned NOT NULL DEFAULT '0',
  `NextSiblingSectionID` smallint unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `IconCreatureDisplayInfoID` int unsigned NOT NULL DEFAULT '0',
  `UiModelSceneID` int NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `IconFileDataID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `IconFlags` int NOT NULL DEFAULT '0',
  `DifficultyMask` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `journal_encounter_section` (`ID`, `Title`, `BodyText`, `JournalEncounterID`, `OrderIndex`, `ParentSectionID`, `FirstChildSectionID`, `NextSiblingSectionID`, `Type`, `IconCreatureDisplayInfoID`, `UiModelSceneID`, `SpellID`, `IconFileDataID`, `Flags`, `IconFlags`, `DifficultyMask`, `VerifiedBuild`) VALUES (18455, 'Section 13', '', 2116, 16, 18452, 0, 0, 2, 0, 0, 262436, 0, 0, 0, -1, 59888);


-- ==========================================
-- Table: journal_encounter_section_locale
-- ==========================================
CREATE TABLE `journal_encounter_section_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Title_lang` text COLLATE utf8mb4_unicode_ci,
  `BodyText_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `journal_encounter_section_locale` (`ID`, `locale`, `Title_lang`, `BodyText_lang`, `VerifiedBuild`) VALUES (18455, 'deDE', 'Abschnitt 13', '', 59888);


-- ==========================================
-- Table: journal_instance
-- ==========================================
CREATE TABLE `journal_instance` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `MapID` smallint unsigned NOT NULL DEFAULT '0',
  `BackgroundFileDataID` int NOT NULL DEFAULT '0',
  `ButtonFileDataID` int NOT NULL DEFAULT '0',
  `ButtonSmallFileDataID` int NOT NULL DEFAULT '0',
  `LoreFileDataID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `AreaID` smallint unsigned NOT NULL DEFAULT '0',
  `CovenantID` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `journal_instance` (`ID`, `Name`, `Description`, `MapID`, `BackgroundFileDataID`, `ButtonFileDataID`, `ButtonSmallFileDataID`, `LoreFileDataID`, `Flags`, `AreaID`, `CovenantID`, `VerifiedBuild`) VALUES (1310, 'Zekvir\'s Lair', '', 0, 0, 0, 0, 0, 0, 0, 0, 59888);


-- ==========================================
-- Table: journal_instance_locale
-- ==========================================
CREATE TABLE `journal_instance_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `journal_instance_locale` (`ID`, `locale`, `Name_lang`, `Description_lang`, `VerifiedBuild`) VALUES (1310, 'deDE', 'Zekvirs Höhle', '', 59888);


-- ==========================================
-- Table: journal_tier
-- ==========================================
CREATE TABLE `journal_tier` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Expansion` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table journal_tier is empty)


-- ==========================================
-- Table: journal_tier_locale
-- ==========================================
CREATE TABLE `journal_tier_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table journal_tier_locale is empty)


-- ==========================================
-- Table: keychain
-- ==========================================
CREATE TABLE `keychain` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Key1` tinyint unsigned NOT NULL DEFAULT '0',
  `Key2` tinyint unsigned NOT NULL DEFAULT '0',
  `Key3` tinyint unsigned NOT NULL DEFAULT '0',
  `Key4` tinyint unsigned NOT NULL DEFAULT '0',
  `Key5` tinyint unsigned NOT NULL DEFAULT '0',
  `Key6` tinyint unsigned NOT NULL DEFAULT '0',
  `Key7` tinyint unsigned NOT NULL DEFAULT '0',
  `Key8` tinyint unsigned NOT NULL DEFAULT '0',
  `Key9` tinyint unsigned NOT NULL DEFAULT '0',
  `Key10` tinyint unsigned NOT NULL DEFAULT '0',
  `Key11` tinyint unsigned NOT NULL DEFAULT '0',
  `Key12` tinyint unsigned NOT NULL DEFAULT '0',
  `Key13` tinyint unsigned NOT NULL DEFAULT '0',
  `Key14` tinyint unsigned NOT NULL DEFAULT '0',
  `Key15` tinyint unsigned NOT NULL DEFAULT '0',
  `Key16` tinyint unsigned NOT NULL DEFAULT '0',
  `Key17` tinyint unsigned NOT NULL DEFAULT '0',
  `Key18` tinyint unsigned NOT NULL DEFAULT '0',
  `Key19` tinyint unsigned NOT NULL DEFAULT '0',
  `Key20` tinyint unsigned NOT NULL DEFAULT '0',
  `Key21` tinyint unsigned NOT NULL DEFAULT '0',
  `Key22` tinyint unsigned NOT NULL DEFAULT '0',
  `Key23` tinyint unsigned NOT NULL DEFAULT '0',
  `Key24` tinyint unsigned NOT NULL DEFAULT '0',
  `Key25` tinyint unsigned NOT NULL DEFAULT '0',
  `Key26` tinyint unsigned NOT NULL DEFAULT '0',
  `Key27` tinyint unsigned NOT NULL DEFAULT '0',
  `Key28` tinyint unsigned NOT NULL DEFAULT '0',
  `Key29` tinyint unsigned NOT NULL DEFAULT '0',
  `Key30` tinyint unsigned NOT NULL DEFAULT '0',
  `Key31` tinyint unsigned NOT NULL DEFAULT '0',
  `Key32` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table keychain is empty)


-- ==========================================
-- Table: keystone_affix
-- ==========================================
CREATE TABLE `keystone_affix` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `FiledataID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `keystone_affix` (`Name`, `Description`, `ID`, `FiledataID`, `VerifiedBuild`) VALUES ('Bolstering', 'When any non-boss enemy dies, its death cry empowers nearby allies, temporarily increasing their health by 10%.', 7, 132333, 64270);


-- ==========================================
-- Table: keystone_affix_locale
-- ==========================================
CREATE TABLE `keystone_affix_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table keystone_affix_locale is empty)


-- ==========================================
-- Table: language_words
-- ==========================================
CREATE TABLE `language_words` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Word` text COLLATE utf8mb4_unicode_ci,
  `LanguageID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table language_words is empty)


-- ==========================================
-- Table: languages
-- ==========================================
CREATE TABLE `languages` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `UiTextureKitID` int NOT NULL DEFAULT '0',
  `UiTextureKitElementCount` int NOT NULL DEFAULT '0',
  `LearningCurveID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table languages is empty)


-- ==========================================
-- Table: languages_locale
-- ==========================================
CREATE TABLE `languages_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table languages_locale is empty)


-- ==========================================
-- Table: lfg_dungeons
-- ==========================================
CREATE TABLE `lfg_dungeons` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `TypeID` tinyint unsigned NOT NULL DEFAULT '0',
  `Subtype` tinyint unsigned NOT NULL DEFAULT '0',
  `Faction` tinyint NOT NULL DEFAULT '0',
  `IconTextureFileID` int NOT NULL DEFAULT '0',
  `RewardsBgTextureFileID` int NOT NULL DEFAULT '0',
  `PopupBgTextureFileID` int NOT NULL DEFAULT '0',
  `ExpansionLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `MapID` smallint NOT NULL DEFAULT '0',
  `DifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `MinGear` float NOT NULL DEFAULT '0',
  `GroupID` tinyint unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `RequiredPlayerConditionId` int unsigned NOT NULL DEFAULT '0',
  `RandomID` smallint unsigned NOT NULL DEFAULT '0',
  `ScenarioID` smallint unsigned NOT NULL DEFAULT '0',
  `FinalEncounterID` smallint unsigned NOT NULL DEFAULT '0',
  `CountTank` tinyint unsigned NOT NULL DEFAULT '0',
  `CountHealer` tinyint unsigned NOT NULL DEFAULT '0',
  `CountDamage` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCountTank` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCountHealer` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCountDamage` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxPremadeCountTank` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxPremadeCountHealer` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxPremadeCountDamage` tinyint unsigned NOT NULL DEFAULT '0',
  `BonusReputationAmount` smallint unsigned NOT NULL DEFAULT '0',
  `MentorItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `MentorCharLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxPremadeGroupSize` tinyint unsigned NOT NULL DEFAULT '0',
  `ContentTuningID` int NOT NULL DEFAULT '0',
  `Flags1` int NOT NULL DEFAULT '0',
  `Flags2` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `lfg_dungeons` (`ID`, `Name`, `Description`, `TypeID`, `Subtype`, `Faction`, `IconTextureFileID`, `RewardsBgTextureFileID`, `PopupBgTextureFileID`, `ExpansionLevel`, `MapID`, `DifficultyID`, `MinGear`, `GroupID`, `OrderIndex`, `RequiredPlayerConditionId`, `RandomID`, `ScenarioID`, `FinalEncounterID`, `CountTank`, `CountHealer`, `CountDamage`, `MinCountTank`, `MinCountHealer`, `MinCountDamage`, `MaxPremadeCountTank`, `MaxPremadeCountHealer`, `MaxPremadeCountDamage`, `BonusReputationAmount`, `MentorItemLevel`, `MentorCharLevel`, `MaxPremadeGroupSize`, `ContentTuningID`, `Flags1`, `Flags2`, `VerifiedBuild`) VALUES (2522, 'Earthcrawl Mines', '', 1, 3, -1, 136349, 615223, 615222, 0, 2680, 208, 0.0, 38, 10, 0, 0, 0, 0, 0, 0, 5, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 2677, 1610629123, 73856, 59888);


-- ==========================================
-- Table: lfg_dungeons_locale
-- ==========================================
CREATE TABLE `lfg_dungeons_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `lfg_dungeons_locale` (`ID`, `locale`, `Name_lang`, `Description_lang`, `VerifiedBuild`) VALUES (2522, 'deDE', 'Erdwühlerminen', '', 59888);


-- ==========================================
-- Table: light
-- ==========================================
CREATE TABLE `light` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `GameCoordsX` float NOT NULL DEFAULT '0',
  `GameCoordsY` float NOT NULL DEFAULT '0',
  `GameCoordsZ` float NOT NULL DEFAULT '0',
  `GameFalloffStart` float NOT NULL DEFAULT '0',
  `GameFalloffEnd` float NOT NULL DEFAULT '0',
  `ContinentID` smallint NOT NULL DEFAULT '0',
  `LightParamsID1` smallint unsigned NOT NULL DEFAULT '0',
  `LightParamsID2` smallint unsigned NOT NULL DEFAULT '0',
  `LightParamsID3` smallint unsigned NOT NULL DEFAULT '0',
  `LightParamsID4` smallint unsigned NOT NULL DEFAULT '0',
  `LightParamsID5` smallint unsigned NOT NULL DEFAULT '0',
  `LightParamsID6` smallint unsigned NOT NULL DEFAULT '0',
  `LightParamsID7` smallint unsigned NOT NULL DEFAULT '0',
  `LightParamsID8` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table light is empty)


-- ==========================================
-- Table: light_params
-- ==========================================
CREATE TABLE `light_params` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `OverrideCelestialSphere1` float NOT NULL DEFAULT '0',
  `OverrideCelestialSphere2` float NOT NULL DEFAULT '0',
  `OverrideCelestialSphere3` float NOT NULL DEFAULT '0',
  `Field_11_0_0_54210_0011` float NOT NULL DEFAULT '0',
  `Field_11_0_0_54210_0012` float NOT NULL DEFAULT '0',
  `Field_11_0_0_54210_0013` float NOT NULL DEFAULT '0',
  `HighlightSky` tinyint unsigned NOT NULL DEFAULT '0',
  `LightSkyboxID` smallint unsigned NOT NULL DEFAULT '0',
  `CloudTypeID` tinyint unsigned NOT NULL DEFAULT '0',
  `Glow` float NOT NULL DEFAULT '0',
  `WaterShallowAlpha` float NOT NULL DEFAULT '0',
  `WaterDeepAlpha` float NOT NULL DEFAULT '0',
  `OceanShallowAlpha` float NOT NULL DEFAULT '0',
  `OceanDeepAlpha` float NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `SsaoSettingsID` int NOT NULL DEFAULT '0',
  `Field_11_0_0_54210_012` float NOT NULL DEFAULT '0',
  `Field_11_0_0_54210_013` float NOT NULL DEFAULT '0',
  `Field_11_0_0_54210_014` float NOT NULL DEFAULT '0',
  `Field_11_0_0_54210_015` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table light_params is empty)


-- ==========================================
-- Table: light_skybox
-- ==========================================
CREATE TABLE `light_skybox` (
  `Id` int unsigned NOT NULL DEFAULT '0',
  `Name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `SkyboxFileDataID` int NOT NULL DEFAULT '0',
  `CelestialSkyboxFileDataID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table light_skybox is empty)


-- ==========================================
-- Table: liquid_type
-- ==========================================
CREATE TABLE `liquid_type` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Texture1` text COLLATE utf8mb4_unicode_ci,
  `Texture2` text COLLATE utf8mb4_unicode_ci,
  `Texture3` text COLLATE utf8mb4_unicode_ci,
  `Texture4` text COLLATE utf8mb4_unicode_ci,
  `Texture5` text COLLATE utf8mb4_unicode_ci,
  `Texture6` text COLLATE utf8mb4_unicode_ci,
  `Flags` int NOT NULL DEFAULT '0',
  `SoundBank` tinyint unsigned NOT NULL DEFAULT '0',
  `SoundID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `MaxDarkenDepth` float NOT NULL DEFAULT '0',
  `FogDarkenIntensity` float NOT NULL DEFAULT '0',
  `AmbDarkenIntensity` float NOT NULL DEFAULT '0',
  `DirDarkenIntensity` float NOT NULL DEFAULT '0',
  `LightID` smallint unsigned NOT NULL DEFAULT '0',
  `ParticleScale` float NOT NULL DEFAULT '0',
  `ParticleMovement` tinyint unsigned NOT NULL DEFAULT '0',
  `ParticleTexSlots` tinyint unsigned NOT NULL DEFAULT '0',
  `MaterialID` tinyint unsigned NOT NULL DEFAULT '0',
  `MinimapStaticCol` int NOT NULL DEFAULT '0',
  `FrameCountTexture1` tinyint unsigned NOT NULL DEFAULT '0',
  `FrameCountTexture2` tinyint unsigned NOT NULL DEFAULT '0',
  `FrameCountTexture3` tinyint unsigned NOT NULL DEFAULT '0',
  `FrameCountTexture4` tinyint unsigned NOT NULL DEFAULT '0',
  `FrameCountTexture5` tinyint unsigned NOT NULL DEFAULT '0',
  `FrameCountTexture6` tinyint unsigned NOT NULL DEFAULT '0',
  `Color1` int NOT NULL DEFAULT '0',
  `Color2` int NOT NULL DEFAULT '0',
  `Float1` float NOT NULL DEFAULT '0',
  `Float2` float NOT NULL DEFAULT '0',
  `Float3` float NOT NULL DEFAULT '0',
  `Float4` float NOT NULL DEFAULT '0',
  `Float5` float NOT NULL DEFAULT '0',
  `Float6` float NOT NULL DEFAULT '0',
  `Float7` float NOT NULL DEFAULT '0',
  `Float8` float NOT NULL DEFAULT '0',
  `Float9` float NOT NULL DEFAULT '0',
  `Float10` float NOT NULL DEFAULT '0',
  `Float11` float NOT NULL DEFAULT '0',
  `Float12` float NOT NULL DEFAULT '0',
  `Float13` float NOT NULL DEFAULT '0',
  `Float14` float NOT NULL DEFAULT '0',
  `Float15` float NOT NULL DEFAULT '0',
  `Float16` float NOT NULL DEFAULT '0',
  `Float17` float NOT NULL DEFAULT '0',
  `Float18` float NOT NULL DEFAULT '0',
  `Int1` int unsigned NOT NULL DEFAULT '0',
  `Int2` int unsigned NOT NULL DEFAULT '0',
  `Int3` int unsigned NOT NULL DEFAULT '0',
  `Int4` int unsigned NOT NULL DEFAULT '0',
  `Coefficient1` float NOT NULL DEFAULT '0',
  `Coefficient2` float NOT NULL DEFAULT '0',
  `Coefficient3` float NOT NULL DEFAULT '0',
  `Coefficient4` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table liquid_type is empty)


-- ==========================================
-- Table: location
-- ==========================================
CREATE TABLE `location` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PosX` float NOT NULL DEFAULT '0',
  `PosY` float NOT NULL DEFAULT '0',
  `PosZ` float NOT NULL DEFAULT '0',
  `Rot1` float NOT NULL DEFAULT '0',
  `Rot2` float NOT NULL DEFAULT '0',
  `Rot3` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `location` (`ID`, `PosX`, `PosY`, `PosZ`, `Rot1`, `Rot2`, `Rot3`, `VerifiedBuild`) VALUES (469186, 1241.18, -2940.1, 272.349, 0.0, 0.0, 0.0, 59888);


-- ==========================================
-- Table: lock
-- ==========================================
CREATE TABLE `lock` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `Index1` int NOT NULL DEFAULT '0',
  `Index2` int NOT NULL DEFAULT '0',
  `Index3` int NOT NULL DEFAULT '0',
  `Index4` int NOT NULL DEFAULT '0',
  `Index5` int NOT NULL DEFAULT '0',
  `Index6` int NOT NULL DEFAULT '0',
  `Index7` int NOT NULL DEFAULT '0',
  `Index8` int NOT NULL DEFAULT '0',
  `Skill1` smallint unsigned NOT NULL DEFAULT '0',
  `Skill2` smallint unsigned NOT NULL DEFAULT '0',
  `Skill3` smallint unsigned NOT NULL DEFAULT '0',
  `Skill4` smallint unsigned NOT NULL DEFAULT '0',
  `Skill5` smallint unsigned NOT NULL DEFAULT '0',
  `Skill6` smallint unsigned NOT NULL DEFAULT '0',
  `Skill7` smallint unsigned NOT NULL DEFAULT '0',
  `Skill8` smallint unsigned NOT NULL DEFAULT '0',
  `Type1` tinyint unsigned NOT NULL DEFAULT '0',
  `Type2` tinyint unsigned NOT NULL DEFAULT '0',
  `Type3` tinyint unsigned NOT NULL DEFAULT '0',
  `Type4` tinyint unsigned NOT NULL DEFAULT '0',
  `Type5` tinyint unsigned NOT NULL DEFAULT '0',
  `Type6` tinyint unsigned NOT NULL DEFAULT '0',
  `Type7` tinyint unsigned NOT NULL DEFAULT '0',
  `Type8` tinyint unsigned NOT NULL DEFAULT '0',
  `Action1` tinyint unsigned NOT NULL DEFAULT '0',
  `Action2` tinyint unsigned NOT NULL DEFAULT '0',
  `Action3` tinyint unsigned NOT NULL DEFAULT '0',
  `Action4` tinyint unsigned NOT NULL DEFAULT '0',
  `Action5` tinyint unsigned NOT NULL DEFAULT '0',
  `Action6` tinyint unsigned NOT NULL DEFAULT '0',
  `Action7` tinyint unsigned NOT NULL DEFAULT '0',
  `Action8` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `lock` (`ID`, `Flags`, `Index1`, `Index2`, `Index3`, `Index4`, `Index5`, `Index6`, `Index7`, `Index8`, `Skill1`, `Skill2`, `Skill3`, `Skill4`, `Skill5`, `Skill6`, `Skill7`, `Skill8`, `Type1`, `Type2`, `Type3`, `Type4`, `Type5`, `Type6`, `Type7`, `Type8`, `Action1`, `Action2`, `Action3`, `Action4`, `Action5`, `Action6`, `Action7`, `Action8`, `VerifiedBuild`) VALUES (4172, 1, 1248091, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 61609);


-- ==========================================
-- Table: mail_template
-- ==========================================
CREATE TABLE `mail_template` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Body` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table mail_template is empty)


-- ==========================================
-- Table: mail_template_locale
-- ==========================================
CREATE TABLE `mail_template_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Body_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table mail_template_locale is empty)


-- ==========================================
-- Table: map
-- ==========================================
CREATE TABLE `map` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Directory` text COLLATE utf8mb4_unicode_ci,
  `MapName` text COLLATE utf8mb4_unicode_ci,
  `MapDescription0` text COLLATE utf8mb4_unicode_ci,
  `MapDescription1` text COLLATE utf8mb4_unicode_ci,
  `PvpShortDescription` text COLLATE utf8mb4_unicode_ci,
  `PvpLongDescription` text COLLATE utf8mb4_unicode_ci,
  `CorpseX` float NOT NULL DEFAULT '0',
  `CorpseY` float NOT NULL DEFAULT '0',
  `MapType` tinyint unsigned NOT NULL DEFAULT '0',
  `InstanceType` tinyint NOT NULL DEFAULT '0',
  `ExpansionID` tinyint unsigned NOT NULL DEFAULT '0',
  `AreaTableID` smallint unsigned NOT NULL DEFAULT '0',
  `LoadingScreenID` smallint NOT NULL DEFAULT '0',
  `TimeOfDayOverride` smallint NOT NULL DEFAULT '0',
  `ParentMapID` smallint NOT NULL DEFAULT '0',
  `CosmeticParentMapID` smallint NOT NULL DEFAULT '0',
  `TimeOffset` tinyint unsigned NOT NULL DEFAULT '0',
  `MinimapIconScale` float NOT NULL DEFAULT '0',
  `CorpseMapID` smallint NOT NULL DEFAULT '0',
  `MaxPlayers` tinyint unsigned NOT NULL DEFAULT '0',
  `WindSettingsID` smallint NOT NULL DEFAULT '0',
  `ZmpFileDataID` int NOT NULL DEFAULT '0',
  `WdtFileDataID` int NOT NULL DEFAULT '0',
  `NavigationMaxDistance` int NOT NULL DEFAULT '0',
  `PreloadFileDataID` int NOT NULL DEFAULT '0',
  `Flags1` int NOT NULL DEFAULT '0',
  `Flags2` int NOT NULL DEFAULT '0',
  `Flags3` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `map` (`ID`, `Directory`, `MapName`, `MapDescription0`, `MapDescription1`, `PvpShortDescription`, `PvpLongDescription`, `CorpseX`, `CorpseY`, `MapType`, `InstanceType`, `ExpansionID`, `AreaTableID`, `LoadingScreenID`, `TimeOfDayOverride`, `ParentMapID`, `CosmeticParentMapID`, `TimeOffset`, `MinimapIconScale`, `CorpseMapID`, `MaxPlayers`, `WindSettingsID`, `ZmpFileDataID`, `WdtFileDataID`, `NavigationMaxDistance`, `PreloadFileDataID`, `Flags1`, `Flags2`, `Flags3`, `VerifiedBuild`) VALUES (0, 'Azeroth', 'Eastern Kingdoms', '', '', '', '', 0.0, 0.0, 1, 0, 0, 0, 4, -1, -1, -1, 0, 1.0, -1, 0, 17, 804940, 775971, 0, 0, 159399517, 134479888, 140, 56647);


-- ==========================================
-- Table: map_challenge_mode
-- ==========================================
CREATE TABLE `map_challenge_mode` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MapID` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ExpansionLevel` int unsigned NOT NULL DEFAULT '0',
  `RequiredWorldStateID` int NOT NULL DEFAULT '0',
  `CriteriaCount1` smallint NOT NULL DEFAULT '0',
  `CriteriaCount2` smallint NOT NULL DEFAULT '0',
  `CriteriaCount3` smallint NOT NULL DEFAULT '0',
  `FirstRewardQuestID1` int NOT NULL DEFAULT '0',
  `FirstRewardQuestID2` int NOT NULL DEFAULT '0',
  `FirstRewardQuestID3` int NOT NULL DEFAULT '0',
  `FirstRewardQuestID4` int NOT NULL DEFAULT '0',
  `FirstRewardQuestID5` int NOT NULL DEFAULT '0',
  `FirstRewardQuestID6` int NOT NULL DEFAULT '0',
  `RewardQuestID1` int NOT NULL DEFAULT '0',
  `RewardQuestID2` int NOT NULL DEFAULT '0',
  `RewardQuestID3` int NOT NULL DEFAULT '0',
  `RewardQuestID4` int NOT NULL DEFAULT '0',
  `RewardQuestID5` int NOT NULL DEFAULT '0',
  `RewardQuestID6` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `map_challenge_mode` (`Name`, `ID`, `MapID`, `Flags`, `ExpansionLevel`, `RequiredWorldStateID`, `CriteriaCount1`, `CriteriaCount2`, `CriteriaCount3`, `FirstRewardQuestID1`, `FirstRewardQuestID2`, `FirstRewardQuestID3`, `FirstRewardQuestID4`, `FirstRewardQuestID5`, `FirstRewardQuestID6`, `RewardQuestID1`, `RewardQuestID2`, `RewardQuestID3`, `RewardQuestID4`, `RewardQuestID5`, `RewardQuestID6`, `VerifiedBuild`) VALUES ('The MOTHERLODE!!', 247, 1594, 0, 7, 21814, 1980, 1584, 1188, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59888);


-- ==========================================
-- Table: map_challenge_mode_locale
-- ==========================================
CREATE TABLE `map_challenge_mode_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `map_challenge_mode_locale` (`ID`, `locale`, `Name_lang`, `VerifiedBuild`) VALUES (247, 'deDE', 'Das RIESENFLÖZ!!', 59888);


-- ==========================================
-- Table: map_difficulty
-- ==========================================
CREATE TABLE `map_difficulty` (
  `Message` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DifficultyID` int NOT NULL DEFAULT '0',
  `LockID` int NOT NULL DEFAULT '0',
  `ResetInterval` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxPlayers` int NOT NULL DEFAULT '0',
  `ItemContext` tinyint unsigned NOT NULL DEFAULT '0',
  `ItemContextPickerID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ContentTuningID` int NOT NULL DEFAULT '0',
  `WorldStateExpressionID` int NOT NULL DEFAULT '0',
  `MapID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `map_difficulty` (`Message`, `ID`, `DifficultyID`, `LockID`, `ResetInterval`, `MaxPlayers`, `ItemContext`, `ItemContextPickerID`, `Flags`, `ContentTuningID`, `WorldStateExpressionID`, `MapID`, `VerifiedBuild`) VALUES ('', 3572, 23, 124, 1, 5, 0, 0, 2, 1175, 0, 1477, 64270);


-- ==========================================
-- Table: map_difficulty_locale
-- ==========================================
CREATE TABLE `map_difficulty_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Message_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `map_difficulty_locale` (`ID`, `locale`, `Message_lang`, `VerifiedBuild`) VALUES (3929, 'deDE', '', 59888);


-- ==========================================
-- Table: map_difficulty_x_condition
-- ==========================================
CREATE TABLE `map_difficulty_x_condition` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `FailureDescription` text COLLATE utf8mb4_unicode_ci,
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `OrderIndex` int NOT NULL DEFAULT '0',
  `MapDifficultyID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `map_difficulty_x_condition` (`ID`, `FailureDescription`, `PlayerConditionID`, `OrderIndex`, `MapDifficultyID`, `VerifiedBuild`) VALUES (1726, '', 83965, 1, 4751, 59888);


-- ==========================================
-- Table: map_difficulty_x_condition_locale
-- ==========================================
CREATE TABLE `map_difficulty_x_condition_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FailureDescription_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `map_difficulty_x_condition_locale` (`ID`, `locale`, `FailureDescription_lang`, `VerifiedBuild`) VALUES (1726, 'deDE', '', 59888);


-- ==========================================
-- Table: map_locale
-- ==========================================
CREATE TABLE `map_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MapName_lang` text COLLATE utf8mb4_unicode_ci,
  `MapDescription0_lang` text COLLATE utf8mb4_unicode_ci,
  `MapDescription1_lang` text COLLATE utf8mb4_unicode_ci,
  `PvpShortDescription_lang` text COLLATE utf8mb4_unicode_ci,
  `PvpLongDescription_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `map_locale` (`ID`, `locale`, `MapName_lang`, `MapDescription0_lang`, `MapDescription1_lang`, `PvpShortDescription_lang`, `PvpLongDescription_lang`, `VerifiedBuild`) VALUES (1882, 'deDE', 'Insel der Sirenen', 'Insel der Sirenen', NULL, NULL, NULL, 0);


-- ==========================================
-- Table: maw_power
-- ==========================================
CREATE TABLE `maw_power` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `MawPowerRarityID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table maw_power is empty)


-- ==========================================
-- Table: mcr_slot_x_mcr_category
-- ==========================================
CREATE TABLE `mcr_slot_x_mcr_category` (
  `ID` int unsigned NOT NULL,
  `ModifiedCraftingCategoryID` int NOT NULL DEFAULT '0',
  `Order` int NOT NULL DEFAULT '0',
  `ModifiedCraftingReagentSlotID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table mcr_slot_x_mcr_category is empty)


-- ==========================================
-- Table: model_file_data
-- ==========================================
CREATE TABLE `model_file_data` (
  `Geobox1` float NOT NULL DEFAULT '0',
  `Geobox2` float NOT NULL DEFAULT '0',
  `Geobox3` float NOT NULL DEFAULT '0',
  `Geobox4` float NOT NULL DEFAULT '0',
  `Geobox5` float NOT NULL DEFAULT '0',
  `Geobox6` float NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `LogCount` tinyint unsigned NOT NULL DEFAULT '0',
  `ModelID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  `ModelResourcesID` int NOT NULL,
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `model_file_data` (`Geobox1`, `Geobox2`, `Geobox3`, `Geobox4`, `Geobox5`, `Geobox6`, `ID`, `Flags`, `LogCount`, `ModelID`, `VerifiedBuild`, `ModelResourcesID`) VALUES (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 8000000, 0, 0, 8000000, 12345, 0);


-- ==========================================
-- Table: modified_crafting_category
-- ==========================================
CREATE TABLE `modified_crafting_category` (
  `ID` int unsigned NOT NULL,
  `DisplayName` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Field_9_0_1_33978_001` int NOT NULL DEFAULT '0',
  `MatQualityWeight` int NOT NULL DEFAULT '0',
  `Field_10_0_0_44649_004` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table modified_crafting_category is empty)


-- ==========================================
-- Table: modified_crafting_category_locale
-- ==========================================
CREATE TABLE `modified_crafting_category_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DisplayName_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table modified_crafting_category_locale is empty)


-- ==========================================
-- Table: modified_crafting_item
-- ==========================================
CREATE TABLE `modified_crafting_item` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ModifiedCraftingReagentItemID` int NOT NULL DEFAULT '0',
  `CraftingQualityID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `modified_crafting_item` (`ID`, `ModifiedCraftingReagentItemID`, `CraftingQualityID`, `VerifiedBuild`) VALUES (208564, 338, 0, 64270);


-- ==========================================
-- Table: modified_crafting_reagent_item
-- ==========================================
CREATE TABLE `modified_crafting_reagent_item` (
  `ID` int unsigned NOT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `ModifiedCraftingCategoryID` int NOT NULL DEFAULT '0',
  `ItemBonusTreeID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `Field_9_1_0_38511_004` int NOT NULL DEFAULT '0',
  `ItemContextOffset` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table modified_crafting_reagent_item is empty)


-- ==========================================
-- Table: modified_crafting_reagent_item_locale
-- ==========================================
CREATE TABLE `modified_crafting_reagent_item_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table modified_crafting_reagent_item_locale is empty)


-- ==========================================
-- Table: modified_crafting_reagent_slot
-- ==========================================
CREATE TABLE `modified_crafting_reagent_slot` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL,
  `Field_9_0_1_33978_001` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `ReagentType` int NOT NULL DEFAULT '0',
  `Field_10_0_2_46091_005` int NOT NULL DEFAULT '0',
  `Field_11_2_0_61476_006` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table modified_crafting_reagent_slot is empty)


-- ==========================================
-- Table: modified_crafting_reagent_slot_locale
-- ==========================================
CREATE TABLE `modified_crafting_reagent_slot_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table modified_crafting_reagent_slot_locale is empty)


-- ==========================================
-- Table: modified_crafting_spell_slot
-- ==========================================
CREATE TABLE `modified_crafting_spell_slot` (
  `ID` int unsigned NOT NULL,
  `SpellID` int NOT NULL DEFAULT '0',
  `Slot` int NOT NULL DEFAULT '0',
  `ModifiedCraftingReagentSlotID` int NOT NULL DEFAULT '0',
  `Field_9_0_1_35679_003` int NOT NULL DEFAULT '0',
  `ReagentCount` int NOT NULL DEFAULT '0',
  `ReagentReCraftCount` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table modified_crafting_spell_slot is empty)


-- ==========================================
-- Table: modifier_tree
-- ==========================================
CREATE TABLE `modifier_tree` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Parent` int unsigned NOT NULL DEFAULT '0',
  `Operator` tinyint NOT NULL DEFAULT '0',
  `Amount` tinyint NOT NULL DEFAULT '0',
  `Type` int NOT NULL DEFAULT '0',
  `Asset` int NOT NULL DEFAULT '0',
  `SecondaryAsset` int NOT NULL DEFAULT '0',
  `TertiaryAsset` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `modifier_tree` (`ID`, `Parent`, `Operator`, `Amount`, `Type`, `Asset`, `SecondaryAsset`, `TertiaryAsset`, `VerifiedBuild`) VALUES (30481, 0, 8, 1, 0, 0, 0, 0, 64270);


-- ==========================================
-- Table: mount
-- ==========================================
CREATE TABLE `mount` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `SourceText` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MountTypeID` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `SourceTypeEnum` tinyint NOT NULL DEFAULT '0',
  `SourceSpellID` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `MountFlyRideHeight` float NOT NULL DEFAULT '0',
  `UiModelSceneID` int NOT NULL DEFAULT '0',
  `MountSpecialRiderAnimKitID` int NOT NULL DEFAULT '0',
  `MountSpecialSpellVisualKitID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `mount` (`Name`, `SourceText`, `Description`, `ID`, `MountTypeID`, `Flags`, `SourceTypeEnum`, `SourceSpellID`, `PlayerConditionID`, `MountFlyRideHeight`, `UiModelSceneID`, `MountSpecialRiderAnimKitID`, `MountSpecialSpellVisualKitID`, `VerifiedBuild`) VALUES ('Vengeance', '|cFFFFD200Drop:|r Lady Sylvanas Windrunner|n|cFFFFD200Zone:|r Sanctum of Domination|n|cFFFFD200Difficulty:|r Mythic', 'Sylvanas lost a part of herself the day Arthas took her life, and the darkness within her grew to fill the void.', 1471, 424, 128, 6, 351195, 0, 0.0, 4, 0, 0, 59888);


-- ==========================================
-- Table: mount_capability
-- ==========================================
CREATE TABLE `mount_capability` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ReqRidingSkill` smallint unsigned NOT NULL DEFAULT '0',
  `ReqAreaID` smallint unsigned NOT NULL DEFAULT '0',
  `ReqSpellAuraID` int unsigned NOT NULL DEFAULT '0',
  `ReqSpellKnownID` int NOT NULL DEFAULT '0',
  `ModSpellAuraID` int NOT NULL DEFAULT '0',
  `ReqMapID` smallint NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `FlightCapabilityID` int NOT NULL DEFAULT '0',
  `DriveCapabilityID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table mount_capability is empty)


-- ==========================================
-- Table: mount_equipment
-- ==========================================
CREATE TABLE `mount_equipment` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Item` int NOT NULL DEFAULT '0',
  `BuffSpell` int NOT NULL DEFAULT '0',
  `Unknown820` int NOT NULL DEFAULT '0',
  `LearnedBySpell` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table mount_equipment is empty)


-- ==========================================
-- Table: mount_locale
-- ==========================================
CREATE TABLE `mount_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `SourceText_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `mount_locale` (`ID`, `locale`, `Name_lang`, `SourceText_lang`, `Description_lang`, `VerifiedBuild`) VALUES (1471, 'deDE', 'Rache', '|cFFFFD200Beute von:|r Fürstin Sylvanas Windläufer|n|cFFFFD200Zone:|r Sanktum der Herrschaft|n|cFFFFD200Schwierigkeitsgrad:|r Mythisch', 'Sylvanas verlor einen Teil ihrer selbst, als Arthas ihr das Leben nahm, und die Dunkelheit in ihr wuchs an, um die Leere auszufüllen.', 59888);


-- ==========================================
-- Table: mount_type_x_capability
-- ==========================================
CREATE TABLE `mount_type_x_capability` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MountTypeID` smallint unsigned NOT NULL DEFAULT '0',
  `MountCapabilityID` smallint unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table mount_type_x_capability is empty)


-- ==========================================
-- Table: mount_x_display
-- ==========================================
CREATE TABLE `mount_x_display` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `CreatureDisplayInfoID` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `Unknown1100` smallint unsigned NOT NULL DEFAULT '0',
  `MountID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table mount_x_display is empty)


-- ==========================================
-- Table: movie
-- ==========================================
CREATE TABLE `movie` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Volume` tinyint unsigned NOT NULL DEFAULT '0',
  `KeyID` tinyint unsigned NOT NULL DEFAULT '0',
  `AudioFileDataID` int unsigned NOT NULL DEFAULT '0',
  `SubtitleFileDataID` int unsigned NOT NULL DEFAULT '0',
  `SubtitleFileFormat` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table movie is empty)


-- ==========================================
-- Table: mythic_plus_season
-- ==========================================
CREATE TABLE `mythic_plus_season` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MilestoneSeason` int NOT NULL DEFAULT '0',
  `StartTimeEvent` int NOT NULL DEFAULT '0',
  `ExpansionLevel` int NOT NULL DEFAULT '0',
  `HeroicLFGDungeonMinGear` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `mythic_plus_season` (`ID`, `MilestoneSeason`, `StartTimeEvent`, `ExpansionLevel`, `HeroicLFGDungeonMinGear`, `VerifiedBuild`) VALUES (103, 101, 576, 10, 300, 59000);


-- ==========================================
-- Table: name_gen
-- ==========================================
CREATE TABLE `name_gen` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `RaceID` tinyint NOT NULL DEFAULT '0',
  `Sex` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table name_gen is empty)


-- ==========================================
-- Table: names_profanity
-- ==========================================
CREATE TABLE `names_profanity` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Language` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table names_profanity is empty)


-- ==========================================
-- Table: names_reserved
-- ==========================================
CREATE TABLE `names_reserved` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table names_reserved is empty)


-- ==========================================
-- Table: names_reserved_locale
-- ==========================================
CREATE TABLE `names_reserved_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `LocaleMask` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table names_reserved_locale is empty)


-- ==========================================
-- Table: npc_model_item_slot_display_info
-- ==========================================
CREATE TABLE `npc_model_item_slot_display_info` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DisplayID` int unsigned NOT NULL DEFAULT '0',
  `Slot` tinyint unsigned NOT NULL DEFAULT '0',
  `ExtendedDisplayID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table npc_model_item_slot_display_info is empty)


-- ==========================================
-- Table: npc_sounds
-- ==========================================
CREATE TABLE `npc_sounds` (
  `ID` int unsigned NOT NULL,
  `hello` int unsigned NOT NULL DEFAULT '0',
  `goodbye` int unsigned NOT NULL DEFAULT '0',
  `pissed` int unsigned NOT NULL DEFAULT '0',
  `ack` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table npc_sounds is empty)


-- ==========================================
-- Table: num_talents_at_level
-- ==========================================
CREATE TABLE `num_talents_at_level` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `NumTalents` int NOT NULL DEFAULT '0',
  `NumTalentsDeathKnight` int NOT NULL DEFAULT '0',
  `NumTalentsDemonHunter` int NOT NULL DEFAULT '0',
  `Unknown1115` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table num_talents_at_level is empty)


-- ==========================================
-- Table: override_spell_data
-- ==========================================
CREATE TABLE `override_spell_data` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Spells1` int NOT NULL DEFAULT '0',
  `Spells2` int NOT NULL DEFAULT '0',
  `Spells3` int NOT NULL DEFAULT '0',
  `Spells4` int NOT NULL DEFAULT '0',
  `Spells5` int NOT NULL DEFAULT '0',
  `Spells6` int NOT NULL DEFAULT '0',
  `Spells7` int NOT NULL DEFAULT '0',
  `Spells8` int NOT NULL DEFAULT '0',
  `Spells9` int NOT NULL DEFAULT '0',
  `Spells10` int NOT NULL DEFAULT '0',
  `PlayerActionBarFileDataID` int NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `override_spell_data` (`ID`, `Spells1`, `Spells2`, `Spells3`, `Spells4`, `Spells5`, `Spells6`, `Spells7`, `Spells8`, `Spells9`, `Spells10`, `PlayerActionBarFileDataID`, `Flags`, `VerifiedBuild`) VALUES (1, 40430, 59351, 31262, 61721, 642, 0, 0, 0, 0, 0, 534044, 5, 0);


-- ==========================================
-- Table: paragon_reputation
-- ==========================================
CREATE TABLE `paragon_reputation` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `FactionID` int NOT NULL DEFAULT '0',
  `LevelThreshold` int NOT NULL DEFAULT '0',
  `QuestID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table paragon_reputation is empty)


-- ==========================================
-- Table: path
-- ==========================================
CREATE TABLE `path` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `SplineType` tinyint unsigned NOT NULL DEFAULT '0',
  `Red` tinyint unsigned NOT NULL DEFAULT '0',
  `Green` tinyint unsigned NOT NULL DEFAULT '0',
  `Blue` tinyint unsigned NOT NULL DEFAULT '0',
  `Alpha` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table path is empty)


-- ==========================================
-- Table: path_node
-- ==========================================
CREATE TABLE `path_node` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PathID` smallint unsigned NOT NULL DEFAULT '0',
  `Sequence` smallint NOT NULL DEFAULT '0',
  `LocationID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table path_node is empty)


-- ==========================================
-- Table: path_property
-- ==========================================
CREATE TABLE `path_property` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PathID` smallint unsigned NOT NULL DEFAULT '0',
  `PropertyIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `Value` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table path_property is empty)


-- ==========================================
-- Table: perks_activity
-- ==========================================
CREATE TABLE `perks_activity` (
  `ActivityName` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `CriteriaTreeID` int NOT NULL DEFAULT '0',
  `ThresholdContributionAmount` int NOT NULL DEFAULT '0',
  `Supersedes` int NOT NULL DEFAULT '0',
  `Priority` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table perks_activity is empty)


-- ==========================================
-- Table: perks_activity_locale
-- ==========================================
CREATE TABLE `perks_activity_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ActivityName_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table perks_activity_locale is empty)


-- ==========================================
-- Table: phase
-- ==========================================
CREATE TABLE `phase` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `phase` (`ID`, `Flags`, `VerifiedBuild`) VALUES (180, 20, 0);


-- ==========================================
-- Table: phase_x_phase_group
-- ==========================================
CREATE TABLE `phase_x_phase_group` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PhaseID` smallint unsigned NOT NULL DEFAULT '0',
  `PhaseGroupID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table phase_x_phase_group is empty)


-- ==========================================
-- Table: player_condition
-- ==========================================
CREATE TABLE `player_condition` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `RaceMask` bigint NOT NULL DEFAULT '0',
  `FailureDescription` text COLLATE utf8mb4_unicode_ci,
  `MinLevel` smallint unsigned NOT NULL DEFAULT '0',
  `MaxLevel` smallint unsigned NOT NULL DEFAULT '0',
  `ClassMask` int NOT NULL DEFAULT '0',
  `SkillLogic` int unsigned NOT NULL DEFAULT '0',
  `LanguageID` int NOT NULL DEFAULT '0',
  `MinLanguage` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxLanguage` int NOT NULL DEFAULT '0',
  `MaxFactionID` smallint unsigned NOT NULL DEFAULT '0',
  `MaxReputation` tinyint unsigned NOT NULL DEFAULT '0',
  `ReputationLogic` int unsigned NOT NULL DEFAULT '0',
  `CurrentPvpFaction` tinyint NOT NULL DEFAULT '0',
  `PvpMedal` tinyint unsigned NOT NULL DEFAULT '0',
  `PrevQuestLogic` int unsigned NOT NULL DEFAULT '0',
  `CurrQuestLogic` int unsigned NOT NULL DEFAULT '0',
  `CurrentCompletedQuestLogic` int unsigned NOT NULL DEFAULT '0',
  `SpellLogic` int unsigned NOT NULL DEFAULT '0',
  `ItemLogic` int unsigned NOT NULL DEFAULT '0',
  `ItemFlags` int NOT NULL DEFAULT '0',
  `AuraSpellLogic` int unsigned NOT NULL DEFAULT '0',
  `WorldStateExpressionID` smallint unsigned NOT NULL DEFAULT '0',
  `WeatherID` int NOT NULL DEFAULT '0',
  `PartyStatus` tinyint unsigned NOT NULL DEFAULT '0',
  `LifetimeMaxPVPRank` tinyint NOT NULL DEFAULT '0',
  `AchievementLogic` int unsigned NOT NULL DEFAULT '0',
  `Gender` tinyint NOT NULL DEFAULT '0',
  `NativeGender` tinyint NOT NULL DEFAULT '0',
  `AreaLogic` int unsigned NOT NULL DEFAULT '0',
  `LfgLogic` int unsigned NOT NULL DEFAULT '0',
  `CurrencyLogic` int unsigned NOT NULL DEFAULT '0',
  `QuestKillID` int NOT NULL DEFAULT '0',
  `QuestKillLogic` int unsigned NOT NULL DEFAULT '0',
  `MinExpansionLevel` tinyint NOT NULL DEFAULT '0',
  `MaxExpansionLevel` tinyint NOT NULL DEFAULT '0',
  `MinAvgItemLevel` int NOT NULL DEFAULT '0',
  `MaxAvgItemLevel` int NOT NULL DEFAULT '0',
  `MinAvgEquippedItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `MaxAvgEquippedItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `PhaseUseFlags` int NOT NULL DEFAULT '0',
  `PhaseID` smallint unsigned NOT NULL DEFAULT '0',
  `PhaseGroupID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ChrSpecializationIndex` tinyint NOT NULL DEFAULT '0',
  `ChrSpecializationRole` tinyint NOT NULL DEFAULT '0',
  `ModifierTreeID` int unsigned NOT NULL DEFAULT '0',
  `PowerType` tinyint NOT NULL DEFAULT '0',
  `PowerTypeComp` tinyint unsigned NOT NULL DEFAULT '0',
  `PowerTypeValue` tinyint unsigned NOT NULL DEFAULT '0',
  `WeaponSubclassMask` int NOT NULL DEFAULT '0',
  `MaxGuildLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `MinGuildLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxExpansionTier` tinyint NOT NULL DEFAULT '0',
  `MinExpansionTier` tinyint NOT NULL DEFAULT '0',
  `MinPVPRank` tinyint NOT NULL DEFAULT '0',
  `MaxPVPRank` tinyint NOT NULL DEFAULT '0',
  `ContentTuningID` int NOT NULL DEFAULT '0',
  `CovenantID` int NOT NULL DEFAULT '0',
  `TraitNodeEntryLogic` int unsigned NOT NULL DEFAULT '0',
  `SkillID1` smallint unsigned NOT NULL DEFAULT '0',
  `SkillID2` smallint unsigned NOT NULL DEFAULT '0',
  `SkillID3` smallint unsigned NOT NULL DEFAULT '0',
  `SkillID4` smallint unsigned NOT NULL DEFAULT '0',
  `MinSkill1` smallint unsigned NOT NULL DEFAULT '0',
  `MinSkill2` smallint unsigned NOT NULL DEFAULT '0',
  `MinSkill3` smallint unsigned NOT NULL DEFAULT '0',
  `MinSkill4` smallint unsigned NOT NULL DEFAULT '0',
  `MaxSkill1` smallint unsigned NOT NULL DEFAULT '0',
  `MaxSkill2` smallint unsigned NOT NULL DEFAULT '0',
  `MaxSkill3` smallint unsigned NOT NULL DEFAULT '0',
  `MaxSkill4` smallint unsigned NOT NULL DEFAULT '0',
  `MinFactionID1` int unsigned NOT NULL DEFAULT '0',
  `MinFactionID2` int unsigned NOT NULL DEFAULT '0',
  `MinFactionID3` int unsigned NOT NULL DEFAULT '0',
  `MinReputation1` tinyint unsigned NOT NULL DEFAULT '0',
  `MinReputation2` tinyint unsigned NOT NULL DEFAULT '0',
  `MinReputation3` tinyint unsigned NOT NULL DEFAULT '0',
  `PrevQuestID1` int NOT NULL DEFAULT '0',
  `PrevQuestID2` int NOT NULL DEFAULT '0',
  `PrevQuestID3` int NOT NULL DEFAULT '0',
  `PrevQuestID4` int NOT NULL DEFAULT '0',
  `CurrQuestID1` int NOT NULL DEFAULT '0',
  `CurrQuestID2` int NOT NULL DEFAULT '0',
  `CurrQuestID3` int NOT NULL DEFAULT '0',
  `CurrQuestID4` int NOT NULL DEFAULT '0',
  `CurrentCompletedQuestID1` int NOT NULL DEFAULT '0',
  `CurrentCompletedQuestID2` int NOT NULL DEFAULT '0',
  `CurrentCompletedQuestID3` int NOT NULL DEFAULT '0',
  `CurrentCompletedQuestID4` int NOT NULL DEFAULT '0',
  `SpellID1` int NOT NULL DEFAULT '0',
  `SpellID2` int NOT NULL DEFAULT '0',
  `SpellID3` int NOT NULL DEFAULT '0',
  `SpellID4` int NOT NULL DEFAULT '0',
  `ItemID1` int NOT NULL DEFAULT '0',
  `ItemID2` int NOT NULL DEFAULT '0',
  `ItemID3` int NOT NULL DEFAULT '0',
  `ItemID4` int NOT NULL DEFAULT '0',
  `ItemCount1` int unsigned NOT NULL DEFAULT '0',
  `ItemCount2` int unsigned NOT NULL DEFAULT '0',
  `ItemCount3` int unsigned NOT NULL DEFAULT '0',
  `ItemCount4` int unsigned NOT NULL DEFAULT '0',
  `Explored1` smallint unsigned NOT NULL DEFAULT '0',
  `Explored2` smallint unsigned NOT NULL DEFAULT '0',
  `Time1` int unsigned NOT NULL DEFAULT '0',
  `Time2` int unsigned NOT NULL DEFAULT '0',
  `AuraSpellID1` int NOT NULL DEFAULT '0',
  `AuraSpellID2` int NOT NULL DEFAULT '0',
  `AuraSpellID3` int NOT NULL DEFAULT '0',
  `AuraSpellID4` int NOT NULL DEFAULT '0',
  `AuraStacks1` tinyint unsigned NOT NULL DEFAULT '0',
  `AuraStacks2` tinyint unsigned NOT NULL DEFAULT '0',
  `AuraStacks3` tinyint unsigned NOT NULL DEFAULT '0',
  `AuraStacks4` tinyint unsigned NOT NULL DEFAULT '0',
  `Achievement1` int unsigned NOT NULL DEFAULT '0',
  `Achievement2` int unsigned NOT NULL DEFAULT '0',
  `Achievement3` int unsigned NOT NULL DEFAULT '0',
  `Achievement4` int unsigned NOT NULL DEFAULT '0',
  `AreaID1` smallint unsigned NOT NULL DEFAULT '0',
  `AreaID2` smallint unsigned NOT NULL DEFAULT '0',
  `AreaID3` smallint unsigned NOT NULL DEFAULT '0',
  `AreaID4` smallint unsigned NOT NULL DEFAULT '0',
  `LfgStatus1` tinyint unsigned NOT NULL DEFAULT '0',
  `LfgStatus2` tinyint unsigned NOT NULL DEFAULT '0',
  `LfgStatus3` tinyint unsigned NOT NULL DEFAULT '0',
  `LfgStatus4` tinyint unsigned NOT NULL DEFAULT '0',
  `LfgCompare1` tinyint unsigned NOT NULL DEFAULT '0',
  `LfgCompare2` tinyint unsigned NOT NULL DEFAULT '0',
  `LfgCompare3` tinyint unsigned NOT NULL DEFAULT '0',
  `LfgCompare4` tinyint unsigned NOT NULL DEFAULT '0',
  `LfgValue1` int unsigned NOT NULL DEFAULT '0',
  `LfgValue2` int unsigned NOT NULL DEFAULT '0',
  `LfgValue3` int unsigned NOT NULL DEFAULT '0',
  `LfgValue4` int unsigned NOT NULL DEFAULT '0',
  `CurrencyID1` int unsigned NOT NULL DEFAULT '0',
  `CurrencyID2` int unsigned NOT NULL DEFAULT '0',
  `CurrencyID3` int unsigned NOT NULL DEFAULT '0',
  `CurrencyID4` int unsigned NOT NULL DEFAULT '0',
  `CurrencyCount1` int unsigned NOT NULL DEFAULT '0',
  `CurrencyCount2` int unsigned NOT NULL DEFAULT '0',
  `CurrencyCount3` int unsigned NOT NULL DEFAULT '0',
  `CurrencyCount4` int unsigned NOT NULL DEFAULT '0',
  `QuestKillMonster1` int unsigned NOT NULL DEFAULT '0',
  `QuestKillMonster2` int unsigned NOT NULL DEFAULT '0',
  `QuestKillMonster3` int unsigned NOT NULL DEFAULT '0',
  `QuestKillMonster4` int unsigned NOT NULL DEFAULT '0',
  `QuestKillMonster5` int unsigned NOT NULL DEFAULT '0',
  `QuestKillMonster6` int unsigned NOT NULL DEFAULT '0',
  `MovementFlags1` int NOT NULL DEFAULT '0',
  `MovementFlags2` int NOT NULL DEFAULT '0',
  `TraitNodeEntryID1` int NOT NULL DEFAULT '0',
  `TraitNodeEntryID2` int NOT NULL DEFAULT '0',
  `TraitNodeEntryID3` int NOT NULL DEFAULT '0',
  `TraitNodeEntryID4` int NOT NULL DEFAULT '0',
  `TraitNodeEntryMinRank1` smallint unsigned NOT NULL DEFAULT '0',
  `TraitNodeEntryMinRank2` smallint unsigned NOT NULL DEFAULT '0',
  `TraitNodeEntryMinRank3` smallint unsigned NOT NULL DEFAULT '0',
  `TraitNodeEntryMinRank4` smallint unsigned NOT NULL DEFAULT '0',
  `TraitNodeEntryMaxRank1` smallint unsigned NOT NULL DEFAULT '0',
  `TraitNodeEntryMaxRank2` smallint unsigned NOT NULL DEFAULT '0',
  `TraitNodeEntryMaxRank3` smallint unsigned NOT NULL DEFAULT '0',
  `TraitNodeEntryMaxRank4` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `player_condition` (`ID`, `RaceMask`, `FailureDescription`, `MinLevel`, `MaxLevel`, `ClassMask`, `SkillLogic`, `LanguageID`, `MinLanguage`, `MaxLanguage`, `MaxFactionID`, `MaxReputation`, `ReputationLogic`, `CurrentPvpFaction`, `PvpMedal`, `PrevQuestLogic`, `CurrQuestLogic`, `CurrentCompletedQuestLogic`, `SpellLogic`, `ItemLogic`, `ItemFlags`, `AuraSpellLogic`, `WorldStateExpressionID`, `WeatherID`, `PartyStatus`, `LifetimeMaxPVPRank`, `AchievementLogic`, `Gender`, `NativeGender`, `AreaLogic`, `LfgLogic`, `CurrencyLogic`, `QuestKillID`, `QuestKillLogic`, `MinExpansionLevel`, `MaxExpansionLevel`, `MinAvgItemLevel`, `MaxAvgItemLevel`, `MinAvgEquippedItemLevel`, `MaxAvgEquippedItemLevel`, `PhaseUseFlags`, `PhaseID`, `PhaseGroupID`, `Flags`, `ChrSpecializationIndex`, `ChrSpecializationRole`, `ModifierTreeID`, `PowerType`, `PowerTypeComp`, `PowerTypeValue`, `WeaponSubclassMask`, `MaxGuildLevel`, `MinGuildLevel`, `MaxExpansionTier`, `MinExpansionTier`, `MinPVPRank`, `MaxPVPRank`, `ContentTuningID`, `CovenantID`, `TraitNodeEntryLogic`, `SkillID1`, `SkillID2`, `SkillID3`, `SkillID4`, `MinSkill1`, `MinSkill2`, `MinSkill3`, `MinSkill4`, `MaxSkill1`, `MaxSkill2`, `MaxSkill3`, `MaxSkill4`, `MinFactionID1`, `MinFactionID2`, `MinFactionID3`, `MinReputation1`, `MinReputation2`, `MinReputation3`, `PrevQuestID1`, `PrevQuestID2`, `PrevQuestID3`, `PrevQuestID4`, `CurrQuestID1`, `CurrQuestID2`, `CurrQuestID3`, `CurrQuestID4`, `CurrentCompletedQuestID1`, `CurrentCompletedQuestID2`, `CurrentCompletedQuestID3`, `CurrentCompletedQuestID4`, `SpellID1`, `SpellID2`, `SpellID3`, `SpellID4`, `ItemID1`, `ItemID2`, `ItemID3`, `ItemID4`, `ItemCount1`, `ItemCount2`, `ItemCount3`, `ItemCount4`, `Explored1`, `Explored2`, `Time1`, `Time2`, `AuraSpellID1`, `AuraSpellID2`, `AuraSpellID3`, `AuraSpellID4`, `AuraStacks1`, `AuraStacks2`, `AuraStacks3`, `AuraStacks4`, `Achievement1`, `Achievement2`, `Achievement3`, `Achievement4`, `AreaID1`, `AreaID2`, `AreaID3`, `AreaID4`, `LfgStatus1`, `LfgStatus2`, `LfgStatus3`, `LfgStatus4`, `LfgCompare1`, `LfgCompare2`, `LfgCompare3`, `LfgCompare4`, `LfgValue1`, `LfgValue2`, `LfgValue3`, `LfgValue4`, `CurrencyID1`, `CurrencyID2`, `CurrencyID3`, `CurrencyID4`, `CurrencyCount1`, `CurrencyCount2`, `CurrencyCount3`, `CurrencyCount4`, `QuestKillMonster1`, `QuestKillMonster2`, `QuestKillMonster3`, `QuestKillMonster4`, `QuestKillMonster5`, `QuestKillMonster6`, `MovementFlags1`, `MovementFlags2`, `TraitNodeEntryID1`, `TraitNodeEntryID2`, `TraitNodeEntryID3`, `TraitNodeEntryID4`, `TraitNodeEntryMinRank1`, `TraitNodeEntryMinRank2`, `TraitNodeEntryMinRank3`, `TraitNodeEntryMinRank4`, `TraitNodeEntryMaxRank1`, `TraitNodeEntryMaxRank2`, `TraitNodeEntryMaxRank3`, `TraitNodeEntryMaxRank4`, `VerifiedBuild`) VALUES (38948, 0, '', 110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 1, -1, -1, 429474, -1, 0, 0, 0, 0, 0, -1, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41694, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64270);


-- ==========================================
-- Table: player_condition_locale
-- ==========================================
CREATE TABLE `player_condition_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FailureDescription_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `player_condition_locale` (`ID`, `locale`, `FailureDescription_lang`, `VerifiedBuild`) VALUES (86994, 'deDE', '', 59888);


-- ==========================================
-- Table: player_data_element_account
-- ==========================================
CREATE TABLE `player_data_element_account` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `StorageIndex` int NOT NULL DEFAULT '0',
  `Type` int NOT NULL DEFAULT '0',
  `Unknown1125` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table player_data_element_account is empty)


-- ==========================================
-- Table: player_data_element_character
-- ==========================================
CREATE TABLE `player_data_element_character` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `StorageIndex` int NOT NULL DEFAULT '0',
  `Type` int NOT NULL DEFAULT '0',
  `Unknown1125` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `player_data_element_character` (`ID`, `StorageIndex`, `Type`, `Unknown1125`, `VerifiedBuild`) VALUES (378, 368, 0, 0, 64270);


-- ==========================================
-- Table: player_data_flag_account
-- ==========================================
CREATE TABLE `player_data_flag_account` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `StorageIndex` int NOT NULL DEFAULT '0',
  `Unknown1107` int NOT NULL DEFAULT '0',
  `Unknown1125` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table player_data_flag_account is empty)


-- ==========================================
-- Table: player_data_flag_character
-- ==========================================
CREATE TABLE `player_data_flag_character` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `StorageIndex` int NOT NULL DEFAULT '0',
  `Unknown1107` int NOT NULL DEFAULT '0',
  `Unknown1125` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table player_data_flag_character is empty)


-- ==========================================
-- Table: pool_members
-- ==========================================
CREATE TABLE `pool_members` (
  `type` smallint unsigned NOT NULL,
  `spawnId` bigint unsigned NOT NULL,
  `poolSpawnId` int unsigned NOT NULL,
  `chance` float NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`type`,`spawnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pool_members` (`type`, `spawnId`, `poolSpawnId`, `chance`, `description`) VALUES (0, 12160, 773, 0.0, 'Sethekk Halls - Sethekk Prophet / Sethekk Shaman - Sethekk Prophet');


-- ==========================================
-- Table: pool_template
-- ==========================================
CREATE TABLE `pool_template` (
  `entry` int unsigned NOT NULL DEFAULT '0' COMMENT 'Pool entry',
  `max_limit` int unsigned NOT NULL DEFAULT '0' COMMENT 'Max number of objects (0) is no limit',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (1, 1, '');


-- ==========================================
-- Table: power_display
-- ==========================================
CREATE TABLE `power_display` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `GlobalStringBaseTag` text COLLATE utf8mb4_unicode_ci,
  `ActualType` tinyint NOT NULL DEFAULT '0',
  `Red` tinyint unsigned NOT NULL DEFAULT '0',
  `Green` tinyint unsigned NOT NULL DEFAULT '0',
  `Blue` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table power_display is empty)


-- ==========================================
-- Table: power_type
-- ==========================================
CREATE TABLE `power_type` (
  `NameGlobalStringTag` text COLLATE utf8mb4_unicode_ci,
  `CostGlobalStringTag` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PowerTypeEnum` tinyint NOT NULL DEFAULT '0',
  `MinPower` int NOT NULL DEFAULT '0',
  `MaxBasePower` int NOT NULL DEFAULT '0',
  `CenterPower` int NOT NULL DEFAULT '0',
  `DefaultPower` int NOT NULL DEFAULT '0',
  `DisplayModifier` int NOT NULL DEFAULT '0',
  `RegenInterruptTimeMS` int NOT NULL DEFAULT '0',
  `RegenPeace` float NOT NULL DEFAULT '0',
  `RegenCombat` float NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table power_type is empty)


-- ==========================================
-- Table: prestige_level_info
-- ==========================================
CREATE TABLE `prestige_level_info` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `PrestigeLevel` int NOT NULL DEFAULT '0',
  `BadgeTextureFileDataID` int NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `AwardedAchievementID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table prestige_level_info is empty)


-- ==========================================
-- Table: prestige_level_info_locale
-- ==========================================
CREATE TABLE `prestige_level_info_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table prestige_level_info_locale is empty)


-- ==========================================
-- Table: prospecting_loot_template
-- ==========================================
CREATE TABLE `prospecting_loot_template` (
  `Entry` int unsigned NOT NULL DEFAULT '0',
  `ItemType` tinyint NOT NULL DEFAULT '0',
  `Item` int unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` tinyint unsigned NOT NULL DEFAULT '1',
  `MaxCount` tinyint unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `idx_primary` (`Entry`,`ItemType`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

INSERT INTO `prospecting_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES (2770, 0, 774, 0.0, 0, 1, 1, 1, 1, NULL);


-- ==========================================
-- Table: pvp_bracket_types
-- ==========================================
CREATE TABLE `pvp_bracket_types` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `BracketID` tinyint NOT NULL DEFAULT '0',
  `WeeklyQuestID_0` int NOT NULL DEFAULT '0',
  `WeeklyQuestID_1` int NOT NULL DEFAULT '0',
  `WeeklyQuestID_2` int NOT NULL DEFAULT '0',
  `WeeklyQuestID_3` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table pvp_bracket_types is empty)


-- ==========================================
-- Table: pvp_difficulty
-- ==========================================
CREATE TABLE `pvp_difficulty` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `RangeIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `MinLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `MapID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pvp_difficulty` (`ID`, `RangeIndex`, `MinLevel`, `MaxLevel`, `MapID`, `VerifiedBuild`) VALUES (1199, 7, 80, 80, 1552, 59888);


-- ==========================================
-- Table: pvp_item
-- ==========================================
CREATE TABLE `pvp_item` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemID` int NOT NULL DEFAULT '0',
  `ItemLevelDelta` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table pvp_item is empty)


-- ==========================================
-- Table: pvp_season
-- ==========================================
CREATE TABLE `pvp_season` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MilestoneSeason` int NOT NULL DEFAULT '0',
  `AllianceAchievementID` int NOT NULL DEFAULT '0',
  `HordeAchievementID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pvp_season` (`ID`, `MilestoneSeason`, `AllianceAchievementID`, `HordeAchievementID`, `VerifiedBuild`) VALUES (37, 102, 42043, 42042, 59000);


-- ==========================================
-- Table: pvp_stat
-- ==========================================
CREATE TABLE `pvp_stat` (
  `Description` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MapID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table pvp_stat is empty)


-- ==========================================
-- Table: pvp_stat_locale
-- ==========================================
CREATE TABLE `pvp_stat_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table pvp_stat_locale is empty)


-- ==========================================
-- Table: pvp_talent
-- ==========================================
CREATE TABLE `pvp_talent` (
  `Description` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpecID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `OverridesSpellID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ActionBarSpellID` int NOT NULL DEFAULT '0',
  `PvpTalentCategoryID` int NOT NULL DEFAULT '0',
  `LevelRequired` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pvp_talent` (`Description`, `ID`, `SpecID`, `SpellID`, `OverridesSpellID`, `Flags`, `ActionBarSpellID`, `PvpTalentCategoryID`, `LevelRequired`, `PlayerConditionID`, `VerifiedBuild`) VALUES (NULL, 15, 265, 248855, 0, 0, 0, 2, 49, 103501, 0);


-- ==========================================
-- Table: pvp_talent_category
-- ==========================================
CREATE TABLE `pvp_talent_category` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TalentSlotMask` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pvp_talent_category` (`ID`, `TalentSlotMask`, `VerifiedBuild`) VALUES (1, 1, 64502);


-- ==========================================
-- Table: pvp_talent_locale
-- ==========================================
CREATE TABLE `pvp_talent_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `pvp_talent_locale` (`ID`, `locale`, `Description_lang`, `VerifiedBuild`) VALUES (5711, 'deDE', '', 59888);


-- ==========================================
-- Table: pvp_talent_slot_unlock
-- ==========================================
CREATE TABLE `pvp_talent_slot_unlock` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Slot` tinyint NOT NULL DEFAULT '0',
  `LevelRequired` int NOT NULL DEFAULT '0',
  `DeathKnightLevelRequired` int NOT NULL DEFAULT '0',
  `DemonHunterLevelRequired` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pvp_talent_slot_unlock` (`ID`, `Slot`, `LevelRequired`, `DeathKnightLevelRequired`, `DemonHunterLevelRequired`, `VerifiedBuild`) VALUES (1, 1, 10, 10, 10, 0);


-- ==========================================
-- Table: pvp_tier
-- ==========================================
CREATE TABLE `pvp_tier` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MinRating` smallint NOT NULL DEFAULT '0',
  `MaxRating` smallint NOT NULL DEFAULT '0',
  `PrevTier` int NOT NULL DEFAULT '0',
  `NextTier` int NOT NULL DEFAULT '0',
  `BracketID` tinyint unsigned NOT NULL DEFAULT '0',
  `Rank` tinyint NOT NULL DEFAULT '0',
  `RankIconFileDataID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table pvp_tier is empty)


-- ==========================================
-- Table: pvp_tier_locale
-- ==========================================
CREATE TABLE `pvp_tier_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table pvp_tier_locale is empty)


-- ==========================================
-- Table: quest_completion_log_conditional
-- ==========================================
CREATE TABLE `quest_completion_log_conditional` (
  `QuestId` int NOT NULL,
  `PlayerConditionId` int NOT NULL,
  `QuestgiverCreatureId` int NOT NULL,
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Text` text COLLATE utf8mb4_unicode_ci,
  `OrderIndex` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestId`,`PlayerConditionId`,`QuestgiverCreatureId`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_completion_log_conditional` (`QuestId`, `PlayerConditionId`, `QuestgiverCreatureId`, `locale`, `Text`, `OrderIndex`, `VerifiedBuild`) VALUES (65049, 0, 0, 'enUS', '', 0, 62438);


-- ==========================================
-- Table: quest_faction_reward
-- ==========================================
CREATE TABLE `quest_faction_reward` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Difficulty1` smallint NOT NULL DEFAULT '0',
  `Difficulty2` smallint NOT NULL DEFAULT '0',
  `Difficulty3` smallint NOT NULL DEFAULT '0',
  `Difficulty4` smallint NOT NULL DEFAULT '0',
  `Difficulty5` smallint NOT NULL DEFAULT '0',
  `Difficulty6` smallint NOT NULL DEFAULT '0',
  `Difficulty7` smallint NOT NULL DEFAULT '0',
  `Difficulty8` smallint NOT NULL DEFAULT '0',
  `Difficulty9` smallint NOT NULL DEFAULT '0',
  `Difficulty10` smallint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table quest_faction_reward is empty)


-- ==========================================
-- Table: quest_info
-- ==========================================
CREATE TABLE `quest_info` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `InfoName` text COLLATE utf8mb4_unicode_ci,
  `Type` tinyint NOT NULL DEFAULT '0',
  `Modifiers` int NOT NULL DEFAULT '0',
  `Profession` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_info` (`ID`, `InfoName`, `Type`, `Modifiers`, `Profession`, `VerifiedBuild`) VALUES (1, 'Group', 0, 2, 0, 0);


-- ==========================================
-- Table: quest_info_locale
-- ==========================================
CREATE TABLE `quest_info_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `InfoName_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `quest_info_locale` (`ID`, `locale`, `InfoName_lang`, `VerifiedBuild`) VALUES (291, 'deDE', 'Hidden NYI', 59888);


-- ==========================================
-- Table: quest_line_x_quest
-- ==========================================
CREATE TABLE `quest_line_x_quest` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `QuestLineID` int unsigned NOT NULL DEFAULT '0',
  `QuestID` int unsigned NOT NULL DEFAULT '0',
  `OrderIndex` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `Unknown1110` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_line_x_quest` (`ID`, `QuestLineID`, `QuestID`, `OrderIndex`, `Flags`, `Unknown1110`, `VerifiedBuild`) VALUES (1, 1, 33815, 0, 0, 0, 0);


-- ==========================================
-- Table: quest_money_reward
-- ==========================================
CREATE TABLE `quest_money_reward` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Difficulty1` int unsigned NOT NULL DEFAULT '0',
  `Difficulty2` int unsigned NOT NULL DEFAULT '0',
  `Difficulty3` int unsigned NOT NULL DEFAULT '0',
  `Difficulty4` int unsigned NOT NULL DEFAULT '0',
  `Difficulty5` int unsigned NOT NULL DEFAULT '0',
  `Difficulty6` int unsigned NOT NULL DEFAULT '0',
  `Difficulty7` int unsigned NOT NULL DEFAULT '0',
  `Difficulty8` int unsigned NOT NULL DEFAULT '0',
  `Difficulty9` int unsigned NOT NULL DEFAULT '0',
  `Difficulty10` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table quest_money_reward is empty)


-- ==========================================
-- Table: quest_p_o_i_point
-- ==========================================
CREATE TABLE `quest_p_o_i_point` (
  `ID` int NOT NULL DEFAULT '0',
  `X` smallint NOT NULL DEFAULT '0',
  `Y` smallint NOT NULL DEFAULT '0',
  `Z` smallint NOT NULL DEFAULT '0',
  `QuestPOIBlobID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_p_o_i_point` (`ID`, `X`, `Y`, `Z`, `QuestPOIBlobID`, `VerifiedBuild`) VALUES (72800, -9663, 694, 37, 22296, 0);


-- ==========================================
-- Table: quest_package_item
-- ==========================================
CREATE TABLE `quest_package_item` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PackageID` smallint unsigned NOT NULL DEFAULT '0',
  `ItemID` int NOT NULL DEFAULT '0',
  `ItemQuantity` int unsigned NOT NULL DEFAULT '0',
  `DisplayType` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table quest_package_item is empty)


-- ==========================================
-- Table: quest_request_items_locale
-- ==========================================
CREATE TABLE `quest_request_items_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CompletionText` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_request_items_locale` (`ID`, `locale`, `CompletionText`, `VerifiedBuild`) VALUES (2, 'deDE', 'Ja, $C, ich habe Eure Ankunft bereits gespürt. Habt Ihr weitere Neuigkeiten von Eurer Jagd zu berichten?', 0);


-- ==========================================
-- Table: quest_sort
-- ==========================================
CREATE TABLE `quest_sort` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SortName` text COLLATE utf8mb4_unicode_ci,
  `UiOrderIndex` tinyint NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_sort` (`ID`, `SortName`, `UiOrderIndex`, `Flags`, `VerifiedBuild`) VALUES (1, 'Epic', 0, 0, 0);


-- ==========================================
-- Table: quest_sort_locale
-- ==========================================
CREATE TABLE `quest_sort_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SortName_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table quest_sort_locale is empty)


-- ==========================================
-- Table: quest_v2
-- ==========================================
CREATE TABLE `quest_v2` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `UniqueBitFlag` int NOT NULL DEFAULT '0',
  `UiQuestDetailsTheme` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_v2` (`ID`, `UniqueBitFlag`, `UiQuestDetailsTheme`, `VerifiedBuild`) VALUES (1, 3287, 0, 0);


-- ==========================================
-- Table: quest_xp
-- ==========================================
CREATE TABLE `quest_xp` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Difficulty1` smallint unsigned NOT NULL DEFAULT '0',
  `Difficulty2` smallint unsigned NOT NULL DEFAULT '0',
  `Difficulty3` smallint unsigned NOT NULL DEFAULT '0',
  `Difficulty4` smallint unsigned NOT NULL DEFAULT '0',
  `Difficulty5` smallint unsigned NOT NULL DEFAULT '0',
  `Difficulty6` smallint unsigned NOT NULL DEFAULT '0',
  `Difficulty7` smallint unsigned NOT NULL DEFAULT '0',
  `Difficulty8` smallint unsigned NOT NULL DEFAULT '0',
  `Difficulty9` smallint unsigned NOT NULL DEFAULT '0',
  `Difficulty10` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_xp` (`ID`, `Difficulty1`, `Difficulty2`, `Difficulty3`, `Difficulty4`, `Difficulty5`, `Difficulty6`, `Difficulty7`, `Difficulty8`, `Difficulty9`, `Difficulty10`, `VerifiedBuild`) VALUES (1, 0, 25, 50, 100, 150, 200, 250, 300, 400, 0, 0);


-- ==========================================
-- Table: rand_prop_points
-- ==========================================
CREATE TABLE `rand_prop_points` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DamageReplaceStatF` float NOT NULL DEFAULT '0',
  `DamageSecondaryF` float NOT NULL DEFAULT '0',
  `DamageReplaceStat` int NOT NULL DEFAULT '0',
  `DamageSecondary` int NOT NULL DEFAULT '0',
  `EpicF1` float NOT NULL DEFAULT '0',
  `EpicF2` float NOT NULL DEFAULT '0',
  `EpicF3` float NOT NULL DEFAULT '0',
  `EpicF4` float NOT NULL DEFAULT '0',
  `EpicF5` float NOT NULL DEFAULT '0',
  `SuperiorF1` float NOT NULL DEFAULT '0',
  `SuperiorF2` float NOT NULL DEFAULT '0',
  `SuperiorF3` float NOT NULL DEFAULT '0',
  `SuperiorF4` float NOT NULL DEFAULT '0',
  `SuperiorF5` float NOT NULL DEFAULT '0',
  `GoodF1` float NOT NULL DEFAULT '0',
  `GoodF2` float NOT NULL DEFAULT '0',
  `GoodF3` float NOT NULL DEFAULT '0',
  `GoodF4` float NOT NULL DEFAULT '0',
  `GoodF5` float NOT NULL DEFAULT '0',
  `Epic1` int unsigned NOT NULL DEFAULT '0',
  `Epic2` int unsigned NOT NULL DEFAULT '0',
  `Epic3` int unsigned NOT NULL DEFAULT '0',
  `Epic4` int unsigned NOT NULL DEFAULT '0',
  `Epic5` int unsigned NOT NULL DEFAULT '0',
  `Superior1` int unsigned NOT NULL DEFAULT '0',
  `Superior2` int unsigned NOT NULL DEFAULT '0',
  `Superior3` int unsigned NOT NULL DEFAULT '0',
  `Superior4` int unsigned NOT NULL DEFAULT '0',
  `Superior5` int unsigned NOT NULL DEFAULT '0',
  `Good1` int unsigned NOT NULL DEFAULT '0',
  `Good2` int unsigned NOT NULL DEFAULT '0',
  `Good3` int unsigned NOT NULL DEFAULT '0',
  `Good4` int unsigned NOT NULL DEFAULT '0',
  `Good5` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table rand_prop_points is empty)


-- ==========================================
-- Table: research_branch
-- ==========================================
CREATE TABLE `research_branch` (
  `Id` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `ResearchFieldId` tinyint unsigned NOT NULL DEFAULT '0',
  `CurrencyId` smallint unsigned NOT NULL DEFAULT '0',
  `TextureFileId` int NOT NULL DEFAULT '0',
  `BigTextureFileId` int NOT NULL DEFAULT '0',
  `ItemId` int NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table research_branch is empty)


-- ==========================================
-- Table: research_branch_locale
-- ==========================================
CREATE TABLE `research_branch_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table research_branch_locale is empty)


-- ==========================================
-- Table: research_project
-- ==========================================
CREATE TABLE `research_project` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Id` int unsigned NOT NULL DEFAULT '0',
  `Rarity` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellId` int NOT NULL DEFAULT '0',
  `ResearchBranchId` smallint unsigned NOT NULL DEFAULT '0',
  `NumSockets` tinyint unsigned NOT NULL DEFAULT '0',
  `TextureFileId` int NOT NULL DEFAULT '0',
  `RequiredWeight` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table research_project is empty)


-- ==========================================
-- Table: research_project_locale
-- ==========================================
CREATE TABLE `research_project_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table research_project_locale is empty)


-- ==========================================
-- Table: research_site
-- ==========================================
CREATE TABLE `research_site` (
  `Id` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `MapId` smallint NOT NULL DEFAULT '0',
  `QuestPoiBlobId` int NOT NULL DEFAULT '0',
  `AreaPOIIconEnum` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table research_site is empty)


-- ==========================================
-- Table: research_site_locale
-- ==========================================
CREATE TABLE `research_site_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table research_site_locale is empty)


-- ==========================================
-- Table: reward_pack
-- ==========================================
CREATE TABLE `reward_pack` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `CharTitleID` int NOT NULL DEFAULT '0',
  `Money` int unsigned NOT NULL DEFAULT '0',
  `ArtifactXPDifficulty` tinyint NOT NULL DEFAULT '0',
  `ArtifactXPMultiplier` float NOT NULL DEFAULT '0',
  `ArtifactXPCategoryID` tinyint unsigned NOT NULL DEFAULT '0',
  `TreasurePickerID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table reward_pack is empty)


-- ==========================================
-- Table: reward_pack_x_currency_type
-- ==========================================
CREATE TABLE `reward_pack_x_currency_type` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `CurrencyTypeID` int unsigned NOT NULL DEFAULT '0',
  `Quantity` int NOT NULL DEFAULT '0',
  `RewardPackID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table reward_pack_x_currency_type is empty)


-- ==========================================
-- Table: reward_pack_x_item
-- ==========================================
CREATE TABLE `reward_pack_x_item` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemID` int NOT NULL DEFAULT '0',
  `ItemQuantity` int NOT NULL DEFAULT '0',
  `RewardPackID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table reward_pack_x_item is empty)


-- ==========================================
-- Table: scenario
-- ==========================================
CREATE TABLE `scenario` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `AreaTableID` smallint unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `UiTextureKitID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `scenario` (`ID`, `Name`, `AreaTableID`, `Type`, `Flags`, `UiTextureKitID`, `VerifiedBuild`) VALUES (3104, 'Delves', 0, 0, 18, 0, 62493);


-- ==========================================
-- Table: scenario_locale
-- ==========================================
CREATE TABLE `scenario_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table scenario_locale is empty)


-- ==========================================
-- Table: scenario_step
-- ==========================================
CREATE TABLE `scenario_step` (
  `Description` text COLLATE utf8mb4_unicode_ci,
  `Title` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ScenarioID` smallint unsigned NOT NULL DEFAULT '0',
  `Criteriatreeid` int unsigned NOT NULL DEFAULT '0',
  `RewardQuestID` int NOT NULL DEFAULT '0',
  `RelatedStep` int NOT NULL DEFAULT '0',
  `Supersedes` smallint unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `VisibilityPlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `WidgetSetID` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `scenario_step` (`Description`, `Title`, `ID`, `ScenarioID`, `Criteriatreeid`, `RewardQuestID`, `RelatedStep`, `Supersedes`, `OrderIndex`, `Flags`, `VisibilityPlayerConditionID`, `WidgetSetID`, `VerifiedBuild`) VALUES ('Sprocketmonger Lockenstock is master of engineering and his assembly line continously churns out devastating weaponry. He must be stopped before he turns Undemine into a smoking crater.', 'Maniacal Machinist', 12902, 2889, 170594, 0, 0, 0, 0, 0, 0, 0, 59888);


-- ==========================================
-- Table: scenario_step_locale
-- ==========================================
CREATE TABLE `scenario_step_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `Title_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `scenario_step_locale` (`ID`, `locale`, `Description_lang`, `Title_lang`, `VerifiedBuild`) VALUES (12902, 'deDE', 'Ritzelkrämer Lockenstock ist ein Meister der Ingenieurskunst, und seine Fertigungsstraße spuckt unaufhörlich neue verheerende Waffen aus. Er muss aufgehalten werden, bevor er Lorenhall in einen schwelenden Krater verwandelt.', 'Manischer Maschinist', 59888);


-- ==========================================
-- Table: scene_script
-- ==========================================
CREATE TABLE `scene_script` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `FirstSceneScriptID` int unsigned NOT NULL DEFAULT '0',
  `NextSceneScriptID` int unsigned NOT NULL DEFAULT '0',
  `Unknown915` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `scene_script` (`ID`, `FirstSceneScriptID`, `NextSceneScriptID`, `Unknown915`, `VerifiedBuild`) VALUES (13952, 0, 13954, 120, 61609);


-- ==========================================
-- Table: scene_script_global_text
-- ==========================================
CREATE TABLE `scene_script_global_text` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Script` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table scene_script_global_text is empty)


-- ==========================================
-- Table: scene_script_package
-- ==========================================
CREATE TABLE `scene_script_package` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Unknown915` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table scene_script_package is empty)


-- ==========================================
-- Table: scene_script_text
-- ==========================================
CREATE TABLE `scene_script_text` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Script` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `scene_script_text` (`ID`, `Name`, `Script`, `VerifiedBuild`) VALUES (13952, '7.0 Artifacts - Acquisition -  Looting Template - Functions - LWB', '--[[
These are the variables that need to be initialized in order to use the cutscene generator

ISLEFT 			- INTEGER - 0 for circling to the RIGHT, 1 for left
INITSOUNDID 	- INTEGER - ID of soundkit to be played at the beginning of the scene
CASTVISUALID 	- INTEGER - ID of spell visual that occurs at the beginning of the scene
IMPACTVISUALID 	- INTEGER - ID of spell visual that occurs during the animation
STATEVISUALID 	- INTEGER - ID of spell visual for the state of the scene
PLAYSOUNDID 	- INTEGER - ID of sound kit that plays when the weapon is actually brandished
WEAPONID 		- INTEGER - ID of the item itself (weapon to brandish)
WEAPONIDOFFHAND - INTEGER - ID of offhand item (if there is one)
WEAPONTYPE 		- INTEGER - What kind of weapon is being brandished
	1 - Single or two handed
	2 - Dual Weapons
	3 - Fists
	4 - Bow/Gun
	5 - Shield
WEAPONEFFECT - INTEGER - What kind of effect to be played when the weapon\'s text appears
	1 - Fel
	2 - Fire
	3 - Ice
	4 - Arcane
	5 - Holy
	6 - Shadow
	7 - Lightning
EFFECTLOCATIONSMALL - Transform:New(Vector:New(x, y, z), rot) - Where the weapon effect splash is played (should be on the text)
EFFECTLOCATIONBIG - \" \" - If race = tauren
EFFECTLOCATIONMED - \" \" - If Race is not small or big
EFFECTSCALE - INTEGER - Size of the effect
	
WEAPONTEXT - STRING - Name of the weapon
TEXTSMALL - Transform:New(Vector:New(x, y, z), rot) - location of the text based on being small (gnome/goblin/etc)
TEXTBIG - \" \" - location based on being Tauren
TEXTMED - \" \" - location based on being everyone else

TEXTEFFECTANIM = animkit for text splash effect

]]--

function PlayWeaponScene()
	--local ISLEFT = _ISLEFT or 0

	-- Setup base scene stuff
	local genericFOV90 = 368
	local genericFOV60 = 369
	local genericFOV45 = 370
	scene:SetRelativeCoords(true)
	scene:SetFadeRegion(200, true)
	scene:AddFadeRegionExcludedGameObject(248560)	--Arcane mage object exclusions
	scene:AddFadeRegionExcludedGameObject(248561)	--Arcane mage object exclusions
	scene:AddFadeRegionExcludedGameObject(248559)	--Arcane mage object exclusions
	scene:AddFadeRegionExcludedGameObject(248558)	--Arcane mage object exclusions
	scene:AddFadeRegionExcludedGameObject(249815)	--Arcane mage object exclusions
	clone = UpdatedSmoothPhaseSpawnActivePlayerCloneActor(0, 0, 0, 0, 1, true , true)


	-- Equip clone with the right weapon
	if (WEAPONTYPE == 1) then
		clone:EquipWeapon(WeaponSlot.MainHand, WEAPONID)
		clone:EquipWeapon(WeaponSlot.OffHand, WEAPONIDOFFHAND)
	end
	if (WEAPONTYPE == 4) then
		--clone:EquipWeapon(WeaponSlot.MainHand, 0)
		--clone:EquipWeapon(WeaponSlot.OffHand, 0)
		--clone:EquipWeapon(WeaponSlot.MainHand, WEAPONID)
		clone:EquipWeapon(WeaponSlot.Ranged, WEAPONID)
		clone:SetSheatheState(SheatheState.ShowRanged, true)
	end
	if ((WEAPONTYPE == 2) or (WEAPONTYPE == 3) or (WEAPONTYPE == 5)) then
		clone:EquipWeapon(WeaponSlot.MainHand, WEAPONID)
		clone:EquipWeapon(WeaponSlot.OffHand, WEAPONIDOFFHAND)
	end
	
	
	-- Play Initial Sound
	clone:PlaySoundKitStereo(INITSOUNDID, true )

	-- Choose Left or Right Camera Path
	if ISLEFT == 1 then
	--	Broadcast(\"GOING LEFT\")
		if scene:EvalPlayerCondition(37486) then -- if gnome, dwarf, or goblin
		SetCameraFollowPath( genericFOV45, 2, 16353, 16365, 3)
			elseif scene:EvalPlayerCondition(37487) then -- if Tauren
			SetCameraFollowPath( genericFOV90, 2, 14835, 16364, 3)
				else --Everyone Else
				SetCameraFollowPath( genericFOV60, 2, 14835, 16364, 3)
			end
		Wait(0.5)
		if scene:EvalPlayerCondition(37486) then -- if gnome, dwarf, or goblin
		SetCameraFollowPath( genericFOV45, 3, 16355, 16365, 6.5)
			elseif scene:EvalPlayerCondition(37487) then -- if Tauren
			SetCameraFollowPath( genericFOV90, 3, 16355, 16364, 6.5)
				else --Everyone Else
				SetCameraFollowPath( genericFOV60, 3, 16355, 16364, 6.5) 
			', 61609);


-- ==========================================
-- Table: screen_effect
-- ==========================================
CREATE TABLE `screen_effect` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DisplayName` text COLLATE utf8mb4_unicode_ci,
  `Param1` int NOT NULL DEFAULT '0',
  `Param2` int NOT NULL DEFAULT '0',
  `Param3` int NOT NULL DEFAULT '0',
  `Param4` int NOT NULL DEFAULT '0',
  `Effect` tinyint NOT NULL DEFAULT '0',
  `FullScreenEffectID` int unsigned NOT NULL DEFAULT '0',
  `LightParamsID` smallint unsigned NOT NULL DEFAULT '0',
  `LightParamsFadeIn` smallint unsigned NOT NULL DEFAULT '0',
  `LightParamsFadeOut` smallint unsigned NOT NULL DEFAULT '0',
  `SoundAmbienceID` int unsigned NOT NULL DEFAULT '0',
  `ZoneMusicID` int unsigned NOT NULL DEFAULT '0',
  `TimeOfDayOverride` smallint NOT NULL DEFAULT '0',
  `EffectMask` tinyint NOT NULL DEFAULT '0',
  `LightFlags` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table screen_effect is empty)


-- ==========================================
-- Table: server_messages
-- ==========================================
CREATE TABLE `server_messages` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Text` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table server_messages is empty)


-- ==========================================
-- Table: server_messages_locale
-- ==========================================
CREATE TABLE `server_messages_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Text_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table server_messages_locale is empty)


-- ==========================================
-- Table: server_settings
-- ==========================================
CREATE TABLE `server_settings` (
  `setting_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `setting_value` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- (Table server_settings is empty)


-- ==========================================
-- Table: skill_line
-- ==========================================
CREATE TABLE `skill_line` (
  `DisplayName` text COLLATE utf8mb4_unicode_ci,
  `AlternateVerb` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `HordeDisplayName` text COLLATE utf8mb4_unicode_ci,
  `OverrideSourceInfoDisplayName` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `CategoryID` tinyint NOT NULL DEFAULT '0',
  `SpellIconFileID` int NOT NULL DEFAULT '0',
  `CanLink` tinyint NOT NULL DEFAULT '0',
  `ParentSkillLineID` int unsigned NOT NULL DEFAULT '0',
  `ParentTierIndex` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `SpellBookSpellID` int NOT NULL DEFAULT '0',
  `ExpansionNameSharedStringID` int NOT NULL DEFAULT '0',
  `HordeExpansionNameSharedStringID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table skill_line is empty)


-- ==========================================
-- Table: skill_line_ability
-- ==========================================
CREATE TABLE `skill_line_ability` (
  `RaceMask` bigint NOT NULL DEFAULT '0',
  `AbilityVerb` text COLLATE utf8mb4_unicode_ci,
  `AbilityAllVerb` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SkillLine` smallint unsigned NOT NULL DEFAULT '0',
  `Spell` int NOT NULL DEFAULT '0',
  `MinSkillLineRank` smallint NOT NULL DEFAULT '0',
  `ClassMask` int NOT NULL DEFAULT '0',
  `SupercedesSpell` int NOT NULL DEFAULT '0',
  `AcquireMethod` int NOT NULL DEFAULT '0',
  `TrivialSkillLineRankHigh` smallint NOT NULL DEFAULT '0',
  `TrivialSkillLineRankLow` smallint NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `NumSkillUps` tinyint NOT NULL DEFAULT '0',
  `UniqueBit` smallint NOT NULL DEFAULT '0',
  `TradeSkillCategoryID` smallint NOT NULL DEFAULT '0',
  `SkillupSkillLineID` smallint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `skill_line_ability` (`RaceMask`, `AbilityVerb`, `AbilityAllVerb`, `ID`, `SkillLine`, `Spell`, `MinSkillLineRank`, `ClassMask`, `SupercedesSpell`, `AcquireMethod`, `TrivialSkillLineRankHigh`, `TrivialSkillLineRankLow`, `Flags`, `NumSkillUps`, `UniqueBit`, `TradeSkillCategoryID`, `SkillupSkillLineID`, `VerifiedBuild`) VALUES (0, NULL, NULL, 900001, 2018, 264434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 99999);


-- ==========================================
-- Table: skill_line_ability_locale
-- ==========================================
CREATE TABLE `skill_line_ability_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AbilityVerb_lang` text COLLATE utf8mb4_unicode_ci,
  `AbilityAllVerb_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table skill_line_ability_locale is empty)


-- ==========================================
-- Table: skill_line_locale
-- ==========================================
CREATE TABLE `skill_line_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DisplayName_lang` text COLLATE utf8mb4_unicode_ci,
  `AlternateVerb_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `HordeDisplayName_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table skill_line_locale is empty)


-- ==========================================
-- Table: skill_line_x_trait_tree
-- ==========================================
CREATE TABLE `skill_line_x_trait_tree` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SkillLineID` int unsigned NOT NULL DEFAULT '0',
  `TraitTreeID` int NOT NULL DEFAULT '0',
  `OrderIndex` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table skill_line_x_trait_tree is empty)


-- ==========================================
-- Table: skill_race_class_info
-- ==========================================
CREATE TABLE `skill_race_class_info` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `RaceMask` bigint NOT NULL DEFAULT '0',
  `SkillID` smallint unsigned NOT NULL DEFAULT '0',
  `ClassMask` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `Availability` int NOT NULL DEFAULT '0',
  `MinLevel` tinyint NOT NULL DEFAULT '0',
  `SkillTierID` smallint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table skill_race_class_info is empty)


-- ==========================================
-- Table: soulbind_conduit_rank
-- ==========================================
CREATE TABLE `soulbind_conduit_rank` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `RankIndex` int NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `AuraPointsOverride` float NOT NULL DEFAULT '0',
  `SoulbindConduitID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table soulbind_conduit_rank is empty)


-- ==========================================
-- Table: sound_ambience
-- ==========================================
CREATE TABLE `sound_ambience` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `FlavorSoundFilterID` int unsigned NOT NULL DEFAULT '0',
  `AmbienceID1` int unsigned NOT NULL DEFAULT '0',
  `AmbienceID2` int unsigned NOT NULL DEFAULT '0',
  `AmbienceStartID1` int unsigned NOT NULL DEFAULT '0',
  `AmbienceStartID2` int unsigned NOT NULL DEFAULT '0',
  `AmbienceStopID1` int unsigned NOT NULL DEFAULT '0',
  `AmbienceStopID2` int unsigned NOT NULL DEFAULT '0',
  `SoundKitID1` int unsigned NOT NULL DEFAULT '0',
  `SoundKitID2` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table sound_ambience is empty)


-- ==========================================
-- Table: sound_kit
-- ==========================================
CREATE TABLE `sound_kit` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SoundType` int NOT NULL DEFAULT '0',
  `VolumeFloat` float NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `MinDistance` float NOT NULL DEFAULT '0',
  `DistanceCutoff` float NOT NULL DEFAULT '0',
  `EAXDef` tinyint unsigned NOT NULL DEFAULT '0',
  `SoundKitAdvancedID` int unsigned NOT NULL DEFAULT '0',
  `VolumeVariationPlus` float NOT NULL DEFAULT '0',
  `VolumeVariationMinus` float NOT NULL DEFAULT '0',
  `PitchVariationPlus` float NOT NULL DEFAULT '0',
  `PitchVariationMinus` float NOT NULL DEFAULT '0',
  `DialogType` tinyint NOT NULL DEFAULT '0',
  `PitchAdjust` float NOT NULL DEFAULT '0',
  `BusOverwriteID` smallint unsigned NOT NULL DEFAULT '0',
  `MaxInstances` tinyint unsigned NOT NULL DEFAULT '0',
  `SoundMixGroupID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sound_kit` (`ID`, `SoundType`, `VolumeFloat`, `Flags`, `MinDistance`, `DistanceCutoff`, `EAXDef`, `SoundKitAdvancedID`, `VolumeVariationPlus`, `VolumeVariationMinus`, `PitchVariationPlus`, `PitchVariationMinus`, `DialogType`, `PitchAdjust`, `BusOverwriteID`, `MaxInstances`, `SoundMixGroupID`, `VerifiedBuild`) VALUES (736, 10, 0.630957, 0, 8.0, 45.0, 2, 80699, 0.0, 0.0, 0.148698, 0.149333, 0, 0.0, 0, 2, 0, 59888);


-- ==========================================
-- Table: sound_kit_advanced
-- ==========================================
CREATE TABLE `sound_kit_advanced` (
  `ID` int NOT NULL DEFAULT '0',
  `SoundKitID` int unsigned NOT NULL DEFAULT '0',
  `InnerRadius2D` float NOT NULL DEFAULT '0',
  `OuterRadius2D` float NOT NULL DEFAULT '0',
  `TimeA` int unsigned NOT NULL DEFAULT '0',
  `TimeB` int unsigned NOT NULL DEFAULT '0',
  `TimeC` int unsigned NOT NULL DEFAULT '0',
  `TimeD` int unsigned NOT NULL DEFAULT '0',
  `RandomOffsetRange` int NOT NULL DEFAULT '0',
  `Usage` tinyint NOT NULL DEFAULT '0',
  `TimeIntervalMin` int unsigned NOT NULL DEFAULT '0',
  `TimeIntervalMax` int unsigned NOT NULL DEFAULT '0',
  `DelayMin` int unsigned NOT NULL DEFAULT '0',
  `DelayMax` int unsigned NOT NULL DEFAULT '0',
  `VolumeSliderCategory` tinyint unsigned NOT NULL DEFAULT '0',
  `DuckToSFX` float NOT NULL DEFAULT '0',
  `DuckToMusic` float NOT NULL DEFAULT '0',
  `DuckToAmbience` float NOT NULL DEFAULT '0',
  `DuckToDialog` float NOT NULL DEFAULT '0',
  `DuckToSuppressors` float NOT NULL DEFAULT '0',
  `DuckToCinematicSFX` float NOT NULL DEFAULT '0',
  `DuckToCinematicMusic` float NOT NULL DEFAULT '0',
  `Field_11_2_0_61476_021` float NOT NULL DEFAULT '0',
  `InnerRadiusOfInfluence` float NOT NULL DEFAULT '0',
  `OuterRadiusOfInfluence` float NOT NULL DEFAULT '0',
  `TimeToDuck` int unsigned NOT NULL DEFAULT '0',
  `TimeToUnduck` int unsigned NOT NULL DEFAULT '0',
  `InsideAngle` float NOT NULL DEFAULT '0',
  `OutsideAngle` float NOT NULL DEFAULT '0',
  `OutsideVolume` float NOT NULL DEFAULT '0',
  `MinRandomPosOffset` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxRandomPosOffset` smallint unsigned NOT NULL DEFAULT '0',
  `MsOffset` int NOT NULL DEFAULT '0',
  `TimeCooldownMin` int unsigned NOT NULL DEFAULT '0',
  `TimeCooldownMax` int unsigned NOT NULL DEFAULT '0',
  `MaxInstancesBehavior` tinyint unsigned NOT NULL DEFAULT '0',
  `VolumeControlType` tinyint unsigned NOT NULL DEFAULT '0',
  `VolumeFadeInTimeMin` int NOT NULL DEFAULT '0',
  `VolumeFadeInTimeMax` int NOT NULL DEFAULT '0',
  `VolumeFadeInCurveID` int unsigned NOT NULL DEFAULT '0',
  `VolumeFadeOutTimeMin` int NOT NULL DEFAULT '0',
  `VolumeFadeOutTimeMax` int NOT NULL DEFAULT '0',
  `VolumeFadeOutCurveID` int unsigned NOT NULL DEFAULT '0',
  `ChanceToPlay` float NOT NULL DEFAULT '0',
  `RolloffType` int NOT NULL DEFAULT '0',
  `RolloffParam0` float NOT NULL DEFAULT '0',
  `Field_8_2_0_30080_045` float NOT NULL DEFAULT '0',
  `Field_8_2_0_30080_046` float NOT NULL DEFAULT '0',
  `Field_8_2_0_30080_047` int NOT NULL DEFAULT '0',
  `Field_8_2_0_30080_048` int NOT NULL DEFAULT '0',
  `Field_8_2_0_30080_049` float NOT NULL DEFAULT '0',
  `Field_8_2_0_30080_050` float NOT NULL DEFAULT '0',
  `Field_8_2_0_30080_051` float NOT NULL DEFAULT '0',
  `Field_8_2_0_30080_052` float NOT NULL DEFAULT '0',
  `Field_8_2_0_30080_053` float NOT NULL DEFAULT '0',
  `Field_8_2_0_30080_054` float NOT NULL DEFAULT '0',
  `Field_9_1_0_38312_055` float NOT NULL DEFAULT '0',
  `Field_9_1_0_38312_056` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table sound_kit_advanced is empty)


-- ==========================================
-- Table: sound_kit_entry
-- ==========================================
CREATE TABLE `sound_kit_entry` (
  `ID` int NOT NULL DEFAULT '0',
  `SoundKitID` int unsigned NOT NULL DEFAULT '0',
  `FileDataID` int NOT NULL DEFAULT '0',
  `Frequency` tinyint unsigned NOT NULL DEFAULT '0',
  `Volume` float NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table sound_kit_entry is empty)


-- ==========================================
-- Table: spec_set_member
-- ==========================================
CREATE TABLE `spec_set_member` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ChrSpecializationID` int NOT NULL DEFAULT '0',
  `SpecSetID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spec_set_member is empty)


-- ==========================================
-- Table: specialization_spells
-- ==========================================
CREATE TABLE `specialization_spells` (
  `Description` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpecID` smallint unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `OverridesSpellID` int NOT NULL DEFAULT '0',
  `DisplayOrder` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `specialization_spells` (`Description`, `ID`, `SpecID`, `SpellID`, `OverridesSpellID`, `DisplayOrder`, `VerifiedBuild`) VALUES (NULL, 4, 62, 30451, 116, 0, 0);


-- ==========================================
-- Table: specialization_spells_display
-- ==========================================
CREATE TABLE `specialization_spells_display` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpecializationID` smallint unsigned NOT NULL DEFAULT '0',
  `SpecllID1` int unsigned NOT NULL DEFAULT '0',
  `SpecllID2` int unsigned NOT NULL DEFAULT '0',
  `SpecllID3` int unsigned NOT NULL DEFAULT '0',
  `SpecllID4` int unsigned NOT NULL DEFAULT '0',
  `SpecllID5` int unsigned NOT NULL DEFAULT '0',
  `SpecllID6` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `specialization_spells_display` (`ID`, `SpecializationID`, `SpecllID1`, `SpecllID2`, `SpecllID3`, `SpecllID4`, `SpecllID5`, `SpecllID6`, `VerifiedBuild`) VALUES (2, 62, 5143, 5143, 5143, 365350, 365350, 365350, 0);


-- ==========================================
-- Table: specialization_spells_locale
-- ==========================================
CREATE TABLE `specialization_spells_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `specialization_spells_locale` (`ID`, `locale`, `Description_lang`, `VerifiedBuild`) VALUES (7211, 'deDE', '', 59888);


-- ==========================================
-- Table: spell
-- ==========================================
CREATE TABLE `spell` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `NameSubtext` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `AuraDescription` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `spell` (`ID`, `NameSubtext`, `Description`, `AuraDescription`, `VerifiedBuild`) VALUES (1, '', '', '', 0);


-- ==========================================
-- Table: spell_aura_options
-- ==========================================
CREATE TABLE `spell_aura_options` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `CumulativeAura` smallint unsigned NOT NULL DEFAULT '0',
  `ProcCategoryRecovery` int NOT NULL DEFAULT '0',
  `ProcChance` tinyint unsigned NOT NULL DEFAULT '0',
  `ProcCharges` int NOT NULL DEFAULT '0',
  `SpellProcsPerMinuteID` smallint unsigned NOT NULL DEFAULT '0',
  `ProcTypeMask1` int NOT NULL DEFAULT '0',
  `ProcTypeMask2` int NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_aura_options` (`ID`, `DifficultyID`, `CumulativeAura`, `ProcCategoryRecovery`, `ProcChance`, `ProcCharges`, `SpellProcsPerMinuteID`, `ProcTypeMask1`, `ProcTypeMask2`, `SpellID`, `VerifiedBuild`) VALUES (3350, 0, 0, 3000, 100, 9, 0, 8, 0, 52127, 61609);


-- ==========================================
-- Table: spell_aura_restrictions
-- ==========================================
CREATE TABLE `spell_aura_restrictions` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DifficultyID` int NOT NULL DEFAULT '0',
  `CasterAuraState` int NOT NULL DEFAULT '0',
  `TargetAuraState` int NOT NULL DEFAULT '0',
  `ExcludeCasterAuraState` int NOT NULL DEFAULT '0',
  `ExcludeTargetAuraState` int NOT NULL DEFAULT '0',
  `CasterAuraSpell` int NOT NULL DEFAULT '0',
  `TargetAuraSpell` int NOT NULL DEFAULT '0',
  `ExcludeCasterAuraSpell` int NOT NULL DEFAULT '0',
  `ExcludeTargetAuraSpell` int NOT NULL DEFAULT '0',
  `CasterAuraType` int NOT NULL DEFAULT '0',
  `TargetAuraType` int NOT NULL DEFAULT '0',
  `ExcludeCasterAuraType` int NOT NULL DEFAULT '0',
  `ExcludeTargetAuraType` int NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_aura_restrictions` (`ID`, `DifficultyID`, `CasterAuraState`, `TargetAuraState`, `ExcludeCasterAuraState`, `ExcludeTargetAuraState`, `CasterAuraSpell`, `TargetAuraSpell`, `ExcludeCasterAuraSpell`, `ExcludeTargetAuraSpell`, `CasterAuraType`, `TargetAuraType`, `ExcludeCasterAuraType`, `ExcludeTargetAuraType`, `SpellID`, `VerifiedBuild`) VALUES (22927, 0, 0, 0, 0, 0, 137018, 0, 0, 0, 0, 0, 0, 0, 385336, 59888);


-- ==========================================
-- Table: spell_cast_times
-- ==========================================
CREATE TABLE `spell_cast_times` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Base` int NOT NULL DEFAULT '0',
  `Minimum` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_cast_times` (`ID`, `Base`, `Minimum`, `VerifiedBuild`) VALUES (1, 0, 0, 0);


-- ==========================================
-- Table: spell_casting_requirements
-- ==========================================
CREATE TABLE `spell_casting_requirements` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `FacingCasterFlags` int NOT NULL DEFAULT '0',
  `MinFactionID` smallint unsigned NOT NULL DEFAULT '0',
  `MinReputation` int NOT NULL DEFAULT '0',
  `RequiredAreasID` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredAuraVision` tinyint unsigned NOT NULL DEFAULT '0',
  `RequiresSpellFocus` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_casting_requirements` (`ID`, `SpellID`, `FacingCasterFlags`, `MinFactionID`, `MinReputation`, `RequiredAreasID`, `RequiredAuraVision`, `RequiresSpellFocus`, `VerifiedBuild`) VALUES (2, 53, 1, 0, 0, 0, 0, 0, 0);


-- ==========================================
-- Table: spell_categories
-- ==========================================
CREATE TABLE `spell_categories` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `Category` smallint NOT NULL DEFAULT '0',
  `DefenseType` int NOT NULL DEFAULT '0',
  `DispelType` tinyint NOT NULL DEFAULT '0',
  `Mechanic` tinyint NOT NULL DEFAULT '0',
  `PreventionType` int NOT NULL DEFAULT '0',
  `StartRecoveryCategory` smallint NOT NULL DEFAULT '0',
  `ChargeCategory` smallint NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_categories` (`ID`, `DifficultyID`, `Category`, `DefenseType`, `DispelType`, `Mechanic`, `PreventionType`, `StartRecoveryCategory`, `ChargeCategory`, `SpellID`, `VerifiedBuild`) VALUES (4053, 0, 0, 0, 0, 0, 2, 0, 1692, 23920, 59888);


-- ==========================================
-- Table: spell_category
-- ==========================================
CREATE TABLE `spell_category` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Flags` int NOT NULL DEFAULT '0',
  `UsesPerWeek` int NOT NULL DEFAULT '0',
  `MaxCharges` int NOT NULL DEFAULT '0',
  `ChargeRecoveryTime` int NOT NULL DEFAULT '0',
  `TypeMask` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_category` (`ID`, `Name`, `Flags`, `UsesPerWeek`, `MaxCharges`, `ChargeRecoveryTime`, `TypeMask`, `VerifiedBuild`) VALUES (1, 'Default', 0, 0, 0, 0, 0, 0);


-- ==========================================
-- Table: spell_category_locale
-- ==========================================
CREATE TABLE `spell_category_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table spell_category_locale is empty)


-- ==========================================
-- Table: spell_class_options
-- ==========================================
CREATE TABLE `spell_class_options` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `ModalNextSpell` int unsigned NOT NULL DEFAULT '0',
  `SpellClassSet` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellClassMask1` int NOT NULL DEFAULT '0',
  `SpellClassMask2` int NOT NULL DEFAULT '0',
  `SpellClassMask3` int NOT NULL DEFAULT '0',
  `SpellClassMask4` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_class_options` (`ID`, `SpellID`, `ModalNextSpell`, `SpellClassSet`, `SpellClassMask1`, `SpellClassMask2`, `SpellClassMask3`, `SpellClassMask4`, `VerifiedBuild`) VALUES (3, 17, 0, 6, 1, 0, 0, 0, 0);


-- ==========================================
-- Table: spell_cooldowns
-- ==========================================
CREATE TABLE `spell_cooldowns` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `CategoryRecoveryTime` int NOT NULL DEFAULT '0',
  `RecoveryTime` int NOT NULL DEFAULT '0',
  `StartRecoveryTime` int NOT NULL DEFAULT '0',
  `AuraSpellID` int NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_cooldowns` (`ID`, `DifficultyID`, `CategoryRecoveryTime`, `RecoveryTime`, `StartRecoveryTime`, `AuraSpellID`, `SpellID`, `VerifiedBuild`) VALUES (5606, 0, 30000, 0, 0, 0, 72757, 59888);


-- ==========================================
-- Table: spell_duration
-- ==========================================
CREATE TABLE `spell_duration` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Duration` int NOT NULL DEFAULT '0',
  `MaxDuration` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_duration is empty)


-- ==========================================
-- Table: spell_effect
-- ==========================================
CREATE TABLE `spell_effect` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `EffectAura` smallint NOT NULL DEFAULT '0',
  `DifficultyID` int NOT NULL DEFAULT '0',
  `EffectIndex` int NOT NULL DEFAULT '0',
  `Effect` int unsigned NOT NULL DEFAULT '0',
  `EffectAmplitude` float NOT NULL DEFAULT '0',
  `EffectAttributes` int NOT NULL DEFAULT '0',
  `EffectAuraPeriod` int NOT NULL DEFAULT '0',
  `EffectBonusCoefficient` float NOT NULL DEFAULT '0',
  `EffectChainAmplitude` float NOT NULL DEFAULT '0',
  `EffectChainTargets` int NOT NULL DEFAULT '0',
  `EffectItemType` int NOT NULL DEFAULT '0',
  `EffectMechanic` int NOT NULL DEFAULT '0',
  `EffectPointsPerResource` float NOT NULL DEFAULT '0',
  `EffectPosFacing` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel` float NOT NULL DEFAULT '0',
  `EffectTriggerSpell` int NOT NULL DEFAULT '0',
  `BonusCoefficientFromAP` float NOT NULL DEFAULT '0',
  `PvpMultiplier` float NOT NULL DEFAULT '0',
  `Coefficient` float NOT NULL DEFAULT '0',
  `Variance` float NOT NULL DEFAULT '0',
  `ResourceCoefficient` float NOT NULL DEFAULT '0',
  `GroupSizeBasePointsCoefficient` float NOT NULL DEFAULT '0',
  `EffectBasePoints` float NOT NULL DEFAULT '0',
  `ScalingClass` int NOT NULL DEFAULT '0',
  `EffectMiscValue1` int NOT NULL DEFAULT '0',
  `EffectMiscValue2` int NOT NULL DEFAULT '0',
  `EffectRadiusIndex1` int unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex2` int unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMask1` int NOT NULL DEFAULT '0',
  `EffectSpellClassMask2` int NOT NULL DEFAULT '0',
  `EffectSpellClassMask3` int NOT NULL DEFAULT '0',
  `EffectSpellClassMask4` int NOT NULL DEFAULT '0',
  `ImplicitTarget1` smallint NOT NULL DEFAULT '0',
  `ImplicitTarget2` smallint NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_effect` (`ID`, `EffectAura`, `DifficultyID`, `EffectIndex`, `Effect`, `EffectAmplitude`, `EffectAttributes`, `EffectAuraPeriod`, `EffectBonusCoefficient`, `EffectChainAmplitude`, `EffectChainTargets`, `EffectItemType`, `EffectMechanic`, `EffectPointsPerResource`, `EffectPosFacing`, `EffectRealPointsPerLevel`, `EffectTriggerSpell`, `BonusCoefficientFromAP`, `PvpMultiplier`, `Coefficient`, `Variance`, `ResourceCoefficient`, `GroupSizeBasePointsCoefficient`, `EffectBasePoints`, `ScalingClass`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectSpellClassMask1`, `EffectSpellClassMask2`, `EffectSpellClassMask3`, `EffectSpellClassMask4`, `ImplicitTarget1`, `ImplicitTarget2`, `SpellID`, `VerifiedBuild`) VALUES (31, 0, 0, 1, 2, 0.0, 0, 0, 0.0, 1.0, 0, 0, 0, 0.0, 0.0, 0.0, 0, 0.69, 1.74, 0.0, 0.05, 0.0, 1.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 53, 59888);


-- ==========================================
-- Table: spell_empower
-- ==========================================
CREATE TABLE `spell_empower` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `Unused1000` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_empower is empty)


-- ==========================================
-- Table: spell_empower_stage
-- ==========================================
CREATE TABLE `spell_empower_stage` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Stage` int NOT NULL DEFAULT '0',
  `DurationMs` int NOT NULL DEFAULT '0',
  `SpellEmpowerID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_empower_stage is empty)


-- ==========================================
-- Table: spell_equipped_items
-- ==========================================
CREATE TABLE `spell_equipped_items` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `EquippedItemClass` int NOT NULL DEFAULT '0',
  `EquippedItemInvTypes` int NOT NULL DEFAULT '0',
  `EquippedItemSubclass` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_equipped_items is empty)


-- ==========================================
-- Table: spell_focus_object
-- ==========================================
CREATE TABLE `spell_focus_object` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_focus_object is empty)


-- ==========================================
-- Table: spell_focus_object_locale
-- ==========================================
CREATE TABLE `spell_focus_object_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table spell_focus_object_locale is empty)


-- ==========================================
-- Table: spell_interrupts
-- ==========================================
CREATE TABLE `spell_interrupts` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `InterruptFlags` int NOT NULL DEFAULT '0',
  `AuraInterruptFlags1` int NOT NULL DEFAULT '0',
  `AuraInterruptFlags2` int NOT NULL DEFAULT '0',
  `ChannelInterruptFlags1` int NOT NULL DEFAULT '0',
  `ChannelInterruptFlags2` int NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_interrupts` (`ID`, `DifficultyID`, `InterruptFlags`, `AuraInterruptFlags1`, `AuraInterruptFlags2`, `ChannelInterruptFlags1`, `ChannelInterruptFlags2`, `SpellID`, `VerifiedBuild`) VALUES (2416, 0, 8, 4718592, 0, 0, 0, 17150, 59888);


-- ==========================================
-- Table: spell_item_enchantment
-- ==========================================
CREATE TABLE `spell_item_enchantment` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `HordeName` text COLLATE utf8mb4_unicode_ci,
  `Duration` int NOT NULL DEFAULT '0',
  `EffectArg1` int unsigned NOT NULL DEFAULT '0',
  `EffectArg2` int unsigned NOT NULL DEFAULT '0',
  `EffectArg3` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `EffectScalingPoints1` float NOT NULL DEFAULT '0',
  `EffectScalingPoints2` float NOT NULL DEFAULT '0',
  `EffectScalingPoints3` float NOT NULL DEFAULT '0',
  `IconFileDataID` int unsigned NOT NULL DEFAULT '0',
  `MinItemLevel` int NOT NULL DEFAULT '0',
  `MaxItemLevel` int NOT NULL DEFAULT '0',
  `TransmogUseConditionID` int unsigned NOT NULL DEFAULT '0',
  `TransmogCost` int unsigned NOT NULL DEFAULT '0',
  `EffectPointsMin1` smallint NOT NULL DEFAULT '0',
  `EffectPointsMin2` smallint NOT NULL DEFAULT '0',
  `EffectPointsMin3` smallint NOT NULL DEFAULT '0',
  `ItemVisual` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredSkillID` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint unsigned NOT NULL DEFAULT '0',
  `ItemLevel` smallint unsigned NOT NULL DEFAULT '0',
  `Charges` tinyint unsigned NOT NULL DEFAULT '0',
  `Effect1` tinyint unsigned NOT NULL DEFAULT '0',
  `Effect2` tinyint unsigned NOT NULL DEFAULT '0',
  `Effect3` tinyint unsigned NOT NULL DEFAULT '0',
  `ScalingClass` tinyint NOT NULL DEFAULT '0',
  `ScalingClassRestricted` tinyint NOT NULL DEFAULT '0',
  `ConditionID` tinyint unsigned NOT NULL DEFAULT '0',
  `MinLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_item_enchantment is empty)


-- ==========================================
-- Table: spell_item_enchantment_condition
-- ==========================================
CREATE TABLE `spell_item_enchantment_condition` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `LtOperandType1` tinyint unsigned NOT NULL DEFAULT '0',
  `LtOperandType2` tinyint unsigned NOT NULL DEFAULT '0',
  `LtOperandType3` tinyint unsigned NOT NULL DEFAULT '0',
  `LtOperandType4` tinyint unsigned NOT NULL DEFAULT '0',
  `LtOperandType5` tinyint unsigned NOT NULL DEFAULT '0',
  `LtOperand1` int unsigned NOT NULL DEFAULT '0',
  `LtOperand2` int unsigned NOT NULL DEFAULT '0',
  `LtOperand3` int unsigned NOT NULL DEFAULT '0',
  `LtOperand4` int unsigned NOT NULL DEFAULT '0',
  `LtOperand5` int unsigned NOT NULL DEFAULT '0',
  `Operator1` tinyint unsigned NOT NULL DEFAULT '0',
  `Operator2` tinyint unsigned NOT NULL DEFAULT '0',
  `Operator3` tinyint unsigned NOT NULL DEFAULT '0',
  `Operator4` tinyint unsigned NOT NULL DEFAULT '0',
  `Operator5` tinyint unsigned NOT NULL DEFAULT '0',
  `RtOperandType1` tinyint unsigned NOT NULL DEFAULT '0',
  `RtOperandType2` tinyint unsigned NOT NULL DEFAULT '0',
  `RtOperandType3` tinyint unsigned NOT NULL DEFAULT '0',
  `RtOperandType4` tinyint unsigned NOT NULL DEFAULT '0',
  `RtOperandType5` tinyint unsigned NOT NULL DEFAULT '0',
  `RtOperand1` tinyint unsigned NOT NULL DEFAULT '0',
  `RtOperand2` tinyint unsigned NOT NULL DEFAULT '0',
  `RtOperand3` tinyint unsigned NOT NULL DEFAULT '0',
  `RtOperand4` tinyint unsigned NOT NULL DEFAULT '0',
  `RtOperand5` tinyint unsigned NOT NULL DEFAULT '0',
  `Logic1` tinyint unsigned NOT NULL DEFAULT '0',
  `Logic2` tinyint unsigned NOT NULL DEFAULT '0',
  `Logic3` tinyint unsigned NOT NULL DEFAULT '0',
  `Logic4` tinyint unsigned NOT NULL DEFAULT '0',
  `Logic5` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_item_enchantment_condition is empty)


-- ==========================================
-- Table: spell_item_enchantment_locale
-- ==========================================
CREATE TABLE `spell_item_enchantment_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `HordeName_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table spell_item_enchantment_locale is empty)


-- ==========================================
-- Table: spell_keybound_override
-- ==========================================
CREATE TABLE `spell_keybound_override` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Function` text COLLATE utf8mb4_unicode_ci,
  `Type` tinyint NOT NULL DEFAULT '0',
  `Data` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_keybound_override is empty)


-- ==========================================
-- Table: spell_label
-- ==========================================
CREATE TABLE `spell_label` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `LabelID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_label` (`ID`, `LabelID`, `SpellID`, `VerifiedBuild`) VALUES (165343, 3098, 466012, 59888);


-- ==========================================
-- Table: spell_learn_spell
-- ==========================================
CREATE TABLE `spell_learn_spell` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `LearnSpellID` int NOT NULL DEFAULT '0',
  `OverridesSpellID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_learn_spell` (`ID`, `SpellID`, `LearnSpellID`, `OverridesSpellID`, `VerifiedBuild`) VALUES (1828, 432463, 1224051, 0, 61609);


-- ==========================================
-- Table: spell_levels
-- ==========================================
CREATE TABLE `spell_levels` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxLevel` smallint NOT NULL DEFAULT '0',
  `MaxPassiveAuraLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `BaseLevel` int NOT NULL DEFAULT '0',
  `SpellLevel` int NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_levels` (`ID`, `DifficultyID`, `MaxLevel`, `MaxPassiveAuraLevel`, `BaseLevel`, `SpellLevel`, `SpellID`, `VerifiedBuild`) VALUES (145030, 0, 0, 0, 0, 0, 466000, 59888);


-- ==========================================
-- Table: spell_locale
-- ==========================================
CREATE TABLE `spell_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `NameSubtext_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `AuraDescription_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table spell_locale is empty)


-- ==========================================
-- Table: spell_misc
-- ==========================================
CREATE TABLE `spell_misc` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Attributes1` int NOT NULL DEFAULT '0',
  `Attributes2` int NOT NULL DEFAULT '0',
  `Attributes3` int NOT NULL DEFAULT '0',
  `Attributes4` int NOT NULL DEFAULT '0',
  `Attributes5` int NOT NULL DEFAULT '0',
  `Attributes6` int NOT NULL DEFAULT '0',
  `Attributes7` int NOT NULL DEFAULT '0',
  `Attributes8` int NOT NULL DEFAULT '0',
  `Attributes9` int NOT NULL DEFAULT '0',
  `Attributes10` int NOT NULL DEFAULT '0',
  `Attributes11` int NOT NULL DEFAULT '0',
  `Attributes12` int NOT NULL DEFAULT '0',
  `Attributes13` int NOT NULL DEFAULT '0',
  `Attributes14` int NOT NULL DEFAULT '0',
  `Attributes15` int NOT NULL DEFAULT '0',
  `Attributes16` int NOT NULL DEFAULT '0',
  `DifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `CastingTimeIndex` smallint unsigned NOT NULL DEFAULT '0',
  `DurationIndex` smallint unsigned NOT NULL DEFAULT '0',
  `PvPDurationIndex` smallint unsigned NOT NULL DEFAULT '0',
  `RangeIndex` smallint unsigned NOT NULL DEFAULT '0',
  `SchoolMask` tinyint unsigned NOT NULL DEFAULT '0',
  `Speed` float NOT NULL DEFAULT '0',
  `LaunchDelay` float NOT NULL DEFAULT '0',
  `MinDuration` float NOT NULL DEFAULT '0',
  `SpellIconFileDataID` int NOT NULL DEFAULT '0',
  `ActiveIconFileDataID` int NOT NULL DEFAULT '0',
  `ContentTuningID` int NOT NULL DEFAULT '0',
  `ShowFutureSpellPlayerConditionID` int NOT NULL DEFAULT '0',
  `SpellVisualScript` int NOT NULL DEFAULT '0',
  `ActiveSpellVisualScript` int NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_misc` (`ID`, `Attributes1`, `Attributes2`, `Attributes3`, `Attributes4`, `Attributes5`, `Attributes6`, `Attributes7`, `Attributes8`, `Attributes9`, `Attributes10`, `Attributes11`, `Attributes12`, `Attributes13`, `Attributes14`, `Attributes15`, `Attributes16`, `DifficultyID`, `CastingTimeIndex`, `DurationIndex`, `PvPDurationIndex`, `RangeIndex`, `SchoolMask`, `Speed`, `LaunchDelay`, `MinDuration`, `SpellIconFileDataID`, `ActiveIconFileDataID`, `ContentTuningID`, `ShowFutureSpellPlayerConditionID`, `SpellVisualScript`, `ActiveSpellVisualScript`, `SpellID`, `VerifiedBuild`) VALUES (1453, 327696, 134218240, 4096, 1024, 512, 0, 0, 0, 0, 4194304, -2147483648, 0, 0, 1, 1, 0, 0, 1, 0, 0, 2, 1, 0.0, 0.0, 0.0, 135358, 0, 0, 0, 0, 0, 5308, 59888);


-- ==========================================
-- Table: spell_name
-- ==========================================
CREATE TABLE `spell_name` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_name` (`ID`, `Name`, `VerifiedBuild`) VALUES (12543, 'Hi-Explosive Bomb', 61609);


-- ==========================================
-- Table: spell_name_locale
-- ==========================================
CREATE TABLE `spell_name_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `spell_name_locale` (`ID`, `locale`, `Name_lang`, `VerifiedBuild`) VALUES (12543, 'deDE', 'Hochexplosive Bombe', 61609);


-- ==========================================
-- Table: spell_power
-- ==========================================
CREATE TABLE `spell_power` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `ManaCost` int NOT NULL DEFAULT '0',
  `ManaCostPerLevel` int NOT NULL DEFAULT '0',
  `ManaPerSecond` int NOT NULL DEFAULT '0',
  `PowerDisplayID` int unsigned NOT NULL DEFAULT '0',
  `AltPowerBarID` int NOT NULL DEFAULT '0',
  `PowerCostPct` float NOT NULL DEFAULT '0',
  `PowerCostMaxPct` float NOT NULL DEFAULT '0',
  `OptionalCostPct` float NOT NULL DEFAULT '0',
  `PowerPctPerSecond` float NOT NULL DEFAULT '0',
  `PowerType` tinyint NOT NULL DEFAULT '0',
  `RequiredAuraSpellID` int NOT NULL DEFAULT '0',
  `OptionalCost` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_power` (`ID`, `OrderIndex`, `ManaCost`, `ManaCostPerLevel`, `ManaPerSecond`, `PowerDisplayID`, `AltPowerBarID`, `PowerCostPct`, `PowerCostMaxPct`, `OptionalCostPct`, `PowerPctPerSecond`, `PowerType`, `RequiredAuraSpellID`, `OptionalCost`, `SpellID`, `VerifiedBuild`) VALUES (3361, 0, 0, 0, 0, 0, 0, 2.5, 0.0, 0.0, 0.0, 0, 0, 0, 77472, 59888);


-- ==========================================
-- Table: spell_power_difficulty
-- ==========================================
CREATE TABLE `spell_power_difficulty` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `OrderIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_power_difficulty is empty)


-- ==========================================
-- Table: spell_procs_per_minute
-- ==========================================
CREATE TABLE `spell_procs_per_minute` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `BaseProcRate` float NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_procs_per_minute` (`ID`, `BaseProcRate`, `Flags`, `VerifiedBuild`) VALUES (451, 0.4, 1, 62493);


-- ==========================================
-- Table: spell_procs_per_minute_mod
-- ==========================================
CREATE TABLE `spell_procs_per_minute_mod` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `Param` int NOT NULL DEFAULT '0',
  `Coeff` float NOT NULL DEFAULT '0',
  `SpellProcsPerMinuteID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_procs_per_minute_mod` (`ID`, `Type`, `Param`, `Coeff`, `SpellProcsPerMinuteID`, `VerifiedBuild`) VALUES (1275, 1, 4, 1.0, 466, 59888);


-- ==========================================
-- Table: spell_radius
-- ==========================================
CREATE TABLE `spell_radius` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Radius` float NOT NULL DEFAULT '0',
  `RadiusPerLevel` float NOT NULL DEFAULT '0',
  `RadiusMin` float NOT NULL DEFAULT '0',
  `RadiusMax` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_radius is empty)


-- ==========================================
-- Table: spell_range
-- ==========================================
CREATE TABLE `spell_range` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DisplayName` text COLLATE utf8mb4_unicode_ci,
  `DisplayNameShort` text COLLATE utf8mb4_unicode_ci,
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `RangeMin1` float NOT NULL DEFAULT '0',
  `RangeMin2` float NOT NULL DEFAULT '0',
  `RangeMax1` float NOT NULL DEFAULT '0',
  `RangeMax2` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_range is empty)


-- ==========================================
-- Table: spell_range_locale
-- ==========================================
CREATE TABLE `spell_range_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DisplayName_lang` text COLLATE utf8mb4_unicode_ci,
  `DisplayNameShort_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table spell_range_locale is empty)


-- ==========================================
-- Table: spell_reagents
-- ==========================================
CREATE TABLE `spell_reagents` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `Reagent1` int NOT NULL DEFAULT '0',
  `Reagent2` int NOT NULL DEFAULT '0',
  `Reagent3` int NOT NULL DEFAULT '0',
  `Reagent4` int NOT NULL DEFAULT '0',
  `Reagent5` int NOT NULL DEFAULT '0',
  `Reagent6` int NOT NULL DEFAULT '0',
  `Reagent7` int NOT NULL DEFAULT '0',
  `Reagent8` int NOT NULL DEFAULT '0',
  `ReagentCount1` smallint NOT NULL DEFAULT '0',
  `ReagentCount2` smallint NOT NULL DEFAULT '0',
  `ReagentCount3` smallint NOT NULL DEFAULT '0',
  `ReagentCount4` smallint NOT NULL DEFAULT '0',
  `ReagentCount5` smallint NOT NULL DEFAULT '0',
  `ReagentCount6` smallint NOT NULL DEFAULT '0',
  `ReagentCount7` smallint NOT NULL DEFAULT '0',
  `ReagentCount8` smallint NOT NULL DEFAULT '0',
  `ReagentRecraftCount1` smallint NOT NULL DEFAULT '0',
  `ReagentRecraftCount2` smallint NOT NULL DEFAULT '0',
  `ReagentRecraftCount3` smallint NOT NULL DEFAULT '0',
  `ReagentRecraftCount4` smallint NOT NULL DEFAULT '0',
  `ReagentRecraftCount5` smallint NOT NULL DEFAULT '0',
  `ReagentRecraftCount6` smallint NOT NULL DEFAULT '0',
  `ReagentRecraftCount7` smallint NOT NULL DEFAULT '0',
  `ReagentRecraftCount8` smallint NOT NULL DEFAULT '0',
  `ReagentSource1` tinyint unsigned NOT NULL DEFAULT '0',
  `ReagentSource2` tinyint unsigned NOT NULL DEFAULT '0',
  `ReagentSource3` tinyint unsigned NOT NULL DEFAULT '0',
  `ReagentSource4` tinyint unsigned NOT NULL DEFAULT '0',
  `ReagentSource5` tinyint unsigned NOT NULL DEFAULT '0',
  `ReagentSource6` tinyint unsigned NOT NULL DEFAULT '0',
  `ReagentSource7` tinyint unsigned NOT NULL DEFAULT '0',
  `ReagentSource8` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_reagents` (`ID`, `SpellID`, `Reagent1`, `Reagent2`, `Reagent3`, `Reagent4`, `Reagent5`, `Reagent6`, `Reagent7`, `Reagent8`, `ReagentCount1`, `ReagentCount2`, `ReagentCount3`, `ReagentCount4`, `ReagentCount5`, `ReagentCount6`, `ReagentCount7`, `ReagentCount8`, `ReagentRecraftCount1`, `ReagentRecraftCount2`, `ReagentRecraftCount3`, `ReagentRecraftCount4`, `ReagentRecraftCount5`, `ReagentRecraftCount6`, `ReagentRecraftCount7`, `ReagentRecraftCount8`, `ReagentSource1`, `ReagentSource2`, `ReagentSource3`, `ReagentSource4`, `ReagentSource5`, `ReagentSource6`, `ReagentSource7`, `ReagentSource8`, `VerifiedBuild`) VALUES (33341, 445726, 235897, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59888);


-- ==========================================
-- Table: spell_reagents_currency
-- ==========================================
CREATE TABLE `spell_reagents_currency` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `CurrencyTypesID` smallint unsigned NOT NULL DEFAULT '0',
  `CurrencyCount` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_reagents_currency is empty)


-- ==========================================
-- Table: spell_scaling
-- ==========================================
CREATE TABLE `spell_scaling` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `MinScalingLevel` int unsigned NOT NULL DEFAULT '0',
  `MaxScalingLevel` int unsigned NOT NULL DEFAULT '0',
  `ScalesFromItemLevel` smallint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_scaling` (`ID`, `SpellID`, `MinScalingLevel`, `MaxScalingLevel`, `ScalesFromItemLevel`, `VerifiedBuild`) VALUES (3704, 65006, 0, 0, 0, 62493);


-- ==========================================
-- Table: spell_shapeshift
-- ==========================================
CREATE TABLE `spell_shapeshift` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `StanceBarOrder` tinyint NOT NULL DEFAULT '0',
  `ShapeshiftExclude1` int NOT NULL DEFAULT '0',
  `ShapeshiftExclude2` int NOT NULL DEFAULT '0',
  `ShapeshiftMask1` int NOT NULL DEFAULT '0',
  `ShapeshiftMask2` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_shapeshift is empty)


-- ==========================================
-- Table: spell_shapeshift_form
-- ==========================================
CREATE TABLE `spell_shapeshift_form` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `CreatureDisplayID` int unsigned NOT NULL DEFAULT '0',
  `CreatureType` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `AttackIconFileID` int NOT NULL DEFAULT '0',
  `BonusActionBar` tinyint NOT NULL DEFAULT '0',
  `CombatRoundTime` smallint NOT NULL DEFAULT '0',
  `DamageVariance` float NOT NULL DEFAULT '0',
  `MountTypeID` smallint unsigned NOT NULL DEFAULT '0',
  `PresetSpellID1` int unsigned NOT NULL DEFAULT '0',
  `PresetSpellID2` int unsigned NOT NULL DEFAULT '0',
  `PresetSpellID3` int unsigned NOT NULL DEFAULT '0',
  `PresetSpellID4` int unsigned NOT NULL DEFAULT '0',
  `PresetSpellID5` int unsigned NOT NULL DEFAULT '0',
  `PresetSpellID6` int unsigned NOT NULL DEFAULT '0',
  `PresetSpellID7` int unsigned NOT NULL DEFAULT '0',
  `PresetSpellID8` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_shapeshift_form is empty)


-- ==========================================
-- Table: spell_shapeshift_form_locale
-- ==========================================
CREATE TABLE `spell_shapeshift_form_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table spell_shapeshift_form_locale is empty)


-- ==========================================
-- Table: spell_target_restrictions
-- ==========================================
CREATE TABLE `spell_target_restrictions` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `ConeDegrees` float NOT NULL DEFAULT '0',
  `MaxTargets` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxTargetLevel` int unsigned NOT NULL DEFAULT '0',
  `TargetCreatureType` smallint NOT NULL DEFAULT '0',
  `Targets` int NOT NULL DEFAULT '0',
  `Width` float NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_target_restrictions` (`ID`, `DifficultyID`, `ConeDegrees`, `MaxTargets`, `MaxTargetLevel`, `TargetCreatureType`, `Targets`, `Width`, `SpellID`, `VerifiedBuild`) VALUES (503, 0, 0.0, 0, 49, 0, 64, 0.0, 12543, 61609);


-- ==========================================
-- Table: spell_totems
-- ==========================================
CREATE TABLE `spell_totems` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `RequiredTotemCategoryID1` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredTotemCategoryID2` smallint unsigned NOT NULL DEFAULT '0',
  `Totem1` int NOT NULL DEFAULT '0',
  `Totem2` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table spell_totems is empty)


-- ==========================================
-- Table: spell_visual
-- ==========================================
CREATE TABLE `spell_visual` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MissileCastOffset1` float NOT NULL DEFAULT '0',
  `MissileCastOffset2` float NOT NULL DEFAULT '0',
  `MissileCastOffset3` float NOT NULL DEFAULT '0',
  `MissileImpactOffset1` float NOT NULL DEFAULT '0',
  `MissileImpactOffset2` float NOT NULL DEFAULT '0',
  `MissileImpactOffset3` float NOT NULL DEFAULT '0',
  `AnimEventSoundID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `MissileAttachment` tinyint NOT NULL DEFAULT '0',
  `MissileDestinationAttachment` tinyint NOT NULL DEFAULT '0',
  `MissileCastPositionerID` int unsigned NOT NULL DEFAULT '0',
  `MissileImpactPositionerID` int unsigned NOT NULL DEFAULT '0',
  `MissileTargetingKit` int NOT NULL DEFAULT '0',
  `HostileSpellVisualID` int unsigned NOT NULL DEFAULT '0',
  `CasterSpellVisualID` int unsigned NOT NULL DEFAULT '0',
  `SpellVisualMissileSetID` smallint unsigned NOT NULL DEFAULT '0',
  `DamageNumberDelay` smallint unsigned NOT NULL DEFAULT '0',
  `LowViolenceSpellVisualID` int unsigned NOT NULL DEFAULT '0',
  `RaidSpellVisualMissileSetID` int unsigned NOT NULL DEFAULT '0',
  `ReducedUnexpectedCameraMovementSpellVisualID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_visual` (`ID`, `MissileCastOffset1`, `MissileCastOffset2`, `MissileCastOffset3`, `MissileImpactOffset1`, `MissileImpactOffset2`, `MissileImpactOffset3`, `AnimEventSoundID`, `Flags`, `MissileAttachment`, `MissileDestinationAttachment`, `MissileCastPositionerID`, `MissileImpactPositionerID`, `MissileTargetingKit`, `HostileSpellVisualID`, `CasterSpellVisualID`, `SpellVisualMissileSetID`, `DamageNumberDelay`, `LowViolenceSpellVisualID`, `RaidSpellVisualMissileSetID`, `ReducedUnexpectedCameraMovementSpellVisualID`, `VerifiedBuild`) VALUES (7438, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, -1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 61609);


-- ==========================================
-- Table: spell_visual_effect_name
-- ==========================================
CREATE TABLE `spell_visual_effect_name` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ModelFileDataID` int NOT NULL DEFAULT '0',
  `BaseMissileSpeed` float NOT NULL DEFAULT '0',
  `Scale` float NOT NULL DEFAULT '0',
  `MinAllowedScale` float NOT NULL DEFAULT '0',
  `MaxAllowedScale` float NOT NULL DEFAULT '0',
  `Alpha` float NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `TextureFileDataID` int NOT NULL DEFAULT '0',
  `EffectRadius` float NOT NULL DEFAULT '0',
  `Type` int unsigned NOT NULL DEFAULT '0',
  `GenericID` int NOT NULL DEFAULT '0',
  `RibbonQualityID` int unsigned NOT NULL DEFAULT '0',
  `DissolveEffectID` int NOT NULL DEFAULT '0',
  `ModelPosition` int NOT NULL DEFAULT '0',
  `Unknown901` tinyint NOT NULL DEFAULT '0',
  `Unknown1100` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_visual_effect_name` (`ID`, `ModelFileDataID`, `BaseMissileSpeed`, `Scale`, `MinAllowedScale`, `MaxAllowedScale`, `Alpha`, `Flags`, `TextureFileDataID`, `EffectRadius`, `Type`, `GenericID`, `RibbonQualityID`, `DissolveEffectID`, `ModelPosition`, `Unknown901`, `Unknown1100`, `VerifiedBuild`) VALUES (38154, 3556379, 0.0, 1.0, 0.5, 1.5, 0.1, 25761, 0, 0.0, 2, 100053, 0, 1608, -1, 0, 0, 64270);


-- ==========================================
-- Table: spell_visual_kit
-- ==========================================
CREATE TABLE `spell_visual_kit` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ClutterLevel` int NOT NULL DEFAULT '0',
  `FallbackSpellVisualKitId` int NOT NULL DEFAULT '0',
  `DelayMin` smallint unsigned NOT NULL DEFAULT '0',
  `DelayMax` smallint unsigned NOT NULL DEFAULT '0',
  `MinimumSpellVisualDensityFilterType` int NOT NULL DEFAULT '0',
  `MinimumSpellVisualDensityFilterParam` int NOT NULL DEFAULT '0',
  `ReducedSpellVisualDensityFilterType` int NOT NULL DEFAULT '0',
  `ReducedSpellVisualDensityFilterParam` int NOT NULL DEFAULT '0',
  `Flags1` int NOT NULL DEFAULT '0',
  `Flags2` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_visual_kit` (`ID`, `ClutterLevel`, `FallbackSpellVisualKitId`, `DelayMin`, `DelayMax`, `MinimumSpellVisualDensityFilterType`, `MinimumSpellVisualDensityFilterParam`, `ReducedSpellVisualDensityFilterType`, `ReducedSpellVisualDensityFilterParam`, `Flags1`, `Flags2`, `VerifiedBuild`) VALUES (110503, 0, 0, 0, 0, 0, 0, 0, 0, 131072, 0, 59888);


-- ==========================================
-- Table: spell_visual_missile
-- ==========================================
CREATE TABLE `spell_visual_missile` (
  `CastOffset1` float NOT NULL DEFAULT '0',
  `CastOffset2` float NOT NULL DEFAULT '0',
  `CastOffset3` float NOT NULL DEFAULT '0',
  `ImpactOffset1` float NOT NULL DEFAULT '0',
  `ImpactOffset2` float NOT NULL DEFAULT '0',
  `ImpactOffset3` float NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellVisualEffectNameID` smallint unsigned NOT NULL DEFAULT '0',
  `SoundEntriesID` int unsigned NOT NULL DEFAULT '0',
  `Attachment` tinyint NOT NULL DEFAULT '0',
  `DestinationAttachment` tinyint NOT NULL DEFAULT '0',
  `CastPositionerID` smallint unsigned NOT NULL DEFAULT '0',
  `ImpactPositionerID` smallint unsigned NOT NULL DEFAULT '0',
  `FollowGroundHeight` int NOT NULL DEFAULT '0',
  `FollowGroundDropSpeed` int unsigned NOT NULL DEFAULT '0',
  `FollowGroundApproach` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `SpellMissileMotionID` smallint unsigned NOT NULL DEFAULT '0',
  `AnimKitID` int unsigned NOT NULL DEFAULT '0',
  `ClutterLevel` int NOT NULL DEFAULT '0',
  `DecayTimeAfterImpact` int NOT NULL DEFAULT '0',
  `Unused1100` smallint unsigned NOT NULL DEFAULT '0',
  `SpellVisualMissileSetID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_visual_missile` (`CastOffset1`, `CastOffset2`, `CastOffset3`, `ImpactOffset1`, `ImpactOffset2`, `ImpactOffset3`, `ID`, `SpellVisualEffectNameID`, `SoundEntriesID`, `Attachment`, `DestinationAttachment`, `CastPositionerID`, `ImpactPositionerID`, `FollowGroundHeight`, `FollowGroundDropSpeed`, `FollowGroundApproach`, `Flags`, `SpellMissileMotionID`, `AnimKitID`, `ClutterLevel`, `DecayTimeAfterImpact`, `Unused1100`, `SpellVisualMissileSetID`, `VerifiedBuild`) VALUES (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2227, 42004, 243068, -1, 34, 0, 0, 0, 300, 750, 516, 0, 0, 0, 0, 0, 2228, 61609);


-- ==========================================
-- Table: spell_x_spell_visual
-- ==========================================
CREATE TABLE `spell_x_spell_visual` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellVisualID` int unsigned NOT NULL DEFAULT '0',
  `Probability` float NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `Priority` int NOT NULL DEFAULT '0',
  `SpellIconFileID` int NOT NULL DEFAULT '0',
  `ActiveIconFileID` int NOT NULL DEFAULT '0',
  `ViewerUnitConditionID` smallint unsigned NOT NULL DEFAULT '0',
  `ViewerPlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `CasterUnitConditionID` smallint unsigned NOT NULL DEFAULT '0',
  `CasterPlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_x_spell_visual` (`ID`, `DifficultyID`, `SpellVisualID`, `Probability`, `Flags`, `Priority`, `SpellIconFileID`, `ActiveIconFileID`, `ViewerUnitConditionID`, `ViewerPlayerConditionID`, `CasterUnitConditionID`, `CasterPlayerConditionID`, `SpellID`, `VerifiedBuild`) VALUES (255314, 0, 76840, 1.0, 0, 0, 0, 0, 0, 0, 0, 0, 270279, 59888);


-- ==========================================
-- Table: summon_properties
-- ==========================================
CREATE TABLE `summon_properties` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Control` int NOT NULL DEFAULT '0',
  `Faction` int NOT NULL DEFAULT '0',
  `Title` int NOT NULL DEFAULT '0',
  `Slot` int NOT NULL DEFAULT '0',
  `Flags1` int NOT NULL DEFAULT '0',
  `Flags2` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `summon_properties` (`ID`, `Control`, `Faction`, `Title`, `Slot`, `Flags1`, `Flags2`, `VerifiedBuild`) VALUES (5955, 1, 0, 29, 0, 655882, 0, 62493);


-- ==========================================
-- Table: tact_key
-- ==========================================
CREATE TABLE `tact_key` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Key1` tinyint unsigned NOT NULL DEFAULT '0',
  `Key2` tinyint unsigned NOT NULL DEFAULT '0',
  `Key3` tinyint unsigned NOT NULL DEFAULT '0',
  `Key4` tinyint unsigned NOT NULL DEFAULT '0',
  `Key5` tinyint unsigned NOT NULL DEFAULT '0',
  `Key6` tinyint unsigned NOT NULL DEFAULT '0',
  `Key7` tinyint unsigned NOT NULL DEFAULT '0',
  `Key8` tinyint unsigned NOT NULL DEFAULT '0',
  `Key9` tinyint unsigned NOT NULL DEFAULT '0',
  `Key10` tinyint unsigned NOT NULL DEFAULT '0',
  `Key11` tinyint unsigned NOT NULL DEFAULT '0',
  `Key12` tinyint unsigned NOT NULL DEFAULT '0',
  `Key13` tinyint unsigned NOT NULL DEFAULT '0',
  `Key14` tinyint unsigned NOT NULL DEFAULT '0',
  `Key15` tinyint unsigned NOT NULL DEFAULT '0',
  `Key16` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tact_key` (`ID`, `Key1`, `Key2`, `Key3`, `Key4`, `Key5`, `Key6`, `Key7`, `Key8`, `Key9`, `Key10`, `Key11`, `Key12`, `Key13`, `Key14`, `Key15`, `Key16`, `VerifiedBuild`) VALUES (58, 209, 172, 32, 253, 20, 149, 127, 171, 194, 113, 150, 233, 246, 231, 2, 74, 51130);


-- ==========================================
-- Table: talent
-- ==========================================
CREATE TABLE `talent` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Description` text COLLATE utf8mb4_unicode_ci,
  `TierID` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ColumnIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `TabID` smallint unsigned NOT NULL DEFAULT '0',
  `ClassID` tinyint NOT NULL DEFAULT '0',
  `SpecID` smallint unsigned NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `OverridesSpellID` int unsigned NOT NULL DEFAULT '0',
  `RequiredSpellID` int unsigned NOT NULL DEFAULT '0',
  `CategoryMask1` int NOT NULL DEFAULT '0',
  `CategoryMask2` int NOT NULL DEFAULT '0',
  `SpellRank1` int unsigned NOT NULL DEFAULT '0',
  `SpellRank2` int unsigned NOT NULL DEFAULT '0',
  `SpellRank3` int unsigned NOT NULL DEFAULT '0',
  `SpellRank4` int unsigned NOT NULL DEFAULT '0',
  `SpellRank5` int unsigned NOT NULL DEFAULT '0',
  `SpellRank6` int unsigned NOT NULL DEFAULT '0',
  `SpellRank7` int unsigned NOT NULL DEFAULT '0',
  `SpellRank8` int unsigned NOT NULL DEFAULT '0',
  `SpellRank9` int unsigned NOT NULL DEFAULT '0',
  `PrereqTalent1` int unsigned NOT NULL DEFAULT '0',
  `PrereqTalent2` int unsigned NOT NULL DEFAULT '0',
  `PrereqTalent3` int unsigned NOT NULL DEFAULT '0',
  `PrereqRank1` tinyint unsigned NOT NULL DEFAULT '0',
  `PrereqRank2` tinyint unsigned NOT NULL DEFAULT '0',
  `PrereqRank3` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `talent` (`ID`, `Description`, `TierID`, `Flags`, `ColumnIndex`, `TabID`, `ClassID`, `SpecID`, `SpellID`, `OverridesSpellID`, `RequiredSpellID`, `CategoryMask1`, `CategoryMask2`, `SpellRank1`, `SpellRank2`, `SpellRank3`, `SpellRank4`, `SpellRank5`, `SpellRank6`, `SpellRank7`, `SpellRank8`, `SpellRank9`, `PrereqTalent1`, `PrereqTalent2`, `PrereqTalent3`, `PrereqRank1`, `PrereqRank2`, `PrereqRank3`, `VerifiedBuild`) VALUES (15757, NULL, 3, 0, 0, 2053, 1, 71, 29838, 0, 0, 0, 0, 29838, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


-- ==========================================
-- Table: talent_locale
-- ==========================================
CREATE TABLE `talent_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table talent_locale is empty)


-- ==========================================
-- Table: taxi_nodes
-- ==========================================
CREATE TABLE `taxi_nodes` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `PosX` float NOT NULL DEFAULT '0',
  `PosY` float NOT NULL DEFAULT '0',
  `PosZ` float NOT NULL DEFAULT '0',
  `MapOffsetX` float NOT NULL DEFAULT '0',
  `MapOffsetY` float NOT NULL DEFAULT '0',
  `FlightMapOffsetX` float NOT NULL DEFAULT '0',
  `FlightMapOffsetY` float NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ContinentID` smallint unsigned NOT NULL DEFAULT '0',
  `ConditionID` int NOT NULL DEFAULT '0',
  `CharacterBitNumber` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `UiTextureKitID` int NOT NULL DEFAULT '0',
  `MinimapAtlasMemberID` int NOT NULL DEFAULT '0',
  `Facing` float NOT NULL DEFAULT '0',
  `SpecialIconConditionID` int unsigned NOT NULL DEFAULT '0',
  `VisibilityConditionID` int unsigned NOT NULL DEFAULT '0',
  `MountCreatureID1` int NOT NULL DEFAULT '0',
  `MountCreatureID2` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table taxi_nodes is empty)


-- ==========================================
-- Table: taxi_nodes_locale
-- ==========================================
CREATE TABLE `taxi_nodes_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table taxi_nodes_locale is empty)


-- ==========================================
-- Table: taxi_path
-- ==========================================
CREATE TABLE `taxi_path` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `FromTaxiNode` smallint unsigned NOT NULL DEFAULT '0',
  `ToTaxiNode` smallint unsigned NOT NULL DEFAULT '0',
  `Cost` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `taxi_path` (`ID`, `FromTaxiNode`, `ToTaxiNode`, `Cost`, `VerifiedBuild`) VALUES (10523, 0, 0, 0, 59888);


-- ==========================================
-- Table: taxi_path_node
-- ==========================================
CREATE TABLE `taxi_path_node` (
  `LocX` float NOT NULL DEFAULT '0',
  `LocY` float NOT NULL DEFAULT '0',
  `LocZ` float NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PathID` smallint unsigned NOT NULL DEFAULT '0',
  `NodeIndex` int NOT NULL DEFAULT '0',
  `ContinentID` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `Delay` int unsigned NOT NULL DEFAULT '0',
  `ArrivalEventID` int NOT NULL DEFAULT '0',
  `DepartureEventID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `taxi_path_node` (`LocX`, `LocY`, `LocZ`, `ID`, `PathID`, `NodeIndex`, `ContinentID`, `Flags`, `Delay`, `ArrivalEventID`, `DepartureEventID`, `VerifiedBuild`) VALUES (-1252.73, -333.889, 520.069, 156439, 10283, 0, 2738, 0, 0, 0, 0, 62493);


-- ==========================================
-- Table: texture_file_data
-- ==========================================
CREATE TABLE `texture_file_data` (
  `ID` int unsigned NOT NULL,
  `UsageType` tinyint unsigned NOT NULL DEFAULT '0',
  `TextureID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table texture_file_data is empty)


-- ==========================================
-- Table: totem_category
-- ==========================================
CREATE TABLE `totem_category` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `TotemCategoryType` tinyint unsigned NOT NULL DEFAULT '0',
  `TotemCategoryMask` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table totem_category is empty)


-- ==========================================
-- Table: totem_category_locale
-- ==========================================
CREATE TABLE `totem_category_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table totem_category_locale is empty)


-- ==========================================
-- Table: toy
-- ==========================================
CREATE TABLE `toy` (
  `SourceText` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ItemID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `SourceTypeEnum` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `toy` (`SourceText`, `ID`, `ItemID`, `Flags`, `SourceTypeEnum`, `VerifiedBuild`) VALUES ('|cFFFFD200Quest:|r Showdown in the Attic|n|cFFFFD200Zone: |rUndermine', 1534, 233202, 0, 1, 59888);


-- ==========================================
-- Table: toy_locale
-- ==========================================
CREATE TABLE `toy_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SourceText_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `toy_locale` (`ID`, `locale`, `SourceText_lang`, `VerifiedBuild`) VALUES (1534, 'deDE', '|cFFFFD200Quest:|r Duell unterm Dach|n|cFFFFD200Zone: |rLorenhall', 59888);


-- ==========================================
-- Table: trait_cond
-- ==========================================
CREATE TABLE `trait_cond` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `CondType` int NOT NULL DEFAULT '0',
  `TraitTreeID` int unsigned NOT NULL DEFAULT '0',
  `GrantedRanks` int NOT NULL DEFAULT '0',
  `QuestID` int NOT NULL DEFAULT '0',
  `AchievementID` int NOT NULL DEFAULT '0',
  `SpecSetID` int NOT NULL DEFAULT '0',
  `TraitNodeGroupID` int NOT NULL DEFAULT '0',
  `TraitNodeID` int NOT NULL DEFAULT '0',
  `TraitNodeEntryID` int NOT NULL DEFAULT '0',
  `TraitCurrencyID` int NOT NULL DEFAULT '0',
  `SpentAmountRequired` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `RequiredLevel` int NOT NULL DEFAULT '0',
  `FreeSharedStringID` int NOT NULL DEFAULT '0',
  `SpendMoreSharedStringID` int NOT NULL DEFAULT '0',
  `TraitCondAccountElementID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_cond is empty)


-- ==========================================
-- Table: trait_cost
-- ==========================================
CREATE TABLE `trait_cost` (
  `InternalName` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Amount` int NOT NULL DEFAULT '0',
  `TraitCurrencyID` int NOT NULL DEFAULT '0',
  `CurveID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_cost is empty)


-- ==========================================
-- Table: trait_currency
-- ==========================================
CREATE TABLE `trait_currency` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Type` int NOT NULL DEFAULT '0',
  `CurrencyTypesID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `Icon` int NOT NULL DEFAULT '0',
  `PlayerDataElementAccountID` int NOT NULL DEFAULT '0',
  `PlayerDataElementCharacterID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_currency is empty)


-- ==========================================
-- Table: trait_currency_source
-- ==========================================
CREATE TABLE `trait_currency_source` (
  `Requirement` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitCurrencyID` int unsigned NOT NULL DEFAULT '0',
  `Amount` int NOT NULL DEFAULT '0',
  `QuestID` int NOT NULL DEFAULT '0',
  `AchievementID` int NOT NULL DEFAULT '0',
  `PlayerLevel` int NOT NULL DEFAULT '0',
  `TraitNodeEntryID` int NOT NULL DEFAULT '0',
  `OrderIndex` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_currency_source is empty)


-- ==========================================
-- Table: trait_currency_source_locale
-- ==========================================
CREATE TABLE `trait_currency_source_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Requirement_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table trait_currency_source_locale is empty)


-- ==========================================
-- Table: trait_definition
-- ==========================================
CREATE TABLE `trait_definition` (
  `OverrideName` text COLLATE utf8mb4_unicode_ci,
  `OverrideSubtext` text COLLATE utf8mb4_unicode_ci,
  `OverrideDescription` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int NOT NULL DEFAULT '0',
  `OverrideIcon` int NOT NULL DEFAULT '0',
  `OverridesSpellID` int NOT NULL DEFAULT '0',
  `VisibleSpellID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `trait_definition` (`OverrideName`, `OverrideSubtext`, `OverrideDescription`, `ID`, `SpellID`, `OverrideIcon`, `OverridesSpellID`, `VisibleSpellID`, `VerifiedBuild`) VALUES ('Orbs of Power', '', 'Imbue more energy into your Reshii Wraps, enhancing its power.|n|nEnemies killed while Phase Diving now have a chance to drop a phase orb that increases your primary stat. Phase orbs have a chance to recover a Phase-Lost appearance.|n|nYou may now ride Phase-Lost Slatebacks when Phase Diving.', 135400, 0, 1033906, 0, 0, 62493);


-- ==========================================
-- Table: trait_definition_effect_points
-- ==========================================
CREATE TABLE `trait_definition_effect_points` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitDefinitionID` int unsigned NOT NULL DEFAULT '0',
  `EffectIndex` int NOT NULL DEFAULT '0',
  `OperationType` int NOT NULL DEFAULT '0',
  `CurveID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `trait_definition_effect_points` (`ID`, `TraitDefinitionID`, `EffectIndex`, `OperationType`, `CurveID`, `VerifiedBuild`) VALUES (23022, 133245, 0, 0, 80255, 59888);


-- ==========================================
-- Table: trait_definition_locale
-- ==========================================
CREATE TABLE `trait_definition_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OverrideName_lang` text COLLATE utf8mb4_unicode_ci,
  `OverrideSubtext_lang` text COLLATE utf8mb4_unicode_ci,
  `OverrideDescription_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `trait_definition_locale` (`ID`, `locale`, `OverrideName_lang`, `OverrideSubtext_lang`, `OverrideDescription_lang`, `VerifiedBuild`) VALUES (136239, 'deDE', '', '', '', 59888);


-- ==========================================
-- Table: trait_edge
-- ==========================================
CREATE TABLE `trait_edge` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `VisualStyle` int NOT NULL DEFAULT '0',
  `LeftTraitNodeID` int unsigned NOT NULL DEFAULT '0',
  `RightTraitNodeID` int NOT NULL DEFAULT '0',
  `Type` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_edge is empty)


-- ==========================================
-- Table: trait_node
-- ==========================================
CREATE TABLE `trait_node` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitTreeID` int unsigned NOT NULL DEFAULT '0',
  `PosX` int NOT NULL DEFAULT '0',
  `PosY` int NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `TraitSubTreeID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `trait_node` (`ID`, `TraitTreeID`, `PosX`, `PosY`, `Type`, `Flags`, `TraitSubTreeID`, `VerifiedBuild`) VALUES (93520, 790, 5400, 3900, 2, 9, 0, 59888);


-- ==========================================
-- Table: trait_node_entry
-- ==========================================
CREATE TABLE `trait_node_entry` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitDefinitionID` int NOT NULL DEFAULT '0',
  `MaxRanks` int NOT NULL DEFAULT '0',
  `NodeEntryType` tinyint unsigned NOT NULL DEFAULT '0',
  `TraitSubTreeID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `trait_node_entry` (`ID`, `TraitDefinitionID`, `MaxRanks`, `NodeEntryType`, `TraitSubTreeID`, `VerifiedBuild`) VALUES (131438, 136239, 1, 2, 0, 59888);


-- ==========================================
-- Table: trait_node_entry_x_trait_cond
-- ==========================================
CREATE TABLE `trait_node_entry_x_trait_cond` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitCondID` int NOT NULL DEFAULT '0',
  `TraitNodeEntryID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_node_entry_x_trait_cond is empty)


-- ==========================================
-- Table: trait_node_entry_x_trait_cost
-- ==========================================
CREATE TABLE `trait_node_entry_x_trait_cost` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitNodeEntryID` int unsigned NOT NULL DEFAULT '0',
  `TraitCostID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_node_entry_x_trait_cost is empty)


-- ==========================================
-- Table: trait_node_group
-- ==========================================
CREATE TABLE `trait_node_group` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitTreeID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_node_group is empty)


-- ==========================================
-- Table: trait_node_group_x_trait_cond
-- ==========================================
CREATE TABLE `trait_node_group_x_trait_cond` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitCondID` int NOT NULL DEFAULT '0',
  `TraitNodeGroupID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_node_group_x_trait_cond is empty)


-- ==========================================
-- Table: trait_node_group_x_trait_cost
-- ==========================================
CREATE TABLE `trait_node_group_x_trait_cost` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitNodeGroupID` int unsigned NOT NULL DEFAULT '0',
  `TraitCostID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_node_group_x_trait_cost is empty)


-- ==========================================
-- Table: trait_node_group_x_trait_node
-- ==========================================
CREATE TABLE `trait_node_group_x_trait_node` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitNodeGroupID` int unsigned NOT NULL DEFAULT '0',
  `TraitNodeID` int NOT NULL DEFAULT '0',
  `Index` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_node_group_x_trait_node is empty)


-- ==========================================
-- Table: trait_node_x_trait_cond
-- ==========================================
CREATE TABLE `trait_node_x_trait_cond` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitCondID` int NOT NULL DEFAULT '0',
  `TraitNodeID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_node_x_trait_cond is empty)


-- ==========================================
-- Table: trait_node_x_trait_cost
-- ==========================================
CREATE TABLE `trait_node_x_trait_cost` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitNodeID` int unsigned NOT NULL DEFAULT '0',
  `TraitCostID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_node_x_trait_cost is empty)


-- ==========================================
-- Table: trait_node_x_trait_node_entry
-- ==========================================
CREATE TABLE `trait_node_x_trait_node_entry` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitNodeID` int unsigned NOT NULL DEFAULT '0',
  `TraitNodeEntryID` int NOT NULL DEFAULT '0',
  `Index` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `trait_node_x_trait_node_entry` (`ID`, `TraitNodeID`, `TraitNodeEntryID`, `Index`, `VerifiedBuild`) VALUES (128905, 93520, 131438, 200, 59888);


-- ==========================================
-- Table: trait_sub_tree
-- ==========================================
CREATE TABLE `trait_sub_tree` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `UiTextureAtlasElementID` int NOT NULL DEFAULT '0',
  `TraitTreeID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_sub_tree is empty)


-- ==========================================
-- Table: trait_sub_tree_locale
-- ==========================================
CREATE TABLE `trait_sub_tree_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table trait_sub_tree_locale is empty)


-- ==========================================
-- Table: trait_system
-- ==========================================
CREATE TABLE `trait_system` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `WidgetSetID` int NOT NULL DEFAULT '0',
  `TraitChangeSpell` int NOT NULL DEFAULT '0',
  `ItemID` int NOT NULL DEFAULT '0',
  `VariationType` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_system is empty)


-- ==========================================
-- Table: trait_tree
-- ==========================================
CREATE TABLE `trait_tree` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitSystemID` int unsigned NOT NULL DEFAULT '0',
  `Unused1000_1` int NOT NULL DEFAULT '0',
  `FirstTraitNodeID` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `Unused1000_2` float NOT NULL DEFAULT '0',
  `Unused1000_3` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `trait_tree` (`ID`, `TraitSystemID`, `Unused1000_1`, `FirstTraitNodeID`, `PlayerConditionID`, `Flags`, `Unused1000_2`, `Unused1000_3`, `VerifiedBuild`) VALUES (790, 0, 0, 0, 0, 0, 0.75, 1.2, 59888);


-- ==========================================
-- Table: trait_tree_loadout
-- ==========================================
CREATE TABLE `trait_tree_loadout` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitTreeID` int unsigned NOT NULL DEFAULT '0',
  `ChrSpecializationID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `trait_tree_loadout` (`ID`, `TraitTreeID`, `ChrSpecializationID`, `VerifiedBuild`) VALUES (613, 854, 577, 59888);


-- ==========================================
-- Table: trait_tree_loadout_entry
-- ==========================================
CREATE TABLE `trait_tree_loadout_entry` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitTreeLoadoutID` int unsigned NOT NULL DEFAULT '0',
  `SelectedTraitNodeID` int NOT NULL DEFAULT '0',
  `SelectedTraitNodeEntryID` int NOT NULL DEFAULT '0',
  `NumPoints` int NOT NULL DEFAULT '0',
  `OrderIndex` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `trait_tree_loadout_entry` (`ID`, `TraitTreeLoadoutID`, `SelectedTraitNodeID`, `SelectedTraitNodeEntryID`, `NumPoints`, `OrderIndex`, `VerifiedBuild`) VALUES (33647, 613, 95147, 0, 2, 61, 59888);


-- ==========================================
-- Table: trait_tree_x_trait_cost
-- ==========================================
CREATE TABLE `trait_tree_x_trait_cost` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TraitTreeID` int unsigned NOT NULL DEFAULT '0',
  `TraitCostID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_tree_x_trait_cost is empty)


-- ==========================================
-- Table: trait_tree_x_trait_currency
-- ==========================================
CREATE TABLE `trait_tree_x_trait_currency` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Index` int NOT NULL DEFAULT '0',
  `TraitTreeID` int unsigned NOT NULL DEFAULT '0',
  `TraitCurrencyID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table trait_tree_x_trait_currency is empty)


-- ==========================================
-- Table: transmog_holiday
-- ==========================================
CREATE TABLE `transmog_holiday` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `RequiredTransmogHoliday` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table transmog_holiday is empty)


-- ==========================================
-- Table: transmog_illusion
-- ==========================================
CREATE TABLE `transmog_illusion` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `UnlockConditionID` int NOT NULL DEFAULT '0',
  `TransmogCost` int NOT NULL DEFAULT '0',
  `SpellItemEnchantmentID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `transmog_illusion` (`ID`, `UnlockConditionID`, `TransmogCost`, `SpellItemEnchantmentID`, `Flags`, `VerifiedBuild`) VALUES (2, 0, 0, 1899, 2, 0);


-- ==========================================
-- Table: transmog_set
-- ==========================================
CREATE TABLE `transmog_set` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ClassMask` int NOT NULL DEFAULT '0',
  `TrackingQuestID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `TransmogSetGroupID` int NOT NULL DEFAULT '0',
  `ItemNameDescriptionID` int NOT NULL DEFAULT '0',
  `ParentTransmogSetID` int unsigned NOT NULL DEFAULT '0',
  `Unknown810` int NOT NULL DEFAULT '0',
  `ExpansionID` int NOT NULL DEFAULT '0',
  `PatchID` int NOT NULL DEFAULT '0',
  `UiOrder` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `transmog_set` (`Name`, `ID`, `ClassMask`, `TrackingQuestID`, `Flags`, `TransmogSetGroupID`, `ItemNameDescriptionID`, `ParentTransmogSetID`, `Unknown810`, `ExpansionID`, `PatchID`, `UiOrder`, `PlayerConditionID`, `VerifiedBuild`) VALUES ('Regalia of Shackled Elements', 934, 64, 87046, 256, 8, 2015, 933, 1, 6, 70001, 8752, 0, 64270);


-- ==========================================
-- Table: transmog_set_group
-- ==========================================
CREATE TABLE `transmog_set_group` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table transmog_set_group is empty)


-- ==========================================
-- Table: transmog_set_group_locale
-- ==========================================
CREATE TABLE `transmog_set_group_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table transmog_set_group_locale is empty)


-- ==========================================
-- Table: transmog_set_item
-- ==========================================
CREATE TABLE `transmog_set_item` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `TransmogSetID` int unsigned NOT NULL DEFAULT '0',
  `ItemModifiedAppearanceID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `transmog_set_item` (`ID`, `TransmogSetID`, `ItemModifiedAppearanceID`, `Flags`, `VerifiedBuild`) VALUES (47445, 2208, 115985, 3, 62493);


-- ==========================================
-- Table: transmog_set_locale
-- ==========================================
CREATE TABLE `transmog_set_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `transmog_set_locale` (`ID`, `locale`, `Name_lang`, `VerifiedBuild`) VALUES (3361, 'deDE', 'Lavendelgewand des Frühlingsfeiernden', 61609);


-- ==========================================
-- Table: transport_animation
-- ==========================================
CREATE TABLE `transport_animation` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PosX` float NOT NULL DEFAULT '0',
  `PosY` float NOT NULL DEFAULT '0',
  `PosZ` float NOT NULL DEFAULT '0',
  `SequenceID` tinyint unsigned NOT NULL DEFAULT '0',
  `TimeIndex` int unsigned NOT NULL DEFAULT '0',
  `TransportID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table transport_animation is empty)


-- ==========================================
-- Table: transport_rotation
-- ==========================================
CREATE TABLE `transport_rotation` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Rot1` float NOT NULL DEFAULT '0',
  `Rot2` float NOT NULL DEFAULT '0',
  `Rot3` float NOT NULL DEFAULT '0',
  `Rot4` float NOT NULL DEFAULT '0',
  `TimeIndex` int unsigned NOT NULL DEFAULT '0',
  `GameObjectsID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table transport_rotation is empty)


-- ==========================================
-- Table: ui_map
-- ==========================================
CREATE TABLE `ui_map` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ParentUiMapID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `System` tinyint unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `BountySetID` int NOT NULL DEFAULT '0',
  `BountyDisplayLocation` int unsigned NOT NULL DEFAULT '0',
  `VisibilityPlayerConditionID2` int NOT NULL DEFAULT '0',
  `VisibilityPlayerConditionID` int NOT NULL DEFAULT '0',
  `HelpTextPosition` tinyint NOT NULL DEFAULT '0',
  `BkgAtlasID` int NOT NULL DEFAULT '0',
  `AlternateUiMapGroup` int NOT NULL DEFAULT '0',
  `ContentTuningID` int NOT NULL DEFAULT '0',
  `AdventureMapTextureKitID` int NOT NULL DEFAULT '0',
  `MapArtZoneTextPosition` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ui_map` (`Name`, `ID`, `ParentUiMapID`, `Flags`, `System`, `Type`, `BountySetID`, `BountyDisplayLocation`, `VisibilityPlayerConditionID2`, `VisibilityPlayerConditionID`, `HelpTextPosition`, `BkgAtlasID`, `AlternateUiMapGroup`, `ContentTuningID`, `AdventureMapTextureKitID`, `MapArtZoneTextPosition`, `VerifiedBuild`) VALUES ('K\'aresh', 2398, 0, 655364, 2, 3, 0, 0, 0, 0, 0, 5350, 0, 0, 0, 0, 62493);


-- ==========================================
-- Table: ui_map_assignment
-- ==========================================
CREATE TABLE `ui_map_assignment` (
  `UiMinX` float NOT NULL DEFAULT '0',
  `UiMinY` float NOT NULL DEFAULT '0',
  `UiMaxX` float NOT NULL DEFAULT '0',
  `UiMaxY` float NOT NULL DEFAULT '0',
  `Region1X` float NOT NULL DEFAULT '0',
  `Region1Y` float NOT NULL DEFAULT '0',
  `Region1Z` float NOT NULL DEFAULT '0',
  `Region2X` float NOT NULL DEFAULT '0',
  `Region2Y` float NOT NULL DEFAULT '0',
  `Region2Z` float NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `UiMapID` int unsigned NOT NULL DEFAULT '0',
  `OrderIndex` int NOT NULL DEFAULT '0',
  `MapID` int NOT NULL DEFAULT '0',
  `AreaID` int NOT NULL DEFAULT '0',
  `WmoDoodadPlacementID` int NOT NULL DEFAULT '0',
  `WmoGroupID` int NOT NULL DEFAULT '0',
  `Unknown1125` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table ui_map_assignment is empty)


-- ==========================================
-- Table: ui_map_link
-- ==========================================
CREATE TABLE `ui_map_link` (
  `UiMinX` float NOT NULL DEFAULT '0',
  `UiMinY` float NOT NULL DEFAULT '0',
  `UiMaxX` float NOT NULL DEFAULT '0',
  `UiMaxY` float NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `ParentUiMapID` int unsigned NOT NULL DEFAULT '0',
  `OrderIndex` int NOT NULL DEFAULT '0',
  `ChildUiMapID` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `OverrideHighlightFileDataID` int NOT NULL DEFAULT '0',
  `OverrideHighlightAtlasID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table ui_map_link is empty)


-- ==========================================
-- Table: ui_map_locale
-- ==========================================
CREATE TABLE `ui_map_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table ui_map_locale is empty)


-- ==========================================
-- Table: ui_map_x_map_art
-- ==========================================
CREATE TABLE `ui_map_x_map_art` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PhaseID` int NOT NULL DEFAULT '0',
  `UiMapArtID` int NOT NULL DEFAULT '0',
  `UiMapID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table ui_map_x_map_art is empty)


-- ==========================================
-- Table: ui_splash_screen
-- ==========================================
CREATE TABLE `ui_splash_screen` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Header` text COLLATE utf8mb4_unicode_ci,
  `TopLeftFeatureTitle` text COLLATE utf8mb4_unicode_ci,
  `TopLeftFeatureDesc` text COLLATE utf8mb4_unicode_ci,
  `BottomLeftFeatureTitle` text COLLATE utf8mb4_unicode_ci,
  `BottomLeftFeatureDesc` text COLLATE utf8mb4_unicode_ci,
  `RightFeatureTitle` text COLLATE utf8mb4_unicode_ci,
  `RightFeatureDesc` text COLLATE utf8mb4_unicode_ci,
  `AllianceQuestID` int NOT NULL DEFAULT '0',
  `HordeQuestID` int NOT NULL DEFAULT '0',
  `ScreenType` tinyint unsigned NOT NULL DEFAULT '0',
  `TextureKitID` int NOT NULL DEFAULT '0',
  `SoundKitID` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `CharLevelConditionID` int NOT NULL DEFAULT '0',
  `RequiredTimeEventPassed` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ui_splash_screen` (`ID`, `Header`, `TopLeftFeatureTitle`, `TopLeftFeatureDesc`, `BottomLeftFeatureTitle`, `BottomLeftFeatureDesc`, `RightFeatureTitle`, `RightFeatureDesc`, `AllianceQuestID`, `HordeQuestID`, `ScreenType`, `TextureKitID`, `SoundKitID`, `PlayerConditionID`, `CharLevelConditionID`, `RequiredTimeEventPassed`, `VerifiedBuild`) VALUES (49, 'New in Dragonflight!', 'Professions Update', 'New features including crafting orders, equipment, specializations, and more!', 'Dragonriding', 'Soar through the Dragon Isles\' skies with a thrilling new movement system!', 'Dragon Isles', 'Travel to the ancestral home of the dragonflights and help them reclaim their legacy.', 67700, 65444, 0, 5484, 0, 0, 104813, 254, 64270);


-- ==========================================
-- Table: ui_splash_screen_locale
-- ==========================================
CREATE TABLE `ui_splash_screen_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Header_lang` text COLLATE utf8mb4_unicode_ci,
  `TopLeftFeatureTitle_lang` text COLLATE utf8mb4_unicode_ci,
  `TopLeftFeatureDesc_lang` text COLLATE utf8mb4_unicode_ci,
  `BottomLeftFeatureTitle_lang` text COLLATE utf8mb4_unicode_ci,
  `BottomLeftFeatureDesc_lang` text COLLATE utf8mb4_unicode_ci,
  `RightFeatureTitle_lang` text COLLATE utf8mb4_unicode_ci,
  `RightFeatureDesc_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `ui_splash_screen_locale` (`ID`, `locale`, `Header_lang`, `TopLeftFeatureTitle_lang`, `TopLeftFeatureDesc_lang`, `BottomLeftFeatureTitle_lang`, `BottomLeftFeatureDesc_lang`, `RightFeatureTitle_lang`, `RightFeatureDesc_lang`, `VerifiedBuild`) VALUES (76, 'deDE', 'Neu in Patch 11.1.0!', 'F.A.H.R.E.N.', 'Erlebt mit dem 99-G-Genickbrecher in Lorenhall eine neue Art der Fortbewegung!', 'Passt Euren Lagerplatz an', 'Erstellt neue Lager im Charakterauswahlbildschirm und wählt aus einer Reihe von freischaltbaren Hintergründen aus!', 'Lorenhall', 'Führt die Verfolgung von Xal\'atath fort und stellt Euch Gallywix\' Streitkräften in den weitläufigen Straßen Lorenhalls.', 59888);


-- ==========================================
-- Table: unit_condition
-- ==========================================
CREATE TABLE `unit_condition` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `Variable1` tinyint unsigned NOT NULL DEFAULT '0',
  `Variable2` tinyint unsigned NOT NULL DEFAULT '0',
  `Variable3` tinyint unsigned NOT NULL DEFAULT '0',
  `Variable4` tinyint unsigned NOT NULL DEFAULT '0',
  `Variable5` tinyint unsigned NOT NULL DEFAULT '0',
  `Variable6` tinyint unsigned NOT NULL DEFAULT '0',
  `Variable7` tinyint unsigned NOT NULL DEFAULT '0',
  `Variable8` tinyint unsigned NOT NULL DEFAULT '0',
  `Op1` tinyint unsigned NOT NULL DEFAULT '0',
  `Op2` tinyint unsigned NOT NULL DEFAULT '0',
  `Op3` tinyint unsigned NOT NULL DEFAULT '0',
  `Op4` tinyint unsigned NOT NULL DEFAULT '0',
  `Op5` tinyint unsigned NOT NULL DEFAULT '0',
  `Op6` tinyint unsigned NOT NULL DEFAULT '0',
  `Op7` tinyint unsigned NOT NULL DEFAULT '0',
  `Op8` tinyint unsigned NOT NULL DEFAULT '0',
  `Value1` int NOT NULL DEFAULT '0',
  `Value2` int NOT NULL DEFAULT '0',
  `Value3` int NOT NULL DEFAULT '0',
  `Value4` int NOT NULL DEFAULT '0',
  `Value5` int NOT NULL DEFAULT '0',
  `Value6` int NOT NULL DEFAULT '0',
  `Value7` int NOT NULL DEFAULT '0',
  `Value8` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `unit_condition` (`ID`, `Flags`, `Variable1`, `Variable2`, `Variable3`, `Variable4`, `Variable5`, `Variable6`, `Variable7`, `Variable8`, `Op1`, `Op2`, `Op3`, `Op4`, `Op5`, `Op6`, `Op7`, `Op8`, `Value1`, `Value2`, `Value3`, `Value4`, `Value5`, `Value6`, `Value7`, `Value8`, `VerifiedBuild`) VALUES (1896, 0, 4, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 62493);


-- ==========================================
-- Table: unit_power_bar
-- ==========================================
CREATE TABLE `unit_power_bar` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Cost` text COLLATE utf8mb4_unicode_ci,
  `OutOfError` text COLLATE utf8mb4_unicode_ci,
  `ToolTip` text COLLATE utf8mb4_unicode_ci,
  `MinPower` int unsigned NOT NULL DEFAULT '0',
  `MaxPower` int unsigned NOT NULL DEFAULT '0',
  `StartPower` int unsigned NOT NULL DEFAULT '0',
  `CenterPower` tinyint unsigned NOT NULL DEFAULT '0',
  `RegenerationPeace` float NOT NULL DEFAULT '0',
  `RegenerationCombat` float NOT NULL DEFAULT '0',
  `BarType` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `StartInset` float NOT NULL DEFAULT '0',
  `EndInset` float NOT NULL DEFAULT '0',
  `FileDataID1` int NOT NULL DEFAULT '0',
  `FileDataID2` int NOT NULL DEFAULT '0',
  `FileDataID3` int NOT NULL DEFAULT '0',
  `FileDataID4` int NOT NULL DEFAULT '0',
  `FileDataID5` int NOT NULL DEFAULT '0',
  `FileDataID6` int NOT NULL DEFAULT '0',
  `Color1` int NOT NULL DEFAULT '0',
  `Color2` int NOT NULL DEFAULT '0',
  `Color3` int NOT NULL DEFAULT '0',
  `Color4` int NOT NULL DEFAULT '0',
  `Color5` int NOT NULL DEFAULT '0',
  `Color6` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table unit_power_bar is empty)


-- ==========================================
-- Table: unit_power_bar_locale
-- ==========================================
CREATE TABLE `unit_power_bar_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Cost_lang` text COLLATE utf8mb4_unicode_ci,
  `OutOfError_lang` text COLLATE utf8mb4_unicode_ci,
  `ToolTip_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table unit_power_bar_locale is empty)


-- ==========================================
-- Table: updates
-- ==========================================
CREATE TABLE `updates` (
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'filename with extension of the update.',
  `hash` char(40) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'sha1 hash of the sql file.',
  `state` enum('RELEASED','ARCHIVED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if an update is released or archived.',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when the query was applied.',
  `speed` int unsigned NOT NULL DEFAULT '0' COMMENT 'time the query takes to apply in ms.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of all applied updates in this database.';

INSERT INTO `updates` (`name`, `hash`, `state`, `timestamp`, `speed`) VALUES ('2014_10_19_01_hotfixes_area_poi.sql', 'BEE7AD2717D833074AAB0B7E50D17312D0018DEC', 'ARCHIVED', '2015-03-21 17:56:09', 0);


-- ==========================================
-- Table: updates_include
-- ==========================================
CREATE TABLE `updates_include` (
  `path` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of directories where we want to include sql updates.';

INSERT INTO `updates_include` (`path`, `state`) VALUES ('$/sql/custom/hotfixes', 'RELEASED');


-- ==========================================
-- Table: vehicle
-- ==========================================
CREATE TABLE `vehicle` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `FlagsB` int NOT NULL DEFAULT '0',
  `TurnSpeed` float NOT NULL DEFAULT '0',
  `PitchSpeed` float NOT NULL DEFAULT '0',
  `PitchMin` float NOT NULL DEFAULT '0',
  `PitchMax` float NOT NULL DEFAULT '0',
  `MouseLookOffsetPitch` float NOT NULL DEFAULT '0',
  `CameraFadeDistScalarMin` float NOT NULL DEFAULT '0',
  `CameraFadeDistScalarMax` float NOT NULL DEFAULT '0',
  `CameraPitchOffset` float NOT NULL DEFAULT '0',
  `FacingLimitRight` float NOT NULL DEFAULT '0',
  `FacingLimitLeft` float NOT NULL DEFAULT '0',
  `CameraYawOffset` float NOT NULL DEFAULT '0',
  `VehicleUIIndicatorID` smallint unsigned NOT NULL DEFAULT '0',
  `MissileTargetingID` int NOT NULL DEFAULT '0',
  `VehiclePOITypeID` smallint unsigned NOT NULL DEFAULT '0',
  `SeatID1` smallint unsigned NOT NULL DEFAULT '0',
  `SeatID2` smallint unsigned NOT NULL DEFAULT '0',
  `SeatID3` smallint unsigned NOT NULL DEFAULT '0',
  `SeatID4` smallint unsigned NOT NULL DEFAULT '0',
  `SeatID5` smallint unsigned NOT NULL DEFAULT '0',
  `SeatID6` smallint unsigned NOT NULL DEFAULT '0',
  `SeatID7` smallint unsigned NOT NULL DEFAULT '0',
  `SeatID8` smallint unsigned NOT NULL DEFAULT '0',
  `PowerDisplayID1` smallint unsigned NOT NULL DEFAULT '0',
  `PowerDisplayID2` smallint unsigned NOT NULL DEFAULT '0',
  `PowerDisplayID3` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `vehicle` (`ID`, `Flags`, `FlagsB`, `TurnSpeed`, `PitchSpeed`, `PitchMin`, `PitchMax`, `MouseLookOffsetPitch`, `CameraFadeDistScalarMin`, `CameraFadeDistScalarMax`, `CameraPitchOffset`, `FacingLimitRight`, `FacingLimitLeft`, `CameraYawOffset`, `VehicleUIIndicatorID`, `MissileTargetingID`, `VehiclePOITypeID`, `SeatID1`, `SeatID2`, `SeatID3`, `SeatID4`, `SeatID5`, `SeatID6`, `SeatID7`, `SeatID8`, `PowerDisplayID1`, `PowerDisplayID2`, `PowerDisplayID3`, `VerifiedBuild`) VALUES (8729, 1073877031, 0, 3.14159, 3.14159, 0.0, 0.0, 0.785398, 1.0, 1.5, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 24861, 25183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59888);


-- ==========================================
-- Table: vehicle_poi_type
-- ==========================================
CREATE TABLE `vehicle_poi_type` (
  `ID` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `TextureWidth` int NOT NULL DEFAULT '0',
  `TextureHeight` int NOT NULL DEFAULT '0',
  `OccupiedTexture` int NOT NULL DEFAULT '0',
  `UnoccupiedTexture` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table vehicle_poi_type is empty)


-- ==========================================
-- Table: vehicle_seat
-- ==========================================
CREATE TABLE `vehicle_seat` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `AttachmentOffsetX` float NOT NULL DEFAULT '0',
  `AttachmentOffsetY` float NOT NULL DEFAULT '0',
  `AttachmentOffsetZ` float NOT NULL DEFAULT '0',
  `CameraOffsetX` float NOT NULL DEFAULT '0',
  `CameraOffsetY` float NOT NULL DEFAULT '0',
  `CameraOffsetZ` float NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `FlagsB` int NOT NULL DEFAULT '0',
  `FlagsC` int NOT NULL DEFAULT '0',
  `AttachmentID` int NOT NULL DEFAULT '0',
  `EnterPreDelay` float NOT NULL DEFAULT '0',
  `EnterSpeed` float NOT NULL DEFAULT '0',
  `EnterGravity` float NOT NULL DEFAULT '0',
  `EnterMinDuration` float NOT NULL DEFAULT '0',
  `EnterMaxDuration` float NOT NULL DEFAULT '0',
  `EnterMinArcHeight` float NOT NULL DEFAULT '0',
  `EnterMaxArcHeight` float NOT NULL DEFAULT '0',
  `EnterAnimStart` smallint NOT NULL DEFAULT '0',
  `EnterAnimLoop` smallint NOT NULL DEFAULT '0',
  `RideAnimStart` smallint NOT NULL DEFAULT '0',
  `RideAnimLoop` smallint NOT NULL DEFAULT '0',
  `RideUpperAnimStart` smallint NOT NULL DEFAULT '0',
  `RideUpperAnimLoop` smallint NOT NULL DEFAULT '0',
  `ExitPreDelay` float NOT NULL DEFAULT '0',
  `ExitSpeed` float NOT NULL DEFAULT '0',
  `ExitGravity` float NOT NULL DEFAULT '0',
  `ExitMinDuration` float NOT NULL DEFAULT '0',
  `ExitMaxDuration` float NOT NULL DEFAULT '0',
  `ExitMinArcHeight` float NOT NULL DEFAULT '0',
  `ExitMaxArcHeight` float NOT NULL DEFAULT '0',
  `ExitAnimStart` smallint NOT NULL DEFAULT '0',
  `ExitAnimLoop` smallint NOT NULL DEFAULT '0',
  `ExitAnimEnd` smallint NOT NULL DEFAULT '0',
  `VehicleEnterAnim` smallint NOT NULL DEFAULT '0',
  `VehicleEnterAnimBone` tinyint NOT NULL DEFAULT '0',
  `VehicleExitAnim` smallint NOT NULL DEFAULT '0',
  `VehicleExitAnimBone` tinyint NOT NULL DEFAULT '0',
  `VehicleRideAnimLoop` smallint NOT NULL DEFAULT '0',
  `VehicleRideAnimLoopBone` tinyint NOT NULL DEFAULT '0',
  `PassengerAttachmentID` tinyint NOT NULL DEFAULT '0',
  `PassengerYaw` float NOT NULL DEFAULT '0',
  `PassengerPitch` float NOT NULL DEFAULT '0',
  `PassengerRoll` float NOT NULL DEFAULT '0',
  `VehicleEnterAnimDelay` float NOT NULL DEFAULT '0',
  `VehicleExitAnimDelay` float NOT NULL DEFAULT '0',
  `VehicleAbilityDisplay` tinyint NOT NULL DEFAULT '0',
  `EnterUISoundID` int unsigned NOT NULL DEFAULT '0',
  `ExitUISoundID` int unsigned NOT NULL DEFAULT '0',
  `UiSkinFileDataID` int NOT NULL DEFAULT '0',
  `CameraEnteringDelay` float NOT NULL DEFAULT '0',
  `CameraEnteringDuration` float NOT NULL DEFAULT '0',
  `CameraExitingDelay` float NOT NULL DEFAULT '0',
  `CameraExitingDuration` float NOT NULL DEFAULT '0',
  `CameraPosChaseRate` float NOT NULL DEFAULT '0',
  `CameraFacingChaseRate` float NOT NULL DEFAULT '0',
  `CameraEnteringZoom` float NOT NULL DEFAULT '0',
  `CameraSeatZoomMin` float NOT NULL DEFAULT '0',
  `CameraSeatZoomMax` float NOT NULL DEFAULT '0',
  `EnterAnimKitID` int NOT NULL DEFAULT '0',
  `RideAnimKitID` int NOT NULL DEFAULT '0',
  `ExitAnimKitID` int NOT NULL DEFAULT '0',
  `VehicleEnterAnimKitID` int NOT NULL DEFAULT '0',
  `VehicleRideAnimKitID` int NOT NULL DEFAULT '0',
  `VehicleExitAnimKitID` int NOT NULL DEFAULT '0',
  `CameraModeID` smallint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `vehicle_seat` (`ID`, `AttachmentOffsetX`, `AttachmentOffsetY`, `AttachmentOffsetZ`, `CameraOffsetX`, `CameraOffsetY`, `CameraOffsetZ`, `Flags`, `FlagsB`, `FlagsC`, `AttachmentID`, `EnterPreDelay`, `EnterSpeed`, `EnterGravity`, `EnterMinDuration`, `EnterMaxDuration`, `EnterMinArcHeight`, `EnterMaxArcHeight`, `EnterAnimStart`, `EnterAnimLoop`, `RideAnimStart`, `RideAnimLoop`, `RideUpperAnimStart`, `RideUpperAnimLoop`, `ExitPreDelay`, `ExitSpeed`, `ExitGravity`, `ExitMinDuration`, `ExitMaxDuration`, `ExitMinArcHeight`, `ExitMaxArcHeight`, `ExitAnimStart`, `ExitAnimLoop`, `ExitAnimEnd`, `VehicleEnterAnim`, `VehicleEnterAnimBone`, `VehicleExitAnim`, `VehicleExitAnimBone`, `VehicleRideAnimLoop`, `VehicleRideAnimLoopBone`, `PassengerAttachmentID`, `PassengerYaw`, `PassengerPitch`, `PassengerRoll`, `VehicleEnterAnimDelay`, `VehicleExitAnimDelay`, `VehicleAbilityDisplay`, `EnterUISoundID`, `ExitUISoundID`, `UiSkinFileDataID`, `CameraEnteringDelay`, `CameraEnteringDuration`, `CameraExitingDelay`, `CameraExitingDuration`, `CameraPosChaseRate`, `CameraFacingChaseRate`, `CameraEnteringZoom`, `CameraSeatZoomMin`, `CameraSeatZoomMax`, `EnterAnimKitID`, `RideAnimKitID`, `ExitAnimKitID`, `VehicleEnterAnimKitID`, `VehicleRideAnimKitID`, `VehicleExitAnimKitID`, `CameraModeID`, `VerifiedBuild`) VALUES (21702, 9.0, 0.0, 6.0, 0.0, 0.0, 0.0, 1073750031, -2113929216, 0, 1, 0.5, 7.0, 19.29, 0.0, 0.0, 1.0, 4.0, 132, 132, 474, 474, 474, 474, 0.0, 7.0, 19.29, 0.0, 0.0, 1.0, 4.0, 269, 269, 39, -1, -1, -1, -1, -1, -1, 19, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 0, 0, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 59888);


-- ==========================================
-- Table: vignette
-- ==========================================
CREATE TABLE `vignette` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Name` text COLLATE utf8mb4_unicode_ci,
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `VisibleTrackingQuestID` int unsigned NOT NULL DEFAULT '0',
  `QuestFeedbackEffectID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `MaxHeight` float NOT NULL DEFAULT '0',
  `MinHeight` float NOT NULL DEFAULT '0',
  `VignetteType` tinyint NOT NULL DEFAULT '0',
  `RewardQuestID` int NOT NULL DEFAULT '0',
  `UiWidgetSetID` int NOT NULL DEFAULT '0',
  `UiMapPinInfoID` int NOT NULL DEFAULT '0',
  `ObjectiveType` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `vignette` (`ID`, `Name`, `PlayerConditionID`, `VisibleTrackingQuestID`, `QuestFeedbackEffectID`, `Flags`, `MaxHeight`, `MinHeight`, `VignetteType`, `RewardQuestID`, `UiWidgetSetID`, `UiMapPinInfoID`, `ObjectiveType`, `VerifiedBuild`) VALUES (6702, 'Ancient Coffer', 132001, 86416, 1140, 0, 0.0, 0.0, 0, 0, 0, 0, 0, 62493);


-- ==========================================
-- Table: vignette_locale
-- ==========================================
CREATE TABLE `vignette_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `vignette_locale` (`ID`, `locale`, `Name_lang`, `VerifiedBuild`) VALUES (6909, 'deDE', 'Waffenvorrat', 59888);


-- ==========================================
-- Table: warband_scene
-- ==========================================
CREATE TABLE `warband_scene` (
  `Name` text COLLATE utf8mb4_unicode_ci,
  `Description` text COLLATE utf8mb4_unicode_ci,
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `PositionZ` float NOT NULL DEFAULT '0',
  `LookAtX` float NOT NULL DEFAULT '0',
  `LookAtY` float NOT NULL DEFAULT '0',
  `LookAtZ` float NOT NULL DEFAULT '0',
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MapID` int unsigned NOT NULL DEFAULT '0',
  `Fov` float NOT NULL DEFAULT '0',
  `TimeOfDay` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `SoundAmbienceID` int NOT NULL DEFAULT '0',
  `Quality` tinyint NOT NULL DEFAULT '0',
  `TextureKit` int NOT NULL DEFAULT '0',
  `DefaultScenePriority` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `warband_scene` (`Name`, `Description`, `PositionX`, `PositionY`, `PositionZ`, `LookAtX`, `LookAtY`, `LookAtZ`, `ID`, `MapID`, `Fov`, `TimeOfDay`, `Flags`, `SoundAmbienceID`, `Quality`, `TextureKit`, `DefaultScenePriority`, `VerifiedBuild`) VALUES ('Ohn\'ahran Overlook', 'Adventurers from across Azeroth would be hard pressed to find a more scenic spot to rest.', -3046.02, 496.399, 410.316, -3038.19, 487.432, 409.817, 4, 2834, 65.0, -1, 8, 2904, 1, 5672, 0, 59888);


-- ==========================================
-- Table: warband_scene_locale
-- ==========================================
CREATE TABLE `warband_scene_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name_lang` text COLLATE utf8mb4_unicode_ci,
  `Description_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `warband_scene_locale` (`ID`, `locale`, `Name_lang`, `Description_lang`, `VerifiedBuild`) VALUES (4, 'deDE', 'Warte von Ohn\'ahra', 'So schnell wird man als Abenteurer in Azeroth keinen schöneren Ort zum Rasten finden.', 59888);


-- ==========================================
-- Table: wmo_area_table
-- ==========================================
CREATE TABLE `wmo_area_table` (
  `AreaName` text COLLATE utf8mb4_unicode_ci,
  `ID` int unsigned NOT NULL DEFAULT '0',
  `WmoID` smallint unsigned NOT NULL DEFAULT '0',
  `NameSetID` tinyint unsigned NOT NULL DEFAULT '0',
  `WmoGroupID` int NOT NULL DEFAULT '0',
  `SoundProviderPref` tinyint unsigned NOT NULL DEFAULT '0',
  `SoundProviderPrefUnderwater` tinyint unsigned NOT NULL DEFAULT '0',
  `AmbienceID` smallint unsigned NOT NULL DEFAULT '0',
  `UwAmbience` smallint unsigned NOT NULL DEFAULT '0',
  `ZoneMusic` smallint unsigned NOT NULL DEFAULT '0',
  `UwZoneMusic` int unsigned NOT NULL DEFAULT '0',
  `IntroSound` smallint unsigned NOT NULL DEFAULT '0',
  `UwIntroSound` smallint unsigned NOT NULL DEFAULT '0',
  `AreaTableID` smallint unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `wmo_area_table` (`AreaName`, `ID`, `WmoID`, `NameSetID`, `WmoGroupID`, `SoundProviderPref`, `SoundProviderPrefUnderwater`, `AmbienceID`, `UwAmbience`, `ZoneMusic`, `UwZoneMusic`, `IntroSound`, `UwIntroSound`, `AreaTableID`, `Flags`, `VerifiedBuild`) VALUES (NULL, 13643, 15977, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13643, 0, 0);


-- ==========================================
-- Table: wmo_area_table_locale
-- ==========================================
CREATE TABLE `wmo_area_table_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AreaName_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

INSERT INTO `wmo_area_table_locale` (`ID`, `locale`, `AreaName_lang`, `VerifiedBuild`) VALUES (64606, 'deDE', '', 61609);


-- ==========================================
-- Table: world_effect
-- ==========================================
CREATE TABLE `world_effect` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `QuestFeedbackEffectID` int unsigned NOT NULL DEFAULT '0',
  `WhenToDisplay` int NOT NULL DEFAULT '0',
  `TargetType` tinyint unsigned NOT NULL DEFAULT '0',
  `TargetAsset` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `CombatConditionID` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `world_effect` (`ID`, `QuestFeedbackEffectID`, `WhenToDisplay`, `TargetType`, `TargetAsset`, `PlayerConditionID`, `CombatConditionID`, `VerifiedBuild`) VALUES (29341, 105, 1, 3, 4869, 0, 0, 59888);


-- ==========================================
-- Table: world_map_overlay
-- ==========================================
CREATE TABLE `world_map_overlay` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `UiMapArtID` int unsigned NOT NULL DEFAULT '0',
  `TextureWidth` smallint unsigned NOT NULL DEFAULT '0',
  `TextureHeight` smallint unsigned NOT NULL DEFAULT '0',
  `OffsetX` int NOT NULL DEFAULT '0',
  `OffsetY` int NOT NULL DEFAULT '0',
  `HitRectTop` int NOT NULL DEFAULT '0',
  `HitRectBottom` int NOT NULL DEFAULT '0',
  `HitRectLeft` int NOT NULL DEFAULT '0',
  `HitRectRight` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `AreaID1` int unsigned NOT NULL DEFAULT '0',
  `AreaID2` int unsigned NOT NULL DEFAULT '0',
  `AreaID3` int unsigned NOT NULL DEFAULT '0',
  `AreaID4` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table world_map_overlay is empty)


-- ==========================================
-- Table: world_state_expression
-- ==========================================
CREATE TABLE `world_state_expression` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Expression` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `world_state_expression` (`ID`, `Expression`, `VerifiedBuild`) VALUES (20621, '01031C00000000000006010A0000000001031B0000000000000601010000000000', 59888);


-- ==========================================
-- Table: zone_music
-- ==========================================
CREATE TABLE `zone_music` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `SetName` text COLLATE utf8mb4_unicode_ci,
  `SilenceIntervalMin1` int unsigned NOT NULL DEFAULT '0',
  `SilenceIntervalMin2` int unsigned NOT NULL DEFAULT '0',
  `SilenceIntervalMax1` int unsigned NOT NULL DEFAULT '0',
  `SilenceIntervalMax2` int unsigned NOT NULL DEFAULT '0',
  `Sounds1` int unsigned NOT NULL DEFAULT '0',
  `Sounds2` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table zone_music is empty)


-- ==========================================
-- Table: zone_music_locale
-- ==========================================
CREATE TABLE `zone_music_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SetName_lang` text COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`,`VerifiedBuild`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC
/*!50500 PARTITION BY LIST  COLUMNS(locale)
(PARTITION deDE VALUES IN ('deDE') ENGINE = InnoDB,
 PARTITION esES VALUES IN ('esES') ENGINE = InnoDB,
 PARTITION esMX VALUES IN ('esMX') ENGINE = InnoDB,
 PARTITION frFR VALUES IN ('frFR') ENGINE = InnoDB,
 PARTITION itIT VALUES IN ('itIT') ENGINE = InnoDB,
 PARTITION koKR VALUES IN ('koKR') ENGINE = InnoDB,
 PARTITION ptBR VALUES IN ('ptBR') ENGINE = InnoDB,
 PARTITION ruRU VALUES IN ('ruRU') ENGINE = InnoDB,
 PARTITION zhCN VALUES IN ('zhCN') ENGINE = InnoDB,
 PARTITION zhTW VALUES IN ('zhTW') ENGINE = InnoDB) */;

-- (Table zone_music_locale is empty)

