package com.darts;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DartsController {

    @GetMapping("/darts")
    public String darts(HttpServletRequest request) {
        return "darts";
    }
}
