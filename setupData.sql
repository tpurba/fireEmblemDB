INSERT INTO Character (name, current_class, level, gender) VALUES
('Chrom', 'Lord', 1, 'M'),
('Robin', 'Tactician', 1, 'M'),
('Frederick', 'Cavalier', 1, 'M'),
('Lissa', 'Cleric', 1, 'F');

INSERT INTO GrowthRates (character_id, hp_growth, strength_growth, magic_growth, skill_growth, speed_growth, luck_growth, defense_growth, resistance_growth) VALUES
(1, 60, 50, 40, 55, 45, 30, 35, 25),  -- Chrom
(2, 50, 45, 55, 60, 55, 40, 30, 35),  -- Robin
(3, 65, 60, 20, 50, 55, 35, 50, 20),  -- Frederick
(4, 55, 30, 45, 40, 50, 45, 20, 50);  -- Lissa

INSERT INTO Supports (character1_id, character2_id, max_rank) VALUES
(1, 2, 'A'),  -- Chrom & Robin
(1, 3, 'B'),  -- Chrom & Frederick
(2, 4, 'C');  -- Robin & Lissa

INSERT INTO Spell (spell_name, power, hit_rate, crit_rate, uses) VALUES
('Fire', 5, 85, 0, 20),
('Thunder', 7, 75, 5, 15),
('Heal', 0, 100, 0, 10);

INSERT INTO CharacterSpell (character_id, spell_id) VALUES
(2, 1),  -- Robin learns Fire
(2, 2),  -- Robin learns Thunder
(4, 3);  -- Lissa learns Heal

INSERT INTO Classes (class_name, tier, class_type, weapon_types) VALUES
('Lord', 'Tier 1', 'Infantry', 'Sword'),
('Tactician', 'Tier 1', 'Infantry', 'Sword, Tome'),
('Cavalier', 'Tier 1', 'Cavalry', 'Sword, Lance'),
('Cleric', 'Tier 1', 'Infantry', 'Staff');

INSERT INTO CharacterClasses (character_id, class_id, is_mastered) VALUES
(1, 1, 0),  -- Chrom as Lord
(2, 2, 0),  -- Robin as Tactician
(3, 3, 0),  -- Frederick as Cavalier
(4, 4, 0);  -- Lissa as Cleric

INSERT INTO Weapon (weapon_name, weapon_type, power, hit_rate, crit_rate, uses) VALUES
('Iron Sword', 'Sword', 5, 90, 0, 50),
('Steel Sword', 'Sword', 7, 85, 0, 40),
('Iron Lance', 'Lance', 6, 90, 0, 50);

INSERT INTO CharacterWeapons (character_id, weapon_id, proficiency) VALUES
(1, 1, 'C'),  -- Chrom with Iron Sword
(2, 2, 'B'),  -- Robin with Steel Sword
(3, 3, 'C');  -- Frederick with Iron Lance

INSERT INTO Skills (skill_name, description) VALUES
('Swordmaster', 'Increases sword damage by 10%.'),
('Magic Attack', 'Increases magic damage by 15%.'),
('Defender', 'Boosts defense when adjacent to allies.');

INSERT INTO CharacterSkills (character_id, skill_id, required_level, class_id) VALUES
(1, 1, 1, 1),  -- Chrom learns Swordmaster
(2, 2, 1, 2),  -- Robin learns Magic Attack
(3, 3, 1, 3);  -- Frederick learns Defender

INSERT INTO Stats (character_id, hp, strength, magic, skill, speed, luck, defense, resistance) VALUES
(1, 20, 8, 3, 7, 6, 5, 7, 3),  -- Chrom
(2, 18, 5, 5, 8, 7, 6, 5, 4),  -- Robin
(3, 25, 10, 2, 6, 5, 4, 9, 2), -- Frederick
(4, 17, 4, 6, 5, 6, 5, 4, 7);  -- Lissa
