-- Restore hunter trainer rows lost despite the original source migration
-- 20260504194945_world being present in the migrations table.
-- Source: sql/database_updates/world/20260504194945_world.sql
-- Entries: 80856 Twinkie Boomstick; 80903 Viz Fizbeast.

DELETE FROM `npc_trainer` WHERE `entry` IN (80856, 80903);

INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES
(80856, 51508, 2200, 0, 0, 20),
(80903, 51508, 2200, 0, 0, 20),
(80856, 47319, 2200, 0, 0, 20),
(80903, 47319, 2200, 0, 0, 20),
(80856, 47320, 8000, 0, 0, 30),
(80903, 47320, 8000, 0, 0, 30),
(80856, 47321, 18000, 0, 0, 40),
(80903, 47321, 18000, 0, 0, 40),
(80856, 47322, 30000, 0, 0, 50),
(80903, 47322, 30000, 0, 0, 50),
(80856, 47338, 42000, 0, 0, 56),
(80903, 47338, 42000, 0, 0, 56),
(80856, 1563, 18000, 0, 0, 40),
(80903, 1563, 18000, 0, 0, 40);