-- Repair the fashion hierarchy to match Turtle_ShopUI.lua's wire contract.
-- The client requests category 7 once, then filters entries by the second
-- Entries field. Leaf IDs 9..20 are visual subcategories, not item categories.

ALTER TABLE `shop_items`
    ADD COLUMN IF NOT EXISTS `subcategory` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 AFTER `category`;

UPDATE `shop_items` AS si
JOIN `item_template` AS it ON it.`entry` = si.`item`
SET si.`category` = 7,
    si.`subcategory` = CASE it.`inventory_type`
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
WHERE si.`category` BETWEEN 9 AND 20
   OR (si.`category` = 7 AND si.`subcategory` = 0);