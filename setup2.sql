
-- Table for storing skills
CREATE TABLE Skills (
    skill_id INTEGER PRIMARY KEY AUTOINCREMENT,
    skill_name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL  -- Detailed description of the skill's effect
);

-- Table for linking characters to their skills
CREATE TABLE CharacterSkills (
    character_skill_id INTEGER PRIMARY KEY AUTOINCREMENT,
    character_id INTEGER NOT NULL,
    skill_id INTEGER NOT NULL,
    required_level INTEGER NOT NULL,  -- Level required to learn the skill
    class_id INTEGER,   -- Class required to learn the skill
    FOREIGN KEY (character_id) REFERENCES Character(character_id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id) ON DELETE CASCADE,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id) ON DELETE CASCADE
);

-- Table for storing character stats
CREATE TABLE Stats (
    stat_id INTEGER PRIMARY KEY AUTOINCREMENT,
    character_id INTEGER NOT NULL,
    hp INTEGER NOT NULL,
    strength INTEGER NOT NULL,
    magic INTEGER NOT NULL,
    skill INTEGER NOT NULL,
    speed INTEGER NOT NULL,
    luck INTEGER NOT NULL,
    defense INTEGER NOT NULL,
    resistance INTEGER NOT NULL,
    FOREIGN KEY (character_id) REFERENCES Character(character_id) ON DELETE CASCADE
);
