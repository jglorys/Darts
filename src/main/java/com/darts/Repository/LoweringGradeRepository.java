package com.darts.Repository;

import com.darts.Vo.LoweringGrade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LoweringGradeRepository extends JpaRepository<LoweringGrade, Long> {

    List<LoweringGrade> findAll();
}