package com.darts.Controller;

import com.darts.Service.LoweringGradeService;
import com.darts.Service.RaiseGradeService;
import com.darts.Vo.LoweringGrade;
import com.darts.Vo.RaiseGrade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
public class GradeRestController {
    @Autowired
    LoweringGradeService loweringGradeService;

    @Autowired
    RaiseGradeService raiseGradeService;

    @PostMapping("/api/saveRank")
    public Map<String, Object> saveRank(HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date now = new Date();
            String game = request.getParameter("game");
            String name = request.getParameter("name");
            String score = request.getParameter("score");
            String inning = request.getParameter("inning");

            if (game.equals("up")) {
                RaiseGrade obj = RaiseGrade.builder()
                        .name(name)
                        .score(Integer.parseInt(score))
                        .date(sdf.format(now))
                        .build();
                raiseGradeService.save(obj);
            }
            if (game.equals("down")) {
                LoweringGrade obj = LoweringGrade.builder()
                        .name(name)
                        .score(Integer.parseInt(score))
                        .inning(Integer.parseInt(inning))
                        .date(sdf.format(now))
                        .build();
                loweringGradeService.save(obj);
            }
            result.put("result", "success");
        } catch(Exception e) {
            result.put("result", "fail");
            e.printStackTrace();
        }
        return result;
    }

    @PostMapping("/api/getRankList")
    public List<Map> getRankList(HttpServletRequest request) {
        List<Map> result = new ArrayList<>();
        try {
            String game = request.getParameter("game");
            if (game.equals("up")) {
                result = raiseGradeService.findAll();
                result.sort(Comparator.comparing(m -> (Integer) m.get("score"), Comparator.reverseOrder())); // score desc
            }
            if (game.equals("down")) {
                result = loweringGradeService.findAll();
                result.sort(Comparator.comparing(m -> (Integer) m.get("score"), Comparator.reverseOrder())); // score desc
                result.sort(Comparator.comparing(m -> (Integer) m.get("inning"))); // inning asc
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
