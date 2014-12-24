package net.wittig.monster.controller;

import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("controller")
public class MonsterController {

    @Autowired
    private NamedParameterJdbcOperations jdbcOperations;

    @RequestMapping(value="monsters", method=RequestMethod.GET)
    public String monsters() {

        List<Map<String, Object>> monsters = jdbcOperations.queryForList("select * from monster_type", new HashMap<String,Object>());
        Gson gson = new Gson();
        return gson.toJson(monsters);
    }

    @RequestMapping(value = "monster", method = RequestMethod.POST)
    public String saveMonster(@RequestParam Map<String, String> params) {

        System.out.println(params);
        params.put("weaponAttack", params.containsKey("weaponAttack") ? "1" : "0");
        jdbcOperations.update("insert into monster_type" +
                        "(name, attack_count, weapon_attack_flag, damage_per_attack, hit_dice, hit_die_modifier, armor_class, size, movement, treasure," +
                        " special_ability_count, special_abilities, exceptional_ability_count, exceptional_abilities, intelligence, alignment, rarity)" +
                        "values (:name, :numAttacks, :weaponAttack, :damagePerAttack, :HD, :hitModifier, :AC, :size, :movement, :treasure," +
                        " :numSpecialAbilities, :specialAbilities, :numExceptionalAbilities, :exceptionalAbilities, :intelligence, :alignment, :rarity)",
                params);
        return "monster";
    }

    @RequestMapping(value = "monster", method = RequestMethod.GET)
    public String getMonster() {

        return "monster";
    }

    @RequestMapping(value = "base-xp", method = RequestMethod.GET)
    public String baseXp(@RequestParam Integer hitDice, @RequestParam Integer modifier) {

        String query = "select e.* from hit_dice_range hdr" +
                " join experience e" +
                "   on hdr.id = e.hit_dice_range_id" +
                " where (hdr.min_hit_die < :hitDice and :hitDice < hdr.max_hit_die)" +
                "   or (:hitDice = hdr.min_hit_die and :mod >= hdr.min_hit_die_modifier and (:hitDice < hdr.max_hit_die or (:hitDice = hdr.max_hit_die and :mod <= hdr.max_hit_die_modifier)))" +
                "   or (:hitDice = hdr.max_hit_die and :mod <= hdr.max_hit_die_modifier and (:hitDice > hdr.min_hit_die or (:hitDice = hdr.min_hit_die and :mod >= hdr.min_hit_die_modifier)))";

        SqlParameterSource params = new MapSqlParameterSource()
                .addValue("hitDice", hitDice)
                .addValue("mod", modifier);

        List<Map<String, Object>> experience = jdbcOperations.queryForList(query, params);
        return new Gson().toJson(experience);
    }
}
