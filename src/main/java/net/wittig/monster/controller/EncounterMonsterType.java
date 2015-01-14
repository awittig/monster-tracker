package net.wittig.monster.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class EncounterMonsterType {

    private MonsterType monsterType;
    private List<EncounterMonster> encounterMonsters = new ArrayList<>();
    private String strategy;
    private String notes;

    public MonsterType getMonsterType() {

        return monsterType;
    }

    public void setMonsterType(MonsterType monsterType) {

        this.monsterType = monsterType;
    }

    public List<EncounterMonster> getEncounterMonsters() {

        return encounterMonsters;
    }

    public void setEncounterMonsters(List<EncounterMonster> encounterMonsters) {

        this.encounterMonsters = encounterMonsters;
    }

    public void addEncounterMonsters(EncounterMonster...encounterMonsters) {

        this.encounterMonsters.addAll(Arrays.asList(encounterMonsters));
    }

    public String getStrategy() {
        return strategy;
    }

    public void setStrategy(String strategy) {
        this.strategy = strategy;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
