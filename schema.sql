Create table GenericMonsters (
    MonsterName varchar(20),
    NumAttacks int,
    WeaponAttack tinyint,
    DamagePerAttack varchar(50),
    HD int,
    AC int,
    Size char(1),
    Movement varchar(5),
    Treasure varchar(15),
    NumSpecialAbilities int,
    SpecialAbilities varchar(255),
    NumExceptionalAbilities int,
    ExceptionalAbilities varchar (255),
    Intelligence varchar (10),
    Alignment varchar(5),
    Rarity varchar(15)
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