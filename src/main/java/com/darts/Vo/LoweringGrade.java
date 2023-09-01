package com.darts.Vo;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Entity
@Table
public class LoweringGrade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private int score; // 301 401 501

    @Column(nullable = false)
    private int inning; // 몇 이닝만에 종료했는지

    @Column(nullable = false)
    private String date; // yyyy-MM-dd

    @Builder
    public LoweringGrade(Long id, String name, int score, int inning, String date) {
        this.id = id;
        this.name = name;
        this.score = score;
        this.inning = inning;
        this.date = date;
    }
}
