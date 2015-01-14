package net.wittig.monster.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.web.bind.annotation.*;

@RestController
public class EncounterController {

    @Autowired
    private JdbcTemplate jdbcOperations;

    @RequestMapping("/controller/encounter")
    public String test() {

        System.out.println("get");
        return "hello, monsters";
    }

    @RequestMapping(value="/controller/encounter", method=RequestMethod.POST)
    public HttpEntity<Number> post(@RequestBody Encounter encounter) {

        System.out.println("post");
        Number id = new SimpleJdbcInsert(jdbcOperations)
                .withTableName("encounter")
                .usingColumns("name")
                .usingGeneratedKeyColumns("id")
                .executeAndReturnKey(new BeanPropertySqlParameterSource(encounter));
        return ResponseEntity.ok(id);
    }

    @RequestMapping(value="/controller/encounter/{encounterId}", method=RequestMethod.POST)
    public String post(@RequestBody Encounter encounter, @PathVariable Integer encounterId) {

        System.out.println("post");
        MapSqlParameterSource parameterSource = new MapSqlParameterSource().addValue("name", encounter.getName()).addValue("id", encounterId);
        jdbcOperations.update("update encounter set name=:name where id=:id", parameterSource);
        return "success";
    }

    @RequestMapping(value="/controller/encounter/{encounterId}/monster-type", method=RequestMethod.POST)
    public String post(@RequestBody(required = false) EncounterMonsterType encounterMonsterType, @PathVariable Integer encounterId) {

        deleteEncounterMonsterTypes(encounterId);
        SimpleJdbcInsert insert = new SimpleJdbcInsert(jdbcOperations)
                .withTableName("encounter_monster_type")
                .usingColumns("encounter_id, monster_type_id, strategy, notes");
        insertEncounterMonsterTypes(encounterId, insert, encounterMonsterType);
        deleteEncounterMonsters(encounterId, encounterMonsterType);
        for (EncounterMonster encounterMonster : encounterMonsterType.getEncounterMonsters()) {
            insertEncounterMonster(encounterId, encounterMonsterType, encounterMonster);
        }
        System.out.println("post");
        return "hello, monsters";
    }

    private void insertEncounterMonster(Integer encounterId, EncounterMonsterType encounterMonsterType, EncounterMonster encounterMonster) {
        SqlParameterSource params = new MapSqlParameterSource()
                .addValue("encounterId", encounterId)
                .addValue("monsterTypeId", encounterMonsterType.getMonsterType().getId())
                .addValue("hitPoints", encounterMonster.getHitPoints())
                .addValue("deadFlag", encounterMonster.isDead());
        new SimpleJdbcInsert(jdbcOperations)
                .withTableName("encounter_monster")
                .usingColumns("encounter_id, monster_type_id, hit_points, dead_flag")
                .execute(params);
    }

    private int deleteEncounterMonsterTypes(Integer encounterId) {
        return jdbcOperations.update("delete from encounter_monster_type where encounter_id = ?", encounterId);
    }

    private void insertEncounterMonsterTypes(Integer encounterId, SimpleJdbcInsert insert, EncounterMonsterType encounterMonsterType) {
        SqlParameterSource parameterSource = new MapSqlParameterSource()
                .addValue("encounterId", encounterId)
                .addValue("monsterTypeId", encounterMonsterType.getMonsterType().getId())
                .addValue("strategy", encounterMonsterType.getStrategy())
                .addValue("notes", encounterMonsterType.getNotes());
        insert.execute(parameterSource);
    }

    private void deleteEncounterMonsters(Integer encounterId, EncounterMonsterType encounterMonsterType) {
        SqlParameterSource deleteParams = new MapSqlParameterSource()
                .addValue("encounterId", encounterId)
                .addValue("monsterTypeId", encounterMonsterType.getMonsterType().getId());
        jdbcOperations.update("delete from encounter_monster where encounter_id = :encounterId and monster_type_id = :monsterTypeId", deleteParams);
    }
}
