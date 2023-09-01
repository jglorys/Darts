package com.darts.Service;

import com.darts.Repository.LoweringGradeRepository;
import com.darts.Repository.RaiseGradeRepository;
import com.darts.Vo.LoweringGrade;
import com.darts.Vo.RaiseGrade;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class LoweringGradeService {
    @Autowired
    private LoweringGradeRepository loweringGradeRepository;

    public List<Map> findAll() {
        List<Map> members = new ArrayList<>();
        ObjectMapper om = new ObjectMapper();
        loweringGradeRepository.findAll().forEach(e -> members.add(om.convertValue(e, Map.class)));
        return members;
    }

    public void save(LoweringGrade user) {
        loweringGradeRepository.save(user);
    }

}