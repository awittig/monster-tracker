insert into monster_type values (

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

insert into experience (hit_dice_range_id, basic_xp, hit_point_xp, special_ability_xp, exceptional_ability_xp) values
(1, 5, 1, 2, 25),
(2, 10, 1, 4, 35),
(3, 20, 2, 8, 45),
(4, 35, 3, 15, 55),
(5, 60, 4, 25, 65),
(6, 90, 5, 40, 75)
;
insert into hit_dice_range (id, min_hit_die, min_hit_die_modifier, max_hit_die, max_hit_die_modifier) values
(1, 0, 0, 1, -2),
(2, 1, -1, 1, 0),
(3, 1, 1, 2, 0),
(4, 2, 1, 3, 0),
(5, 3, 1, 4, 0),
(6, 4, 1, 5, 0)
;