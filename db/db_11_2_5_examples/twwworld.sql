
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
-- Table: achievement_scripts
-- ==========================================
CREATE TABLE `achievement_scripts` (
  `AchievementId` int NOT NULL,
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`AchievementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `achievement_scripts` (`AchievementId`, `ScriptName`) VALUES (6566, 'achievement_just_a_pup');


-- ==========================================
-- Table: archaeology_artifacts
-- ==========================================
CREATE TABLE `archaeology_artifacts` (
  `spellId` int unsigned NOT NULL DEFAULT '0',
  `minSkillValue` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spellId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `archaeology_artifacts` (`spellId`, `minSkillValue`) VALUES (84796, 50);


-- ==========================================
-- Table: archaeology_digsites
-- ==========================================
CREATE TABLE `archaeology_digsites` (
  `id` smallint unsigned NOT NULL DEFAULT '0',
  `minLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `minSkillLevel` smallint unsigned NOT NULL DEFAULT '0',
  `currencyId` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `archaeology_digsites` (`id`, `minLevel`, `minSkillLevel`, `currencyId`) VALUES (9, 1, 1, 384);


-- ==========================================
-- Table: areatrigger
-- ==========================================
CREATE TABLE `areatrigger` (
  `SpawnId` bigint unsigned NOT NULL,
  `AreaTriggerCreatePropertiesId` int unsigned NOT NULL,
  `IsCustom` tinyint unsigned NOT NULL,
  `MapId` int unsigned NOT NULL,
  `SpawnDifficulties` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `Orientation` float NOT NULL,
  `PhaseUseFlags` tinyint unsigned DEFAULT '0',
  `PhaseId` int unsigned DEFAULT '0',
  `PhaseGroup` int unsigned DEFAULT '0',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpawnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `areatrigger` (`SpawnId`, `AreaTriggerCreatePropertiesId`, `IsCustom`, `MapId`, `SpawnDifficulties`, `PosX`, `PosY`, `PosZ`, `Orientation`, `PhaseUseFlags`, `PhaseId`, `PhaseGroup`, `ScriptName`, `Comment`, `VerifiedBuild`) VALUES (1, 1, 1, 0, '0', -9016.11, 876.142, 148.617, 0.7259, 1, 0, 0, '', 'Stormwind Mage Portal Entrance', 0);


-- ==========================================
-- Table: areatrigger_create_properties
-- ==========================================
CREATE TABLE `areatrigger_create_properties` (
  `Id` int unsigned NOT NULL,
  `IsCustom` tinyint unsigned NOT NULL,
  `AreaTriggerId` int unsigned NOT NULL,
  `IsAreatriggerCustom` tinyint unsigned NOT NULL,
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `MoveCurveId` int unsigned NOT NULL DEFAULT '0',
  `ScaleCurveId` int unsigned NOT NULL DEFAULT '0',
  `MorphCurveId` int unsigned NOT NULL DEFAULT '0',
  `FacingCurveId` int unsigned NOT NULL DEFAULT '0',
  `AnimId` int NOT NULL DEFAULT '-1',
  `AnimKitId` int NOT NULL DEFAULT '0',
  `DecalPropertiesId` int unsigned NOT NULL DEFAULT '0',
  `SpellForVisuals` int DEFAULT NULL,
  `TimeToTargetScale` int unsigned NOT NULL DEFAULT '0',
  `Speed` float NOT NULL DEFAULT '1',
  `SpeedIsTime` tinyint unsigned NOT NULL DEFAULT '0',
  `Shape` tinyint unsigned NOT NULL DEFAULT '0',
  `ShapeData0` float NOT NULL DEFAULT '0',
  `ShapeData1` float NOT NULL DEFAULT '0',
  `ShapeData2` float NOT NULL DEFAULT '0',
  `ShapeData3` float NOT NULL DEFAULT '0',
  `ShapeData4` float NOT NULL DEFAULT '0',
  `ShapeData5` float NOT NULL DEFAULT '0',
  `ShapeData6` float NOT NULL DEFAULT '0',
  `ShapeData7` float NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`,`IsCustom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `areatrigger_create_properties` (`Id`, `IsCustom`, `AreaTriggerId`, `IsAreatriggerCustom`, `Flags`, `MoveCurveId`, `ScaleCurveId`, `MorphCurveId`, `FacingCurveId`, `AnimId`, `AnimKitId`, `DecalPropertiesId`, `SpellForVisuals`, `TimeToTargetScale`, `Speed`, `SpeedIsTime`, `Shape`, `ShapeData0`, `ShapeData1`, `ShapeData2`, `ShapeData3`, `ShapeData4`, `ShapeData5`, `ShapeData6`, `ShapeData7`, `ScriptName`, `VerifiedBuild`) VALUES (1, 1, 1, 1, 0, 0, 0, 0, 0, -1, 0, 0, NULL, 0, 1.0, 0, 1, 3.0, 1.0, 3.0, 3.0, 1.0, 3.0, 0.0, 0.0, '', 0);


-- ==========================================
-- Table: areatrigger_create_properties_orbit
-- ==========================================
CREATE TABLE `areatrigger_create_properties_orbit` (
  `AreaTriggerCreatePropertiesId` int unsigned NOT NULL,
  `IsCustom` tinyint unsigned NOT NULL,
  `ExtraTimeForBlending` int NOT NULL DEFAULT '0',
  `CircleRadius` float NOT NULL DEFAULT '0',
  `BlendFromRadius` float NOT NULL DEFAULT '0',
  `InitialAngle` float NOT NULL DEFAULT '0',
  `ZOffset` float NOT NULL DEFAULT '0',
  `CounterClockwise` tinyint unsigned NOT NULL DEFAULT '0',
  `CanLoop` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AreaTriggerCreatePropertiesId`,`IsCustom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `areatrigger_create_properties_orbit` (`AreaTriggerCreatePropertiesId`, `IsCustom`, `ExtraTimeForBlending`, `CircleRadius`, `BlendFromRadius`, `InitialAngle`, `ZOffset`, `CounterClockwise`, `CanLoop`, `VerifiedBuild`) VALUES (5838, 0, 0, 0.0, 0.0, 0.0, 0.0, 0, 1, 52129);


-- ==========================================
-- Table: areatrigger_create_properties_polygon_vertex
-- ==========================================
CREATE TABLE `areatrigger_create_properties_polygon_vertex` (
  `AreaTriggerCreatePropertiesId` int unsigned NOT NULL,
  `IsCustom` tinyint unsigned NOT NULL,
  `Idx` int unsigned NOT NULL,
  `VerticeX` float NOT NULL DEFAULT '0',
  `VerticeY` float NOT NULL DEFAULT '0',
  `VerticeTargetX` float DEFAULT NULL,
  `VerticeTargetY` float DEFAULT NULL,
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AreaTriggerCreatePropertiesId`,`IsCustom`,`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `areatrigger_create_properties_polygon_vertex` (`AreaTriggerCreatePropertiesId`, `IsCustom`, `Idx`, `VerticeX`, `VerticeY`, `VerticeTargetX`, `VerticeTargetY`, `VerifiedBuild`) VALUES (45, 1, 0, 193.429, -26.469, NULL, NULL, 0);


-- ==========================================
-- Table: areatrigger_create_properties_spline_point
-- ==========================================
CREATE TABLE `areatrigger_create_properties_spline_point` (
  `AreaTriggerCreatePropertiesId` int unsigned NOT NULL,
  `IsCustom` tinyint unsigned NOT NULL,
  `Idx` int unsigned NOT NULL,
  `X` float NOT NULL DEFAULT '0',
  `Y` float NOT NULL DEFAULT '0',
  `Z` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AreaTriggerCreatePropertiesId`,`IsCustom`,`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `areatrigger_create_properties_spline_point` (`AreaTriggerCreatePropertiesId`, `IsCustom`, `Idx`, `X`, `Y`, `Z`, `VerifiedBuild`) VALUES (1315, 0, 0, 0.0, 0.0, 0.0, 40120);


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
-- Table: areatrigger_scripts
-- ==========================================
CREATE TABLE `areatrigger_scripts` (
  `entry` int NOT NULL,
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES (962, 'at_zumrah');


-- ==========================================
-- Table: areatrigger_tavern
-- ==========================================
CREATE TABLE `areatrigger_tavern` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Trigger System';

INSERT INTO `areatrigger_tavern` (`id`, `name`) VALUES (71, 'Westfall - Sentinel Hill Inn');


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
-- Table: areatrigger_template_actions
-- ==========================================
CREATE TABLE `areatrigger_template_actions` (
  `AreaTriggerId` int unsigned NOT NULL,
  `IsCustom` tinyint unsigned NOT NULL,
  `ActionType` int unsigned NOT NULL,
  `ActionParam` int unsigned NOT NULL,
  `TargetType` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`AreaTriggerId`,`IsCustom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `areatrigger_template_actions` (`AreaTriggerId`, `IsCustom`, `ActionType`, `ActionParam`, `TargetType`) VALUES (1, 1, 2, 3631, 5);


-- ==========================================
-- Table: battle_pay_entry
-- ==========================================
CREATE TABLE `battle_pay_entry` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `productId` int unsigned NOT NULL DEFAULT '0',
  `groupId` int unsigned NOT NULL DEFAULT '0',
  `idx` int NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `icon` int unsigned NOT NULL DEFAULT '0',
  `displayId` int unsigned NOT NULL DEFAULT '0',
  `banner` tinyint unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `battle_pay_entry` (`id`, `productId`, `groupId`, `idx`, `title`, `description`, `icon`, `displayId`, `banner`, `flags`) VALUES (44, 44, 2, 0, 'Experience Potion (300%)', 'Experience Potion', 0, 0, 2, 0);


-- ==========================================
-- Table: battle_pay_group
-- ==========================================
CREATE TABLE `battle_pay_group` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `idx` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(16) NOT NULL,
  `icon` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`idx`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `battle_pay_group` (`id`, `idx`, `name`, `icon`, `type`) VALUES (1, 1, 'Featured', 939376, 1);


-- ==========================================
-- Table: battle_pay_product
-- ==========================================
CREATE TABLE `battle_pay_product` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `icon` int unsigned NOT NULL DEFAULT '0',
  `price` int unsigned NOT NULL DEFAULT '0',
  `discount` int unsigned NOT NULL DEFAULT '0',
  `displayId` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `choiceType` tinyint unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  `flagsInfo` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `battle_pay_product` (`id`, `title`, `description`, `icon`, `price`, `discount`, `displayId`, `type`, `choiceType`, `flags`, `flagsInfo`) VALUES (44, 'Experience Potion (300%)', 'Experience Potion', 236884, 500, 0, 0, 0, 1, 47, 0);


-- ==========================================
-- Table: battle_pay_product_items
-- ==========================================
CREATE TABLE `battle_pay_product_items` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `itemId` int unsigned NOT NULL DEFAULT '0',
  `count` int unsigned NOT NULL DEFAULT '0',
  `productId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `productId` (`itemId`,`productId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `battle_pay_product_items` (`id`, `itemId`, `count`, `productId`) VALUES (83, 0, 0, 83);


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
-- Table: battleground_scripts
-- ==========================================
CREATE TABLE `battleground_scripts` (
  `MapId` int NOT NULL,
  `BattlemasterListId` int NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`MapId`,`BattlemasterListId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battleground_scripts` (`MapId`, `BattlemasterListId`, `ScriptName`) VALUES (30, 0, 'battleground_alterac_valley');


-- ==========================================
-- Table: battleground_template
-- ==========================================
CREATE TABLE `battleground_template` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `AllianceStartLoc` int unsigned NOT NULL,
  `HordeStartLoc` int unsigned NOT NULL,
  `StartMaxDist` float NOT NULL DEFAULT '0',
  `Weight` tinyint unsigned NOT NULL DEFAULT '1',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Comment` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battleground_template` (`ID`, `AllianceStartLoc`, `HordeStartLoc`, `StartMaxDist`, `Weight`, `ScriptName`, `Comment`) VALUES (1, 611, 610, 150.0, 1, '', 'Alterac Valley');


-- ==========================================
-- Table: battlemaster_entry
-- ==========================================
CREATE TABLE `battlemaster_entry` (
  `entry` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of a creature',
  `bg_template` int unsigned NOT NULL DEFAULT '0' COMMENT 'Battleground template id',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `battlemaster_entry` (`entry`, `bg_template`) VALUES (347, 1);


-- ==========================================
-- Table: blackmarket_template
-- ==========================================
CREATE TABLE `blackmarket_template` (
  `marketId` int NOT NULL DEFAULT '0',
  `sellerNpc` int NOT NULL DEFAULT '0',
  `itemEntry` int unsigned NOT NULL DEFAULT '0',
  `quantity` int NOT NULL DEFAULT '1',
  `minBid` bigint unsigned NOT NULL DEFAULT '0',
  `duration` int NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `bonusListIDs` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`marketId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table blackmarket_template is empty)


-- ==========================================
-- Table: character_template
-- ==========================================
CREATE TABLE `character_template` (
  `Id` int unsigned NOT NULL,
  `Name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Level` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_template is empty)


-- ==========================================
-- Table: character_template_class
-- ==========================================
CREATE TABLE `character_template_class` (
  `TemplateId` int unsigned NOT NULL,
  `FactionGroup` tinyint unsigned NOT NULL COMMENT '3 - Alliance, 5 - Horde',
  `Class` tinyint unsigned NOT NULL,
  PRIMARY KEY (`TemplateId`,`FactionGroup`,`Class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table character_template_class is empty)


-- ==========================================
-- Table: class_expansion_requirement
-- ==========================================
CREATE TABLE `class_expansion_requirement` (
  `ClassID` tinyint unsigned NOT NULL,
  `RaceID` tinyint unsigned NOT NULL,
  `ActiveExpansionLevel` tinyint unsigned DEFAULT '0',
  `AccountExpansionLevel` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`ClassID`,`RaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `class_expansion_requirement` (`ClassID`, `RaceID`, `ActiveExpansionLevel`, `AccountExpansionLevel`) VALUES (1, 1, 0, 0);


-- ==========================================
-- Table: command
-- ==========================================
CREATE TABLE `command` (
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `help` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Chat System';

INSERT INTO `command` (`name`, `help`) VALUES ('additem', 'Syntax: .additem #itemid/[#itemname]/#shift-click-item-link #itemcount #bonusListIDs

Adds the specified number of items of id #itemid (or exact (!) name $itemname in brackets, or link created by shift-click at item in inventory or recipe) to your or selected character inventory. If #itemcount is omitted, only one item will be added. #bonusListIDs is a semicolon separated list of bonuses to add to item (such as Mythic/Heroic/Warforged/socket)');


-- ==========================================
-- Table: conditions
-- ==========================================
CREATE TABLE `conditions` (
  `SourceTypeOrReferenceId` int NOT NULL DEFAULT '0',
  `SourceGroup` int unsigned NOT NULL DEFAULT '0',
  `SourceEntry` int NOT NULL DEFAULT '0',
  `SourceId` int NOT NULL DEFAULT '0',
  `ElseGroup` int unsigned NOT NULL DEFAULT '0',
  `ConditionTypeOrReference` int NOT NULL DEFAULT '0',
  `ConditionTarget` tinyint unsigned NOT NULL DEFAULT '0',
  `ConditionValue1` int unsigned NOT NULL DEFAULT '0',
  `ConditionValue2` int unsigned NOT NULL DEFAULT '0',
  `ConditionValue3` int unsigned NOT NULL DEFAULT '0',
  `ConditionStringValue1` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `NegativeCondition` tinyint unsigned NOT NULL DEFAULT '0',
  `ErrorType` int unsigned NOT NULL DEFAULT '0',
  `ErrorTextId` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ConditionStringValue1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Condition System';

INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ConditionStringValue1`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (-40002, 0, 0, 0, 0, 47, 0, 29611, 64, 0, '', 0, 0, 0, '', 'Apply condition reference if quest 29611 is rewarded');


-- ==========================================
-- Table: conversation_actors
-- ==========================================
CREATE TABLE `conversation_actors` (
  `ConversationId` int unsigned NOT NULL,
  `ConversationActorId` int unsigned NOT NULL DEFAULT '0',
  `ConversationActorGuid` bigint unsigned NOT NULL DEFAULT '0',
  `Idx` smallint unsigned NOT NULL DEFAULT '0',
  `CreatureId` int unsigned NOT NULL DEFAULT '0',
  `CreatureDisplayInfoId` int unsigned NOT NULL DEFAULT '0',
  `NoActorObject` tinyint unsigned DEFAULT '0',
  `ActivePlayerObject` tinyint unsigned DEFAULT '0',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ConversationId`,`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `conversation_actors` (`ConversationId`, `ConversationActorId`, `ConversationActorGuid`, `Idx`, `CreatureId`, `CreatureDisplayInfoId`, `NoActorObject`, `ActivePlayerObject`, `VerifiedBuild`) VALUES (705, 50124, 0, 0, 98075, 21135, 0, 0, 50622);


-- ==========================================
-- Table: conversation_line_template
-- ==========================================
CREATE TABLE `conversation_line_template` (
  `Id` int unsigned NOT NULL,
  `UiCameraID` int unsigned NOT NULL DEFAULT '0',
  `ActorIdx` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `ChatType` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `conversation_line_template` (`Id`, `UiCameraID`, `ActorIdx`, `Flags`, `ChatType`, `VerifiedBuild`) VALUES (1683, 296, 0, 0, 0, 50622);


-- ==========================================
-- Table: conversation_template
-- ==========================================
CREATE TABLE `conversation_template` (
  `Id` int unsigned NOT NULL,
  `FirstLineId` int unsigned NOT NULL,
  `TextureKitId` int unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `conversation_template` (`Id`, `FirstLineId`, `TextureKitId`, `Flags`, `ScriptName`, `VerifiedBuild`) VALUES (705, 1683, 0, 0, '', 50622);


-- ==========================================
-- Table: creature
-- ==========================================
CREATE TABLE `creature` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `areaId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Area Identifier',
  `spawnDifficulties` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `phaseUseFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `PhaseId` int DEFAULT '0',
  `PhaseGroup` int DEFAULT '0',
  `terrainSwapMap` int NOT NULL DEFAULT '-1',
  `modelid` int unsigned NOT NULL DEFAULT '0',
  `equipment_id` tinyint NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int unsigned NOT NULL DEFAULT '120',
  `wander_distance` float NOT NULL DEFAULT '0',
  `currentwaypoint` int unsigned NOT NULL DEFAULT '0',
  `curHealthPct` int unsigned NOT NULL DEFAULT '100',
  `MovementType` tinyint unsigned NOT NULL DEFAULT '0',
  `npcflag` bigint unsigned DEFAULT NULL,
  `unit_flags` int unsigned DEFAULT NULL,
  `unit_flags2` int unsigned DEFAULT NULL,
  `unit_flags3` int unsigned DEFAULT NULL,
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StringId` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  `size` float NOT NULL DEFAULT '-1',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `idx_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature System';

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curHealthPct`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `ScriptName`, `StringId`, `VerifiedBuild`, `size`) VALUES (5, 12160, 1, 6450, 188, '0', 0, 0, 0, -1, 0, 1, 10348.9, 751.136, 1325.35, 5.05727, 120, 10.0, 0, 100, 2, NULL, NULL, NULL, NULL, '', NULL, 0, -1.0);


-- ==========================================
-- Table: creature_addon
-- ==========================================
CREATE TABLE `creature_addon` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `PathId` int unsigned NOT NULL DEFAULT '0',
  `mount` int unsigned NOT NULL DEFAULT '0',
  `MountCreatureID` int unsigned NOT NULL DEFAULT '0',
  `StandState` tinyint unsigned NOT NULL DEFAULT '0',
  `AnimTier` tinyint unsigned NOT NULL DEFAULT '0',
  `VisFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `SheathState` tinyint unsigned NOT NULL DEFAULT '1',
  `PvPFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `emote` int unsigned NOT NULL DEFAULT '0',
  `aiAnimKit` smallint NOT NULL DEFAULT '0',
  `movementAnimKit` smallint NOT NULL DEFAULT '0',
  `meleeAnimKit` smallint NOT NULL DEFAULT '0',
  `visibilityDistanceType` tinyint unsigned NOT NULL DEFAULT '0',
  `auras` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_addon` (`guid`, `PathId`, `mount`, `MountCreatureID`, `StandState`, `AnimTier`, `VisFlags`, `SheathState`, `PvPFlags`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `visibilityDistanceType`, `auras`) VALUES (17, 1360, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, '');


-- ==========================================
-- Table: creature_classlevelstats
-- ==========================================
CREATE TABLE `creature_classlevelstats` (
  `level` tinyint NOT NULL,
  `class` tinyint NOT NULL,
  `basemana` int unsigned NOT NULL DEFAULT '1',
  `attackpower` smallint NOT NULL DEFAULT '0',
  `rangedattackpower` smallint NOT NULL DEFAULT '0',
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`level`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_classlevelstats` (`level`, `class`, `basemana`, `attackpower`, `rangedattackpower`, `comment`) VALUES (1, 1, 0, 10, 1, NULL);


-- ==========================================
-- Table: creature_equip_template
-- ==========================================
CREATE TABLE `creature_equip_template` (
  `CreatureID` int unsigned NOT NULL DEFAULT '0',
  `ID` tinyint unsigned NOT NULL DEFAULT '1',
  `ItemID1` int unsigned NOT NULL DEFAULT '0',
  `AppearanceModID1` smallint unsigned NOT NULL DEFAULT '0',
  `ItemVisual1` smallint unsigned NOT NULL DEFAULT '0',
  `ItemID2` int unsigned NOT NULL DEFAULT '0',
  `AppearanceModID2` smallint unsigned NOT NULL DEFAULT '0',
  `ItemVisual2` smallint unsigned NOT NULL DEFAULT '0',
  `ItemID3` int unsigned NOT NULL DEFAULT '0',
  `AppearanceModID3` smallint unsigned NOT NULL DEFAULT '0',
  `ItemVisual3` smallint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureID`,`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `AppearanceModID1`, `ItemVisual1`, `ItemID2`, `AppearanceModID2`, `ItemVisual2`, `ItemID3`, `AppearanceModID3`, `ItemVisual3`, `VerifiedBuild`) VALUES (6, 1, 5276, 0, 0, 0, 0, 0, 0, 0, 0, 18019);


-- ==========================================
-- Table: creature_formations
-- ==========================================
CREATE TABLE `creature_formations` (
  `leaderGUID` bigint unsigned NOT NULL DEFAULT '0',
  `memberGUID` bigint unsigned NOT NULL DEFAULT '0',
  `dist` float NOT NULL,
  `angle` float NOT NULL,
  `groupAI` int unsigned NOT NULL,
  `point_1` smallint unsigned NOT NULL DEFAULT '0',
  `point_2` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`memberGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES (4151, 4151, 0.0, 0.0, 512, 0, 0);


-- ==========================================
-- Table: creature_immunities
-- ==========================================
CREATE TABLE `creature_immunities` (
  `ID` int NOT NULL,
  `SchoolMask` tinyint NOT NULL DEFAULT '0',
  `DispelTypeMask` smallint NOT NULL DEFAULT '0',
  `MechanicsMask` bigint NOT NULL DEFAULT '0',
  `Effects` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Auras` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ImmuneAoE` tinyint(1) NOT NULL DEFAULT '0',
  `ImmuneChain` tinyint(1) NOT NULL DEFAULT '0',
  `Comment` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_immunities` (`ID`, `SchoolMask`, `DispelTypeMask`, `MechanicsMask`, `Effects`, `Auras`, `ImmuneAoE`, `ImmuneChain`, `Comment`) VALUES (-204, 0, 0, 4294967038, '', '', 0, 0, '');


-- ==========================================
-- Table: creature_loot_template
-- ==========================================
CREATE TABLE `creature_loot_template` (
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
  `Reference` int DEFAULT NULL,
  KEY `idx_primary` (`Entry`,`ItemType`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loot System';

INSERT INTO `creature_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`, `Reference`) VALUES (1, 0, 2592, 25.0412, 0, 1, 0, 1, 2, '', NULL);


-- ==========================================
-- Table: creature_model_info
-- ==========================================
CREATE TABLE `creature_model_info` (
  `DisplayID` int unsigned NOT NULL DEFAULT '0',
  `BoundingRadius` float NOT NULL DEFAULT '0',
  `CombatReach` float NOT NULL DEFAULT '0',
  `DisplayID_Other_Gender` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`DisplayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature System (Model related info)';

INSERT INTO `creature_model_info` (`DisplayID`, `BoundingRadius`, `CombatReach`, `DisplayID_Other_Gender`, `VerifiedBuild`) VALUES (0, 1.88097, 1.8, 0, 0);


-- ==========================================
-- Table: creature_movement_info
-- ==========================================
CREATE TABLE `creature_movement_info` (
  `MovementID` int unsigned NOT NULL DEFAULT '0' COMMENT 'creature_template.movementId value',
  `WalkSpeed` float DEFAULT NULL,
  `RunSpeed` float DEFAULT NULL,
  PRIMARY KEY (`MovementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_movement_info` (`MovementID`, `WalkSpeed`, `RunSpeed`) VALUES (1, 0.0, 5.0);


-- ==========================================
-- Table: creature_movement_override
-- ==========================================
CREATE TABLE `creature_movement_override` (
  `SpawnId` bigint unsigned NOT NULL DEFAULT '0',
  `HoverInitiallyEnabled` tinyint unsigned DEFAULT NULL,
  `Chase` tinyint unsigned DEFAULT NULL,
  `Random` tinyint unsigned DEFAULT NULL,
  `InteractionPauseTimer` int unsigned DEFAULT NULL COMMENT 'Time (in milliseconds) during which creature will not move after interaction with player',
  PRIMARY KEY (`SpawnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_movement_override` (`SpawnId`, `HoverInitiallyEnabled`, `Chase`, `Random`, `InteractionPauseTimer`) VALUES (106339, NULL, 0, 0, NULL);


-- ==========================================
-- Table: creature_onkill_reputation
-- ==========================================
CREATE TABLE `creature_onkill_reputation` (
  `creature_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` smallint NOT NULL DEFAULT '0',
  `RewOnKillRepFaction2` smallint NOT NULL DEFAULT '0',
  `MaxStanding1` tinyint NOT NULL DEFAULT '0',
  `IsTeamAward1` tinyint NOT NULL DEFAULT '0',
  `RewOnKillRepValue1` int NOT NULL DEFAULT '0',
  `MaxStanding2` tinyint NOT NULL DEFAULT '0',
  `IsTeamAward2` tinyint NOT NULL DEFAULT '0',
  `RewOnKillRepValue2` int NOT NULL DEFAULT '0',
  `TeamDependent` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature OnKill Reputation gain';

INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (674, 21, 0, 5, 0, 25, 0, 0, 0, 0);


-- ==========================================
-- Table: creature_quest_currency
-- ==========================================
CREATE TABLE `creature_quest_currency` (
  `CreatureId` int unsigned NOT NULL,
  `CurrencyId` int NOT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureId`,`CurrencyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_quest_currency` (`CreatureId`, `CurrencyId`, `VerifiedBuild`) VALUES (639, 1166, 63796);


-- ==========================================
-- Table: creature_questender
-- ==========================================
CREATE TABLE `creature_questender` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature System';

INSERT INTO `creature_questender` (`id`, `quest`, `VerifiedBuild`) VALUES (19, 5053, 0);


-- ==========================================
-- Table: creature_questitem
-- ==========================================
CREATE TABLE `creature_questitem` (
  `CreatureEntry` int unsigned NOT NULL DEFAULT '0',
  `DifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `Idx` int unsigned NOT NULL DEFAULT '0',
  `ItemId` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureEntry`,`DifficultyID`,`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_questitem` (`CreatureEntry`, `DifficultyID`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES (3, 0, 0, 884, 63796);


-- ==========================================
-- Table: creature_queststarter
-- ==========================================
CREATE TABLE `creature_queststarter` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature System';

INSERT INTO `creature_queststarter` (`id`, `quest`, `VerifiedBuild`) VALUES (197, 54, 64270);


-- ==========================================
-- Table: creature_static_flags_override
-- ==========================================
CREATE TABLE `creature_static_flags_override` (
  `SpawnId` bigint unsigned NOT NULL,
  `DifficultyId` tinyint unsigned NOT NULL DEFAULT '0',
  `StaticFlags1` int unsigned DEFAULT NULL,
  `StaticFlags2` int unsigned DEFAULT NULL,
  `StaticFlags3` int unsigned DEFAULT NULL,
  `StaticFlags4` int unsigned DEFAULT NULL,
  `StaticFlags5` int unsigned DEFAULT NULL,
  `StaticFlags6` int unsigned DEFAULT NULL,
  `StaticFlags7` int unsigned DEFAULT NULL,
  `StaticFlags8` int unsigned DEFAULT NULL,
  PRIMARY KEY (`SpawnId`,`DifficultyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_static_flags_override` (`SpawnId`, `DifficultyId`, `StaticFlags1`, `StaticFlags2`, `StaticFlags3`, `StaticFlags4`, `StaticFlags5`, `StaticFlags6`, `StaticFlags7`, `StaticFlags8`) VALUES (264435, 0, 0, 0, 0, 0, 0, 0, 0, 0);


-- ==========================================
-- Table: creature_summon_groups
-- ==========================================
CREATE TABLE `creature_summon_groups` (
  `summonerId` int unsigned NOT NULL DEFAULT '0',
  `summonerType` tinyint unsigned NOT NULL DEFAULT '0',
  `groupId` tinyint unsigned NOT NULL DEFAULT '0',
  `entry` int unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `summonType` tinyint unsigned NOT NULL DEFAULT '0',
  `summonTime` int unsigned NOT NULL DEFAULT '0',
  `Comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`, `Comment`) VALUES (52151, 0, 0, 52156, -12330.3, -1878.41, 127.32, 3.89208, 8, 0, '');


-- ==========================================
-- Table: creature_summoned_data
-- ==========================================
CREATE TABLE `creature_summoned_data` (
  `CreatureID` int unsigned NOT NULL,
  `CreatureIDVisibleToSummoner` int DEFAULT NULL,
  `GroundMountDisplayID` int unsigned DEFAULT NULL,
  `FlyingMountDisplayID` int unsigned DEFAULT NULL,
  `DespawnOnQuestsRemoved` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`CreatureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_summoned_data` (`CreatureID`, `CreatureIDVisibleToSummoner`, `GroundMountDisplayID`, `FlyingMountDisplayID`, `DespawnOnQuestsRemoved`) VALUES (80087, 78556, NULL, NULL, NULL);


-- ==========================================
-- Table: creature_template
-- ==========================================
CREATE TABLE `creature_template` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `KillCredit1` int unsigned NOT NULL DEFAULT '0',
  `KillCredit2` int unsigned NOT NULL DEFAULT '0',
  `name` mediumtext COLLATE utf8mb4_unicode_ci,
  `femaleName` mediumtext COLLATE utf8mb4_unicode_ci,
  `subname` mediumtext COLLATE utf8mb4_unicode_ci,
  `TitleAlt` mediumtext COLLATE utf8mb4_unicode_ci,
  `IconName` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RequiredExpansion` int NOT NULL DEFAULT '0',
  `VignetteID` int NOT NULL DEFAULT '0',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  `npcflag` bigint unsigned NOT NULL DEFAULT '0',
  `speed_walk` float NOT NULL DEFAULT '1' COMMENT 'Result of 2.5/2.5, most common value',
  `speed_run` float NOT NULL DEFAULT '1.14286' COMMENT 'Result of 8.0/7.0, most common value',
  `scale` float NOT NULL DEFAULT '1',
  `Classification` tinyint unsigned NOT NULL DEFAULT '0',
  `dmgschool` tinyint NOT NULL DEFAULT '0',
  `BaseAttackTime` int unsigned NOT NULL DEFAULT '0',
  `RangeAttackTime` int unsigned NOT NULL DEFAULT '0',
  `BaseVariance` float NOT NULL DEFAULT '1',
  `RangeVariance` float NOT NULL DEFAULT '1',
  `unit_class` tinyint unsigned NOT NULL DEFAULT '0',
  `unit_flags` int unsigned NOT NULL DEFAULT '0',
  `unit_flags2` int unsigned NOT NULL DEFAULT '0',
  `unit_flags3` int unsigned NOT NULL DEFAULT '0',
  `family` int NOT NULL DEFAULT '0',
  `trainer_class` tinyint unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `VehicleId` int unsigned NOT NULL DEFAULT '0',
  `AIName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `MovementType` tinyint unsigned NOT NULL DEFAULT '0',
  `ExperienceModifier` float NOT NULL DEFAULT '1',
  `RacialLeader` tinyint unsigned NOT NULL DEFAULT '0',
  `movementId` int unsigned NOT NULL DEFAULT '0',
  `WidgetSetID` int NOT NULL DEFAULT '0',
  `WidgetSetUnitConditionID` int NOT NULL DEFAULT '0',
  `RegenHealth` tinyint unsigned NOT NULL DEFAULT '1',
  `CreatureImmunitiesId` int NOT NULL DEFAULT '0',
  `flags_extra` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StringId` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature System';

INSERT INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `name`, `femaleName`, `subname`, `TitleAlt`, `IconName`, `RequiredExpansion`, `VignetteID`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `Classification`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `family`, `trainer_class`, `type`, `VehicleId`, `AIName`, `MovementType`, `ExperienceModifier`, `RacialLeader`, `movementId`, `WidgetSetID`, `WidgetSetUnitConditionID`, `RegenHealth`, `CreatureImmunitiesId`, `flags_extra`, `ScriptName`, `StringId`, `VerifiedBuild`) VALUES (1, 0, 0, 'Waypoint (Only GM can see it)', '', 'Visual', NULL, NULL, 0, 0, 35, 16, 0.91, 1.14286, 1.0, 0, 0, 2000, 2200, 1.0, 1.0, 1, 0, 2048, 0, 0, 0, 8, 0, '', 0, 1.0, 0, 0, 0, 0, 1, 0, 130, '', NULL, 0);


-- ==========================================
-- Table: creature_template_addon
-- ==========================================
CREATE TABLE `creature_template_addon` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `PathId` int unsigned NOT NULL DEFAULT '0',
  `mount` int unsigned NOT NULL DEFAULT '0',
  `MountCreatureID` int unsigned NOT NULL DEFAULT '0',
  `StandState` tinyint unsigned NOT NULL DEFAULT '0',
  `AnimTier` tinyint unsigned NOT NULL DEFAULT '0',
  `VisFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `SheathState` tinyint unsigned NOT NULL DEFAULT '1',
  `PvPFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `emote` int unsigned NOT NULL DEFAULT '0',
  `aiAnimKit` smallint NOT NULL DEFAULT '0',
  `movementAnimKit` smallint NOT NULL DEFAULT '0',
  `meleeAnimKit` smallint NOT NULL DEFAULT '0',
  `visibilityDistanceType` tinyint unsigned NOT NULL DEFAULT '0',
  `auras` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_template_addon` (`entry`, `PathId`, `mount`, `MountCreatureID`, `StandState`, `AnimTier`, `VisFlags`, `SheathState`, `PvPFlags`, `emote`, `aiAnimKit`, `movementAnimKit`, `meleeAnimKit`, `visibilityDistanceType`, `auras`) VALUES (3, 0, 0, 0, 0, 0, 0, 1, 16, 0, 0, 0, 0, 0, '');


-- ==========================================
-- Table: creature_template_difficulty
-- ==========================================
CREATE TABLE `creature_template_difficulty` (
  `Entry` int unsigned NOT NULL,
  `DifficultyID` tinyint unsigned NOT NULL DEFAULT '0',
  `LevelScalingDeltaMin` smallint NOT NULL DEFAULT '0',
  `LevelScalingDeltaMax` smallint NOT NULL DEFAULT '0',
  `ContentTuningID` int NOT NULL DEFAULT '0',
  `HealthScalingExpansion` int NOT NULL DEFAULT '0',
  `HealthModifier` float NOT NULL DEFAULT '1',
  `ManaModifier` float NOT NULL DEFAULT '1',
  `ArmorModifier` float NOT NULL DEFAULT '1',
  `DamageModifier` float NOT NULL DEFAULT '1',
  `CreatureDifficultyID` int NOT NULL DEFAULT '0',
  `TypeFlags` int unsigned NOT NULL DEFAULT '0',
  `TypeFlags2` int unsigned NOT NULL DEFAULT '0',
  `TypeFlags3` int unsigned NOT NULL DEFAULT '0',
  `LootID` int unsigned NOT NULL DEFAULT '0',
  `PickPocketLootID` int unsigned NOT NULL DEFAULT '0',
  `SkinLootID` int unsigned NOT NULL DEFAULT '0',
  `GoldMin` int unsigned NOT NULL DEFAULT '0',
  `GoldMax` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags1` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags2` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags3` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags4` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags5` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags6` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags7` int unsigned NOT NULL DEFAULT '0',
  `StaticFlags8` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Entry`,`DifficultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_template_difficulty` (`Entry`, `DifficultyID`, `LevelScalingDeltaMin`, `LevelScalingDeltaMax`, `ContentTuningID`, `HealthScalingExpansion`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `CreatureDifficultyID`, `TypeFlags`, `TypeFlags2`, `TypeFlags3`, `LootID`, `PickPocketLootID`, `SkinLootID`, `GoldMin`, `GoldMax`, `StaticFlags1`, `StaticFlags2`, `StaticFlags3`, `StaticFlags4`, `StaticFlags5`, `StaticFlags6`, `StaticFlags7`, `StaticFlags8`, `VerifiedBuild`) VALUES (1, 2, 0, 0, 0, 0, 1e-05, 1.0, 1.0, 0.01, 0, 0, 0, 0, 1, 0, 0, 0, 0, 536870912, 0, 0, 0, 0, 0, 0, 0, -1);


-- ==========================================
-- Table: creature_template_gossip
-- ==========================================
CREATE TABLE `creature_template_gossip` (
  `CreatureID` int unsigned NOT NULL,
  `MenuID` int unsigned NOT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureID`,`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_template_gossip` (`CreatureID`, `MenuID`, `VerifiedBuild`) VALUES (68, 435, 47936);


-- ==========================================
-- Table: creature_template_locale
-- ==========================================
CREATE TABLE `creature_template_locale` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` mediumtext COLLATE utf8mb4_unicode_ci,
  `NameAlt` mediumtext COLLATE utf8mb4_unicode_ci,
  `Title` mediumtext COLLATE utf8mb4_unicode_ci,
  `TitleAlt` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `NameAlt`, `Title`, `TitleAlt`, `VerifiedBuild`) VALUES (3, 'deDE', 'Fleischfresser', '', '', NULL, 62438);


-- ==========================================
-- Table: creature_template_model
-- ==========================================
CREATE TABLE `creature_template_model` (
  `CreatureID` int unsigned NOT NULL,
  `Idx` int unsigned NOT NULL DEFAULT '0',
  `CreatureDisplayID` int unsigned NOT NULL,
  `DisplayScale` float NOT NULL DEFAULT '1',
  `Probability` float NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureID`,`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_template_model` (`CreatureID`, `Idx`, `CreatureDisplayID`, `DisplayScale`, `Probability`, `VerifiedBuild`) VALUES (1, 0, 10045, 1.0, 1.0, 0);


-- ==========================================
-- Table: creature_template_movement
-- ==========================================
CREATE TABLE `creature_template_movement` (
  `CreatureId` int unsigned NOT NULL DEFAULT '0',
  `HoverInitiallyEnabled` tinyint unsigned DEFAULT NULL,
  `Chase` tinyint unsigned DEFAULT NULL,
  `Random` tinyint unsigned DEFAULT NULL,
  `InteractionPauseTimer` int unsigned DEFAULT NULL COMMENT 'Time (in milliseconds) during which creature will not move after interaction with player',
  PRIMARY KEY (`CreatureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_template_movement` (`CreatureId`, `HoverInitiallyEnabled`, `Chase`, `Random`, `InteractionPauseTimer`) VALUES (1, NULL, 0, 0, NULL);


-- ==========================================
-- Table: creature_template_outfits
-- ==========================================
CREATE TABLE `creature_template_outfits` (
  `entry` int unsigned NOT NULL,
  `npcsoundsid` int unsigned NOT NULL DEFAULT '0' COMMENT 'entry from NPCSounds.dbc/db2',
  `race` tinyint unsigned NOT NULL DEFAULT '1',
  `class` tinyint unsigned NOT NULL DEFAULT '1',
  `gender` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 for male, 1 for female',
  `spellvisualkitid` int NOT NULL DEFAULT '0',
  `customizations` text,
  `head` bigint NOT NULL DEFAULT '0',
  `head_appearance` int unsigned NOT NULL DEFAULT '0',
  `shoulders` bigint NOT NULL DEFAULT '0',
  `shoulders_appearance` int unsigned NOT NULL DEFAULT '0',
  `body` bigint NOT NULL DEFAULT '0',
  `body_appearance` int unsigned NOT NULL DEFAULT '0',
  `chest` bigint NOT NULL DEFAULT '0',
  `chest_appearance` int unsigned NOT NULL DEFAULT '0',
  `waist` bigint NOT NULL DEFAULT '0',
  `waist_appearance` int unsigned NOT NULL DEFAULT '0',
  `legs` bigint NOT NULL DEFAULT '0',
  `legs_appearance` int unsigned NOT NULL DEFAULT '0',
  `feet` bigint NOT NULL DEFAULT '0',
  `feet_appearance` int unsigned NOT NULL DEFAULT '0',
  `wrists` bigint NOT NULL DEFAULT '0',
  `wrists_appearance` int unsigned NOT NULL DEFAULT '0',
  `hands` bigint NOT NULL DEFAULT '0',
  `hands_appearance` int unsigned NOT NULL DEFAULT '0',
  `back` bigint NOT NULL DEFAULT '0',
  `back_appearance` int unsigned NOT NULL DEFAULT '0',
  `tabard` bigint NOT NULL DEFAULT '0',
  `tabard_appearance` int unsigned NOT NULL DEFAULT '0',
  `guildid` bigint unsigned NOT NULL DEFAULT '0',
  `description` text,
  PRIMARY KEY (`entry`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Use positive values for item entries and negative to use item displayid for head, shoulders etc.';

-- (Table creature_template_outfits is empty)


-- ==========================================
-- Table: creature_template_outfits_customizations
-- ==========================================
CREATE TABLE `creature_template_outfits_customizations` (
  `chrCustomizationOptionID` int unsigned NOT NULL,
  `chrCustomizationChoiceID` int unsigned NOT NULL DEFAULT '0',
  `outfitID` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- (Table creature_template_outfits_customizations is empty)


-- ==========================================
-- Table: creature_template_resistance
-- ==========================================
CREATE TABLE `creature_template_resistance` (
  `CreatureID` int unsigned NOT NULL,
  `School` tinyint unsigned NOT NULL,
  `Resistance` smallint NOT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureID`,`School`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`, `VerifiedBuild`) VALUES (40, 2, 21, 41031);


-- ==========================================
-- Table: creature_template_sparring
-- ==========================================
CREATE TABLE `creature_template_sparring` (
  `Entry` int unsigned NOT NULL,
  `NoNPCDamageBelowHealthPct` float NOT NULL,
  PRIMARY KEY (`Entry`,`NoNPCDamageBelowHealthPct`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_template_sparring` (`Entry`, `NoNPCDamageBelowHealthPct`) VALUES (32882, 100.0);


-- ==========================================
-- Table: creature_template_spell
-- ==========================================
CREATE TABLE `creature_template_spell` (
  `CreatureID` int unsigned NOT NULL,
  `Index` tinyint unsigned NOT NULL DEFAULT '0',
  `Spell` int unsigned NOT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureID`,`Index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_template_spell` (`CreatureID`, `Index`, `Spell`, `VerifiedBuild`) VALUES (30, 0, 744, 41031);


-- ==========================================
-- Table: creature_text
-- ==========================================
CREATE TABLE `creature_text` (
  `CreatureID` int unsigned NOT NULL DEFAULT '0',
  `GroupID` tinyint unsigned NOT NULL DEFAULT '0',
  `ID` tinyint unsigned NOT NULL DEFAULT '0',
  `Text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `Language` tinyint NOT NULL DEFAULT '0',
  `Probability` float NOT NULL DEFAULT '0',
  `Emote` int unsigned NOT NULL DEFAULT '0',
  `Duration` int unsigned NOT NULL DEFAULT '0',
  `Sound` int unsigned NOT NULL DEFAULT '0',
  `SoundPlayType` tinyint unsigned NOT NULL DEFAULT '0',
  `BroadcastTextId` int NOT NULL DEFAULT '0',
  `TextRange` tinyint unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`CreatureID`,`GroupID`,`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `SoundPlayType`, `BroadcastTextId`, `TextRange`, `comment`) VALUES (0, 0, 0, 'Text', 0, 0, 0.0, 0, 0, 0, 0, 0, 0, 'comment');


-- ==========================================
-- Table: creature_text_locale
-- ==========================================
CREATE TABLE `creature_text_locale` (
  `CreatureID` int unsigned NOT NULL DEFAULT '0',
  `GroupID` tinyint unsigned NOT NULL DEFAULT '0',
  `ID` tinyint unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Text` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`CreatureID`,`GroupID`,`ID`,`Locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES (6, 0, 0, 'deDE', 'Du nimmst keine Kerze!');


-- ==========================================
-- Table: creature_trainer
-- ==========================================
CREATE TABLE `creature_trainer` (
  `CreatureID` int unsigned NOT NULL DEFAULT '0',
  `TrainerID` int unsigned NOT NULL DEFAULT '0',
  `MenuID` int unsigned NOT NULL DEFAULT '0',
  `OptionID` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`CreatureID`,`MenuID`,`OptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `creature_trainer` (`CreatureID`, `TrainerID`, `MenuID`, `OptionID`) VALUES (1, 813, 0, 0);


-- ==========================================
-- Table: criteria_data
-- ==========================================
CREATE TABLE `criteria_data` (
  `criteria_id` int NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `value1` int unsigned NOT NULL DEFAULT '0',
  `value2` int unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`criteria_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Achievment system';

INSERT INTO `criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES (4244, 11, 0, 0, 'achievement_hadronox_denied');


-- ==========================================
-- Table: custom_transmog
-- ==========================================
CREATE TABLE `custom_transmog` (
  `guid` bigint NOT NULL,
  `slot` int NOT NULL,
  `appearance_id` int NOT NULL,
  PRIMARY KEY (`guid`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table custom_transmog is empty)


-- ==========================================
-- Table: destructible_hitpoint
-- ==========================================
CREATE TABLE `destructible_hitpoint` (
  `Id` int unsigned NOT NULL,
  `IntactNumHits` int unsigned NOT NULL,
  `DamagedNumHits` int unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='This table contains data about destructible building health';

INSERT INTO `destructible_hitpoint` (`Id`, `IntactNumHits`, `DamagedNumHits`) VALUES (1, 0, 0);


-- ==========================================
-- Table: disables
-- ==========================================
CREATE TABLE `disables` (
  `sourceType` int unsigned NOT NULL,
  `entry` int unsigned NOT NULL,
  `flags` smallint NOT NULL,
  `params_0` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`sourceType`,`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES (0, 2825, 64, '', '', 'Ignore LOS for Heroism');


-- ==========================================
-- Table: disenchant_loot_template
-- ==========================================
CREATE TABLE `disenchant_loot_template` (
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

INSERT INTO `disenchant_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES (3, 0, 10938, 80.0, 0, 1, 1, 1, 2, NULL);


-- ==========================================
-- Table: event_script_names
-- ==========================================
CREATE TABLE `event_script_names` (
  `Id` int unsigned NOT NULL,
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `event_script_names` (`Id`, `ScriptName`) VALUES (255, 'SmartEventTrigger');


-- ==========================================
-- Table: event_scripts
-- ==========================================
CREATE TABLE `event_scripts` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `command` int unsigned NOT NULL DEFAULT '0',
  `datalong` int unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `Comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `Comment`) VALUES (259, 2, 10, 1770, 300000, 0, 881.63, 1230.37, 47.83, 3.1, '');


-- ==========================================
-- Table: exploration_basexp
-- ==========================================
CREATE TABLE `exploration_basexp` (
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `basexp` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Exploration System';

INSERT INTO `exploration_basexp` (`level`, `basexp`) VALUES (0, 0);


-- ==========================================
-- Table: fishing_loot_template
-- ==========================================
CREATE TABLE `fishing_loot_template` (
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

INSERT INTO `fishing_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES (1, 1, 11000, 100.0, 0, 1, 1, 1, 1, NULL);


-- ==========================================
-- Table: game_event
-- ==========================================
CREATE TABLE `game_event` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NULL DEFAULT NULL COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NULL DEFAULT NULL COMMENT 'Absolute end date, the event will never start after',
  `occurence` bigint unsigned NOT NULL DEFAULT '5184000' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint unsigned NOT NULL DEFAULT '2592000' COMMENT 'Length in minutes of the event',
  `holiday` int unsigned NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `holidayStage` tinyint unsigned NOT NULL DEFAULT '0',
  `WorldStateId` int DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Description of the event displayed in console',
  `world_event` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0 if normal event, 1 if world event',
  `announce` tinyint unsigned DEFAULT '2' COMMENT '0 dont announce, 1 announce, 2 value from config',
  PRIMARY KEY (`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `holidayStage`, `WorldStateId`, `description`, `world_event`, `announce`) VALUES (1, '2023-06-21 01:01:00', '2030-12-31 08:00:00', 525600, 20160, 341, 1, 2286, 'Midsummer Fire Festival', 0, 2);


-- ==========================================
-- Table: game_event_arena_seasons
-- ==========================================
CREATE TABLE `game_event_arena_seasons` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `season` tinyint unsigned NOT NULL COMMENT 'Arena season number',
  UNIQUE KEY `season` (`season`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `game_event_arena_seasons` (`eventEntry`, `season`) VALUES (55, 3);


-- ==========================================
-- Table: game_event_condition
-- ==========================================
CREATE TABLE `game_event_condition` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `condition_id` int unsigned NOT NULL DEFAULT '0',
  `req_num` float DEFAULT '0',
  `max_world_state_field` smallint unsigned NOT NULL DEFAULT '0',
  `done_world_state_field` smallint unsigned NOT NULL DEFAULT '0',
  `description` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`eventEntry`,`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table game_event_condition is empty)


-- ==========================================
-- Table: game_event_creature
-- ==========================================
CREATE TABLE `game_event_creature` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES (10, 297);


-- ==========================================
-- Table: game_event_creature_quest
-- ==========================================
CREATE TABLE `game_event_creature_quest` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event.',
  `id` int unsigned NOT NULL DEFAULT '0',
  `quest` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `game_event_creature_quest` (`eventEntry`, `id`, `quest`) VALUES (12, 8719, 29399);


-- ==========================================
-- Table: game_event_gameobject
-- ==========================================
CREATE TABLE `game_event_gameobject` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES (3, 312);


-- ==========================================
-- Table: game_event_gameobject_quest
-- ==========================================
CREATE TABLE `game_event_gameobject_quest` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `id` int unsigned NOT NULL DEFAULT '0',
  `quest` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `game_event_gameobject_quest` (`eventEntry`, `id`, `quest`) VALUES (52, 180743, 8744);


-- ==========================================
-- Table: game_event_model_equip
-- ==========================================
CREATE TABLE `game_event_model_equip` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event.',
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `modelid` int unsigned NOT NULL DEFAULT '0',
  `equipment_id` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table game_event_model_equip is empty)


-- ==========================================
-- Table: game_event_npc_vendor
-- ==========================================
CREATE TABLE `game_event_npc_vendor` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event.',
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `slot` smallint NOT NULL DEFAULT '0',
  `item` int unsigned NOT NULL DEFAULT '0',
  `maxcount` int unsigned NOT NULL DEFAULT '0',
  `incrtime` int unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '1',
  `BonusListIDs` mediumtext COLLATE utf8mb4_unicode_ci,
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `IgnoreFiltering` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`item`,`ExtendedCost`,`type`),
  KEY `slot` (`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `game_event_npc_vendor` (`eventEntry`, `guid`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`, `BonusListIDs`, `PlayerConditionID`, `IgnoreFiltering`) VALUES (10, 97984, 0, 46693, 0, 0, 0, 1, NULL, 0, 0);


-- ==========================================
-- Table: game_event_npcflag
-- ==========================================
CREATE TABLE `game_event_npcflag` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `npcflag` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table game_event_npcflag is empty)


-- ==========================================
-- Table: game_event_pool
-- ==========================================
CREATE TABLE `game_event_pool` (
  `eventEntry` tinyint NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.',
  `pool_entry` int unsigned NOT NULL DEFAULT '0' COMMENT 'Id of the pool',
  PRIMARY KEY (`pool_entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `game_event_pool` (`eventEntry`, `pool_entry`) VALUES (9, 5699);


-- ==========================================
-- Table: game_event_prerequisite
-- ==========================================
CREATE TABLE `game_event_prerequisite` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event',
  `prerequisite_event` int unsigned NOT NULL,
  PRIMARY KEY (`eventEntry`,`prerequisite_event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table game_event_prerequisite is empty)


-- ==========================================
-- Table: game_event_quest_condition
-- ==========================================
CREATE TABLE `game_event_quest_condition` (
  `eventEntry` tinyint unsigned NOT NULL COMMENT 'Entry of the game event.',
  `quest` int unsigned NOT NULL DEFAULT '0',
  `condition_id` int unsigned NOT NULL DEFAULT '0',
  `num` float DEFAULT '0',
  PRIMARY KEY (`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table game_event_quest_condition is empty)


-- ==========================================
-- Table: game_event_seasonal_questrelation
-- ==========================================
CREATE TABLE `game_event_seasonal_questrelation` (
  `questId` int unsigned NOT NULL COMMENT 'Quest Identifier',
  `eventEntry` int unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of the game event',
  PRIMARY KEY (`questId`,`eventEntry`),
  KEY `idx_quest` (`questId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Player System';

INSERT INTO `game_event_seasonal_questrelation` (`questId`, `eventEntry`) VALUES (171, 10);


-- ==========================================
-- Table: game_tele
-- ==========================================
CREATE TABLE `game_tele` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tele Command';

INSERT INTO `game_tele` (`id`, `position_x`, `position_y`, `position_z`, `orientation`, `map`, `name`) VALUES (1, 1054.94, 1055.23, -48.2358, 0.313367, 529, 'AB');


-- ==========================================
-- Table: game_weather
-- ==========================================
CREATE TABLE `game_weather` (
  `zone` int unsigned NOT NULL DEFAULT '0',
  `spring_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `spring_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `spring_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `summer_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `summer_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `summer_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `fall_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `fall_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `fall_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `winter_rain_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `winter_snow_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `winter_storm_chance` tinyint unsigned NOT NULL DEFAULT '25',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Weather System';

INSERT INTO `game_weather` (`zone`, `spring_rain_chance`, `spring_snow_chance`, `spring_storm_chance`, `summer_rain_chance`, `summer_snow_chance`, `summer_storm_chance`, `fall_rain_chance`, `fall_snow_chance`, `fall_storm_chance`, `winter_rain_chance`, `winter_snow_chance`, `winter_storm_chance`, `ScriptName`) VALUES (1, 0, 25, 0, 0, 15, 0, 0, 25, 0, 0, 25, 0, '');


-- ==========================================
-- Table: gameobject
-- ==========================================
CREATE TABLE `gameobject` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `areaId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Area Identifier',
  `spawnDifficulties` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `phaseUseFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `PhaseId` int DEFAULT '0',
  `PhaseGroup` int DEFAULT '0',
  `terrainSwapMap` int NOT NULL DEFAULT '-1',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `rotation0` float NOT NULL DEFAULT '0',
  `rotation1` float NOT NULL DEFAULT '0',
  `rotation2` float NOT NULL DEFAULT '0',
  `rotation3` float NOT NULL DEFAULT '0',
  `spawntimesecs` int NOT NULL DEFAULT '0',
  `animprogress` tinyint unsigned NOT NULL DEFAULT '0',
  `state` tinyint unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StringId` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  `size` float NOT NULL DEFAULT '-1',
  `visibility` float NOT NULL DEFAULT '256',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Gameobject System';

INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `StringId`, `VerifiedBuild`, `size`, `visibility`) VALUES (5, 184447, 530, 3523, 3880, '0', 0, 0, 0, -1, 3793.59, 2079.87, 153.262, 3.61391, 0.0, 0.0, -0.968147, 0.250381, 300, 255, 1, '', NULL, 0, -1.0, 256.0);


-- ==========================================
-- Table: gameobject_addon
-- ==========================================
CREATE TABLE `gameobject_addon` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `parent_rotation0` float NOT NULL DEFAULT '0',
  `parent_rotation1` float NOT NULL DEFAULT '0',
  `parent_rotation2` float NOT NULL DEFAULT '0',
  `parent_rotation3` float NOT NULL DEFAULT '1',
  `invisibilityType` tinyint unsigned NOT NULL DEFAULT '0',
  `invisibilityValue` int unsigned NOT NULL DEFAULT '0',
  `WorldEffectID` int unsigned NOT NULL DEFAULT '0',
  `AIAnimKitID` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gameobject_addon` (`guid`, `parent_rotation0`, `parent_rotation1`, `parent_rotation2`, `parent_rotation3`, `invisibilityType`, `invisibilityValue`, `WorldEffectID`, `AIAnimKitID`) VALUES (21, 0.0, 0.0, 0.984808, 0.173648, 0, 0, 0, 0);


-- ==========================================
-- Table: gameobject_loot_template
-- ==========================================
CREATE TABLE `gameobject_loot_template` (
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

INSERT INTO `gameobject_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES (57, 0, 60295, 100.0, 1, 1, 0, 1, 1, '');


-- ==========================================
-- Table: gameobject_overrides
-- ==========================================
CREATE TABLE `gameobject_overrides` (
  `spawnId` bigint unsigned NOT NULL DEFAULT '0',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spawnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gameobject_overrides` (`spawnId`, `faction`, `flags`) VALUES (76181, 0, 16);


-- ==========================================
-- Table: gameobject_questender
-- ==========================================
CREATE TABLE `gameobject_questender` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gameobject_questender` (`id`, `quest`, `VerifiedBuild`) VALUES (31, 94, 0);


-- ==========================================
-- Table: gameobject_questitem
-- ==========================================
CREATE TABLE `gameobject_questitem` (
  `GameObjectEntry` int unsigned NOT NULL DEFAULT '0',
  `Idx` int unsigned NOT NULL DEFAULT '0',
  `ItemId` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`GameObjectEntry`,`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gameobject_questitem` (`GameObjectEntry`, `Idx`, `ItemId`, `VerifiedBuild`) VALUES (32, 0, 1309, 48069);


-- ==========================================
-- Table: gameobject_queststarter
-- ==========================================
CREATE TABLE `gameobject_queststarter` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `VerifiedBuild` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`quest`,`VerifiedBuild`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gameobject_queststarter` (`id`, `quest`, `VerifiedBuild`) VALUES (34, 26356, 0);


-- ==========================================
-- Table: gameobject_template
-- ==========================================
CREATE TABLE `gameobject_template` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `displayId` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IconName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `castBarCaption` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unk1` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `size` float NOT NULL DEFAULT '1',
  `Data0` int NOT NULL DEFAULT '0',
  `Data1` int NOT NULL DEFAULT '0',
  `Data2` int NOT NULL DEFAULT '0',
  `Data3` int NOT NULL DEFAULT '0',
  `Data4` int NOT NULL DEFAULT '0',
  `Data5` int NOT NULL DEFAULT '0',
  `Data6` int NOT NULL DEFAULT '0',
  `Data7` int NOT NULL DEFAULT '0',
  `Data8` int NOT NULL DEFAULT '0',
  `Data9` int NOT NULL DEFAULT '0',
  `Data10` int NOT NULL DEFAULT '0',
  `Data11` int NOT NULL DEFAULT '0',
  `Data12` int NOT NULL DEFAULT '0',
  `Data13` int NOT NULL DEFAULT '0',
  `Data14` int NOT NULL DEFAULT '0',
  `Data15` int NOT NULL DEFAULT '0',
  `Data16` int NOT NULL DEFAULT '0',
  `Data17` int NOT NULL DEFAULT '0',
  `Data18` int NOT NULL DEFAULT '0',
  `Data19` int NOT NULL DEFAULT '0',
  `Data20` int NOT NULL DEFAULT '0',
  `Data21` int NOT NULL DEFAULT '0',
  `Data22` int NOT NULL DEFAULT '0',
  `Data23` int NOT NULL DEFAULT '0',
  `Data24` int NOT NULL DEFAULT '0',
  `Data25` int NOT NULL DEFAULT '0',
  `Data26` int NOT NULL DEFAULT '0',
  `Data27` int NOT NULL DEFAULT '0',
  `Data28` int NOT NULL DEFAULT '0',
  `Data29` int NOT NULL DEFAULT '0',
  `Data30` int NOT NULL DEFAULT '0',
  `Data31` int NOT NULL DEFAULT '0',
  `Data32` int NOT NULL DEFAULT '0',
  `Data33` int NOT NULL DEFAULT '0',
  `Data34` int NOT NULL DEFAULT '0',
  `ContentTuningId` int NOT NULL DEFAULT '0',
  `AIName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `StringId` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Gameobject System';

INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `Data24`, `Data25`, `Data26`, `Data27`, `Data28`, `Data29`, `Data30`, `Data31`, `Data32`, `Data33`, `Data34`, `ContentTuningId`, `AIName`, `ScriptName`, `StringId`, `VerifiedBuild`) VALUES (1, 0, 12795, 'Door', 'questinteract', '', '', 1.08707, 0, 999999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, '', '', NULL, 27326);


-- ==========================================
-- Table: gameobject_template_addon
-- ==========================================
CREATE TABLE `gameobject_template_addon` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  `mingold` int unsigned NOT NULL DEFAULT '0',
  `maxgold` int unsigned NOT NULL DEFAULT '0',
  `artkit0` int NOT NULL DEFAULT '0',
  `artkit1` int NOT NULL DEFAULT '0',
  `artkit2` int NOT NULL DEFAULT '0',
  `artkit3` int NOT NULL DEFAULT '0',
  `artkit4` int NOT NULL DEFAULT '0',
  `WorldEffectID` int unsigned NOT NULL DEFAULT '0',
  `AIAnimKitID` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gameobject_template_addon` (`entry`, `faction`, `flags`, `mingold`, `maxgold`, `artkit0`, `artkit1`, `artkit2`, `artkit3`, `artkit4`, `WorldEffectID`, `AIAnimKitID`) VALUES (4, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);


-- ==========================================
-- Table: gameobject_template_locale
-- ==========================================
CREATE TABLE `gameobject_template_locale` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` mediumtext COLLATE utf8mb4_unicode_ci,
  `castBarCaption` mediumtext COLLATE utf8mb4_unicode_ci,
  `unk1` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `unk1`, `VerifiedBuild`) VALUES (1, 'frFR', 'Porte', NULL, NULL, 61559);


-- ==========================================
-- Table: garrison_follower_class_spec_abilities
-- ==========================================
CREATE TABLE `garrison_follower_class_spec_abilities` (
  `classSpecId` int unsigned NOT NULL DEFAULT '0',
  `abilityId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`classSpecId`,`abilityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `garrison_follower_class_spec_abilities` (`classSpecId`, `abilityId`) VALUES (2, 114);


-- ==========================================
-- Table: garrison_plot_finalize_info
-- ==========================================
CREATE TABLE `garrison_plot_finalize_info` (
  `garrPlotInstanceId` int unsigned NOT NULL,
  `hordeGameObjectId` int unsigned NOT NULL DEFAULT '0',
  `hordeX` float NOT NULL DEFAULT '0',
  `hordeY` float NOT NULL DEFAULT '0',
  `hordeZ` float NOT NULL DEFAULT '0',
  `hordeO` float NOT NULL DEFAULT '0',
  `hordeAnimKitId` smallint unsigned NOT NULL DEFAULT '0',
  `allianceGameObjectId` int unsigned NOT NULL DEFAULT '0',
  `allianceX` float NOT NULL DEFAULT '0',
  `allianceY` float NOT NULL DEFAULT '0',
  `allianceZ` float NOT NULL DEFAULT '0',
  `allianceO` float NOT NULL DEFAULT '0',
  `allianceAnimKitId` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`garrPlotInstanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `garrison_plot_finalize_info` (`garrPlotInstanceId`, `hordeGameObjectId`, `hordeX`, `hordeY`, `hordeZ`, `hordeO`, `hordeAnimKitId`, `allianceGameObjectId`, `allianceX`, `allianceY`, `allianceZ`, `allianceO`, `allianceAnimKitId`) VALUES (18, 233248, 5642.37, 4514.43, 119.27, 1.88088, 1696, 0, 0.0, 0.0, 0.0, 0.0, 0);


-- ==========================================
-- Table: gossip_menu
-- ==========================================
CREATE TABLE `gossip_menu` (
  `MenuID` int unsigned NOT NULL DEFAULT '0',
  `TextID` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuID`,`TextID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gossip_menu` (`MenuID`, `TextID`, `VerifiedBuild`) VALUES (1, 68, 0);


-- ==========================================
-- Table: gossip_menu_addon
-- ==========================================
CREATE TABLE `gossip_menu_addon` (
  `MenuID` int unsigned NOT NULL DEFAULT '0',
  `FriendshipFactionID` int NOT NULL DEFAULT '0',
  `LfgDungeonsID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gossip_menu_addon` (`MenuID`, `FriendshipFactionID`, `LfgDungeonsID`, `VerifiedBuild`) VALUES (13332, 1283, 0, 44908);


-- ==========================================
-- Table: gossip_menu_option
-- ==========================================
CREATE TABLE `gossip_menu_option` (
  `MenuID` int unsigned NOT NULL DEFAULT '0',
  `GossipOptionID` int NOT NULL DEFAULT '0',
  `OptionID` int unsigned NOT NULL DEFAULT '0',
  `OptionNpc` tinyint unsigned NOT NULL DEFAULT '0',
  `OptionText` mediumtext COLLATE utf8mb4_unicode_ci,
  `OptionBroadcastTextID` int unsigned NOT NULL DEFAULT '0',
  `Language` int unsigned NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `ActionMenuID` int unsigned NOT NULL DEFAULT '0',
  `ActionPoiID` int unsigned NOT NULL DEFAULT '0',
  `GossipNpcOptionID` int DEFAULT NULL,
  `BoxCoded` tinyint unsigned NOT NULL DEFAULT '0',
  `BoxMoney` bigint unsigned NOT NULL DEFAULT '0',
  `BoxText` mediumtext COLLATE utf8mb4_unicode_ci,
  `BoxBroadcastTextID` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int DEFAULT NULL,
  `OverrideIconID` int DEFAULT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MenuID`,`OptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gossip_menu_option` (`MenuID`, `GossipOptionID`, `OptionID`, `OptionNpc`, `OptionText`, `OptionBroadcastTextID`, `Language`, `Flags`, `ActionMenuID`, `ActionPoiID`, `GossipNpcOptionID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `SpellID`, `OverrideIconID`, `VerifiedBuild`) VALUES (6, 0, 0, 21, 'I have Void fragments. Maybe change?', 130810, 0, 128, 0, 0, NULL, 0, 0, NULL, 0, NULL, NULL, 0);


-- ==========================================
-- Table: gossip_menu_option_locale
-- ==========================================
CREATE TABLE `gossip_menu_option_locale` (
  `MenuID` int unsigned NOT NULL DEFAULT '0',
  `OptionID` int unsigned NOT NULL DEFAULT '0',
  `Locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OptionText` mediumtext COLLATE utf8mb4_unicode_ci,
  `BoxText` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`MenuID`,`OptionID`,`Locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `gossip_menu_option_locale` (`MenuID`, `OptionID`, `Locale`, `OptionText`, `BoxText`) VALUES (0, 0, 'Loca', 'OptionText', '');


-- ==========================================
-- Table: graveyard_zone
-- ==========================================
CREATE TABLE `graveyard_zone` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `GhostZone` int unsigned NOT NULL DEFAULT '0',
  `Comment` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`,`GhostZone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Trigger System';

INSERT INTO `graveyard_zone` (`ID`, `GhostZone`, `Comment`) VALUES (1, 717, NULL);


-- ==========================================
-- Table: guild_rewards
-- ==========================================
CREATE TABLE `guild_rewards` (
  `ItemID` int unsigned NOT NULL DEFAULT '0',
  `MinGuildRep` tinyint unsigned DEFAULT '0',
  `RaceMask` bigint unsigned DEFAULT '0',
  `Cost` bigint unsigned DEFAULT '0',
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `guild_rewards` (`ItemID`, `MinGuildRep`, `RaceMask`, `Cost`) VALUES (61931, 4, 0, 15000000);


-- ==========================================
-- Table: guild_rewards_req_achievements
-- ==========================================
CREATE TABLE `guild_rewards_req_achievements` (
  `ItemID` int unsigned NOT NULL DEFAULT '0',
  `AchievementRequired` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ItemID`,`AchievementRequired`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `guild_rewards_req_achievements` (`ItemID`, `AchievementRequired`) VALUES (62023, 6626);


-- ==========================================
-- Table: instance_spawn_groups
-- ==========================================
CREATE TABLE `instance_spawn_groups` (
  `instanceMapId` smallint unsigned NOT NULL,
  `bossStateId` tinyint unsigned NOT NULL,
  `bossStates` tinyint unsigned NOT NULL,
  `spawnGroupId` int unsigned NOT NULL,
  `flags` tinyint unsigned NOT NULL,
  PRIMARY KEY (`instanceMapId`,`bossStateId`,`spawnGroupId`,`bossStates`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `instance_spawn_groups` (`instanceMapId`, `bossStateId`, `bossStates`, `spawnGroupId`, `flags`) VALUES (249, 0, 23, 10, 1);


-- ==========================================
-- Table: instance_template
-- ==========================================
CREATE TABLE `instance_template` (
  `map` smallint unsigned NOT NULL,
  `parent` smallint unsigned NOT NULL,
  `script` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`map`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `instance_template` (`map`, `parent`, `script`) VALUES (33, 0, 'instance_shadowfang_keep');


-- ==========================================
-- Table: item_loot_template
-- ==========================================
CREATE TABLE `item_loot_template` (
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

INSERT INTO `item_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES (4632, 0, 2985, 2.95615, 0, 1, 2, 1, 1, 'Ornate Bronze Lockbox -- Contains: Inscribed Leather Breastplate');


-- ==========================================
-- Table: item_random_bonus_list_template
-- ==========================================
CREATE TABLE `item_random_bonus_list_template` (
  `Id` int unsigned NOT NULL,
  `BonusListID` int unsigned NOT NULL,
  `Chance` float NOT NULL,
  PRIMARY KEY (`Id`,`BonusListID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Item Random Enchantment System';

-- (Table item_random_bonus_list_template is empty)


-- ==========================================
-- Table: item_script_names
-- ==========================================
CREATE TABLE `item_script_names` (
  `Id` int unsigned NOT NULL,
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_script_names` (`Id`, `ScriptName`) VALUES (19169, 'item_generic_limit_chance_above_60');


-- ==========================================
-- Table: item_template_addon
-- ==========================================
CREATE TABLE `item_template_addon` (
  `Id` int unsigned NOT NULL,
  `FlagsCu` int unsigned NOT NULL DEFAULT '0',
  `FoodType` tinyint unsigned NOT NULL DEFAULT '0',
  `MinMoneyLoot` int unsigned NOT NULL DEFAULT '0',
  `MaxMoneyLoot` int unsigned NOT NULL DEFAULT '0',
  `SpellPPMChance` float NOT NULL DEFAULT '0',
  `RandomBonusListTemplateId` int unsigned NOT NULL DEFAULT '0',
  `QuestLogItemId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `item_template_addon` (`Id`, `FlagsCu`, `FoodType`, `MinMoneyLoot`, `MaxMoneyLoot`, `SpellPPMChance`, `RandomBonusListTemplateId`, `QuestLogItemId`) VALUES (117, 0, 1, 0, 0, 0.0, 0, 0);


-- ==========================================
-- Table: jump_charge_params
-- ==========================================
CREATE TABLE `jump_charge_params` (
  `id` int NOT NULL,
  `speed` float NOT NULL DEFAULT '42',
  `treatSpeedAsMoveTimeSeconds` tinyint(1) NOT NULL DEFAULT '0',
  `jumpGravity` float NOT NULL DEFAULT '19.2911',
  `spellVisualId` int DEFAULT NULL,
  `progressCurveId` int DEFAULT NULL,
  `parabolicCurveId` int DEFAULT NULL,
  `triggerSpellId` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `jump_charge_params` (`id`, `speed`, `treatSpeedAsMoveTimeSeconds`, `jumpGravity`, `spellVisualId`, `progressCurveId`, `parabolicCurveId`, `triggerSpellId`) VALUES (2, 0.65, 1, 0.0188189, NULL, 1636, NULL, NULL);


-- ==========================================
-- Table: lfg_dungeon_rewards
-- ==========================================
CREATE TABLE `lfg_dungeon_rewards` (
  `dungeonId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Dungeon entry from dbc',
  `maxLevel` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Max level at which this reward is rewarded',
  `firstQuestId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for first dungeon this day',
  `otherQuestId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for Nth dungeon this day',
  PRIMARY KEY (`dungeonId`,`maxLevel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `lfg_dungeon_rewards` (`dungeonId`, `maxLevel`, `firstQuestId`, `otherQuestId`) VALUES (258, 15, 24881, 24889);


-- ==========================================
-- Table: lfg_dungeon_template
-- ==========================================
CREATE TABLE `lfg_dungeon_template` (
  `dungeonId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Unique id from LFGDungeons.dbc',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `requiredItemLevel` smallint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`dungeonId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `lfg_dungeon_template` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`, `requiredItemLevel`, `VerifiedBuild`) VALUES (1, 'Wailing Caverns', -158.441, 131.601, -74.2552, 5.84685, 0, 0);


-- ==========================================
-- Table: linked_respawn
-- ==========================================
CREATE TABLE `linked_respawn` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `linkedGuid` bigint unsigned NOT NULL DEFAULT '0',
  `linkType` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`linkType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Creature Respawn Link System';

INSERT INTO `linked_respawn` (`guid`, `linkedGuid`, `linkType`) VALUES (317642, 338782, 0);


-- ==========================================
-- Table: mail_level_reward
-- ==========================================
CREATE TABLE `mail_level_reward` (
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `raceMask` bigint unsigned NOT NULL,
  `mailTemplateId` int unsigned NOT NULL DEFAULT '0',
  `senderEntry` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`,`raceMask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Mail System';

INSERT INTO `mail_level_reward` (`level`, `raceMask`, `mailTemplateId`, `senderEntry`) VALUES (20, 1, 224, 4732);


-- ==========================================
-- Table: mail_loot_template
-- ==========================================
CREATE TABLE `mail_loot_template` (
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

INSERT INTO `mail_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES (87, 0, 6529, 100.0, 0, 1, 0, 1, 1, NULL);


-- ==========================================
-- Table: milling_loot_template
-- ==========================================
CREATE TABLE `milling_loot_template` (
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

INSERT INTO `milling_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES (765, 1, 11900, 100.0, 0, 1, 0, 1, 1, NULL);


-- ==========================================
-- Table: mount_definitions
-- ==========================================
CREATE TABLE `mount_definitions` (
  `spellId` int unsigned NOT NULL,
  `otherFactionSpellId` int unsigned NOT NULL,
  PRIMARY KEY (`spellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `mount_definitions` (`spellId`, `otherFactionSpellId`) VALUES (17229, 64658);


-- ==========================================
-- Table: npc_spellclick_spells
-- ==========================================
CREATE TABLE `npc_spellclick_spells` (
  `npc_entry` int unsigned NOT NULL COMMENT 'reference to creature_template',
  `spell_id` int unsigned NOT NULL COMMENT 'spell which should be casted ',
  `cast_flags` tinyint unsigned NOT NULL COMMENT 'first bit defines caster: 1=player, 0=creature; second bit defines target, same mapping as caster bit',
  `user_type` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'relation with summoner: 0-no 1-friendly 2-raid 3-party player can click',
  PRIMARY KEY (`npc_entry`,`spell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (14864, 104517, 1, 0);


-- ==========================================
-- Table: npc_text
-- ==========================================
CREATE TABLE `npc_text` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Probability0` float NOT NULL DEFAULT '0',
  `Probability1` float NOT NULL DEFAULT '0',
  `Probability2` float NOT NULL DEFAULT '0',
  `Probability3` float NOT NULL DEFAULT '0',
  `Probability4` float NOT NULL DEFAULT '0',
  `Probability5` float NOT NULL DEFAULT '0',
  `Probability6` float NOT NULL DEFAULT '0',
  `Probability7` float NOT NULL DEFAULT '0',
  `BroadcastTextID0` int unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID1` int unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID2` int unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID3` int unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID4` int unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID5` int unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID6` int unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID7` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `npc_text` (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextID0`, `BroadcastTextID1`, `BroadcastTextID2`, `BroadcastTextID3`, `BroadcastTextID4`, `BroadcastTextID5`, `BroadcastTextID6`, `BroadcastTextID7`, `VerifiedBuild`) VALUES (0, 1.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 217928, 232277, 0, 0, 0, 0, 0, 0, 53584);


-- ==========================================
-- Table: npc_vendor
-- ==========================================
CREATE TABLE `npc_vendor` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `slot` smallint NOT NULL DEFAULT '0',
  `item` int NOT NULL DEFAULT '0',
  `maxcount` int unsigned NOT NULL DEFAULT '0',
  `incrtime` int unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '1',
  `BonusListIDs` mediumtext COLLATE utf8mb4_unicode_ci,
  `PlayerConditionID` int unsigned NOT NULL DEFAULT '0',
  `IgnoreFiltering` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  `OverrideGoldCost` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`entry`,`item`,`ExtendedCost`,`type`),
  KEY `slot` (`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Npc System';

INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`, `BonusListIDs`, `PlayerConditionID`, `IgnoreFiltering`, `VerifiedBuild`, `OverrideGoldCost`) VALUES (54, 1, 2488, 0, 0, 0, 1, NULL, 0, 0, 63906, -1);


-- ==========================================
-- Table: outdoorpvp_template
-- ==========================================
CREATE TABLE `outdoorpvp_template` (
  `TypeId` tinyint unsigned NOT NULL,
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`TypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='OutdoorPvP Templates';

INSERT INTO `outdoorpvp_template` (`TypeId`, `ScriptName`, `comment`) VALUES (1, 'outdoorpvp_hp', 'Hellfire Peninsula');


-- ==========================================
-- Table: page_text
-- ==========================================
CREATE TABLE `page_text` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Text` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `NextPageID` int unsigned NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Item System';

INSERT INTO `page_text` (`ID`, `Text`, `NextPageID`, `PlayerConditionID`, `Flags`, `VerifiedBuild`) VALUES (15, 'Hello Morgan,$B$BBusiness in Goldshire is brisk, so brisk that I haven\'t had time to send you any shipments!  $B$BI commissioned the person bearing this note to bring you a package of large wax candles (you know, the ones the Kobolds like to wear on their heads?). $B$BPlease give this person our thanks, and fair payment.', 0, 0, 0, 12340);


-- ==========================================
-- Table: page_text_locale
-- ==========================================
CREATE TABLE `page_text_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Text` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `page_text_locale` (`ID`, `locale`, `Text`, `VerifiedBuild`) VALUES (15, 'frFR', 'Bonjour Morgan, $B$BLes affaires vont bon train à Goldshire, si bien que je n\'ai pas eu le temps de vous envoyer quoi que ce soit ! $B$BJ\'ai chargé la personne portant ce billet de vous apporter un paquet de grandes bougies en cire (vous savez, celles que les Kobolds aiment porter sur la tête ?). $B$BVeuillez transmettre à cette personne nos remerciements et un paiement équitable.', 61559);


-- ==========================================
-- Table: pet_levelstats
-- ==========================================
CREATE TABLE `pet_levelstats` (
  `creature_entry` int unsigned NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `hp` smallint unsigned NOT NULL,
  `mana` smallint unsigned NOT NULL,
  `armor` int unsigned NOT NULL DEFAULT '0',
  `str` smallint unsigned NOT NULL,
  `agi` smallint unsigned NOT NULL,
  `sta` smallint unsigned NOT NULL,
  `inte` smallint unsigned NOT NULL,
  `spi` smallint unsigned NOT NULL,
  PRIMARY KEY (`creature_entry`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PACK_KEYS=0 COMMENT='Stores pet levels stats.';

INSERT INTO `pet_levelstats` (`creature_entry`, `level`, `hp`, `mana`, `armor`, `str`, `agi`, `sta`, `inte`, `spi`) VALUES (1, 1, 42, 1, 20, 22, 20, 22, 20, 20);


-- ==========================================
-- Table: pet_name_generation
-- ==========================================
CREATE TABLE `pet_name_generation` (
  `id` int unsigned NOT NULL,
  `word` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `entry` int unsigned NOT NULL DEFAULT '0',
  `half` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pet_name_generation` (`id`, `word`, `entry`, `half`) VALUES (1, 'Aba', 416, 0);


-- ==========================================
-- Table: phase_area
-- ==========================================
CREATE TABLE `phase_area` (
  `AreaId` int unsigned NOT NULL,
  `PhaseId` int unsigned NOT NULL,
  `Comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`AreaId`,`PhaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `phase_area` (`AreaId`, `PhaseId`, `Comment`) VALUES (4, 2801, 'Blasted Lands Present (A)');


-- ==========================================
-- Table: phase_name
-- ==========================================
CREATE TABLE `phase_name` (
  `ID` int unsigned NOT NULL,
  `Name` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Helper table to store names for phases';

INSERT INTO `phase_name` (`ID`, `Name`) VALUES (50, 'Gilneas Lev 6');


-- ==========================================
-- Table: pickpocketing_loot_template
-- ==========================================
CREATE TABLE `pickpocketing_loot_template` (
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

INSERT INTO `pickpocketing_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES (3, 0, 929, 2.449, 0, 1, 0, 1, 1, NULL);


-- ==========================================
-- Table: player_classlevelstats
-- ==========================================
CREATE TABLE `player_classlevelstats` (
  `class` tinyint unsigned NOT NULL,
  `level` tinyint unsigned NOT NULL,
  `str` int NOT NULL COMMENT 'strength',
  `agi` int NOT NULL COMMENT 'agility',
  `sta` int NOT NULL COMMENT 'stamina',
  `inte` int NOT NULL COMMENT 'intellect',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`class`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Stores levels stats.';

INSERT INTO `player_classlevelstats` (`class`, `level`, `str`, `agi`, `sta`, `inte`, `VerifiedBuild`) VALUES (1, 1, 17, 12, 74, 14, 0);


-- ==========================================
-- Table: player_factionchange_achievement
-- ==========================================
CREATE TABLE `player_factionchange_achievement` (
  `alliance_id` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `player_factionchange_achievement` (`alliance_id`, `horde_id`) VALUES (33, 1358);


-- ==========================================
-- Table: player_factionchange_items
-- ==========================================
CREATE TABLE `player_factionchange_items` (
  `race_A` int unsigned NOT NULL,
  `alliance_id` int unsigned NOT NULL,
  `commentA` text,
  `race_H` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  `commentH` text,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

INSERT INTO `player_factionchange_items` (`race_A`, `alliance_id`, `commentA`, `race_H`, `horde_id`, `commentH`) VALUES (0, 15196, 'Private\'s Tabard', 0, 15197, 'Scout\'s Tabard');


-- ==========================================
-- Table: player_factionchange_quests
-- ==========================================
CREATE TABLE `player_factionchange_quests` (
  `alliance_id` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`),
  UNIQUE KEY `alliance_uniq` (`alliance_id`),
  UNIQUE KEY `horde_uniq` (`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `player_factionchange_quests` (`alliance_id`, `horde_id`) VALUES (7168, 7163);


-- ==========================================
-- Table: player_factionchange_reputations
-- ==========================================
CREATE TABLE `player_factionchange_reputations` (
  `alliance_id` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `player_factionchange_reputations` (`alliance_id`, `horde_id`) VALUES (47, 530);


-- ==========================================
-- Table: player_factionchange_spells
-- ==========================================
CREATE TABLE `player_factionchange_spells` (
  `alliance_id` int unsigned NOT NULL,
  `horde_id` int unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `player_factionchange_spells` (`alliance_id`, `horde_id`) VALUES (458, 6654);


-- ==========================================
-- Table: player_factionchange_titles
-- ==========================================
CREATE TABLE `player_factionchange_titles` (
  `alliance_id` int NOT NULL,
  `horde_id` int NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `player_factionchange_titles` (`alliance_id`, `horde_id`) VALUES (1, 15);


-- ==========================================
-- Table: player_racestats
-- ==========================================
CREATE TABLE `player_racestats` (
  `race` tinyint unsigned NOT NULL,
  `str` smallint NOT NULL COMMENT 'strength',
  `agi` smallint NOT NULL COMMENT 'agility',
  `sta` smallint NOT NULL COMMENT 'stamina',
  `inte` smallint NOT NULL COMMENT 'intellect',
  PRIMARY KEY (`race`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COMMENT='Stores race stats.';

INSERT INTO `player_racestats` (`race`, `str`, `agi`, `sta`, `inte`) VALUES (1, 0, 0, 0, 0);


-- ==========================================
-- Table: player_xp_for_level
-- ==========================================
CREATE TABLE `player_xp_for_level` (
  `Level` tinyint unsigned NOT NULL,
  `Experience` int unsigned NOT NULL,
  PRIMARY KEY (`Level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table player_xp_for_level is empty)


-- ==========================================
-- Table: playerchoice
-- ==========================================
CREATE TABLE `playerchoice` (
  `ChoiceId` int NOT NULL,
  `UiTextureKitId` int NOT NULL DEFAULT '0',
  `SoundKitId` int unsigned NOT NULL DEFAULT '0',
  `CloseSoundKitId` int unsigned NOT NULL DEFAULT '0',
  `Duration` bigint NOT NULL DEFAULT '0',
  `PendingChoiceText` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `HideWarboardHeader` tinyint unsigned NOT NULL DEFAULT '0',
  `KeepOpenAfterChoice` tinyint unsigned NOT NULL DEFAULT '0',
  `ShowChoicesAsList` tinyint unsigned NOT NULL DEFAULT '0',
  `ForceDontShowChoicesAsList` tinyint unsigned NOT NULL DEFAULT '0',
  `MaxResponses` int unsigned DEFAULT NULL,
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `InfiniteRange` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `playerchoice` (`ChoiceId`, `UiTextureKitId`, `SoundKitId`, `CloseSoundKitId`, `Duration`, `PendingChoiceText`, `Question`, `HideWarboardHeader`, `KeepOpenAfterChoice`, `ShowChoicesAsList`, `ForceDontShowChoicesAsList`, `MaxResponses`, `ScriptName`, `InfiniteRange`, `VerifiedBuild`) VALUES (352, 261, 0, 0, 0, '', 'The King needs you! Please take a flyer.', 0, 0, 0, 0, NULL, NULL, 0, 47213);


-- ==========================================
-- Table: playerchoice_locale
-- ==========================================
CREATE TABLE `playerchoice_locale` (
  `ChoiceId` int NOT NULL,
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table playerchoice_locale is empty)


-- ==========================================
-- Table: playerchoice_response
-- ==========================================
CREATE TABLE `playerchoice_response` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `Index` int unsigned NOT NULL,
  `ChoiceArtFileId` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `WidgetSetID` int unsigned NOT NULL DEFAULT '0',
  `UiTextureAtlasElementID` int unsigned NOT NULL DEFAULT '0',
  `SoundKitID` int unsigned NOT NULL DEFAULT '0',
  `GroupID` tinyint unsigned NOT NULL DEFAULT '0',
  `UiTextureKitID` int NOT NULL DEFAULT '0',
  `Header` varchar(511) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SubHeader` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ButtonTooltip` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Answer` varchar(511) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(2047) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Confirmation` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RewardQuestID` int unsigned DEFAULT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `playerchoice_response` (`ChoiceId`, `ResponseId`, `Index`, `ChoiceArtFileId`, `Flags`, `WidgetSetID`, `UiTextureAtlasElementID`, `SoundKitID`, `GroupID`, `UiTextureKitID`, `Header`, `SubHeader`, `ButtonTooltip`, `Answer`, `Description`, `Confirmation`, `RewardQuestID`, `VerifiedBuild`) VALUES (352, 937, 2, 1851074, 0, 0, 0, 0, 0, 0, 'Darkshore', '', '', 'Assist the Night Elves', 'The destruction of Auberdine has left the night elves in a vulnerable situation, with many of their own unaccounted for.

Lend your support. Help them rebuild.', '', 0, 47213);


-- ==========================================
-- Table: playerchoice_response_locale
-- ==========================================
CREATE TABLE `playerchoice_response_locale` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Header` varchar(511) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `SubHeader` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ButtonTooltip` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Answer` varchar(511) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Description` varchar(2047) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Confirmation` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table playerchoice_response_locale is empty)


-- ==========================================
-- Table: playerchoice_response_maw_power
-- ==========================================
CREATE TABLE `playerchoice_response_maw_power` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `TypeArtFileID` int DEFAULT '0',
  `Rarity` int DEFAULT '0',
  `SpellID` int DEFAULT '0',
  `MaxStacks` int DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table playerchoice_response_maw_power is empty)


-- ==========================================
-- Table: playerchoice_response_reward
-- ==========================================
CREATE TABLE `playerchoice_response_reward` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `TitleId` int NOT NULL DEFAULT '0',
  `PackageId` int NOT NULL DEFAULT '0',
  `SkillLineId` int unsigned NOT NULL DEFAULT '0',
  `SkillPointCount` int unsigned NOT NULL DEFAULT '0',
  `ArenaPointCount` int unsigned NOT NULL DEFAULT '0',
  `HonorPointCount` int unsigned NOT NULL DEFAULT '0',
  `Money` bigint unsigned NOT NULL DEFAULT '0',
  `Xp` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table playerchoice_response_reward is empty)


-- ==========================================
-- Table: playerchoice_response_reward_currency
-- ==========================================
CREATE TABLE `playerchoice_response_reward_currency` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `Index` int unsigned NOT NULL,
  `CurrencyId` int unsigned NOT NULL DEFAULT '0',
  `Quantity` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table playerchoice_response_reward_currency is empty)


-- ==========================================
-- Table: playerchoice_response_reward_faction
-- ==========================================
CREATE TABLE `playerchoice_response_reward_faction` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `Index` int unsigned NOT NULL,
  `FactionId` int unsigned NOT NULL DEFAULT '0',
  `Quantity` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table playerchoice_response_reward_faction is empty)


-- ==========================================
-- Table: playerchoice_response_reward_item
-- ==========================================
CREATE TABLE `playerchoice_response_reward_item` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `Index` int unsigned NOT NULL,
  `ItemId` int unsigned NOT NULL DEFAULT '0',
  `BonusListIDs` mediumtext COLLATE utf8mb4_unicode_ci,
  `Quantity` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table playerchoice_response_reward_item is empty)


-- ==========================================
-- Table: playerchoice_response_reward_item_choice
-- ==========================================
CREATE TABLE `playerchoice_response_reward_item_choice` (
  `ChoiceId` int NOT NULL,
  `ResponseId` int NOT NULL,
  `Index` int unsigned NOT NULL,
  `ItemId` int unsigned NOT NULL DEFAULT '0',
  `BonusListIDs` mediumtext COLLATE utf8mb4_unicode_ci,
  `Quantity` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ChoiceId`,`ResponseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table playerchoice_response_reward_item_choice is empty)


-- ==========================================
-- Table: playercreateinfo
-- ==========================================
CREATE TABLE `playercreateinfo` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `npe_map` int unsigned DEFAULT NULL,
  `npe_position_x` float DEFAULT NULL,
  `npe_position_y` float DEFAULT NULL,
  `npe_position_z` float DEFAULT NULL,
  `npe_orientation` float DEFAULT NULL,
  `npe_transport_guid` bigint unsigned DEFAULT NULL,
  `intro_movie_id` int unsigned DEFAULT NULL,
  `intro_scene_id` int unsigned DEFAULT NULL,
  `npe_intro_scene_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`race`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `npe_map`, `npe_position_x`, `npe_position_y`, `npe_position_z`, `npe_orientation`, `npe_transport_guid`, `intro_movie_id`, `intro_scene_id`, `npe_intro_scene_id`) VALUES (1, 1, 0, -8914.57, -133.909, 80.5378, 5.10444, NULL, NULL, NULL, NULL, NULL, 29, NULL, NULL, 2236);


-- ==========================================
-- Table: playercreateinfo_action
-- ==========================================
CREATE TABLE `playercreateinfo_action` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `button` smallint unsigned NOT NULL DEFAULT '0',
  `action` int unsigned NOT NULL DEFAULT '0',
  `type` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`,`button`),
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) VALUES (1, 1, 0, 6603, 0);


-- ==========================================
-- Table: playercreateinfo_cast_spell
-- ==========================================
CREATE TABLE `playercreateinfo_cast_spell` (
  `raceMask` bigint unsigned NOT NULL,
  `classMask` int unsigned NOT NULL DEFAULT '0',
  `createMode` tinyint NOT NULL DEFAULT '0',
  `spell` int unsigned NOT NULL DEFAULT '0',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`raceMask`,`classMask`,`createMode`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `playercreateinfo_cast_spell` (`raceMask`, `classMask`, `createMode`, `spell`, `note`) VALUES (4, 4096, 0, 290245, 'Nightelf');


-- ==========================================
-- Table: playercreateinfo_item
-- ==========================================
CREATE TABLE `playercreateinfo_item` (
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `itemid` int unsigned NOT NULL DEFAULT '0',
  `amount` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`race`,`class`,`itemid`),
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES (0, 6, 40582, -1);


-- ==========================================
-- Table: playercreateinfo_spell_custom
-- ==========================================
CREATE TABLE `playercreateinfo_spell_custom` (
  `racemask` bigint unsigned NOT NULL,
  `classmask` int unsigned NOT NULL DEFAULT '0',
  `Spell` int unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`racemask`,`classmask`,`Spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`) VALUES (8, 4095, 290245, NULL);


-- ==========================================
-- Table: points_of_interest
-- ==========================================
CREATE TABLE `points_of_interest` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `PositionZ` float NOT NULL DEFAULT '0',
  `Icon` int unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `Importance` int unsigned NOT NULL DEFAULT '0',
  `Name` mediumtext COLLATE utf8mb4_unicode_ci,
  `WMOGroupID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `points_of_interest` (`ID`, `PositionX`, `PositionY`, `PositionZ`, `Icon`, `Flags`, `Importance`, `Name`, `WMOGroupID`, `VerifiedBuild`) VALUES (47, -8900.59, 632.021, 99.569, 7, 99, 0, 'Stormwind Bank', 0, 44325);


-- ==========================================
-- Table: points_of_interest_locale
-- ==========================================
CREATE TABLE `points_of_interest_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `points_of_interest_locale` (`ID`, `locale`, `Name`, `VerifiedBuild`) VALUES (47, 'deDE', 'Bank von Sturmwind', 44325);


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

INSERT INTO `quest_completion_log_conditional` (`QuestId`, `PlayerConditionId`, `QuestgiverCreatureId`, `locale`, `Text`, `OrderIndex`, `VerifiedBuild`) VALUES (65049, 0, 0, 'enUS', '', 0, 63796);


-- ==========================================
-- Table: quest_description_conditional
-- ==========================================
CREATE TABLE `quest_description_conditional` (
  `QuestId` int NOT NULL,
  `PlayerConditionId` int NOT NULL,
  `QuestgiverCreatureId` int NOT NULL,
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Text` text COLLATE utf8mb4_unicode_ci,
  `OrderIndex` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestId`,`PlayerConditionId`,`QuestgiverCreatureId`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_description_conditional` (`QuestId`, `PlayerConditionId`, `QuestgiverCreatureId`, `locale`, `Text`, `OrderIndex`, `VerifiedBuild`) VALUES (31392, 0, 55809, 'enUS', 'Have you heard the news, traveller? There\'s been an attack at one of our most sacred places, the Vale of Eternal Blossoms!$b$bEven now, there\'s a human prince within the White Tiger Temple arguing that you and the other races from beyond the mists should be allowed within.$b$bThe temple is in the northeast of Kun-Lai. Maybe you can convince the White Tiger to allow you inside?$b$bI only hope the Vale has not been utterly destroyed...', 1, 63796);


-- ==========================================
-- Table: quest_details
-- ==========================================
CREATE TABLE `quest_details` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Emote1` smallint unsigned NOT NULL DEFAULT '0',
  `Emote2` smallint unsigned NOT NULL DEFAULT '0',
  `Emote3` smallint unsigned NOT NULL DEFAULT '0',
  `Emote4` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteDelay1` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_details` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `VerifiedBuild`) VALUES (2, 0, 0, 0, 0, 0, 0, 0, 0, 39653);


-- ==========================================
-- Table: quest_greeting
-- ==========================================
CREATE TABLE `quest_greeting` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `GreetEmoteType` smallint unsigned NOT NULL DEFAULT '0',
  `GreetEmoteDelay` int unsigned NOT NULL DEFAULT '0',
  `Greeting` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_greeting` (`ID`, `Type`, `GreetEmoteType`, `GreetEmoteDelay`, `Greeting`, `VerifiedBuild`) VALUES (234, 0, 1, 0, 'A foul corruption has crept into Westfall.  While I was upholding my duty on the battlefields of Lordaeron these honest farms were overrun and made into hide-outs for thugs and murderers. The People\'s Militia needs your help.', 0);


-- ==========================================
-- Table: quest_greeting_locale
-- ==========================================
CREATE TABLE `quest_greeting_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Greeting` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`type`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_greeting_locale` (`ID`, `type`, `locale`, `Greeting`, `VerifiedBuild`) VALUES (234, 0, 'esES', 'Una completa corrupción se ha infiltrado en Paramos de Poniente. Mientras cumplía con mi deber en los campos de batalla de Lordaeron, estas honestas granjas fueron invadidas y convertidas en escondites para matones y asesinos. La Milicia Popular necesita tu ayuda.', 0);


-- ==========================================
-- Table: quest_mail_sender
-- ==========================================
CREATE TABLE `quest_mail_sender` (
  `QuestId` int unsigned NOT NULL DEFAULT '0',
  `RewardMailSenderEntry` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_mail_sender` (`QuestId`, `RewardMailSenderEntry`) VALUES (8729, 11811);


-- ==========================================
-- Table: quest_objectives
-- ==========================================
CREATE TABLE `quest_objectives` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `QuestID` int unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '0',
  `Order` tinyint unsigned NOT NULL DEFAULT '0',
  `StorageIndex` tinyint NOT NULL DEFAULT '0',
  `ObjectID` int NOT NULL DEFAULT '0',
  `Amount` int NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `Flags2` int unsigned NOT NULL DEFAULT '0',
  `ProgressBarWeight` float NOT NULL DEFAULT '0',
  `Description` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_objectives` (`ID`, `QuestID`, `Type`, `Order`, `StorageIndex`, `ObjectID`, `Amount`, `Flags`, `Flags2`, `ProgressBarWeight`, `Description`, `VerifiedBuild`) VALUES (46446, 39801, 0, 6, 6, 95451, 1, 2, 0, 0.0, 'Final Stage: Queen Takes King - Battle Genn Greymane on the deck of the Skyfire', 42488);


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

INSERT INTO `quest_objectives_completion_effect` (`ObjectiveID`, `GameEventID`, `SpellID`, `ConversationID`, `UpdatePhaseShift`, `UpdateZoneAuras`) VALUES (252090, NULL, NULL, NULL, 1, 1);


-- ==========================================
-- Table: quest_objectives_locale
-- ==========================================
CREATE TABLE `quest_objectives_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `QuestId` int unsigned NOT NULL DEFAULT '0',
  `StorageIndex` tinyint NOT NULL DEFAULT '0',
  `Description` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_objectives_locale` (`ID`, `locale`, `QuestId`, `StorageIndex`, `Description`, `VerifiedBuild`) VALUES (46446, 'deDE', 39801, 6, 'Letzte Phase: Dame schlägt König - Bekämpft Genn Graumähne auf dem Deck der Himmelsfeuer.', 42488);


-- ==========================================
-- Table: quest_offer_reward
-- ==========================================
CREATE TABLE `quest_offer_reward` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Emote1` smallint NOT NULL DEFAULT '0',
  `Emote2` smallint NOT NULL DEFAULT '0',
  `Emote3` smallint NOT NULL DEFAULT '0',
  `Emote4` smallint NOT NULL DEFAULT '0',
  `EmoteDelay1` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay2` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay3` int unsigned NOT NULL DEFAULT '0',
  `EmoteDelay4` int unsigned NOT NULL DEFAULT '0',
  `RewardText` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_offer_reward` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `RewardText`, `VerifiedBuild`) VALUES (2, 1, 0, 0, 0, 0, 0, 0, 0, 'You have slain the beast?$b$bI owe you a great debt, friend. That beast terrorized many over the years, but its death holds special meaning to me.$b$bYou see, recently my brother fell victim to these very claws... I shall sleep well now, knowing that he has been avenged.', 32028);


-- ==========================================
-- Table: quest_offer_reward_conditional
-- ==========================================
CREATE TABLE `quest_offer_reward_conditional` (
  `QuestId` int NOT NULL,
  `PlayerConditionId` int NOT NULL,
  `QuestgiverCreatureId` int NOT NULL,
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Text` text COLLATE utf8mb4_unicode_ci,
  `OrderIndex` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestId`,`PlayerConditionId`,`QuestgiverCreatureId`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table quest_offer_reward_conditional is empty)


-- ==========================================
-- Table: quest_offer_reward_locale
-- ==========================================
CREATE TABLE `quest_offer_reward_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `RewardText` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_offer_reward_locale` (`ID`, `locale`, `RewardText`, `VerifiedBuild`) VALUES (2, 'esES', 'De lo más impresionante, $n... ¡no puede haber sido un paseo conseguir la garra de Garrafilada! ¡La Caza de Vallefresno te está yendo bien!$B$BGarrafilada lleva muchos años aterrorizando a los peones de los aserraderos cuando se trasladan a Puesto del Hachazo y se cruzan en su ruta. No lo dudes, cuando se corra la voz de que doblegaste a ese monstruo, ¡se escucharán muchas canciones alabando tu valor en los campamentos y aserraderos de todo Vallefresno!', 0);


-- ==========================================
-- Table: quest_poi
-- ==========================================
CREATE TABLE `quest_poi` (
  `QuestID` int NOT NULL DEFAULT '0',
  `BlobIndex` int NOT NULL DEFAULT '0',
  `Idx1` int NOT NULL DEFAULT '0',
  `ObjectiveIndex` int NOT NULL DEFAULT '0',
  `QuestObjectiveID` int NOT NULL DEFAULT '0',
  `QuestObjectID` int NOT NULL DEFAULT '0',
  `MapID` int NOT NULL DEFAULT '0',
  `UiMapID` int NOT NULL DEFAULT '0',
  `Priority` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `WorldEffectID` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `NavigationPlayerConditionID` int NOT NULL DEFAULT '0',
  `SpawnTrackingID` int NOT NULL DEFAULT '0',
  `AlwaysAllowMergingBlobs` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestID`,`BlobIndex`,`Idx1`),
  KEY `idx` (`QuestID`,`BlobIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `Idx1`, `ObjectiveIndex`, `QuestObjectiveID`, `QuestObjectID`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `NavigationPlayerConditionID`, `SpawnTrackingID`, `AlwaysAllowMergingBlobs`, `VerifiedBuild`) VALUES (1, 0, 0, -1, 0, 0, 0, 23, 0, 1, 0, 0, 0, 0, 0, 62493);


-- ==========================================
-- Table: quest_poi_points
-- ==========================================
CREATE TABLE `quest_poi_points` (
  `QuestID` int NOT NULL DEFAULT '0',
  `Idx1` int NOT NULL DEFAULT '0',
  `Idx2` int NOT NULL DEFAULT '0',
  `X` int NOT NULL DEFAULT '0',
  `Y` int NOT NULL DEFAULT '0',
  `Z` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestID`,`Idx1`,`Idx2`),
  KEY `questId_id` (`QuestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `Z`, `VerifiedBuild`) VALUES (1, 0, 0, 2148, -5252, 0, 62493);


-- ==========================================
-- Table: quest_pool_members
-- ==========================================
CREATE TABLE `quest_pool_members` (
  `questId` int unsigned NOT NULL,
  `poolId` int unsigned NOT NULL,
  `poolIndex` tinyint unsigned NOT NULL COMMENT 'Multiple quests with the same index will always spawn together!',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`questId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_pool_members` (`questId`, `poolId`, `poolIndex`, `description`) VALUES (236, 5708, 2, 'Fueling the Demolishers (Alliance, defenders)');


-- ==========================================
-- Table: quest_pool_template
-- ==========================================
CREATE TABLE `quest_pool_template` (
  `poolId` int unsigned NOT NULL,
  `numActive` int unsigned NOT NULL COMMENT 'Number of indices to have active at any time',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`poolId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_pool_template` (`poolId`, `numActive`, `description`) VALUES (348, 1, 'Public Relations Agent <Crown Chemical Co.> - Daily Quests');


-- ==========================================
-- Table: quest_request_items
-- ==========================================
CREATE TABLE `quest_request_items` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `EmoteOnComplete` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteOnIncomplete` smallint unsigned NOT NULL DEFAULT '0',
  `EmoteOnCompleteDelay` int unsigned NOT NULL DEFAULT '0',
  `EmoteOnIncompleteDelay` int unsigned NOT NULL DEFAULT '0',
  `CompletionText` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `EmoteOnCompleteDelay`, `EmoteOnIncompleteDelay`, `CompletionText`, `VerifiedBuild`) VALUES (2, 6, 0, 0, 0, 'What have you there, $c? Could it be....?', 0);


-- ==========================================
-- Table: quest_request_items_conditional
-- ==========================================
CREATE TABLE `quest_request_items_conditional` (
  `QuestId` int NOT NULL,
  `PlayerConditionId` int NOT NULL,
  `QuestgiverCreatureId` int NOT NULL,
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Text` text COLLATE utf8mb4_unicode_ci,
  `OrderIndex` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestId`,`PlayerConditionId`,`QuestgiverCreatureId`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table quest_request_items_conditional is empty)


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
-- Table: quest_reward_choice_items
-- ==========================================
CREATE TABLE `quest_reward_choice_items` (
  `QuestID` int unsigned NOT NULL,
  `Type1` tinyint unsigned DEFAULT '0',
  `Type2` tinyint unsigned DEFAULT '0',
  `Type3` tinyint unsigned DEFAULT '0',
  `Type4` tinyint unsigned DEFAULT '0',
  `Type5` tinyint unsigned DEFAULT '0',
  `Type6` tinyint unsigned DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table quest_reward_choice_items is empty)


-- ==========================================
-- Table: quest_reward_display_spell
-- ==========================================
CREATE TABLE `quest_reward_display_spell` (
  `QuestID` int unsigned NOT NULL,
  `Idx` int unsigned NOT NULL,
  `SpellID` int unsigned DEFAULT '0',
  `PlayerConditionID` int unsigned DEFAULT '0',
  `Type` int unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestID`,`Idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_reward_display_spell` (`QuestID`, `Idx`, `SpellID`, `PlayerConditionID`, `Type`, `VerifiedBuild`) VALUES (96, 0, 5394, 0, 0, 52095);


-- ==========================================
-- Table: quest_template
-- ==========================================
CREATE TABLE `quest_template` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `QuestType` tinyint unsigned NOT NULL DEFAULT '2',
  `QuestPackageID` int unsigned NOT NULL DEFAULT '0',
  `ContentTuningID` int unsigned NOT NULL DEFAULT '0',
  `QuestSortID` smallint NOT NULL DEFAULT '0',
  `QuestInfoID` smallint unsigned NOT NULL DEFAULT '0',
  `SuggestedGroupNum` tinyint unsigned NOT NULL DEFAULT '0',
  `RewardNextQuest` int unsigned NOT NULL DEFAULT '0',
  `RewardXPDifficulty` int unsigned NOT NULL DEFAULT '0',
  `RewardXPMultiplier` float NOT NULL DEFAULT '1',
  `RewardMoneyDifficulty` int unsigned NOT NULL DEFAULT '0',
  `RewardMoneyMultiplier` float NOT NULL DEFAULT '1',
  `RewardBonusMoney` int unsigned NOT NULL DEFAULT '0',
  `RewardDisplaySpell1` int unsigned NOT NULL DEFAULT '0',
  `RewardDisplaySpell2` int unsigned NOT NULL DEFAULT '0',
  `RewardDisplaySpell3` int unsigned NOT NULL DEFAULT '0',
  `RewardSpell` int unsigned NOT NULL DEFAULT '0',
  `RewardHonor` int unsigned NOT NULL DEFAULT '0',
  `RewardKillHonor` int unsigned NOT NULL DEFAULT '0',
  `StartItem` int unsigned NOT NULL DEFAULT '0',
  `RewardArtifactXPDifficulty` int unsigned NOT NULL DEFAULT '0',
  `RewardArtifactXPMultiplier` float NOT NULL DEFAULT '1',
  `RewardArtifactCategoryID` int unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `FlagsEx` int unsigned NOT NULL DEFAULT '0',
  `FlagsEx2` int unsigned NOT NULL DEFAULT '0',
  `FlagsEx3` int unsigned NOT NULL DEFAULT '0',
  `RewardItem1` int unsigned NOT NULL DEFAULT '0',
  `RewardAmount1` int unsigned NOT NULL DEFAULT '0',
  `RewardItem2` int unsigned NOT NULL DEFAULT '0',
  `RewardAmount2` int unsigned NOT NULL DEFAULT '0',
  `RewardItem3` int unsigned NOT NULL DEFAULT '0',
  `RewardAmount3` int unsigned NOT NULL DEFAULT '0',
  `RewardItem4` int unsigned NOT NULL DEFAULT '0',
  `RewardAmount4` int unsigned NOT NULL DEFAULT '0',
  `ItemDrop1` int unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity1` int unsigned NOT NULL DEFAULT '0',
  `ItemDrop2` int unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity2` int unsigned NOT NULL DEFAULT '0',
  `ItemDrop3` int unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity3` int unsigned NOT NULL DEFAULT '0',
  `ItemDrop4` int unsigned NOT NULL DEFAULT '0',
  `ItemDropQuantity4` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID1` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity1` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemDisplayID1` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID2` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity2` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemDisplayID2` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID3` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity3` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemDisplayID3` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID4` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity4` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemDisplayID4` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID5` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity5` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemDisplayID5` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemID6` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemQuantity6` int unsigned NOT NULL DEFAULT '0',
  `RewardChoiceItemDisplayID6` int unsigned NOT NULL DEFAULT '0',
  `POIContinent` int unsigned NOT NULL DEFAULT '0',
  `POIx` float NOT NULL DEFAULT '0',
  `POIy` float NOT NULL DEFAULT '0',
  `POIPriority` int NOT NULL DEFAULT '0',
  `RewardTitle` int unsigned NOT NULL DEFAULT '0',
  `RewardArenaPoints` int unsigned NOT NULL DEFAULT '0',
  `RewardSkillLineID` int unsigned NOT NULL DEFAULT '0',
  `RewardNumSkillUps` int unsigned NOT NULL DEFAULT '0',
  `PortraitGiver` int unsigned NOT NULL DEFAULT '0',
  `PortraitGiverMount` int NOT NULL DEFAULT '0',
  `PortraitGiverModelSceneID` int NOT NULL DEFAULT '0',
  `PortraitTurnIn` int unsigned NOT NULL DEFAULT '0',
  `RewardFactionID1` int unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue1` int NOT NULL DEFAULT '0',
  `RewardFactionOverride1` int NOT NULL DEFAULT '0',
  `RewardFactionCapIn1` int NOT NULL DEFAULT '0',
  `RewardFactionID2` int unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue2` int NOT NULL DEFAULT '0',
  `RewardFactionOverride2` int NOT NULL DEFAULT '0',
  `RewardFactionCapIn2` int NOT NULL DEFAULT '0',
  `RewardFactionID3` int unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue3` int NOT NULL DEFAULT '0',
  `RewardFactionOverride3` int NOT NULL DEFAULT '0',
  `RewardFactionCapIn3` int NOT NULL DEFAULT '0',
  `RewardFactionID4` int unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue4` int NOT NULL DEFAULT '0',
  `RewardFactionOverride4` int NOT NULL DEFAULT '0',
  `RewardFactionCapIn4` int NOT NULL DEFAULT '0',
  `RewardFactionID5` int unsigned NOT NULL DEFAULT '0',
  `RewardFactionValue5` int NOT NULL DEFAULT '0',
  `RewardFactionOverride5` int NOT NULL DEFAULT '0',
  `RewardFactionCapIn5` int NOT NULL DEFAULT '0',
  `RewardFactionFlags` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyID1` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyQty1` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyID2` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyQty2` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyID3` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyQty3` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyID4` int unsigned NOT NULL DEFAULT '0',
  `RewardCurrencyQty4` int unsigned NOT NULL DEFAULT '0',
  `AcceptedSoundKitID` int unsigned NOT NULL DEFAULT '0',
  `CompleteSoundKitID` int unsigned NOT NULL DEFAULT '0',
  `AreaGroupID` int unsigned NOT NULL DEFAULT '0',
  `TimeAllowed` bigint NOT NULL DEFAULT '0',
  `AllowableRaces` bigint unsigned DEFAULT '0',
  `Expansion` int NOT NULL DEFAULT '0',
  `ManagedWorldStateID` int NOT NULL DEFAULT '0',
  `QuestSessionBonus` int NOT NULL DEFAULT '0',
  `LogTitle` mediumtext COLLATE utf8mb4_unicode_ci,
  `LogDescription` mediumtext COLLATE utf8mb4_unicode_ci,
  `QuestDescription` mediumtext COLLATE utf8mb4_unicode_ci,
  `AreaDescription` mediumtext COLLATE utf8mb4_unicode_ci,
  `PortraitGiverText` mediumtext COLLATE utf8mb4_unicode_ci,
  `PortraitGiverName` mediumtext COLLATE utf8mb4_unicode_ci,
  `PortraitTurnInText` mediumtext COLLATE utf8mb4_unicode_ci,
  `PortraitTurnInName` mediumtext COLLATE utf8mb4_unicode_ci,
  `QuestCompletionLog` mediumtext COLLATE utf8mb4_unicode_ci,
  `ResetByScheduler` tinyint NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Quest System';

INSERT INTO `quest_template` (`ID`, `QuestType`, `QuestPackageID`, `ContentTuningID`, `QuestSortID`, `QuestInfoID`, `SuggestedGroupNum`, `RewardNextQuest`, `RewardXPDifficulty`, `RewardXPMultiplier`, `RewardMoneyDifficulty`, `RewardMoneyMultiplier`, `RewardBonusMoney`, `RewardDisplaySpell1`, `RewardDisplaySpell2`, `RewardDisplaySpell3`, `RewardSpell`, `RewardHonor`, `RewardKillHonor`, `StartItem`, `RewardArtifactXPDifficulty`, `RewardArtifactXPMultiplier`, `RewardArtifactCategoryID`, `Flags`, `FlagsEx`, `FlagsEx2`, `FlagsEx3`, `RewardItem1`, `RewardAmount1`, `RewardItem2`, `RewardAmount2`, `RewardItem3`, `RewardAmount3`, `RewardItem4`, `RewardAmount4`, `ItemDrop1`, `ItemDropQuantity1`, `ItemDrop2`, `ItemDropQuantity2`, `ItemDrop3`, `ItemDropQuantity3`, `ItemDrop4`, `ItemDropQuantity4`, `RewardChoiceItemID1`, `RewardChoiceItemQuantity1`, `RewardChoiceItemDisplayID1`, `RewardChoiceItemID2`, `RewardChoiceItemQuantity2`, `RewardChoiceItemDisplayID2`, `RewardChoiceItemID3`, `RewardChoiceItemQuantity3`, `RewardChoiceItemDisplayID3`, `RewardChoiceItemID4`, `RewardChoiceItemQuantity4`, `RewardChoiceItemDisplayID4`, `RewardChoiceItemID5`, `RewardChoiceItemQuantity5`, `RewardChoiceItemDisplayID5`, `RewardChoiceItemID6`, `RewardChoiceItemQuantity6`, `RewardChoiceItemDisplayID6`, `POIContinent`, `POIx`, `POIy`, `POIPriority`, `RewardTitle`, `RewardArenaPoints`, `RewardSkillLineID`, `RewardNumSkillUps`, `PortraitGiver`, `PortraitGiverMount`, `PortraitGiverModelSceneID`, `PortraitTurnIn`, `RewardFactionID1`, `RewardFactionValue1`, `RewardFactionOverride1`, `RewardFactionCapIn1`, `RewardFactionID2`, `RewardFactionValue2`, `RewardFactionOverride2`, `RewardFactionCapIn2`, `RewardFactionID3`, `RewardFactionValue3`, `RewardFactionOverride3`, `RewardFactionCapIn3`, `RewardFactionID4`, `RewardFactionValue4`, `RewardFactionOverride4`, `RewardFactionCapIn4`, `RewardFactionID5`, `RewardFactionValue5`, `RewardFactionOverride5`, `RewardFactionCapIn5`, `RewardFactionFlags`, `RewardCurrencyID1`, `RewardCurrencyQty1`, `RewardCurrencyID2`, `RewardCurrencyQty2`, `RewardCurrencyID3`, `RewardCurrencyQty3`, `RewardCurrencyID4`, `RewardCurrencyQty4`, `AcceptedSoundKitID`, `CompleteSoundKitID`, `AreaGroupID`, `TimeAllowed`, `AllowableRaces`, `Expansion`, `ManagedWorldStateID`, `QuestSessionBonus`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `PortraitGiverText`, `PortraitGiverName`, `PortraitTurnInText`, `PortraitTurnInName`, `QuestCompletionLog`, `ResetByScheduler`, `VerifiedBuild`) VALUES (0, 2, 0, 0, 0, 0, 0, 0, 5, 1.0, 5, 1.0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 1.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 890, 878, 0, 0, 18446744073709551615, 0, 0, 0, 'Quests', 'A complete searchable and filterable list of all Quests in World of Warcraft: The War Within. Always up to date with the latest patch (11.2.0).', '', NULL, NULL, NULL, NULL, NULL, '', 0, 42488);


-- ==========================================
-- Table: quest_template_addon
-- ==========================================
CREATE TABLE `quest_template_addon` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `AllowableClasses` int unsigned NOT NULL DEFAULT '0',
  `SourceSpellID` int unsigned NOT NULL DEFAULT '0',
  `PrevQuestID` int NOT NULL DEFAULT '0',
  `NextQuestID` int unsigned NOT NULL DEFAULT '0',
  `ExclusiveGroup` int NOT NULL DEFAULT '0',
  `BreadcrumbForQuestId` int NOT NULL DEFAULT '0',
  `RewardMailTemplateID` int unsigned NOT NULL DEFAULT '0',
  `RewardMailDelay` int unsigned NOT NULL DEFAULT '0',
  `RequiredSkillID` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredSkillPoints` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredMaxRepFaction` smallint unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepValue` int NOT NULL DEFAULT '0',
  `RequiredMaxRepValue` int NOT NULL DEFAULT '0',
  `ProvidedItemCount` tinyint unsigned NOT NULL DEFAULT '0',
  `SpecialFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `BreadcrumbForQuestId`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`, `ScriptName`) VALUES (1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartQuest');


-- ==========================================
-- Table: quest_template_locale
-- ==========================================
CREATE TABLE `quest_template_locale` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LogTitle` mediumtext COLLATE utf8mb4_unicode_ci,
  `LogDescription` mediumtext COLLATE utf8mb4_unicode_ci,
  `QuestDescription` mediumtext COLLATE utf8mb4_unicode_ci,
  `AreaDescription` mediumtext COLLATE utf8mb4_unicode_ci,
  `PortraitGiverText` mediumtext COLLATE utf8mb4_unicode_ci,
  `PortraitGiverName` mediumtext COLLATE utf8mb4_unicode_ci,
  `PortraitTurnInText` mediumtext COLLATE utf8mb4_unicode_ci,
  `PortraitTurnInName` mediumtext COLLATE utf8mb4_unicode_ci,
  `QuestCompletionLog` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_template_locale` (`ID`, `locale`, `LogTitle`, `LogDescription`, `QuestDescription`, `AreaDescription`, `PortraitGiverText`, `PortraitGiverName`, `PortraitTurnInText`, `PortraitTurnInName`, `QuestCompletionLog`, `VerifiedBuild`) VALUES (0, 'frFR', 'Chapitre 4 : Explorer l\'environnement - Les chemins de l\'inconnu.', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, 61559);


-- ==========================================
-- Table: quest_treasure_pickers
-- ==========================================
CREATE TABLE `quest_treasure_pickers` (
  `QuestID` int unsigned NOT NULL,
  `TreasurePickerID` int NOT NULL,
  `OrderIndex` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`QuestID`,`TreasurePickerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_treasure_pickers` (`QuestID`, `TreasurePickerID`, `OrderIndex`) VALUES (11997, 3711, 0);


-- ==========================================
-- Table: quest_visual_effect
-- ==========================================
CREATE TABLE `quest_visual_effect` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Index` tinyint unsigned NOT NULL DEFAULT '0',
  `VisualEffect` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `quest_visual_effect` (`ID`, `Index`, `VisualEffect`, `VerifiedBuild`) VALUES (251625, 0, 932, 63796);


-- ==========================================
-- Table: race_unlock_requirement
-- ==========================================
CREATE TABLE `race_unlock_requirement` (
  `raceID` tinyint unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint unsigned NOT NULL DEFAULT '0',
  `achievementId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`raceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `race_unlock_requirement` (`raceID`, `expansion`, `achievementId`) VALUES (1, 0, 0);


-- ==========================================
-- Table: reference_loot_template
-- ==========================================
CREATE TABLE `reference_loot_template` (
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

INSERT INTO `reference_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES (1000, 0, 21929, 16.0, 0, 1, 1, 1, 2, NULL);


-- ==========================================
-- Table: reputation_reward_rate
-- ==========================================
CREATE TABLE `reputation_reward_rate` (
  `faction` int unsigned NOT NULL DEFAULT '0',
  `quest_rate` float NOT NULL DEFAULT '1',
  `quest_daily_rate` float NOT NULL DEFAULT '1',
  `quest_weekly_rate` float NOT NULL DEFAULT '1',
  `quest_monthly_rate` float NOT NULL DEFAULT '1',
  `quest_repeatable_rate` float NOT NULL DEFAULT '1',
  `creature_rate` float NOT NULL DEFAULT '1',
  `spell_rate` float NOT NULL DEFAULT '1',
  PRIMARY KEY (`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `reputation_reward_rate` (`faction`, `quest_rate`, `quest_daily_rate`, `quest_weekly_rate`, `quest_monthly_rate`, `quest_repeatable_rate`, `creature_rate`, `spell_rate`) VALUES (529, 2.0, 1.0, 1.0, 1.0, 2.0, 1.0, 2.0);


-- ==========================================
-- Table: reputation_spillover_template
-- ==========================================
CREATE TABLE `reputation_spillover_template` (
  `faction` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction entry',
  `faction1` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'faction to give spillover for',
  `rate_1` float NOT NULL DEFAULT '0' COMMENT 'the given rep points * rate',
  `rank_1` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'max rank,above this will not give any spillover',
  `faction2` smallint unsigned NOT NULL DEFAULT '0',
  `rate_2` float NOT NULL DEFAULT '0',
  `rank_2` tinyint unsigned NOT NULL DEFAULT '0',
  `faction3` smallint unsigned NOT NULL DEFAULT '0',
  `rate_3` float NOT NULL DEFAULT '0',
  `rank_3` tinyint unsigned NOT NULL DEFAULT '0',
  `faction4` smallint unsigned NOT NULL DEFAULT '0',
  `rate_4` float NOT NULL DEFAULT '0',
  `rank_4` tinyint unsigned NOT NULL DEFAULT '0',
  `faction5` smallint unsigned NOT NULL DEFAULT '0',
  `rate_5` float NOT NULL DEFAULT '0',
  `rank_5` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Reputation spillover reputation gain';

INSERT INTO `reputation_spillover_template` (`faction`, `faction1`, `rate_1`, `rank_1`, `faction2`, `rate_2`, `rank_2`, `faction3`, `rate_3`, `rank_3`, `faction4`, `rate_4`, `rank_4`, `faction5`, `rate_5`, `rank_5`) VALUES (21, 369, 0.5, 7, 470, 0.5, 7, 577, 0.5, 7, 0, 0.0, 0, 0, 0.0, 0);


-- ==========================================
-- Table: scenario_poi
-- ==========================================
CREATE TABLE `scenario_poi` (
  `CriteriaTreeID` int NOT NULL DEFAULT '0',
  `BlobIndex` int NOT NULL DEFAULT '0',
  `Idx1` int NOT NULL DEFAULT '0',
  `MapID` int NOT NULL DEFAULT '0',
  `UiMapID` int NOT NULL DEFAULT '0',
  `Priority` int NOT NULL DEFAULT '0',
  `Flags` int NOT NULL DEFAULT '0',
  `WorldEffectID` int NOT NULL DEFAULT '0',
  `PlayerConditionID` int NOT NULL DEFAULT '0',
  `NavigationPlayerConditionID` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CriteriaTreeID`,`BlobIndex`,`Idx1`),
  KEY `idx` (`CriteriaTreeID`,`BlobIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `scenario_poi` (`CriteriaTreeID`, `BlobIndex`, `Idx1`, `MapID`, `UiMapID`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `NavigationPlayerConditionID`, `VerifiedBuild`) VALUES (1, 0, 1, 0, 0, 0, 1, 1536, 2333, 0, 47213);


-- ==========================================
-- Table: scenario_poi_points
-- ==========================================
CREATE TABLE `scenario_poi_points` (
  `CriteriaTreeID` int NOT NULL DEFAULT '0',
  `Idx1` int NOT NULL DEFAULT '0',
  `Idx2` int NOT NULL DEFAULT '0',
  `X` int NOT NULL DEFAULT '0',
  `Y` int NOT NULL DEFAULT '0',
  `Z` int NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`CriteriaTreeID`,`Idx1`,`Idx2`),
  KEY `questId_id` (`CriteriaTreeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `scenario_poi_points` (`CriteriaTreeID`, `Idx1`, `Idx2`, `X`, `Y`, `Z`, `VerifiedBuild`) VALUES (1, 1, 0, 95509, 1, 0, 47213);


-- ==========================================
-- Table: scenarios
-- ==========================================
CREATE TABLE `scenarios` (
  `map` int unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `scenario_A` int unsigned NOT NULL DEFAULT '0',
  `scenario_H` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`map`,`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `scenarios` (`map`, `difficulty`, `scenario_A`, `scenario_H`) VALUES (33, 1, 516, 516);


-- ==========================================
-- Table: scene_template
-- ==========================================
CREATE TABLE `scene_template` (
  `SceneId` int unsigned NOT NULL,
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `ScriptPackageID` int unsigned NOT NULL DEFAULT '0',
  `Encrypted` tinyint unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`SceneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `scene_template` (`SceneId`, `Flags`, `ScriptPackageID`, `Encrypted`, `ScriptName`) VALUES (35, 25, 186, 0, '');


-- ==========================================
-- Table: scrapping_loot_template
-- ==========================================
CREATE TABLE `scrapping_loot_template` (
  `Entry` mediumint unsigned NOT NULL DEFAULT '0',
  `ItemType` tinyint NOT NULL DEFAULT '0',
  `Item` mediumint NOT NULL DEFAULT '0',
  `Reference` mediumint unsigned NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '100',
  `QuestRequired` tinyint(1) NOT NULL DEFAULT '0',
  `LootMode` smallint unsigned NOT NULL DEFAULT '1',
  `GroupId` tinyint unsigned NOT NULL DEFAULT '0',
  `MinCount` int unsigned NOT NULL DEFAULT '1',
  `MaxCount` int unsigned NOT NULL DEFAULT '1',
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Entry`,`Item`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Loot System';

INSERT INTO `scrapping_loot_template` (`Entry`, `ItemType`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES (1, 0, 160266, 0, 100.0, 0, 1, 0, 1, 1, NULL);


-- ==========================================
-- Table: script_spline_chain_meta
-- ==========================================
CREATE TABLE `script_spline_chain_meta` (
  `entry` int unsigned NOT NULL,
  `chainId` smallint unsigned NOT NULL,
  `splineId` tinyint unsigned NOT NULL,
  `expectedDuration` int unsigned NOT NULL,
  `msUntilNext` int unsigned NOT NULL,
  `velocity` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`chainId`,`splineId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `script_spline_chain_meta` (`entry`, `chainId`, `splineId`, `expectedDuration`, `msUntilNext`, `velocity`) VALUES (17225, 1, 0, 3689, 0, 0.0);


-- ==========================================
-- Table: script_spline_chain_waypoints
-- ==========================================
CREATE TABLE `script_spline_chain_waypoints` (
  `entry` int unsigned NOT NULL,
  `chainId` smallint unsigned NOT NULL,
  `splineId` tinyint unsigned NOT NULL,
  `wpId` tinyint unsigned NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  PRIMARY KEY (`entry`,`chainId`,`splineId`,`wpId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `script_spline_chain_waypoints` (`entry`, `chainId`, `splineId`, `wpId`, `x`, `y`, `z`) VALUES (17225, 1, 0, 0, -11003.7, -1760.19, 140.253);


-- ==========================================
-- Table: serverside_spell
-- ==========================================
CREATE TABLE `serverside_spell` (
  `Id` int unsigned NOT NULL,
  `DifficultyID` int NOT NULL DEFAULT '0',
  `CategoryId` int unsigned NOT NULL DEFAULT '0',
  `Dispel` int unsigned NOT NULL DEFAULT '0',
  `Mechanic` int unsigned NOT NULL DEFAULT '0',
  `Attributes` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx2` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx3` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx4` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx5` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx6` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx7` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx8` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx9` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx10` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx11` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx12` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx13` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx14` int unsigned NOT NULL DEFAULT '0',
  `AttributesEx15` int unsigned NOT NULL DEFAULT '0',
  `Stances` bigint unsigned NOT NULL DEFAULT '0',
  `StancesNot` bigint unsigned NOT NULL DEFAULT '0',
  `Targets` int unsigned NOT NULL DEFAULT '0',
  `TargetCreatureType` int unsigned NOT NULL DEFAULT '0',
  `RequiresSpellFocus` int unsigned NOT NULL DEFAULT '0',
  `FacingCasterFlags` int unsigned NOT NULL DEFAULT '0',
  `CasterAuraState` int unsigned NOT NULL DEFAULT '0',
  `TargetAuraState` int unsigned NOT NULL DEFAULT '0',
  `ExcludeCasterAuraState` int unsigned NOT NULL DEFAULT '0',
  `ExcludeTargetAuraState` int unsigned NOT NULL DEFAULT '0',
  `CasterAuraSpell` int unsigned NOT NULL DEFAULT '0',
  `TargetAuraSpell` int unsigned NOT NULL DEFAULT '0',
  `ExcludeCasterAuraSpell` int unsigned NOT NULL DEFAULT '0',
  `ExcludeTargetAuraSpell` int unsigned NOT NULL DEFAULT '0',
  `CasterAuraType` int NOT NULL DEFAULT '0',
  `TargetAuraType` int NOT NULL DEFAULT '0',
  `ExcludeCasterAuraType` int NOT NULL DEFAULT '0',
  `ExcludeTargetAuraType` int NOT NULL DEFAULT '0',
  `CastingTimeIndex` int unsigned NOT NULL DEFAULT '1',
  `RecoveryTime` int unsigned NOT NULL DEFAULT '0',
  `CategoryRecoveryTime` int unsigned NOT NULL DEFAULT '0',
  `StartRecoveryCategory` int unsigned NOT NULL DEFAULT '0',
  `StartRecoveryTime` int unsigned NOT NULL DEFAULT '0',
  `InterruptFlags` int unsigned NOT NULL DEFAULT '0',
  `AuraInterruptFlags1` int unsigned NOT NULL DEFAULT '0',
  `AuraInterruptFlags2` int unsigned NOT NULL DEFAULT '0',
  `ChannelInterruptFlags1` int unsigned NOT NULL DEFAULT '0',
  `ChannelInterruptFlags2` int unsigned NOT NULL DEFAULT '0',
  `ProcFlags` int unsigned NOT NULL DEFAULT '0',
  `ProcFlags2` int unsigned NOT NULL DEFAULT '0',
  `ProcChance` int unsigned NOT NULL DEFAULT '0',
  `ProcCharges` int unsigned NOT NULL DEFAULT '0',
  `ProcCooldown` int unsigned NOT NULL DEFAULT '0',
  `ProcBasePPM` float NOT NULL DEFAULT '0',
  `MaxLevel` int unsigned NOT NULL DEFAULT '0',
  `BaseLevel` int unsigned NOT NULL DEFAULT '0',
  `SpellLevel` int unsigned NOT NULL DEFAULT '0',
  `DurationIndex` int unsigned NOT NULL DEFAULT '0',
  `RangeIndex` int unsigned NOT NULL DEFAULT '1',
  `Speed` float NOT NULL DEFAULT '0',
  `LaunchDelay` float NOT NULL DEFAULT '0',
  `StackAmount` int unsigned NOT NULL DEFAULT '0',
  `EquippedItemClass` int NOT NULL DEFAULT '-1',
  `EquippedItemSubClassMask` int NOT NULL DEFAULT '0',
  `EquippedItemInventoryTypeMask` int NOT NULL DEFAULT '0',
  `ContentTuningId` int unsigned NOT NULL DEFAULT '0',
  `SpellName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ConeAngle` float NOT NULL DEFAULT '0',
  `ConeWidth` float NOT NULL DEFAULT '0',
  `MaxTargetLevel` int unsigned NOT NULL DEFAULT '0',
  `MaxAffectedTargets` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags1` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags2` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags3` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags4` int unsigned NOT NULL DEFAULT '0',
  `DmgClass` int unsigned NOT NULL DEFAULT '0',
  `PreventionType` int unsigned NOT NULL DEFAULT '0',
  `AreaGroupId` int NOT NULL DEFAULT '0',
  `SchoolMask` int unsigned NOT NULL DEFAULT '0',
  `ChargeCategoryId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`,`DifficultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `serverside_spell` (`Id`, `DifficultyID`, `CategoryId`, `Dispel`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `AttributesEx8`, `AttributesEx9`, `AttributesEx10`, `AttributesEx11`, `AttributesEx12`, `AttributesEx13`, `AttributesEx14`, `AttributesEx15`, `Stances`, `StancesNot`, `Targets`, `TargetCreatureType`, `RequiresSpellFocus`, `FacingCasterFlags`, `CasterAuraState`, `TargetAuraState`, `ExcludeCasterAuraState`, `ExcludeTargetAuraState`, `CasterAuraSpell`, `TargetAuraSpell`, `ExcludeCasterAuraSpell`, `ExcludeTargetAuraSpell`, `CasterAuraType`, `TargetAuraType`, `ExcludeCasterAuraType`, `ExcludeTargetAuraType`, `CastingTimeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `StartRecoveryCategory`, `StartRecoveryTime`, `InterruptFlags`, `AuraInterruptFlags1`, `AuraInterruptFlags2`, `ChannelInterruptFlags1`, `ChannelInterruptFlags2`, `ProcFlags`, `ProcFlags2`, `ProcChance`, `ProcCharges`, `ProcCooldown`, `ProcBasePPM`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `RangeIndex`, `Speed`, `LaunchDelay`, `StackAmount`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `ContentTuningId`, `SpellName`, `ConeAngle`, `ConeWidth`, `MaxTargetLevel`, `MaxAffectedTargets`, `SpellFamilyName`, `SpellFamilyFlags1`, `SpellFamilyFlags2`, `SpellFamilyFlags3`, `SpellFamilyFlags4`, `DmgClass`, `PreventionType`, `AreaGroupId`, `SchoolMask`, `ChargeCategoryId`) VALUES (19, 0, 0, 0, 0, 208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 101, 0, 0, 0.0, 0, 0, 0, 21, 1, 0.0, 0.0, 0, 2, 384, 0, 0, 'SWORDSPECIAL (DND)', 0.0, 0.0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);


-- ==========================================
-- Table: serverside_spell_effect
-- ==========================================
CREATE TABLE `serverside_spell_effect` (
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `EffectIndex` int NOT NULL DEFAULT '0',
  `DifficultyID` int NOT NULL DEFAULT '0',
  `Effect` int NOT NULL DEFAULT '0',
  `EffectAura` smallint NOT NULL DEFAULT '0',
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
  PRIMARY KEY (`SpellID`,`EffectIndex`,`DifficultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `serverside_spell_effect` (`SpellID`, `EffectIndex`, `DifficultyID`, `Effect`, `EffectAura`, `EffectAmplitude`, `EffectAttributes`, `EffectAuraPeriod`, `EffectBonusCoefficient`, `EffectChainAmplitude`, `EffectChainTargets`, `EffectItemType`, `EffectMechanic`, `EffectPointsPerResource`, `EffectPosFacing`, `EffectRealPointsPerLevel`, `EffectTriggerSpell`, `BonusCoefficientFromAP`, `PvpMultiplier`, `Coefficient`, `Variance`, `ResourceCoefficient`, `GroupSizeBasePointsCoefficient`, `EffectBasePoints`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectSpellClassMask1`, `EffectSpellClassMask2`, `EffectSpellClassMask3`, `EffectSpellClassMask4`, `ImplicitTarget1`, `ImplicitTarget2`) VALUES (19, 0, 0, 6, 52, 1.0, 0, 0, 0.0, 1.0, 0, 0, 0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);


-- ==========================================
-- Table: skill_discovery_template
-- ==========================================
CREATE TABLE `skill_discovery_template` (
  `spellId` int unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the discoverable spell',
  `reqSpell` int unsigned NOT NULL DEFAULT '0' COMMENT 'spell requirement',
  `reqSkillValue` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'skill points requirement',
  `chance` float NOT NULL DEFAULT '0' COMMENT 'chance to discover',
  PRIMARY KEY (`spellId`,`reqSpell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Skill Discovery System';

INSERT INTO `skill_discovery_template` (`spellId`, `reqSpell`, `reqSkillValue`, `chance`) VALUES (28580, 0, 0, 0.1);


-- ==========================================
-- Table: skill_extra_item_template
-- ==========================================
CREATE TABLE `skill_extra_item_template` (
  `spellId` int unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` int unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `additionalCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create add',
  `additionalMaxNum` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'max num of adds',
  PRIMARY KEY (`spellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Skill Specialization System';

INSERT INTO `skill_extra_item_template` (`spellId`, `requiredSpecialization`, `additionalCreateChance`, `additionalMaxNum`) VALUES (2329, 28677, 14.0, 4);


-- ==========================================
-- Table: skill_fishing_base_level
-- ==========================================
CREATE TABLE `skill_fishing_base_level` (
  `entry` int unsigned NOT NULL DEFAULT '0' COMMENT 'Area identifier',
  `skill` smallint NOT NULL DEFAULT '0' COMMENT 'Base skill level requirement',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Fishing system';

INSERT INTO `skill_fishing_base_level` (`entry`, `skill`) VALUES (1, -70);


-- ==========================================
-- Table: skill_perfect_item_template
-- ==========================================
CREATE TABLE `skill_perfect_item_template` (
  `spellId` int unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` int unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `perfectCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create the perfect item instead',
  `perfectItemType` int unsigned NOT NULL DEFAULT '0' COMMENT 'perfect item type to create instead',
  PRIMARY KEY (`spellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Crafting Perfection System';

INSERT INTO `skill_perfect_item_template` (`spellId`, `requiredSpecialization`, `perfectCreateChance`, `perfectItemType`) VALUES (53831, 55534, 20.0, 41432);


-- ==========================================
-- Table: skill_tiers
-- ==========================================
CREATE TABLE `skill_tiers` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `Value1` int unsigned NOT NULL DEFAULT '0',
  `Value2` int unsigned NOT NULL DEFAULT '0',
  `Value3` int unsigned NOT NULL DEFAULT '0',
  `Value4` int unsigned NOT NULL DEFAULT '0',
  `Value5` int unsigned NOT NULL DEFAULT '0',
  `Value6` int unsigned NOT NULL DEFAULT '0',
  `Value7` int unsigned NOT NULL DEFAULT '0',
  `Value8` int unsigned NOT NULL DEFAULT '0',
  `Value9` int unsigned NOT NULL DEFAULT '0',
  `Value10` int unsigned NOT NULL DEFAULT '0',
  `Value11` int unsigned NOT NULL DEFAULT '0',
  `Value12` int unsigned NOT NULL DEFAULT '0',
  `Value13` int unsigned NOT NULL DEFAULT '0',
  `Value14` int unsigned NOT NULL DEFAULT '0',
  `Value15` int unsigned NOT NULL DEFAULT '0',
  `Value16` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `skill_tiers` (`ID`, `Value1`, `Value2`, `Value3`, `Value4`, `Value5`, `Value6`, `Value7`, `Value8`, `Value9`, `Value10`, `Value11`, `Value12`, `Value13`, `Value14`, `Value15`, `Value16`) VALUES (2, 75, 150, 225, 300, 375, 450, 525, 600, 700, 800, 900, 1000, 0, 0, 0, 0);


-- ==========================================
-- Table: skinning_loot_template
-- ==========================================
CREATE TABLE `skinning_loot_template` (
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

INSERT INTO `skinning_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES (113, 0, 2318, 39.2962, 0, 1, 1, 1, 1, NULL);


-- ==========================================
-- Table: smart_scripts
-- ==========================================
CREATE TABLE `smart_scripts` (
  `entryorguid` bigint NOT NULL DEFAULT '0',
  `source_type` tinyint unsigned NOT NULL DEFAULT '0',
  `id` smallint unsigned NOT NULL DEFAULT '0',
  `link` smallint unsigned NOT NULL DEFAULT '0',
  `Difficulties` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `event_type` tinyint unsigned NOT NULL DEFAULT '0',
  `event_phase_mask` smallint unsigned NOT NULL DEFAULT '0',
  `event_chance` tinyint unsigned NOT NULL DEFAULT '100',
  `event_flags` smallint unsigned NOT NULL DEFAULT '0',
  `event_param1` int unsigned NOT NULL DEFAULT '0',
  `event_param2` int unsigned NOT NULL DEFAULT '0',
  `event_param3` int unsigned NOT NULL DEFAULT '0',
  `event_param4` int unsigned NOT NULL DEFAULT '0',
  `event_param5` int unsigned NOT NULL DEFAULT '0',
  `event_param_string` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `action_type` tinyint unsigned NOT NULL DEFAULT '0',
  `action_param1` int unsigned NOT NULL DEFAULT '0',
  `action_param2` int unsigned NOT NULL DEFAULT '0',
  `action_param3` int unsigned NOT NULL DEFAULT '0',
  `action_param4` int unsigned NOT NULL DEFAULT '0',
  `action_param5` int unsigned NOT NULL DEFAULT '0',
  `action_param7` int unsigned NOT NULL DEFAULT '0',
  `action_param_string` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_param6` int unsigned NOT NULL DEFAULT '0',
  `target_type` tinyint unsigned NOT NULL DEFAULT '0',
  `target_param1` int NOT NULL DEFAULT '0',
  `target_param2` int unsigned NOT NULL DEFAULT '0',
  `target_param3` int unsigned NOT NULL DEFAULT '0',
  `target_param4` int unsigned NOT NULL DEFAULT '0',
  `target_param_string` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_x` float NOT NULL DEFAULT '0',
  `target_y` float NOT NULL DEFAULT '0',
  `target_z` float NOT NULL DEFAULT '0',
  `target_o` float NOT NULL DEFAULT '0',
  `comment` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Event Comment',
  PRIMARY KEY (`entryorguid`,`source_type`,`id`,`link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `Difficulties`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `event_param_string`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param7`, `action_param_string`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_param_string`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (-4000000000141091, 0, 0, 0, '', 25, 0, 100, 1, 0, 0, 0, 0, 0, '', 11, 39550, 0, 0, 0, 0, 0, NULL, 0, 1, 0, 0, 0, 0, NULL, 0.0, 0.0, 0.0, 0.0, 'Nightborne Animator - After Combat, On Respawn or Spawn - Cast spell \"Arcane Channeling\" - to self');


-- ==========================================
-- Table: spawn_group
-- ==========================================
CREATE TABLE `spawn_group` (
  `groupId` int unsigned NOT NULL,
  `spawnType` tinyint unsigned NOT NULL,
  `spawnId` bigint unsigned NOT NULL,
  PRIMARY KEY (`groupId`,`spawnType`,`spawnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spawn_group` (`groupId`, `spawnType`, `spawnId`) VALUES (1, 1, 150);


-- ==========================================
-- Table: spawn_group_template
-- ==========================================
CREATE TABLE `spawn_group_template` (
  `groupId` int unsigned NOT NULL,
  `groupName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupFlags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spawn_group_template` (`groupId`, `groupName`, `groupFlags`) VALUES (0, 'Default Group', 1);


-- ==========================================
-- Table: spawn_tracking
-- ==========================================
CREATE TABLE `spawn_tracking` (
  `SpawnTrackingId` int unsigned NOT NULL,
  `SpawnType` tinyint unsigned NOT NULL,
  `SpawnId` bigint unsigned NOT NULL,
  `QuestObjectiveIds` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`SpawnTrackingId`,`SpawnType`,`SpawnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spawn_tracking` (`SpawnTrackingId`, `SpawnType`, `SpawnId`, `QuestObjectiveIds`) VALUES (1362549, 0, 7003647, '292396');


-- ==========================================
-- Table: spawn_tracking_quest_objective
-- ==========================================
CREATE TABLE `spawn_tracking_quest_objective` (
  `SpawnTrackingId` int unsigned NOT NULL,
  `QuestObjectiveId` int unsigned NOT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpawnTrackingId`,`QuestObjectiveId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spawn_tracking_quest_objective` (`SpawnTrackingId`, `QuestObjectiveId`, `VerifiedBuild`) VALUES (13135, 431994, 54630);


-- ==========================================
-- Table: spawn_tracking_state
-- ==========================================
CREATE TABLE `spawn_tracking_state` (
  `SpawnType` tinyint unsigned NOT NULL,
  `SpawnId` bigint unsigned NOT NULL,
  `State` tinyint unsigned NOT NULL DEFAULT '0',
  `Visible` tinyint unsigned NOT NULL DEFAULT '1',
  `StateSpellVisualId` int unsigned DEFAULT NULL,
  `StateAnimId` smallint unsigned DEFAULT NULL,
  `StateAnimKitId` smallint unsigned DEFAULT NULL,
  `StateWorldEffects` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`SpawnType`,`SpawnId`,`State`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spawn_tracking_state` (`SpawnType`, `SpawnId`, `State`, `Visible`, `StateSpellVisualId`, `StateAnimId`, `StateAnimKitId`, `StateWorldEffects`) VALUES (0, 7003643, 0, 1, NULL, NULL, NULL, NULL);


-- ==========================================
-- Table: spawn_tracking_template
-- ==========================================
CREATE TABLE `spawn_tracking_template` (
  `SpawnTrackingId` int unsigned NOT NULL,
  `MapId` smallint unsigned NOT NULL DEFAULT '0',
  `PhaseId` int NOT NULL DEFAULT '0',
  `PhaseGroup` int NOT NULL DEFAULT '0',
  `PhaseUseFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpawnTrackingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spawn_tracking_template` (`SpawnTrackingId`, `MapId`, `PhaseId`, `PhaseGroup`, `PhaseUseFlags`, `VerifiedBuild`) VALUES (11763, 0, 0, 0, 0, 60822);


-- ==========================================
-- Table: spell_area
-- ==========================================
CREATE TABLE `spell_area` (
  `spell` int unsigned NOT NULL DEFAULT '0',
  `area` int unsigned NOT NULL DEFAULT '0',
  `quest_start` int unsigned NOT NULL DEFAULT '0',
  `quest_end` int unsigned NOT NULL DEFAULT '0',
  `aura_spell` int NOT NULL DEFAULT '0',
  `racemask` bigint unsigned NOT NULL DEFAULT '0',
  `gender` tinyint unsigned NOT NULL DEFAULT '2',
  `flags` tinyint unsigned NOT NULL DEFAULT '3',
  `quest_start_status` int NOT NULL DEFAULT '64',
  `quest_end_status` int NOT NULL DEFAULT '11',
  PRIMARY KEY (`spell`,`area`,`quest_start`,`aura_spell`,`racemask`,`gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`) VALUES (27105, 4492, 0, 12951, 0, 0, 2, 3, 64, 11);


-- ==========================================
-- Table: spell_custom_attr
-- ==========================================
CREATE TABLE `spell_custom_attr` (
  `entry` int unsigned NOT NULL DEFAULT '0' COMMENT 'spell id',
  `attributes` int unsigned NOT NULL DEFAULT '0' COMMENT 'SpellCustomAttributes',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='SpellInfo custom attributes';

INSERT INTO `spell_custom_attr` (`entry`, `attributes`) VALUES (1066, 16777216);


-- ==========================================
-- Table: spell_enchant_proc_data
-- ==========================================
CREATE TABLE `spell_enchant_proc_data` (
  `EnchantID` int unsigned NOT NULL,
  `Chance` float NOT NULL DEFAULT '0',
  `ProcsPerMinute` float NOT NULL DEFAULT '0',
  `HitMask` int unsigned NOT NULL DEFAULT '0',
  `AttributesMask` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`EnchantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Spell enchant proc data';

INSERT INTO `spell_enchant_proc_data` (`EnchantID`, `Chance`, `ProcsPerMinute`, `HitMask`, `AttributesMask`) VALUES (803, 0.0, 6.0, 0, 0);


-- ==========================================
-- Table: spell_group
-- ==========================================
CREATE TABLE `spell_group` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `spell_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`spell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Spell System';

INSERT INTO `spell_group` (`id`, `spell_id`) VALUES (1, 2367);


-- ==========================================
-- Table: spell_group_stack_rules
-- ==========================================
CREATE TABLE `spell_group_stack_rules` (
  `group_id` int unsigned NOT NULL DEFAULT '0',
  `stack_rule` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES (1, 1);


-- ==========================================
-- Table: spell_learn_spell
-- ==========================================
CREATE TABLE `spell_learn_spell` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `SpellID` int unsigned NOT NULL DEFAULT '0',
  `Active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`entry`,`SpellID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Item System';

INSERT INTO `spell_learn_spell` (`entry`, `SpellID`, `Active`) VALUES (33943, 34090, 1);


-- ==========================================
-- Table: spell_linked_spell
-- ==========================================
CREATE TABLE `spell_linked_spell` (
  `spell_trigger` int NOT NULL,
  `spell_effect` int NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `comment` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `trigger_effect_type` (`spell_trigger`,`spell_effect`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Spell System';

INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (-326626, 321340, 0, 'Removing aura Gor\'groth Scene (DNT) cast Scout-o-Matic Ping (DNT) on player');


-- ==========================================
-- Table: spell_loot_template
-- ==========================================
CREATE TABLE `spell_loot_template` (
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

INSERT INTO `spell_loot_template` (`Entry`, `ItemType`, `Item`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES (48247, 0, 37168, 100.0, 0, 1, 0, 1, 1, NULL);


-- ==========================================
-- Table: spell_pet_auras
-- ==========================================
CREATE TABLE `spell_pet_auras` (
  `spell` int unsigned NOT NULL COMMENT 'dummy spell id',
  `effectId` tinyint unsigned NOT NULL DEFAULT '0',
  `pet` int unsigned NOT NULL DEFAULT '0' COMMENT 'pet id; 0 = all',
  `aura` int unsigned NOT NULL COMMENT 'pet aura id',
  PRIMARY KEY (`spell`,`effectId`,`pet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_pet_auras` (`spell`, `effectId`, `pet`, `aura`) VALUES (20895, 0, 0, 24529);


-- ==========================================
-- Table: spell_proc
-- ==========================================
CREATE TABLE `spell_proc` (
  `SpellId` int NOT NULL DEFAULT '0',
  `SchoolMask` tinyint unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` smallint unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask0` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask1` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask2` int unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask3` int unsigned NOT NULL DEFAULT '0',
  `ProcFlags` int unsigned NOT NULL DEFAULT '0',
  `ProcFlags2` int unsigned NOT NULL DEFAULT '0',
  `SpellTypeMask` int unsigned NOT NULL DEFAULT '0',
  `SpellPhaseMask` int unsigned NOT NULL DEFAULT '0',
  `HitMask` int unsigned NOT NULL DEFAULT '0',
  `AttributesMask` int unsigned NOT NULL DEFAULT '0',
  `DisableEffectsMask` int unsigned NOT NULL DEFAULT '0',
  `ProcsPerMinute` float NOT NULL DEFAULT '0',
  `Chance` float NOT NULL DEFAULT '0',
  `Cooldown` int unsigned NOT NULL DEFAULT '0',
  `Charges` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_proc` (`SpellId`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `SpellFamilyMask3`, `ProcFlags`, `ProcFlags2`, `SpellTypeMask`, `SpellPhaseMask`, `HitMask`, `AttributesMask`, `DisableEffectsMask`, `ProcsPerMinute`, `Chance`, `Cooldown`, `Charges`) VALUES (4341, 0, 0, 0, 0, 0, 0, 4096, 0, 1, 1, 0, 0, 0, 0.0, 0.0, 0, 0);


-- ==========================================
-- Table: spell_required
-- ==========================================
CREATE TABLE `spell_required` (
  `spell_id` int NOT NULL DEFAULT '0',
  `req_spell` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell_id`,`req_spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Spell Additinal Data';

INSERT INTO `spell_required` (`spell_id`, `req_spell`) VALUES (9788, 9785);


-- ==========================================
-- Table: spell_script_names
-- ==========================================
CREATE TABLE `spell_script_names` (
  `spell_id` int NOT NULL,
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `spell_id` (`spell_id`,`ScriptName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (-85113, 'spell_warl_aftermath');


-- ==========================================
-- Table: spell_scripts
-- ==========================================
CREATE TABLE `spell_scripts` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `effIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `delay` int unsigned NOT NULL DEFAULT '0',
  `command` int unsigned NOT NULL DEFAULT '0',
  `datalong` int unsigned NOT NULL DEFAULT '0',
  `datalong2` int unsigned NOT NULL DEFAULT '0',
  `dataint` int NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `Comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `Comment`) VALUES (54620, 0, 0, 6, 571, 0, 0, 5807.75, 588.063, 660.939, 1.64659, '');


-- ==========================================
-- Table: spell_target_position
-- ==========================================
CREATE TABLE `spell_target_position` (
  `ID` int unsigned NOT NULL DEFAULT '0',
  `EffectIndex` tinyint unsigned NOT NULL DEFAULT '0',
  `OrderIndex` int NOT NULL DEFAULT '0',
  `MapID` smallint unsigned NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `PositionZ` float NOT NULL DEFAULT '0',
  `Orientation` float DEFAULT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`EffectIndex`,`OrderIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Spell System';

INSERT INTO `spell_target_position` (`ID`, `EffectIndex`, `OrderIndex`, `MapID`, `PositionX`, `PositionY`, `PositionZ`, `Orientation`, `VerifiedBuild`) VALUES (31, 0, 0, 0, -9464.0, 62.0, 56.0, NULL, 0);


-- ==========================================
-- Table: spell_threat
-- ==========================================
CREATE TABLE `spell_threat` (
  `entry` int unsigned NOT NULL,
  `flatMod` int DEFAULT NULL,
  `pctMod` float NOT NULL DEFAULT '1' COMMENT 'threat multiplier for damage/healing',
  `apPctMod` float NOT NULL DEFAULT '0' COMMENT 'additional threat bonus from attack power',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_threat` (`entry`, `flatMod`, `pctMod`, `apPctMod`) VALUES (498, 0, 0.0, 0.0);


-- ==========================================
-- Table: spell_totem_model
-- ==========================================
CREATE TABLE `spell_totem_model` (
  `SpellID` int unsigned NOT NULL,
  `RaceID` tinyint unsigned NOT NULL,
  `DisplayID` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`SpellID`,`RaceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `spell_totem_model` (`SpellID`, `RaceID`, `DisplayID`) VALUES (2484, 2, 30757);


-- ==========================================
-- Table: terrain_swap_defaults
-- ==========================================
CREATE TABLE `terrain_swap_defaults` (
  `MapId` int unsigned NOT NULL,
  `TerrainSwapMap` int unsigned NOT NULL,
  `Comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MapId`,`TerrainSwapMap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `terrain_swap_defaults` (`MapId`, `TerrainSwapMap`, `Comment`) VALUES (0, 736, 'Twilight Highlands - Dragonmaw Port');


-- ==========================================
-- Table: terrain_worldmap
-- ==========================================
CREATE TABLE `terrain_worldmap` (
  `TerrainSwapMap` int unsigned NOT NULL,
  `UiMapPhaseId` int unsigned NOT NULL,
  `Comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`TerrainSwapMap`,`UiMapPhaseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `terrain_worldmap` (`TerrainSwapMap`, `UiMapPhaseId`, `Comment`) VALUES (655, 52, 'Gilneas_terrain1');


-- ==========================================
-- Table: trainer
-- ==========================================
CREATE TABLE `trainer` (
  `Id` int unsigned NOT NULL DEFAULT '0',
  `Type` tinyint unsigned NOT NULL DEFAULT '2',
  `Greeting` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `trainer` (`Id`, `Type`, `Greeting`, `VerifiedBuild`) VALUES (1, 2, 'Greetings! Can I teach you Blacksmithing?', 0);


-- ==========================================
-- Table: trainer_locale
-- ==========================================
CREATE TABLE `trainer_locale` (
  `Id` int unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Greeting_lang` mediumtext COLLATE utf8mb4_unicode_ci,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `trainer_locale` (`Id`, `locale`, `Greeting_lang`, `VerifiedBuild`) VALUES (580, 'deDE', 'Kein Gruß.', 41079);


-- ==========================================
-- Table: trainer_spell
-- ==========================================
CREATE TABLE `trainer_spell` (
  `TrainerId` int unsigned NOT NULL DEFAULT '0',
  `SpellId` int unsigned NOT NULL DEFAULT '0',
  `MoneyCost` int unsigned NOT NULL DEFAULT '0',
  `ReqSkillLine` int unsigned NOT NULL DEFAULT '0',
  `ReqSkillRank` int unsigned NOT NULL DEFAULT '0',
  `ReqAbility1` int unsigned NOT NULL DEFAULT '0',
  `ReqAbility2` int unsigned NOT NULL DEFAULT '0',
  `ReqAbility3` int unsigned NOT NULL DEFAULT '0',
  `ReqLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`TrainerId`,`SpellId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`, `VerifiedBuild`) VALUES (1, 2018, 10, 0, 0, 0, 0, 0, 0, 0);


-- ==========================================
-- Table: transports
-- ==========================================
CREATE TABLE `transports` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `entry` int unsigned NOT NULL DEFAULT '0',
  `name` mediumtext COLLATE utf8mb4_unicode_ci,
  `phaseUseFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `phaseid` int NOT NULL DEFAULT '0',
  `phasegroup` int NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `idx_entry` (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Transports';

INSERT INTO `transports` (`guid`, `entry`, `name`, `phaseUseFlags`, `phaseid`, `phasegroup`, `ScriptName`) VALUES (4, 176231, 'Menethil Harbor, Wetlands and Theramore Isle, Dustwallow Marsh (\"The Lady Mehley\")', 0, 0, 0, '');


-- ==========================================
-- Table: trinity_string
-- ==========================================
CREATE TABLE `trinity_string` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `content_default` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_loc1` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_loc2` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_loc3` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_loc4` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_loc5` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_loc6` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_loc7` mediumtext COLLATE utf8mb4_unicode_ci,
  `content_loc8` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (1, 'You should select a character or a creature.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


-- ==========================================
-- Table: ui_map_quest
-- ==========================================
CREATE TABLE `ui_map_quest` (
  `UiMapId` int unsigned NOT NULL,
  `QuestId` int unsigned NOT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`UiMapId`,`QuestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ui_map_quest` (`UiMapId`, `QuestId`, `VerifiedBuild`) VALUES (371, 30134, 56461);


-- ==========================================
-- Table: ui_map_quest_line
-- ==========================================
CREATE TABLE `ui_map_quest_line` (
  `UiMapId` int unsigned NOT NULL,
  `QuestLineId` int unsigned NOT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`UiMapId`,`QuestLineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ui_map_quest_line` (`UiMapId`, `QuestLineId`, `VerifiedBuild`) VALUES (1, 130, 56461);


-- ==========================================
-- Table: ui_map_quest_lines
-- ==========================================
CREATE TABLE `ui_map_quest_lines` (
  `UiMapId` int unsigned NOT NULL,
  `QuestLineId` int unsigned NOT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`UiMapId`,`QuestLineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ui_map_quest_lines` (`UiMapId`, `QuestLineId`, `VerifiedBuild`) VALUES (1, 130, 54988);


-- ==========================================
-- Table: ui_map_quests
-- ==========================================
CREATE TABLE `ui_map_quests` (
  `UiMapId` int unsigned NOT NULL,
  `QuestId` int unsigned NOT NULL,
  `VerifiedBuild` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`UiMapId`,`QuestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ui_map_quests` (`UiMapId`, `QuestId`, `VerifiedBuild`) VALUES (371, 30134, 54988);


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

INSERT INTO `updates` (`name`, `hash`, `state`, `timestamp`, `speed`) VALUES ('2014_10_19_00_world.sql', 'C9D12A22A30EAA0E602D5DEF7E72BF2F18BC8546', 'ARCHIVED', '2015-03-21 17:53:46', 0);


-- ==========================================
-- Table: updates_include
-- ==========================================
CREATE TABLE `updates_include` (
  `path` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'directory to include. $ means relative to the source directory.',
  `state` enum('RELEASED','ARCHIVED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RELEASED' COMMENT 'defines if the directory contains released or archived updates.',
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='List of directories where we want to include sql updates.';

INSERT INTO `updates_include` (`path`, `state`) VALUES ('$/sql/custom/world', 'RELEASED');


-- ==========================================
-- Table: vehicle_accessory
-- ==========================================
CREATE TABLE `vehicle_accessory` (
  `guid` bigint unsigned NOT NULL DEFAULT '0',
  `accessory_entry` int unsigned NOT NULL DEFAULT '0',
  `seat_id` tinyint NOT NULL DEFAULT '0',
  `minion` tinyint unsigned NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `summontype` tinyint unsigned NOT NULL DEFAULT '6' COMMENT 'see enum TempSummonType',
  `summontimer` int unsigned NOT NULL DEFAULT '30000' COMMENT 'timer, only relevant for certain summontypes',
  `RideSpellID` int DEFAULT NULL,
  PRIMARY KEY (`guid`,`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- (Table vehicle_accessory is empty)


-- ==========================================
-- Table: vehicle_seat_addon
-- ==========================================
CREATE TABLE `vehicle_seat_addon` (
  `SeatEntry` int unsigned NOT NULL COMMENT 'VehicleSeatEntry.dbc identifier',
  `SeatOrientation` float DEFAULT '0' COMMENT 'Seat Orientation override value',
  `ExitParamX` float DEFAULT '0',
  `ExitParamY` float DEFAULT '0',
  `ExitParamZ` float DEFAULT '0',
  `ExitParamO` float DEFAULT '0',
  `ExitParamValue` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`SeatEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `vehicle_seat_addon` (`SeatEntry`, `SeatOrientation`, `ExitParamX`, `ExitParamY`, `ExitParamZ`, `ExitParamO`, `ExitParamValue`) VALUES (861, 0.0, -2.0, 2.0, 0.0, 0.0, 1);


-- ==========================================
-- Table: vehicle_template
-- ==========================================
CREATE TABLE `vehicle_template` (
  `creatureId` int unsigned NOT NULL,
  `despawnDelayMs` int NOT NULL DEFAULT '0',
  `Pitch` float DEFAULT NULL,
  `CustomFlags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creatureId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `vehicle_template` (`creatureId`, `despawnDelayMs`, `Pitch`, `CustomFlags`) VALUES (170715, 800, NULL, 0);


-- ==========================================
-- Table: vehicle_template_accessory
-- ==========================================
CREATE TABLE `vehicle_template_accessory` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `accessory_entry` int unsigned NOT NULL DEFAULT '0',
  `seat_id` tinyint NOT NULL DEFAULT '0',
  `minion` tinyint unsigned NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `summontype` tinyint unsigned NOT NULL DEFAULT '6' COMMENT 'see enum TempSummonType',
  `summontimer` int unsigned NOT NULL DEFAULT '30000' COMMENT 'timer, only relevant for certain summontypes',
  `RideSpellID` int DEFAULT NULL,
  PRIMARY KEY (`entry`,`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`, `RideSpellID`) VALUES (24083, 24849, 0, 0, 'Proto Drake Rider mounted to Enslaved Proto Drake', 6, 30000, NULL);


-- ==========================================
-- Table: version
-- ==========================================
CREATE TABLE `version` (
  `core_version` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Core revision dumped at startup.',
  `core_revision` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_version` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Version of world DB.',
  `cache_id` int DEFAULT '0',
  PRIMARY KEY (`core_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Version Notes';

INSERT INTO `version` (`core_version`, `core_revision`, `db_version`, `cache_id`) VALUES ('TrinityCore rev. unknown 1970-01-01 00:00:00 +0000 (Archived branch) (Windows, AMD64, RelWithDebInfo, Static)', 'unknown', 'TDB RetailCore', 22111);


-- ==========================================
-- Table: warden_checks
-- ==========================================
CREATE TABLE `warden_checks` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint unsigned DEFAULT NULL,
  `str` varchar(170) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` int unsigned DEFAULT NULL,
  `length` tinyint unsigned DEFAULT NULL,
  `comment` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` binary(24) DEFAULT NULL,
  `result` varbinary(24) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=791 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `warden_checks` (`id`, `type`, `str`, `address`, `length`, `comment`, `data`, `result`) VALUES (0, 178, '', 710730, 23, NULL, 'b\"\\x07\\xf2#\\x14<i\'\\x1a\\xa2\\xa8Q\\xfe\\xcfm\\xc8\\x83\\xa9\\xd3\\xa7\\xdb\\xa6\\xfe&\\xcc\"', NULL);


-- ==========================================
-- Table: waypoint_path
-- ==========================================
CREATE TABLE `waypoint_path` (
  `PathId` int unsigned NOT NULL,
  `MoveType` tinyint unsigned NOT NULL DEFAULT '0',
  `Flags` tinyint unsigned NOT NULL DEFAULT '0',
  `Velocity` float DEFAULT NULL,
  `Comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`PathId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `waypoint_path` (`PathId`, `MoveType`, `Flags`, `Velocity`, `Comment`) VALUES (960, 0, 0, NULL, 'Migrated from refactor');


-- ==========================================
-- Table: waypoint_path_node
-- ==========================================
CREATE TABLE `waypoint_path_node` (
  `PathId` int unsigned NOT NULL DEFAULT '0',
  `NodeId` int unsigned NOT NULL DEFAULT '0',
  `PositionX` float NOT NULL DEFAULT '0',
  `PositionY` float NOT NULL DEFAULT '0',
  `PositionZ` float NOT NULL DEFAULT '0',
  `Orientation` float DEFAULT NULL,
  `Delay` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`PathId`,`NodeId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `waypoint_path_node` (`PathId`, `NodeId`, `PositionX`, `PositionY`, `PositionZ`, `Orientation`, `Delay`) VALUES (960, 1, 1964.88, -4678.7, 32.4229, NULL, 0);


-- ==========================================
-- Table: world_safe_locs
-- ==========================================
CREATE TABLE `world_safe_locs` (
  `ID` int unsigned NOT NULL,
  `MapID` int unsigned DEFAULT NULL,
  `LocX` float DEFAULT NULL,
  `LocY` float DEFAULT NULL,
  `LocZ` float DEFAULT NULL,
  `Facing` float DEFAULT NULL,
  `TransportSpawnId` bigint unsigned DEFAULT NULL,
  `Comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `world_safe_locs` (`ID`, `MapID`, `LocX`, `LocY`, `LocZ`, `Facing`, `TransportSpawnId`, `Comment`) VALUES (1, 0, -9115.0, 423.0, 96.0, 0.0, NULL, 'Stormwind');


-- ==========================================
-- Table: world_state
-- ==========================================
CREATE TABLE `world_state` (
  `ID` int NOT NULL,
  `DefaultValue` int NOT NULL,
  `MapIDs` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AreaIDs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ScriptName` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `Comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `world_state` (`ID`, `DefaultValue`, `MapIDs`, `AreaIDs`, `ScriptName`, `Comment`) VALUES (121, 0, '109', NULL, '', 'Sunken Temple - Jammal\'an the Prophet - Encounter completed');

