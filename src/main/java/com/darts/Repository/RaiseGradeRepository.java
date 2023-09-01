package com.darts.Repository;

import com.darts.Vo.RaiseGrade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RaiseGradeRepository extends JpaRepository<RaiseGrade, Long> {

    List<RaiseGrade> findAll();
}