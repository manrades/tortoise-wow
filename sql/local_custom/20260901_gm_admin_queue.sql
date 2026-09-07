CREATE TABLE IF NOT EXISTS `gm_admin_queue` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `target_guid` int(10) unsigned NOT NULL,
  `target_name` varchar(12) NOT NULL,
  `target_account` int(10) unsigned NOT NULL,
  `action` enum('item','money','shellcoin') NOT NULL,
  `amount` int(11) NOT NULL,
  `item_entry` int(10) unsigned NOT NULL DEFAULT 0,
  `status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `result_message` varchar(255) NOT NULL DEFAULT '',
  `created_at` bigint(20) unsigned NOT NULL DEFAULT 0,
  `processed_at` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `status_created` (`status`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;