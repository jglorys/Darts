package com.darts;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DartsController {

    @GetMapping("/ella/darts")
    public String darts(HttpServletRequest request) {
        return "Darts";
    }

    @GetMapping("/ella/darts/raise")
    public String raise(Model model) {
        model.addAttribute("game", "up");
        return "Game";
    }

    @GetMapping("/ella/darts/lowering")
    public String lowering(Model model, @RequestParam String score) {
        model.addAttribute("game", "down");
        model.addAttribute("score", score);
        return "Game";
    }


}
