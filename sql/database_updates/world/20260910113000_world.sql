-- ==============================================
-- FILE: shop_fashion_subcategories.sql
-- GENERATED: 20260910113000
-- ==============================================
-- The Turtle shop client accepts category records as
-- id=parentId=name=icon. Fashion previously sent every record as a root
-- category, despite the client supporting nested equipment slots.

ALTER TABLE `shop_categories`
    ADD COLUMN IF NOT EXISTS `parent_id` INT(11) UNSIGNED NOT NULL DEFAULT 0 AFTER `id`;

INSERT INTO `shop_categories` (`id`, `parent_id`, `name`, `name_loc4`, `icon`) VALUES
    (9, 7, 'Head', '头部', 'inv_helmet'),
    (10, 7, 'Shoulders', '肩部', 'inv_shoulder'),
    (11, 7, 'Back', '背部', 'inv_misc_cape_02'),
    (12, 7, 'Chest', '胸甲', 'inv_chest_cloth_21'),
    (13, 7, 'Tabards', '战袍', 'inv_tabard_03'),
    (14, 7, 'Shirts', '衬衫', 'inv_shirt_03'),
    (15, 7, 'Wrists', '护腕', 'inv_bracer_07'),
    (16, 7, 'Hands', '手部', 'inv_gauntlets_04'),
    (17, 7, 'Waist', '腰部', 'inv_belt_08'),
    (18, 7, 'Legs', '腿部', 'inv_pants_06'),
    (19, 7, 'Feet', '脚部', 'inv_boots_cloth_05'),
    (20, 7, 'Weapons', '武器', 'inv_sword_04')
ON DUPLICATE KEY UPDATE
    `parent_id` = VALUES(`parent_id`),
    `name` = VALUES(`name`),
    `name_loc4` = VALUES(`name_loc4`),
    `icon` = VALUES(`icon`);

-- Convert pre-existing flat fashion entries to their appropriate leaf.
UPDATE `shop_items` AS si
JOIN `item_template` AS it ON it.`entry` = si.`item`
SET si.`category` = CASE it.`inventory_type`
    WHEN 1 THEN 9
    WHEN 3 THEN 10
    WHEN 16 THEN 11
    WHEN 5 THEN 12
    WHEN 19 THEN 13
    WHEN 4 THEN 14
    WHEN 9 THEN 15
    WHEN 10 THEN 16
    WHEN 6 THEN 17
    WHEN 7 THEN 18
    WHEN 8 THEN 19
    ELSE 20
END
WHERE si.`category` = 7;

-- Restore city-guard sets and the client-shipped seasonal fashion series from
-- the reference shop. The source rows come from item_template, so repeated
-- application never creates duplicate shop entries.
INSERT INTO `shop_items`
    (`category`, `item`, `model_id`, `item_id`, `description`, `description_loc4`,
     `price`, `region_locked`, `position_x`, `position_y`, `position_z`, `rotation`, `scale`)
SELECT
    CASE it.`inventory_type`
        WHEN 1 THEN 9 WHEN 3 THEN 10 WHEN 16 THEN 11 WHEN 5 THEN 12
        WHEN 19 THEN 13 WHEN 4 THEN 14 WHEN 9 THEN 15 WHEN 10 THEN 16
        WHEN 6 THEN 17 WHEN 7 THEN 18 WHEN 8 THEN 19 ELSE 20
    END,
    it.`entry`, 0, 0, '', '',
    CASE it.`inventory_type`
        WHEN 1 THEN 150 WHEN 16 THEN 150 WHEN 19 THEN 150 WHEN 4 THEN 150
        WHEN 5 THEN 200 ELSE 50
    END,
    0, 0, 0, 0, 0, 1
FROM `item_template` AS it
LEFT JOIN `shop_items` AS existing ON existing.`item` = it.`entry`
WHERE existing.`item` IS NULL
  AND it.`class` IN (2, 4)
  AND it.`inventory_type` IN (1, 3, 4, 5, 6, 7, 8, 9, 10, 13, 15, 16, 17, 21, 22, 23, 26)
  AND (
      it.`entry` BETWEEN 50300 AND 50379
      OR it.`entry` BETWEEN 41486 AND 41556
      OR it.`entry` BETWEEN 69100 AND 69160
  );
