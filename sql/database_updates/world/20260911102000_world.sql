-- Battleground resource crates are awarded dynamically and therefore are not
-- listed in quest_template item fields. Localize their residual zhCN text.
UPDATE `locales_quest` SET
  `Objectives_loc4` = REPLACE(`Objectives_loc4`, 'Arathi Resource Crate', '阿拉希资源箱')
WHERE `entry` IN (8298, 8300);