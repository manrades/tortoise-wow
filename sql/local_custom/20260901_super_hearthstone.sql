-- Super Hearthstone: cloned from the original Hearthstone (6948).
-- It retains the original item while Eluna attaches the teleport menu to ID 900001.
CREATE TEMPORARY TABLE super_hearthstone_template LIKE item_template;
INSERT INTO super_hearthstone_template SELECT * FROM item_template WHERE entry = 6948;
UPDATE super_hearthstone_template
SET entry = 900001,
    name = '超级炉石',
    description = '具有传送菜单功能的炉石。原版炉石仍可正常使用。'
WHERE entry = 6948;
INSERT INTO item_template
SELECT * FROM super_hearthstone_template
ON DUPLICATE KEY UPDATE
    name = VALUES(name),
    description = VALUES(description);
DROP TEMPORARY TABLE super_hearthstone_template;