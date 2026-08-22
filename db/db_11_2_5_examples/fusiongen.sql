
-- ==========================================
-- Table: account_data
-- ==========================================
CREATE TABLE `account_data` (
  `id` int NOT NULL,
  `vp` int DEFAULT '0',
  `dp` int DEFAULT '0',
  `total_votes` int NOT NULL DEFAULT '0',
  `location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nickname` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `language` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'english',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'default.gif',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `account_data` (`id`, `vp`, `dp`, `total_votes`, `location`, `nickname`, `language`, `avatar`) VALUES (2, 0, 0, 0, 'Unknown', 'WEBADMIN', 'english', '1');


-- ==========================================
-- Table: acl_account_groups
-- ==========================================
CREATE TABLE `acl_account_groups` (
  `account_id` int unsigned NOT NULL,
  `group_id` int unsigned NOT NULL,
  PRIMARY KEY (`account_id`,`group_id`) USING BTREE,
  UNIQUE KEY `account_id_group_id` (`account_id`,`group_id`) USING BTREE,
  KEY `FK__acl_groups` (`group_id`) USING BTREE,
  CONSTRAINT `FK__acl_groups` FOREIGN KEY (`group_id`) REFERENCES `acl_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `acl_account_groups` (`account_id`, `group_id`) VALUES (2, 8);


-- ==========================================
-- Table: acl_account_permissions
-- ==========================================
CREATE TABLE `acl_account_permissions` (
  `account_id` int unsigned NOT NULL,
  `permission_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `module` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_id`) USING BTREE,
  UNIQUE KEY `account_id_permission_id` (`account_id`,`permission_name`,`module`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table acl_account_permissions is empty)


-- ==========================================
-- Table: acl_account_roles
-- ==========================================
CREATE TABLE `acl_account_roles` (
  `account_id` int unsigned NOT NULL,
  `role_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `module` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`account_id`,`role_name`) USING BTREE,
  UNIQUE KEY `account_id_role_name` (`account_id`,`role_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table acl_account_roles is empty)


-- ==========================================
-- Table: acl_group_roles
-- ==========================================
CREATE TABLE `acl_group_roles` (
  `group_id` int unsigned NOT NULL,
  `role_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `module` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`group_id`,`role_name`,`module`) USING BTREE,
  UNIQUE KEY `group_id_role_id` (`group_id`,`role_name`,`module`) USING BTREE,
  CONSTRAINT `FK__groups` FOREIGN KEY (`group_id`) REFERENCES `acl_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `acl_group_roles` (`group_id`, `role_name`, `module`) VALUES (1, '11', '--MENU--');


-- ==========================================
-- Table: acl_groups
-- ==========================================
CREATE TABLE `acl_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `priority` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `color` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '#FFFFFF',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `acl_groups` (`id`, `priority`, `name`, `color`, `description`) VALUES (1, 1, 'Guest', '', 'Rank that the user gets when they are not logged in, can be defined in the configs that it is this rank.');


-- ==========================================
-- Table: article_tag
-- ==========================================
CREATE TABLE `article_tag` (
  `article_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table article_tag is empty)


-- ==========================================
-- Table: articles
-- ==========================================
CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` int NOT NULL,
  `author_id` int NOT NULL,
  `comments` int DEFAULT '0',
  `type` int DEFAULT NULL,
  `type_content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `headline` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table articles is empty)


-- ==========================================
-- Table: avatars
-- ==========================================
CREATE TABLE `avatars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `avatar` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `staff` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `avatars` (`id`, `avatar`, `staff`) VALUES (1, 'rookie_avatar_1.jpg', 0);


-- ==========================================
-- Table: backup
-- ==========================================
CREATE TABLE `backup` (
  `id` int NOT NULL AUTO_INCREMENT,
  `backup_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `backup_name_UNIQUE` (`backup_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table backup is empty)


-- ==========================================
-- Table: changelog
-- ==========================================
CREATE TABLE `changelog` (
  `change_id` int NOT NULL AUTO_INCREMENT,
  `changelog` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `author` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` int NOT NULL,
  `time` int NOT NULL,
  PRIMARY KEY (`change_id`) USING BTREE,
  KEY `FK_changelog_changelog_type` (`type`) USING BTREE,
  CONSTRAINT `FK_changelog_changelog_type` FOREIGN KEY (`type`) REFERENCES `changelog_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table changelog is empty)


-- ==========================================
-- Table: changelog_type
-- ==========================================
CREATE TABLE `changelog_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table changelog_type is empty)


-- ==========================================
-- Table: ci_sessions
-- ==========================================
CREATE TABLE `ci_sessions` (
  `id` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `data` mediumblob NOT NULL,
  PRIMARY KEY (`id`,`ip_address`) USING BTREE,
  KEY `last_activity_idx` (`timestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `ci_sessions` (`id`, `ip_address`, `user_agent`, `timestamp`, `data`) VALUES ('06p13c42k01r777lfv0g2g2ljcrskvdl', '192.168.0.28', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', 1712140592, 'b\'__ci_last_regenerate|i:1712140588;captcha|s:7:\"KSpMSkd\";\'');


-- ==========================================
-- Table: comments
-- ==========================================
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL,
  `author_id` int NOT NULL,
  `timestamp` int DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `is_gm` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table comments is empty)


-- ==========================================
-- Table: daily_signups
-- ==========================================
CREATE TABLE `daily_signups` (
  `date` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `amount` int DEFAULT '0',
  PRIMARY KEY (`date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `daily_signups` (`date`, `amount`) VALUES ('2024-05-26', 1);


-- ==========================================
-- Table: email_log
-- ==========================================
CREATE TABLE `email_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `timestamp` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table email_log is empty)


-- ==========================================
-- Table: email_templates
-- ==========================================
CREATE TABLE `email_templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `email_templates` (`id`, `template_name`) VALUES (1, 'password_recovery.tpl');


-- ==========================================
-- Table: failed_logins
-- ==========================================
CREATE TABLE `failed_logins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt` datetime DEFAULT NULL,
  `block_until` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table failed_logins is empty)


-- ==========================================
-- Table: gm_log
-- ==========================================
CREATE TABLE `gm_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `gm_id` int unsigned DEFAULT NULL,
  `affected` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL COMMENT 'ticket, characters, account, ...',
  `realm` int NOT NULL,
  `time` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table gm_log is empty)


-- ==========================================
-- Table: image_slider
-- ==========================================
CREATE TABLE `image_slider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '#',
  `text` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order` int DEFAULT NULL,
  `header` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `body` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `footer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `image_slider` (`id`, `image`, `link`, `text`, `order`, `header`, `body`, `footer`) VALUES (1, '{path}{image_path}slides/slide-01.jpg', '', 'Welcome to FusionCMS', 1, 'EXPLORE THE WORLD BENEATH AZEROTH', '', '');


-- ==========================================
-- Table: item_template
-- ==========================================
CREATE TABLE `item_template` (
  `entry` mediumint unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `displayid` mediumint unsigned NOT NULL DEFAULT '0',
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Quality` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `subclass` tinyint unsigned NOT NULL DEFAULT '0',
  `ItemLevel` tinyint unsigned NOT NULL DEFAULT '0',
  `InventoryType` tinyint unsigned NOT NULL DEFAULT '0',
  `stackable` tinyint unsigned NOT NULL DEFAULT '1',
  `htmlTooltip` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`entry`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='Item System';

INSERT INTO `item_template` (`entry`, `name`, `displayid`, `icon`, `Quality`, `class`, `subclass`, `ItemLevel`, `InventoryType`, `stackable`, `htmlTooltip`) VALUES (206448, 'Fyr\'alath the Dreamrender', 670081, 'inv_axe_2h_fyrakk_d_01_shadowflame', 5, 2, 1, 255, 17, 1, '<table><tr><td><!--nstart--><b class=\"q5\">Fyr\'alath the Dreamrender</b><!--nend--><!--ndstart--><!--ndend--><span class=\"q\"><br>Item Level <!--ilvl-->496</span><!--bo--><br>Binds when picked up<br>Unique-Equipped<table width=\"100%\"><tr><td>Two-Hand</td><th><!--scstart2:1--><span class=\"q1\">Axe</span><!--scend--></th></tr></table><table width=\"100%\"><tr>
    <td><span><!--dmg-->1,764 - 3,664 Damage</span></td>
    <th>Speed <!--spd-->3.60</th>
</tr></table><!--dps-->(753.9 damage per second)<br><span><!--stat4-->+1,002 Strength</span><br><span><!--stat7-->+4,317 Stamina</span><!--ebstats--><br><span class=\"q2\">+<!--rtg32-->394 Critical Strike</span><br><span class=\"q2\">+<!--rtg36-->667 Haste</span><!--egstats--><!--eistats--><!--nameDescStats--><!--e--><!--ps--><br>Durability 145 / 145</td></tr></table><table><tr><td><span class=\"q2\">Use: <a href=\"https://www.wowhead.com/spell=417131/rage-of-fyralath\" class=\"q2\">Unleash the Rage of Fyr\'alath to charge towards your target and swing repeatedly, dealing (<!--pts1:0:0:417134:63.359-->51807<!----> * 3 / 0.5 + <!--pts1:0:0:413584:253.336-->207148<!---->) Shadowflame damage over 3 sec to all who would stand in your way.</a> (2 Min Cooldown)</span><br><span class=\"q2\">Equip: <a href=\"https://www.wowhead.com/spell=420248/fyralath-the-dreamrender\" class=\"q2\">Your attacks apply Mark of Fyr\'alath, dealing <!--pts1:3:5:414532:24.5817-->20100<!----> Shadowflame damage over 15 sec. Upon activation, Fyr\'alath draws in the flames from all marks to increase its damage by <!--pts1:0:0:420248:0-->10<!---->%.</a></span><!--itemEffects:1--><br>Requires Level <!--rlvl-->70<div class=\"whtt-sellprice\">Sell Price: <span class=\"moneygold\">246</span> <span class=\"moneysilver\">50</span> <span class=\"moneycopper\">89</span></div></td></tr></table>');


-- ==========================================
-- Table: logs
-- ==========================================
CREATE TABLE `logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` enum('failed','succeed') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'succeed',
  `custom` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `time` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `logs` (`id`, `module`, `user_id`, `type`, `event`, `message`, `status`, `custom`, `ip`, `time`) VALUES (1, 'store', 6, 'admin', 'add', 'Item added', 'succeed', '{\"Item\":\"Fyr\'alath the Dreamrender\"}', '192.168.0.46', 1709556947);


-- ==========================================
-- Table: menu
-- ==========================================
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `link` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '#',
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'top' COMMENT 'top, side, bottom',
  `rank` int NOT NULL,
  `specific_rank` tinyint(1) NOT NULL DEFAULT '0',
  `order` int DEFAULT NULL,
  `permission` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `side` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT 'L = left, R = right',
  `dropdown` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = Default, 1 = Dropdown',
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_menu_ranks` (`rank`) USING BTREE,
  CONSTRAINT `FK_menu_ranks` FOREIGN KEY (`rank`) REFERENCES `ranks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `menu` (`id`, `name`, `link`, `type`, `rank`, `specific_rank`, `order`, `permission`, `side`, `dropdown`, `parent_id`) VALUES (1, 'Home', 'news', 'top', 1, 0, 1, NULL, NULL, 0, 0);


-- ==========================================
-- Table: monthly_income
-- ==========================================
CREATE TABLE `monthly_income` (
  `month` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `amount` int DEFAULT '0',
  PRIMARY KEY (`month`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table monthly_income is empty)


-- ==========================================
-- Table: monthly_votes
-- ==========================================
CREATE TABLE `monthly_votes` (
  `month` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `amount` int DEFAULT '0',
  PRIMARY KEY (`month`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table monthly_votes is empty)


-- ==========================================
-- Table: notifications
-- ==========================================
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `read` int NOT NULL DEFAULT '0',
  `time` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table notifications is empty)


-- ==========================================
-- Table: order_log
-- ==========================================
CREATE TABLE `order_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `completed` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `vp_cost` int DEFAULT NULL,
  `dp_cost` int DEFAULT NULL,
  `cart` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `timestamp` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table order_log is empty)


-- ==========================================
-- Table: pages
-- ==========================================
CREATE TABLE `pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `permission` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `rank_needed` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `identifier` (`identifier`) USING BTREE,
  KEY `fk_rank_needed_ranks` (`rank_needed`) USING BTREE,
  CONSTRAINT `fk_rank_needed_ranks` FOREIGN KEY (`rank_needed`) REFERENCES `ranks` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `pages` (`id`, `identifier`, `name`, `content`, `permission`, `rank_needed`) VALUES (1, 'connect', '{\"english\":\"How to connect\"}', '<p><strong>1.</strong> First of all, you must create an account. The account is used to log into both the game and our website. <a href=\"../register\">Click here</a> to open the registration page. <br /><br /><strong>2.</strong> Install World of Warcraft. You can download it (legally) from here: <a href=\"https://www.worldofwarcraft.com/account/download/clients/pc/InstallWoW.exe\" target=\"_blank\" rel=\"noopener\">Windows</a> or <a href=\"https://www.worldofwarcraft.com/account/download/clients/mac/InstallWoW.zip\" target=\"_blank\" rel=\"noopener\">Mac</a>. Make sure to upgrade to our current supported patch, which is 3.3.5 (build 12340). Patch mirrors can be found <a href=\"http://www.wowwiki.com/Patch_mirrors\" target=\"_blank\" rel=\"noopener\">here</a>. <br /><br /><strong>3.</strong> Open up the \"World of Warcraft\" directory. The default directory is \"C:\\Program Files\\World of Warcraft\". When you\'ve found it, open up the directory called \"data\", then go into the directory called either enUS or enGB, depending on your client language. <br /><br /><strong>4.</strong> Open up the file called \"realmlist.wtf\" with a text editor such as Notepad. To do this, you must right click on the file and choose properties, then select notepad as the default software for files with the \".wtf\" ending. You may also just start the text editor and drag the file into the edit window. <br /><br /><strong>5.</strong> Erase all text and change it to:</p>
<div style=\"padding: 30px; display: block; font-weight: bold;\">set realmlist logon.myserver.com (edit from admin panel -&gt; pages)</div>
<p><strong>You may now start playing! If you need any help, do not hesitate to create a support ticket.</strong></p>', NULL, 1);


-- ==========================================
-- Table: password_recovery_key
-- ==========================================
CREATE TABLE `password_recovery_key` (
  `recoverykey` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table password_recovery_key is empty)


-- ==========================================
-- Table: pay_custom_gateway_logs
-- ==========================================
CREATE TABLE `pay_custom_gateway_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `payment_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hash` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `total` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `points` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `create_time` int DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `error` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `invoice_number` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `payer_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `transactions_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gateway_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table pay_custom_gateway_logs is empty)


-- ==========================================
-- Table: paypal_donate
-- ==========================================
CREATE TABLE `paypal_donate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tax` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `points` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `paypal_donate` (`id`, `price`, `tax`, `points`) VALUES (1, '5.00', NULL, 15);


-- ==========================================
-- Table: paypal_logs
-- ==========================================
CREATE TABLE `paypal_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `payment_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `hash` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `total` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `points` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `create_time` int DEFAULT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `error` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `invoice_number` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `payer_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `token` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `transactions_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table paypal_logs is empty)


-- ==========================================
-- Table: pending_accounts
-- ==========================================
CREATE TABLE `pending_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `timestamp` int DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- (Table pending_accounts is empty)


-- ==========================================
-- Table: ranks
-- ==========================================
CREATE TABLE `ranks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'RANK',
  `access_id` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '0',
  `is_gm` int DEFAULT '0',
  `is_dev` int DEFAULT '0',
  `is_admin` int DEFAULT '0',
  `is_owner` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `ranks` (`id`, `rank_name`, `access_id`, `is_gm`, `is_dev`, `is_admin`, `is_owner`) VALUES (1, 'Guest', '-1', 0, 0, 0, 0);


-- ==========================================
-- Table: realms
-- ==========================================
CREATE TABLE `realms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hostname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `char_database` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `world_database` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cap` int DEFAULT '100',
  `expansion` int DEFAULT '2',
  `realmName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `console_username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `console_password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `console_port` int DEFAULT NULL,
  `emulator` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `realm_port` int DEFAULT NULL,
  `override_port_world` int DEFAULT NULL,
  `override_username_world` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `override_password_world` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `override_hostname_world` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `override_port_char` int DEFAULT NULL,
  `override_username_char` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `override_password_char` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `override_hostname_char` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `realms` (`id`, `hostname`, `username`, `password`, `char_database`, `world_database`, `cap`, `expansion`, `realmName`, `console_username`, `console_password`, `console_port`, `emulator`, `realm_port`, `override_port_world`, `override_username_world`, `override_password_world`, `override_hostname_world`, `override_port_char`, `override_username_char`, `override_password_char`, `override_hostname_char`) VALUES (1, 'localhost', NULL, 'admin', 'characters', 'world', 100, 9, 'TrinityCore', 'webadmin', 'webadmin', 7878, 'trinity_df', 8085, 3306, 'root', 'admin', 'localhost', 3306, 'root', 'admin', 'localhost');


-- ==========================================
-- Table: sideboxes
-- ==========================================
CREATE TABLE `sideboxes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `displayName` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `rank_needed` int NOT NULL DEFAULT '1',
  `order` int DEFAULT '100',
  `location` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'side' COMMENT 'side, top, bottom',
  `permission` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pages` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_sb_rank_needed` (`rank_needed`) USING BTREE,
  CONSTRAINT `fk_sb_rank_needed` FOREIGN KEY (`rank_needed`) REFERENCES `ranks` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `sideboxes` (`id`, `type`, `displayName`, `rank_needed`, `order`, `location`, `permission`, `pages`) VALUES (1, 'status', '{\"english\":\"Server status\"}', 1, 0, 'side', NULL, '[\"news\"]');


-- ==========================================
-- Table: sideboxes_custom
-- ==========================================
CREATE TABLE `sideboxes_custom` (
  `sidebox_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  UNIQUE KEY `sidebox_id` (`sidebox_id`) USING BTREE,
  CONSTRAINT `FK_sideboxes_custom_sideboxes` FOREIGN KEY (`sidebox_id`) REFERENCES `sideboxes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table sideboxes_custom is empty)


-- ==========================================
-- Table: sideboxes_poll_answers
-- ==========================================
CREATE TABLE `sideboxes_poll_answers` (
  `answerid` int NOT NULL AUTO_INCREMENT,
  `questionid` int NOT NULL,
  `answer` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`answerid`) USING BTREE,
  KEY `FK__sideboxes_poll_questions` (`questionid`) USING BTREE,
  CONSTRAINT `FK__sideboxes_poll_questions` FOREIGN KEY (`questionid`) REFERENCES `sideboxes_poll_questions` (`questionid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table sideboxes_poll_answers is empty)


-- ==========================================
-- Table: sideboxes_poll_questions
-- ==========================================
CREATE TABLE `sideboxes_poll_questions` (
  `questionid` int NOT NULL AUTO_INCREMENT,
  `question` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`questionid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table sideboxes_poll_questions is empty)


-- ==========================================
-- Table: sideboxes_poll_votes
-- ==========================================
CREATE TABLE `sideboxes_poll_votes` (
  `questionid` int DEFAULT NULL,
  `answerid` int DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `time` int DEFAULT NULL,
  KEY `fk_answers` (`questionid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table sideboxes_poll_votes is empty)


-- ==========================================
-- Table: sideboxes_spotlight
-- ==========================================
CREATE TABLE `sideboxes_spotlight` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contents` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `order` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table sideboxes_spotlight is empty)


-- ==========================================
-- Table: spelltext_en
-- ==========================================
CREATE TABLE `spelltext_en` (
  `spellId` int NOT NULL,
  `spellText` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `spelltext_en` (`spellId`, `spellText`) VALUES (5, 'Instantly Kills the target. I hope you feel good about yourself now.....');


-- ==========================================
-- Table: store_groups
-- ==========================================
CREATE TABLE `store_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `orderNumber` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=COMPACT;

INSERT INTO `store_groups` (`id`, `title`, `orderNumber`) VALUES (1, 'Test group', 1);


-- ==========================================
-- Table: store_items
-- ==========================================
CREATE TABLE `store_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `itemid` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `itemcount` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `vp_price` int DEFAULT NULL,
  `dp_price` int DEFAULT NULL,
  `realm` int DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'inv_misc_questionmark',
  `group` int DEFAULT NULL,
  `query` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `query_database` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `query_need_character` int DEFAULT '0',
  `command` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `command_need_character` int DEFAULT NULL,
  `require_character_offline` int NOT NULL DEFAULT '0',
  `tooltip` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_group` (`group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=COMPACT;

INSERT INTO `store_items` (`id`, `itemid`, `itemcount`, `name`, `quality`, `vp_price`, `dp_price`, `realm`, `description`, `icon`, `group`, `query`, `query_database`, `query_need_character`, `command`, `command_need_character`, `require_character_offline`, `tooltip`) VALUES (1, '206448', '1', 'Fyr\'alath the Dreamrender', 5, 1, 0, 1, 'Unique-Equipped Two-Hand', 'Inv_axe_2h_fyrakk_d_01_shadowflame', 1, NULL, '', 0, NULL, NULL, 0, 1);


-- ==========================================
-- Table: tag
-- ==========================================
CREATE TABLE `tag` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table tag is empty)


-- ==========================================
-- Table: teleport_locations
-- ==========================================
CREATE TABLE `teleport_locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Unnamed',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `x` float DEFAULT '0',
  `y` float DEFAULT '0',
  `z` float DEFAULT '0',
  `orientation` float DEFAULT '0',
  `mapId` smallint DEFAULT '0',
  `vpCost` int DEFAULT '0',
  `dpCost` int DEFAULT '0',
  `goldCost` int DEFAULT '0',
  `realm` int DEFAULT '1',
  `required_faction` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `realm_fk` (`realm`) USING BTREE,
  CONSTRAINT `realm_fk` FOREIGN KEY (`realm`) REFERENCES `realms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table teleport_locations is empty)


-- ==========================================
-- Table: visitor_log
-- ==========================================
CREATE TABLE `visitor_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `timestamp` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1312 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `visitor_log` (`id`, `date`, `timestamp`, `ip`) VALUES (1, '2024-03-04', '1709552325', '192.168.0.46');


-- ==========================================
-- Table: vote_log
-- ==========================================
CREATE TABLE `vote_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vote_site_id` int NOT NULL DEFAULT '0',
  `user_id` int NOT NULL,
  `ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `time` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_vote_log_vote_sites` (`vote_site_id`) USING BTREE,
  CONSTRAINT `FK_vote_log_vote_sites` FOREIGN KEY (`vote_site_id`) REFERENCES `vote_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table vote_log is empty)


-- ==========================================
-- Table: vote_sites
-- ==========================================
CREATE TABLE `vote_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vote_sitename` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `vote_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'https://',
  `vote_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hour_interval` int NOT NULL DEFAULT '12',
  `points_per_vote` tinyint NOT NULL DEFAULT '1',
  `callback_enabled` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci ROW_FORMAT=DYNAMIC;

-- (Table vote_sites is empty)

