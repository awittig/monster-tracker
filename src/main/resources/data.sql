insert into GenericMonsters values (

    'Santa',
    2,
    true,
    25,
    9,
    2,
    'M',
    '100',
    'infinite toys',
    3,
    'faster than light travel, flight, omniscience',
    0,
    '',
    18,
    'neutr',
    'rare'
),(
      'Elf',
      1,
      true,
      2,
      1,
      5,
      'S',
      '10',
      'magical hammer',
      2,
      'holiday cheer, work ethic',
      0,
      '',
      13,
      'NG',
      'rare'
  );

insert into Experience (HitDiceRangeId, BasicXP, HitPointXP, SpecialAbilityXP, ExceptionalAbilityXP) values
(1, 5, 1, 2, 25),
(2, 10, 1, 4, 35),
(3, 20, 2, 8, 45),
(4, 35, 3, 15, 55),
(5, 60, 4, 25, 65),
(6, 90, 5, 40, 75)
;
insert into HitDiceRange (Id, MinHitDie, MinModifier, MaxHitDie, MaxModifier) values
(1, 0, 0, 1, -2),
(2, 1, -1, 1, 0),
(3, 1, 1, 2, 0),
(4, 2, 1, 3, 0),
(5, 3, 1, 4, 0),
(6, 4, 1, 5, 0)
;