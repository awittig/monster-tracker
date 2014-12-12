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
public class MonsterController {

    @Autowired
    private NamedParameterJdbcOperations jdbcOperations;

    @RequestMapping(value="monsters", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    public String monsters() {

        List<Map<String, Object>> monsters = jdbcOperations.queryForList("select * from GenericMonsters", new HashMap<String,Object>());
        Gson gson = new Gson();
        return gson.toJson(monsters);
    }

    @RequestMapping(value = "base-xp", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
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
