package net.wittig.monster.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EncounterController {

    @RequestMapping("/controller/encounter")
    public String test() {

        return "hello, monsters";
    }
}
