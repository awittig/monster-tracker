Create table GenericMonsters (
    MonsterName char(20),
    NumAttacks int,
    WeaponAttack boolean,
    DamagePerAttack char(50),
    HD int,
    AC int,
    Size char(1),
    Movement char(5),
    Treasure char(15),
    NumSpecialAbilities int,
    SpecialAbilities char(255),
    NumExceptionalAbilities int,
    ExceptionalAbilities char (255),
    Intelligence char (10),
    Alignment char(5),
    Rarity char(15)
)
;
create table Experience (
    HitDiceRangeId int primary key,
    BasicXP int,
    HitPointXP int,
    SpecialAbilityXP int,
    ExceptionalAbilityXP int
)
;
create table HitDiceRange (
    Id int primary key,
    MinHitDie int,
    MinModifier int,
    MaxHitDie int,
    MaxModifier int
)
;