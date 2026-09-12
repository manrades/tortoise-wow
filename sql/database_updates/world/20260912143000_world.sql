-- Restore client item previews for fashion items that use their own item model.
-- The shop protocol sends shop_items.item_id as the preview item entry.  The
-- affected fashion rows had item_id=0, which renders the client question-mark
-- placeholder even though their item_template display records are valid.
-- Keep rows with explicit model_id untouched: mounts, pets and illusions use a
-- distinct creature model rather than an item preview.

UPDATE `shop_items` AS `shop`
INNER JOIN `item_template` AS `item` ON `item`.`entry` = `shop`.`item`
SET `shop`.`item_id` = `shop`.`item`
WHERE `shop`.`category` = 7
  AND `shop`.`model_id` = 0
  AND `shop`.`item_id` = 0;
