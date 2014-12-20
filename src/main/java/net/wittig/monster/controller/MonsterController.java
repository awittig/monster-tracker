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

        List<Map<String, Object>> monsters = jdbcOperations.queryForList("select * from GenericMonsters", new HashMap<String,Object>());
        Gson gson = new Gson();
        return gson.toJson(monsters);
    }

    @RequestMapping(value = "monster", method = RequestMethod.POST)
    public String saveMonster(@RequestParam Map<String, String> params) {

        System.out.println(params);
        params.put("weaponAttack", params.containsKey("weaponAttack") ? "1" : "0");
        jdbcOperations.update("insert into GenericMonsters" +
                        "(MonsterName, NumAttacks, WeaponAttack, DamagePerAttack, HD, HitModifier, AC, Size, Movement, Treasure," +
                        " NumSpecialAbilities, SpecialAbilities, NumExceptionalAbilities, ExceptionalAbilities, Intelligence, Alignment, Rarity)" +
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

        String query = "select e.* from HitDiceRange hdr" +
                " join Experience e" +
                "   on hdr.id = e.HitDiceRangeId" +
                " where (hdr.MinHitDie < :hitDice and :hitDice < hdr.MaxHitDie)" +
                "   or (:hitDice = hdr.MinHitDie and :mod >= hdr.MinModifier and (:hitDice < hdr.MaxHitDie or (:hitDice = hdr.MaxHitDie and :mod <= hdr.MaxModifier)))" +
                "   or (:hitDice = hdr.MaxHitDie and :mod <= hdr.MaxModifier and (:hitDice > hdr.MinHitDie or (:hitDice = hdr.MinHitDie and :mod >= hdr.MinModifier)))";

        SqlParameterSource params = new MapSqlParameterSource()
                .addValue("hitDice", hitDice)
                .addValue("mod", modifier);

        List<Map<String, Object>> experience = jdbcOperations.queryForList(query, params);
        return new Gson().toJson(experience);
    }
}
