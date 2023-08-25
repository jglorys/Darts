package com.darts;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DartsController {

    @GetMapping("/ella/darts")
    public String darts(HttpServletRequest request) {
        return "Darts";
    }

    @GetMapping("/ella/darts/raise")
    public String raise() {
        return "RaiseTheScore";
    }

    @GetMapping("/ella/darts/lowering")
    public String lowering() {
        return "LoweringTheScore";
    }


}
