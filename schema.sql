CREATE TABLE encounter
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50)
);
CREATE TABLE encounter_monster
(
    encounter_id INT NOT NULL,
    monster_type_id INT NOT NULL,
    hit_points INT NOT NULL,
    dead_flag TINYINT DEFAULT 0 NOT NULL
);
CREATE TABLE encounter_monster_type
(
    encounter_id INT NOT NULL,
    monster_type_id INT NOT NULL,
    strategy LONGTEXT,
    notes LONGTEXT,
    PRIMARY KEY (encounter_id, monster_type_id)
);
CREATE TABLE experience
(
    hit_dice_range_id INT PRIMARY KEY NOT NULL,
    basic_xp INT,
    hit_point_xp INT,
    special_ability_xp INT,
    exceptional_ability_xp INT
);
CREATE TABLE hit_dice_range
(
    id INT PRIMARY KEY NOT NULL,
    min_hit_die INT,
    min_hit_die_modifier INT,
    max_hit_die INT,
    max_hit_die_modifier INT
);
CREATE TABLE monster_type
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(20),
    attack_count INT,
    weapon_attack_flag TINYINT,
    damage_per_attack VARCHAR(50),
    hit_dice INT,
    armor_class INT,
    size CHAR(1),
    movement VARCHAR(5),
    treasure VARCHAR(15),
    special_ability_count INT,
    special_abilities VARCHAR(255),
    exceptional_ability_count INT,
    exceptional_abilities VARCHAR(255),
    intelligence VARCHAR(10),
    alignment VARCHAR(5),
    rarity VARCHAR(15),
    hit_die_modifier INT
);
