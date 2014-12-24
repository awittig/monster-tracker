package net.wittig.monster.controller;

import org.springframework.web.bind.annotation.*;

@RestController
public class EncounterController {

    @RequestMapping("/controller/encounter")
    public String test() {

        System.out.println("get");
        return "hello, monsters";
    }

    @RequestMapping(value="/controller/encounter", method=RequestMethod.POST)
    public String post(@RequestBody(required = false) Encounter encounter) {

        System.out.println("post");
        return "hello, monsters";
    }

    @RequestMapping(value="/controller/encounter/{encounterId}/monster-type", method=RequestMethod.POST)
    public String post(@RequestBody(required = false) EncounterMonsterType encounterMonsterType, @PathVariable Integer encounterId) {

        System.out.println("post");
        return "hello, monsters";
    }
}
