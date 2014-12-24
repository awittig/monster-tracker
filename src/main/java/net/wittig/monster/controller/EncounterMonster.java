package net.wittig.monster.controller;

public class EncounterMonster {

    private Integer hitPoints;
    private Boolean dead;

    public Integer getHitPoints() {
        return hitPoints;
    }

    public void setHitPoints(Integer hitPoints) {
        this.hitPoints = hitPoints;
    }

    public Boolean isDead() {
        return dead;
    }

    public void setDead(Boolean dead) {
        this.dead = dead;
    }
}
