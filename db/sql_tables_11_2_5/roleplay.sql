
-- ==========================================
-- Table: creature_extra
-- ==========================================
CREATE TABLE `creature_extra` (
  `guid` bigint unsigned NOT NULL,
  `scale` float NOT NULL DEFAULT '-1',
  `id_creator_bnet` int unsigned NOT NULL DEFAULT '0',
  `id_creator_player` bigint unsigned NOT NULL DEFAULT '0',
  `id_modifier_bnet` int unsigned NOT NULL DEFAULT '0',
  `id_modifier_player` bigint unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phaseMask` int unsigned NOT NULL DEFAULT '1',
  `displayLock` tinyint unsigned NOT NULL DEFAULT '0',
  `displayId` int unsigned NOT NULL DEFAULT '0',
  `nativeDisplayId` int unsigned NOT NULL DEFAULT '0',
  `genderLock` tinyint unsigned NOT NULL DEFAULT '0',
  `gender` tinyint unsigned NOT NULL DEFAULT '0',
  `swim` tinyint unsigned NOT NULL DEFAULT '1',
  `gravity` tinyint unsigned NOT NULL DEFAULT '1',
  `fly` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- (Table creature_extra is empty)


-- ==========================================
-- Table: creature_template_extra
-- ==========================================
CREATE TABLE `creature_template_extra` (
  `id_entry` int unsigned NOT NULL,
  `disabled` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_entry`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- (Table creature_template_extra is empty)


-- ==========================================
-- Table: custom_npcs
-- ==========================================
CREATE TABLE `custom_npcs` (
  `Key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Entry` int unsigned NOT NULL,
  PRIMARY KEY (`Key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- (Table custom_npcs is empty)


-- ==========================================
-- Table: server_settings
-- ==========================================
CREATE TABLE `server_settings` (
  `setting_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `setting_value` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- (Table server_settings is empty)

