package com.darts.Controller;

import com.darts.Service.LoweringGradeService;
import com.darts.Service.RaiseGradeService;
import com.darts.Vo.LoweringGrade;
import com.darts.Vo.RaiseGrade;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DartsController {

    @Autowired
    LoweringGradeService loweringGradeService;

    @Autowired
    RaiseGradeService raiseGradeService;

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
