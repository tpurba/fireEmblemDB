-- Table for characters
CREATE TABLE Character(
    character_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    current_class VARCHAR(20) NOT NULL,
    level INTEGER NOT NULL,
    gender CHAR(1) NOT NULL
);

-- Table for growth rates
CREATE TABLE GrowthRates (
    growth_rate_id INTEGER PRIMARY KEY AUTOINCREMENT,
    character_id INTEGER NOT NULL,
    hp_growth INT NOT NULL,
    strength_growth INT NOT NULL,
    magic_growth INT NOT NULL,
    skill_growth INT NOT NULL,
    speed_growth INT NOT NULL,
    luck_growth INT NOT NULL,
    defense_growth INT NOT NULL,
    resistance_growth INT NOT NULL,
    FOREIGN KEY (character_id) REFERENCES Character(character_id) ON DELETE CASCADE
);

-- Table for supports
CREATE TABLE Supports(
    support_id INTEGER PRIMARY KEY AUTOINCREMENT,
    character1_id INTEGER NOT NULL,
    character2_id INTEGER NOT NULL,
    max_rank CHAR(1) NOT NULL,
    FOREIGN KEY (character1_id) REFERENCES Character(character_id) ON DELETE CASCADE,
    FOREIGN KEY (character2_id) REFERENCES Character(character_id) ON DELETE CASCADE
);

-- Table for spells
CREATE TABLE Spell(
    spell_id INTEGER PRIMARY KEY AUTOINCREMENT,
    spell_name VARCHAR(50) NOT NULL,
    power INT NOT NULL,
    hit_rate INT NOT NULL,
    crit_rate INT NOT NULL,
    uses INT NOT NULL
);

-- Table for linking characters to spells
CREATE TABLE CharacterSpell(
    character_spell_id INTEGER PRIMARY KEY AUTOINCREMENT,
    character_id INTEGER NOT NULL,
    spell_id INTEGER NOT NULL,
    FOREIGN KEY (character_id) REFERENCES Character(character_id) ON DELETE CASCADE,
    FOREIGN KEY (spell_id) REFERENCES Spell(spell_id) ON DELETE CASCADE
);

-- Table for classes
CREATE TABLE Classes (
    class_id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_name VARCHAR(50) NOT NULL,
    tier VARCHAR(20) NOT NULL,
    class_type VARCHAR(20) NOT NULL,
    weapon_types VARCHAR(100) NOT NULL  -- could add description 
);

-- Table for linking characters to classes
CREATE TABLE CharacterClasses (
    character_class_id INTEGER PRIMARY KEY AUTOINCREMENT,
    character_id INTEGER NOT NULL,
    class_id INTEGER NOT NULL,
    is_mastered INTEGER DEFAULT 0,
    FOREIGN KEY (character_id) REFERENCES Character(character_id) ON DELETE CASCADE,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id) ON DELETE CASCADE
);

-- Table for weapons 
CREATE TABLE Weapon (
    weapon_id INTEGER PRIMARY KEY AUTOINCREMENT,
    weapon_name VARCHAR(50) NOT NULL,
    weapon_type VARCHAR(20) NOT NULL,  
    power INTEGER NOT NULL,
    hit_rate INTEGER NOT NULL,
    crit_rate INTEGER NOT NULL,
    uses INTEGER NOT NULL 
);

-- Table for linking characters to weapons
CREATE TABLE CharacterWeapons (
    character_weapon_id INTEGER PRIMARY KEY AUTOINCREMENT,
    character_id INTEGER NOT NULL,
    weapon_id INTEGER NOT NULL,
    proficiency VARCHAR(20) NOT NULL,  -- e.g., E, D, C, B, A, S
    FOREIGN KEY (character_id) REFERENCES Character(character_id) ON DELETE CASCADE,
    FOREIGN KEY (weapon_id) REFERENCES Weapon(weapon_id) ON DELETE CASCADE
);
