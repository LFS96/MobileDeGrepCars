SELECT c.*,
       co.category as color_category,
       m.country,
       count(DISTINCT  f.id) as features,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE1x%', 'X', '')   as F1,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE2x%', 'X', '')   as F2,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE3x%', 'X', '')   as F3,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE4x%', 'X', '')   as F4,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE5x%', 'X', '')   as F5,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE6x%', 'X', '')   as F6,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE7x%', 'X', '')   as F7,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE8x%', 'X', '')   as F8,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE9x%', 'X', '')   as F9,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE10x%', 'X', '')  as F10,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE11x%', 'X', '')  as F11,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE12x%', 'X', '')  as F12,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE13x%', 'X', '')  as F13,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE14x%', 'X', '')  as F14,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE15x%', 'X', '')  as F15,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE16x%', 'X', '')  as F16,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE17x%', 'X', '')  as F17,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE18x%', 'X', '')  as F18,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE19x%', 'X', '')  as F19,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE20x%', 'X', '')  as F20,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE21x%', 'X', '')  as F21,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE22x%', 'X', '')  as F22,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE23x%', 'X', '')  as F23,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE24x%', 'X', '')  as F24,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE25x%', 'X', '')  as F25,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE26x%', 'X', '')  as F26,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE27x%', 'X', '')  as F27,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE28x%', 'X', '')  as F28,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE29x%', 'X', '')  as F29,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE30x%', 'X', '')  as F30,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE31x%', 'X', '')  as F31,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE32x%', 'X', '')  as F32,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE33x%', 'X', '')  as F33,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE34x%', 'X', '')  as F34,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE35x%', 'X', '')  as F35,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE36x%', 'X', '')  as F36,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE37x%', 'X', '')  as F37,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE38x%', 'X', '')  as F38,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE39x%', 'X', '')  as F39,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE40x%', 'X', '')  as F40,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE41x%', 'X', '')  as F41,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE42x%', 'X', '')  as F42,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE43x%', 'X', '')  as F43,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE44x%', 'X', '')  as F44,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE45x%', 'X', '')  as F45,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE46x%', 'X', '')  as F46,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE47x%', 'X', '')  as F47,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE48x%', 'X', '')  as F48,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE49x%', 'X', '')  as F49,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE50x%', 'X', '')  as F50,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE51x%', 'X', '')  as F51,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE52x%', 'X', '')  as F52,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE53x%', 'X', '')  as F53,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE54x%', 'X', '')  as F54,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE55x%', 'X', '')  as F55,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE56x%', 'X', '')  as F56,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE57x%', 'X', '')  as F57,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE58x%', 'X', '')  as F58,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE59x%', 'X', '')  as F59,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE60x%', 'X', '')  as F60,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE61x%', 'X', '')  as F61,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE62x%', 'X', '')  as F62,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE63x%', 'X', '')  as F63,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE64x%', 'X', '')  as F64,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE65x%', 'X', '')  as F65,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE66x%', 'X', '')  as F66,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE67x%', 'X', '')  as F67,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE68x%', 'X', '')  as F68,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE69x%', 'X', '')  as F69,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE70x%', 'X', '')  as F70,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE71x%', 'X', '')  as F71,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE72x%', 'X', '')  as F72,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE73x%', 'X', '')  as F73,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE74x%', 'X', '')  as F74,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE75x%', 'X', '')  as F75,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE76x%', 'X', '')  as F76,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE77x%', 'X', '')  as F77,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE78x%', 'X', '')  as F78,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE79x%', 'X', '')  as F79,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE80x%', 'X', '')  as F80,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE81x%', 'X', '')  as F81,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE82x%', 'X', '')  as F82,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE83x%', 'X', '')  as F83,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE84x%', 'X', '')  as F84,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE85x%', 'X', '')  as F85,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE86x%', 'X', '')  as F86,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE87x%', 'X', '')  as F87,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE88x%', 'X', '')  as F88,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE89x%', 'X', '')  as F89,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE90x%', 'X', '')  as F90,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE91x%', 'X', '')  as F91,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE92x%', 'X', '')  as F92,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE93x%', 'X', '')  as F93,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE94x%', 'X', '')  as F94,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE95x%', 'X', '')  as F95,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE96x%', 'X', '')  as F96,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE97x%', 'X', '')  as F97,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE98x%', 'X', '')  as F98,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE99x%', 'X', '')  as F99,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE100x%', 'X', '') as F100,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE101x%', 'X', '') as F101,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE102x%', 'X', '') as F102,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE103x%', 'X', '') as F103,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE104x%', 'X', '') as F104,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE105x%', 'X', '') as F105,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE106x%', 'X', '') as F106,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE107x%', 'X', '') as F107,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE108x%', 'X', '') as F108,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE109x%', 'X', '') as F109,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE110x%', 'X', '') as F110,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE111x%', 'X', '') as F111,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE112x%', 'X', '') as F112,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE113x%', 'X', '') as F113,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE114x%', 'X', '') as F114,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE115x%', 'X', '') as F115,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE116x%', 'X', '') as F116,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE117x%', 'X', '') as F117
  FROM cars  as c
         LEFT JOIN color co on c.color = co.color
         LEFT JOIN manufacturer m on c.manufacturer = m.manufacturer
         LEFT JOIN cars_features as cf ON c.id = cf.car
         INNER JOIN features AS f ON cf.feature = f.id
    WHERE 1=1
            AND registration is not null
            AND c.color is not null
           AND c.color <> ""
            AND model is not null
            AND m.manufacturer is not null
            AND c.category is not null
            AND c.category LIKE  "%Kleinwagen%"
            AND damage = "Unfallfrei"
            AND model NOT IN ("A3", "Golf", "Leon")
            AND year(registration) BETWEEN 2010 AND 2014
    GROUP BY id, co.category, m.country;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));