package net.wittig.monster.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class EncounterController {

    @RequestMapping("/controller/encounter")
    public String test() {

        return "hello, monsters";
    }

    @RequestMapping(value="/controller/encounter", method=RequestMethod.POST)
    public String post(@RequestParam Map<String, String> params) {

        System.out.println(params);

        return "hello, monsters";
    }
}
