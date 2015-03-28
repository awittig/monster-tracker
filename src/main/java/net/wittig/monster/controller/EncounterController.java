package net.wittig.monster.controller;

import net.wittig.monster.service.ExperienceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.web.bind.annotation.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@RestController
public class EncounterController {

    @Autowired
    private JdbcTemplate jdbcOperations;

    @Autowired
    private NamedParameterJdbcOperations namedParameterJdbcOperations;

    @Autowired
    private ExperienceService experienceService;

    @RequestMapping(value = "controller/encounters", method = RequestMethod.GET)
    public HttpEntity<List<Encounter>> getAll() {

        List<Encounter> encounters = jdbcOperations.query("select id, name from encounter", BeanPropertyRowMapper.newInstance(Encounter.class));
        return ResponseEntity.ok(encounters);
    }

    @RequestMapping(value = "controller/encounter/{encounterId}", method=RequestMethod.GET)
    public HttpEntity<Encounter> getEncounter(@PathVariable Integer encounterId) {

        Encounter encounter = jdbcOperations.queryForObject(
                "select id, name from encounter where id=?", BeanPropertyRowMapper.newInstance(Encounter.class), encounterId);

        RowMapper<EncounterMonsterType> encounterMonsterTypeRowMapper = new RowMapper<EncounterMonsterType>() {
            @Override
            public EncounterMonsterType mapRow(ResultSet rs, int rowNum) throws SQLException {

                EncounterMonsterType encounterMonsterType = new EncounterMonsterType();
                MonsterType monsterType = new MonsterType();
                monsterType.setId(rs.getInt("monster_type_id"));
                encounterMonsterType.setNotes(rs.getString("notes"));
                encounterMonsterType.setStrategy(rs.getString("strategy"));
                encounterMonsterType.setTreasure(rs.getString("treasure"));
                encounterMonsterType.setMonsterType(monsterType);
                return encounterMonsterType;
            }
        };
        List<EncounterMonsterType> encounterMonsterTypes = jdbcOperations.query(
                "select monster_type_id, strategy, notes, treasure from encounter_monster_type where encounter_id = ?", encounterMonsterTypeRowMapper, encounterId);
        encounter.addEncounterMonsterTypes(encounterMonsterTypes);

        for (EncounterMonsterType encounterMonsterType : encounterMonsterTypes) {
            List<EncounterMonster> encounterMonsters = jdbcOperations.query(
                    "select hit_points, dead_flag as dead from encounter_monster where encounter_id = ? and monster_type_id = ?",
                    BeanPropertyRowMapper.newInstance(EncounterMonster.class),
                    encounterId, encounterMonsterType.getMonsterType().getId());
            encounterMonsterType.addEncounterMonsters(encounterMonsters);
        }
        return ResponseEntity.ok(encounter);
    }

    @RequestMapping(value = "controller/encounter/{encounterId}", method=RequestMethod.DELETE)
    public String delete(@PathVariable Integer encounterId) {

        jdbcOperations.update("delete from encounter_monster where encounter_id = ?", encounterId);
        jdbcOperations.update("delete from encounter_monster_type where encounter_id = ?", encounterId);
        jdbcOperations.update("delete from encounter where id = ?", encounterId);
        return "success";
    }

    @RequestMapping(value = "/controller/encounter", method = RequestMethod.POST)
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
    public HttpEntity<Number> post(@RequestBody Encounter encounter, @PathVariable Integer encounterId) {

        System.out.println("post");
        jdbcOperations.update("update encounter set name=? where id=?", encounter.getName(), encounterId);
        return ResponseEntity.ok(encounterId);
    }

    @RequestMapping(value="/controller/encounter/{encounterId}/monster-type", method=RequestMethod.POST)
    public String post(@RequestBody(required = false) EncounterMonsterType encounterMonsterType, @PathVariable Integer encounterId) {

//        deleteEncounterMonsterTypes(encounterId);
        insertEncounterMonsterTypes(encounterId, encounterMonsterType);
        deleteEncounterMonsters(encounterId, encounterMonsterType);
        for (EncounterMonster encounterMonster : encounterMonsterType.getEncounterMonsters()) {
            insertEncounterMonster(encounterId, encounterMonsterType, encounterMonster);
        }
        System.out.println("post");
        return "saved monster types";
    }

    private void insertEncounterMonster(Integer encounterId, EncounterMonsterType encounterMonsterType, EncounterMonster encounterMonster) {
        SqlParameterSource params = new MapSqlParameterSource()
                .addValue("encounterId", encounterId)
                .addValue("monsterTypeId", encounterMonsterType.getMonsterType().getId())
                .addValue("hitPoints", encounterMonster.getHitPoints())
                .addValue("deadFlag", encounterMonster.isDead());
        new SimpleJdbcInsert(jdbcOperations)
                .withTableName("encounter_monster")
                .usingColumns("encounter_id", "monster_type_id", "hit_points", "dead_flag")
                .execute(params);
    }

    private int deleteEncounterMonsterTypes(Integer encounterId) {
        return jdbcOperations.update("delete from encounter_monster_type where encounter_id = ?", encounterId);
    }

    private void insertEncounterMonsterTypes(Integer encounterId, EncounterMonsterType encounterMonsterType) {
        SqlParameterSource parameterSource = new MapSqlParameterSource()
                .addValue("encounterId", encounterId)
                .addValue("monsterTypeId", encounterMonsterType.getMonsterType().getId())
                .addValue("strategy", encounterMonsterType.getStrategy())
                .addValue("notes", encounterMonsterType.getNotes())
                .addValue("treasure", encounterMonsterType.getTreasure());
        namedParameterJdbcOperations.update("replace into encounter_monster_type (encounter_id, monster_type_id, strategy, notes, treasure)" +
                " values (:encounterId, :monsterTypeId, :strategy, :notes, :treasure)", parameterSource);
    }

    private void deleteEncounterMonsters(Integer encounterId, EncounterMonsterType encounterMonsterType) {
        jdbcOperations.update("delete from encounter_monster where encounter_id = ? and monster_type_id = ?",
                encounterId, encounterMonsterType.getMonsterType().getId());
    }

    @RequestMapping(value="/controller/encounter/{encounterId}/xp", method=RequestMethod.GET)
    public ResponseEntity<Integer> calculateEncounterXp(@PathVariable Long encounterId) {

        Integer xp = experienceService.calculateEncounterXp(encounterId);
        return ResponseEntity.ok(xp);
    }
}
