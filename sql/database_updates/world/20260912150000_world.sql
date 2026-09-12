-- Make the portable Fashionista Glitterglam (summoned by item 49995) use the
-- same transmog interaction state as Felicia. Keep Glitterglam's display and
-- localized identity, but align every gameplay-facing template field that
-- differs from the proven functional Stormwind Fashionista.
UPDATE `creature_template`
SET `gossip_menu_id` = 64999,
    `faction` = 12,
    `npc_flags` = 268435457,
    `speed_walk` = 1.11,
    `speed_run` = 1.14286,
    `scale` = 1,
    `detection_range` = 18,
    `call_for_help_range` = 5,
    `leash_range` = 0,
    `rank` = 0,
    `xp_multiplier` = 1,
    `dmg_min` = 56.1,
    `dmg_max` = 71.5,
    `dmg_school` = 0,
    `attack_power` = 138,
    `dmg_multiplier` = 1,
    `base_attack_time` = 2000,
    `ranged_attack_time` = 2000,
    `unit_class` = 1,
    `unit_flags` = 768,
    `dynamic_flags` = 0,
    `type` = 10,
    `flags_extra` = 2
WHERE `entry` = 51295;
