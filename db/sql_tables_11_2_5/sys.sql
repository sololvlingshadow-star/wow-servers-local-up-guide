
-- ==========================================
-- Table: sys_config
-- ==========================================
CREATE TABLE `sys_config` (
  `variable` varchar(128) NOT NULL,
  `value` varchar(128) DEFAULT NULL,
  `set_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `set_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `sys_config` (`variable`, `value`, `set_time`, `set_by`) VALUES ('diagnostics.allow_i_s_tables', 'OFF', '2025-12-08 12:26:06', NULL);

