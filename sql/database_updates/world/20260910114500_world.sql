-- ==============================================
-- FILE: shop_fashion_back_items.sql
-- GENERATED: 20260910114500
-- ==============================================
-- The reference Fashion -> Back page contains these eleven city/faction capes.
INSERT INTO `shop_items`
    (`category`, `item`, `model_id`, `item_id`, `description`, `description_loc4`,
     `price`, `region_locked`, `position_x`, `position_y`, `position_z`, `rotation`, `scale`)
SELECT 11, it.`entry`, 0, 0, '', '', 150, 0, 0, 0, 0, 0, 1
FROM `item_template` AS it
LEFT JOIN `shop_items` AS existing ON existing.`item` = it.`entry`
WHERE existing.`item` IS NULL
  AND it.`entry` IN (18, 19, 95, 96, 97, 98, 99, 100, 101, 102, 212)
  AND it.`inventory_type` = 16;
