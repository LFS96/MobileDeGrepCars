CREATE TABLE data as (
SELECT c.*,
       co.category                                                                   as color_category,
       co.codierung                                                                  as color_code,
       co.metalic                                                                    as metalic,
       co.base_color                                                                 as color,
       m.country,
       l.lat,
       l.lon,
       l3.*,
       ifnull(r.population, 9833)                                                    as population,
       (
           SELECT sum(r2.population) as count
           FROM residents as r2
                    INNER JOIN location l2 on r2.zip = l2.zip
           WHERE l.lat + 0.1356 >= l2.lat
             AND l.lat - 0.1356 <= l2.lat
             AND l.lon + (15 / 111.320 * cos(l.lat)) <= l2.lon
             AND l.lon - (15 / 111.320 * cos(l.lat)) >= l2.lon
       )                                                                             as pop15,
       count(DISTINCT f.id)                                                          as features,
       # region Features
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE1x%', '1', '0')   as F1,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE2x%', '1', '0')   as F2,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE3x%', '1', '0')   as F3,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE4x%', '1', '0')   as F4,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE5x%', '1', '0')   as F5,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE6x%', '1', '0')   as F6,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE7x%', '1', '0')   as F7,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE8x%', '1', '0')   as F8,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE9x%', '1', '0')   as F9,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE10x%', '1', '0')  as F10,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE11x%', '1', '0')  as F11,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE12x%', '1', '0')  as F12,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE13x%', '1', '0')  as F13,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE14x%', '1', '0')  as F14,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE15x%', '1', '0')  as F15,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE16x%', '1', '0')  as F16,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE17x%', '1', '0')  as F17,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE18x%', '1', '0')  as F18,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE19x%', '1', '0')  as F19,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE20x%', '1', '0')  as F20,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE21x%', '1', '0')  as F21,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE22x%', '1', '0')  as F22,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE23x%', '1', '0')  as F23,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE24x%', '1', '0')  as F24,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE25x%', '1', '0')  as F25,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE26x%', '1', '0')  as F26,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE27x%', '1', '0')  as F27,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE28x%', '1', '0')  as F28,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE29x%', '1', '0')  as F29,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE30x%', '1', '0')  as F30,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE31x%', '1', '0')  as F31,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE32x%', '1', '0')  as F32,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE33x%', '1', '0')  as F33,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE34x%', '1', '0')  as F34,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE35x%', '1', '0')  as F35,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE36x%', '1', '0')  as F36,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE37x%', '1', '0')  as F37,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE38x%', '1', '0')  as F38,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE39x%', '1', '0')  as F39,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE40x%', '1', '0')  as F40,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE41x%', '1', '0')  as F41,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE42x%', '1', '0')  as F42,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE43x%', '1', '0')  as F43,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE44x%', '1', '0')  as F44,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE45x%', '1', '0')  as F45,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE46x%', '1', '0')  as F46,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE47x%', '1', '0')  as F47,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE48x%', '1', '0')  as F48,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE49x%', '1', '0')  as F49,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE50x%', '1', '0')  as F50,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE51x%', '1', '0')  as F51,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE52x%', '1', '0')  as F52,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE53x%', '1', '0')  as F53,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE54x%', '1', '0')  as F54,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE55x%', '1', '0')  as F55,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE56x%', '1', '0')  as F56,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE57x%', '1', '0')  as F57,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE58x%', '1', '0')  as F58,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE59x%', '1', '0')  as F59,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE60x%', '1', '0')  as F60,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE61x%', '1', '0')  as F61,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE62x%', '1', '0')  as F62,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE63x%', '1', '0')  as F63,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE64x%', '1', '0')  as F64,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE65x%', '1', '0')  as F65,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE66x%', '1', '0')  as F66,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE67x%', '1', '0')  as F67,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE68x%', '1', '0')  as F68,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE69x%', '1', '0')  as F69,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE70x%', '1', '0')  as F70,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE71x%', '1', '0')  as F71,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE72x%', '1', '0')  as F72,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE73x%', '1', '0')  as F73,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE74x%', '1', '0')  as F74,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE75x%', '1', '0')  as F75,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE76x%', '1', '0')  as F76,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE77x%', '1', '0')  as F77,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE78x%', '1', '0')  as F78,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE79x%', '1', '0')  as F79,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE80x%', '1', '0')  as F80,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE81x%', '1', '0')  as F81,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE82x%', '1', '0')  as F82,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE83x%', '1', '0')  as F83,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE84x%', '1', '0')  as F84,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE85x%', '1', '0')  as F85,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE86x%', '1', '0')  as F86,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE87x%', '1', '0')  as F87,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE88x%', '1', '0')  as F88,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE89x%', '1', '0')  as F89,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE90x%', '1', '0')  as F90,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE91x%', '1', '0')  as F91,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE92x%', '1', '0')  as F92,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE93x%', '1', '0')  as F93,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE94x%', '1', '0')  as F94,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE95x%', '1', '0')  as F95,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE96x%', '1', '0')  as F96,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE97x%', '1', '0')  as F97,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE98x%', '1', '0')  as F98,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE99x%', '1', '0')  as F99,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE100x%', '1', '0') as F100,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE101x%', '1', '0') as F101,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE102x%', '1', '0') as F102,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE103x%', '1', '0') as F103,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE104x%', '1', '0') as F104,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE105x%', '1', '0') as F105,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE106x%', '1', '0') as F106,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE107x%', '1', '0') as F107,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE108x%', '1', '0') as F108,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE109x%', '1', '0') as F109,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE110x%', '1', '0') as F110,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE111x%', '1', '0') as F111,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE112x%', '1', '0') as F112,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE113x%', '1', '0') as F113,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE114x%', '1', '0') as F114,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE115x%', '1', '0') as F115,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE116x%', '1', '0') as F116,
       if(GROUP_CONCAT(concat('FEATURE', f.id, 'x')) LIKE '%FEATURE117x%', '1', '0') as F117,
       # endregion
       if(fuel LIKE "%Benzin%", 1, 0)                                                as isBenzin,
       if(fuel LIKE "%Diesel%", 1, 0)                                                as isDiesel,
       if(fuel LIKE "%Autogas (LPG)%", 1, 0)                                         as isLPG,
       if(transmission = "Automatik", 1, 0)                                          as isAutomatik,
       if(transmission = "Halbautomatik", 1, 0)                                      as isHalbautomatik,
       if(transmission = "Schaltgetriebe", 1, 0)                                     as isSchaltgetriebe,
       if(m.country LIKE "%Deutschland%", 0, 1)                                      as Import,
       if(l3.typ LIKE "%Kreis%", 1, 0)                                               as isKreis,
       if(l3.land IN ("Sachsen", "Brandenburg", "Th??ringen", "Sachsen-Anhalt", "Berlin", "Mecklenburg-Vorpommern"), 1,
          0)                                                                         as isOsten,


       # <editor-fold desc="isLand">
       if(land = "Baden-W??rttemberg", 1, 0)                                          as isBadenWuerttemberg,
       if(land = "Bayern", 1, 0)                                                     as isBayern,
       if(land = "Berlin", 1, 0)                                                     as isBerlin,
       if(land = "Brandenburg", 1, 0)                                                as isBrandenburg,
       if(land = "Bremen", 1, 0)                                                     as isBremen,
       if(land = "Hamburg", 1, 0)                                                    as isHamburg,
       if(land = "Hessen", 1, 0)                                                     as isHessen,
       if(land = "Mecklenburg-Vorpommern", 1, 0)                                     as isMecklenburgVorpommern,
       if(land = "Niedersachsen", 1, 0)                                              as isNiedersachsen,
       if(land = "Nordrhein-Westfalen", 1, 0)                                        as isNordrheinWestfalen,
       if(land = "Rheinland-Pfalz", 1, 0)                                            as isRheinlandPfalz,
       if(land = "Saarland", 1, 0)                                                   as isSaarland,
       if(land = "Sachsen", 1, 0)                                                    as isSachsen,
       if(land = "Sachsen-Anhalt", 1, 0)                                             as isSachsenAnhalt,
       if(land = "Schleswig-Holstein", 1, 0)                                         as isSchleswigHolstein,
       if(land = "Th??ringen", 1, 0)                                                  as isThueringen,
       # </editor-fold>
       TIMESTAMPDIFF(MONTH, registration, '2021-11-01')                              as ageInMonths
FROM cars as c
         LEFT JOIN color co on c.color = co.color
         LEFT JOIN manufacturer m on c.manufacturer = m.manufacturer
         LEFT JOIN cars_features as cf ON c.id = cf.car
         INNER JOIN features AS f ON cf.feature = f.id
         INNER JOIN categories c2 on c.model = c2.model AND c2.manufacture = c.manufacturer
         LEFT JOIN location as l ON city = l.zip
         LEFT JOIN residents as r ON city = r.zip
         left join lands l3 on c.city = l3.zip
WHERE registration is not null
  AND c.color is not null
  AND c.color <> ''
  AND m.manufacturer is not null
  AND c2.category IN ('Kleinwagen', 'Kleinstwagen')
  AND damage = 'Unfallfrei'
  AND year(registration) BETWEEN 2010 AND 2014
  AND price <= 45000
  # outlier filter
  AND power < 175
  AND price < 27000
  AND consumption_k > 0
  AND consumption_i > 0
GROUP BY id, co.category, m.country
HAVING features < 60
);

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));