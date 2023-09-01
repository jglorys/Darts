package com.darts.Service;

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
public class RaiseGradeService {
    @Autowired
    private RaiseGradeRepository raiseGradeRepository;

    public List<Map> findAll() {
        List<Map> members = new ArrayList<>();
        ObjectMapper om = new ObjectMapper();
        raiseGradeRepository.findAll().forEach(e -> members.add(om.convertValue(e, Map.class)));
        return members;
    }

    public void save(RaiseGrade user) {
        raiseGradeRepository.save(user);
    }

}
