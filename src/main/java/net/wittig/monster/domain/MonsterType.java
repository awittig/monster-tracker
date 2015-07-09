package net.wittig.monster.domain;

public class MonsterType {

    private Integer id;
    private String name;
    private Integer attackCount;
    private boolean weaponAttackFlag;
    private Integer hitDice;
    private Integer armorClass;
    private String size;
    private String movement;
    private String treasre;
    private Integer specialAbilityCount;
    private String specialAbilities;
    private Integer exceptionalAbilityCount;
    private String exceptionalAbilities;
    private String intelligence;
    private String alignment;
    private String rarity;
    private Integer hitDieModifier;
    private String notes;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {

        return name;
    }

    public void setName(String name) {

        this.name = name;
    }

    public Integer getAttackCount() {

        return attackCount;
    }

    public void setAttackCount(Integer attackCount) {

        this.attackCount = attackCount;
    }

    public boolean isWeaponAttackFlag() {

        return weaponAttackFlag;
    }

    public void setWeaponAttackFlag(boolean weaponAttackFlag) {

        this.weaponAttackFlag = weaponAttackFlag;
    }

    public Integer getHitDice() {

        return hitDice;
    }

    public void setHitDice(Integer hitDice) {

        this.hitDice = hitDice;
    }

    public Integer getArmorClass() {

        return armorClass;
    }

    public void setArmorClass(Integer armorClass) {

        this.armorClass = armorClass;
    }

    public String getSize() {

        return size;
    }

    public void setSize(String size) {

        this.size = size;
    }

    public String getMovement() {

        return movement;
    }

    public void setMovement(String movement) {

        this.movement = movement;
    }

    public String getTreasre() {

        return treasre;
    }

    public void setTreasre(String treasre) {

        this.treasre = treasre;
    }

    public Integer getSpecialAbilityCount() {

        return specialAbilityCount;
    }

    public void setSpecialAbilityCount(Integer specialAbilityCount) {

        this.specialAbilityCount = specialAbilityCount;
    }

    public String getSpecialAbilities() {

        return specialAbilities;
    }

    public void setSpecialAbilities(String specialAbilities) {

        this.specialAbilities = specialAbilities;
    }

    public Integer getExceptionalAbilityCount() {

        return exceptionalAbilityCount;
    }

    public void setExceptionalAbilityCount(Integer exceptionalAbilityCount) {

        this.exceptionalAbilityCount = exceptionalAbilityCount;
    }

    public String getExceptionalAbilities() {

        return exceptionalAbilities;
    }

    public void setExceptionalAbilities(String exceptionalAbilities) {

        this.exceptionalAbilities = exceptionalAbilities;
    }

    public String getIntelligence() {

        return intelligence;
    }

    public void setIntelligence(String intelligence) {

        this.intelligence = intelligence;
    }

    public String getAlignment() {

        return alignment;
    }

    public void setAlignment(String alignment) {

        this.alignment = alignment;
    }

    public String getRarity() {

        return rarity;
    }

    public void setRarity(String rarity) {

        this.rarity = rarity;
    }

    public Integer getHitDieModifier() {

        return hitDieModifier;
    }

    public void setHitDieModifier(Integer hitDieModifier) {

        this.hitDieModifier = hitDieModifier;
    }

    public String getNotes() {

        return notes;
    }

    public void setNotes(String notes) {

        this.notes = notes;
    }
}
