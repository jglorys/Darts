<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <link rel="stylesheet" href="/webjars/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

    <style>
        /*색상조합 링크*/
        /*https://colorhunt.co/palette/b5c99a862b0dfff9c9ffc95f*/
        /*커서모양 링크*/
        /*https://www.cursor.cc/?action=icon&file_id=84224*/
        body, button, input, button:hover, div:hover {
            cursor: url('data:image/x-icon;base64,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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAT0xP/1xUXP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFxUXP9cVFz/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABhXlz/T0xP/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGFeXP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA////////gP///wAH//kAA//4AAP/8AAB/+AAAP/gAAD/4AAB/8AAAf/AAAD/gAAA/4AAAP+AAAD/gAAA/wAAAf8gAAH+AAAD/AAAA/wAAAf4AAAP+AAAP/gAAP/wAE//8AH///AH///wH///4H///8////+f////P////3////8='), default;
        }
        #body-wrapper {
            max-height: 100vh;
            height: 100vh;
            position: relative;
        }
        footer {
            width: 100%;
            height: 10vh; /* footer의 높이 */
            position: absolute;
            bottom: 0;
            left: 0;
        }
        .funcBtn1 {
            background-color: #862B0D;
            color: #ffffff;
            width: 30vh;
            height: 50vh;
            border-radius: 0px !important;
            transition: all 0.2s linear;
            margin: 30px;
            border: transparent;
        }
        .upHoverBtn {
            display: none;
        }
        .funcBtn1:hover {
            background-color: #FFC95F; /* 원하는 배경색으로 변경 */
            color: #862B0D;
            border-color: transparent; /* 테두리 색 변경 */
            transform: scale(1.2);
        }
        .upHoverBtn {
            border-color: #862B0D;
            border-radius: 0px !important;
            margin: 10px;
        }

    </style>
    <link rel="icon" href="img/logo/favicon.png"/>
    <title>Darts</title>
</head>

<body>
<div class="col-12 p-3" id="body-wrapper">
    <section class="col-12 d-flex justify-content-center align-items-center">
        <div class="col-8 d-flex justify-content-around align-items-center" style="height: 90vh;">
            <div>
                <div class="btn funcBtn1 d-flex align-items-center justify-content-center" onclick="gamePage(0)">
                    <span>RAISE<br>THE<br>SCORE</span>
                </div>
                <div class="btn funcBtn1 d-flex align-items-center justify-content-center" style="height: 10vh !important;" onclick="gradePage('up')">
                    <span>RAISE<br>RANKING</span>
                </div>
            </div>
            <div>
                <div id="loweringBtn" class="btn funcBtn1 d-flex align-items-center justify-content-center">
                    <div>
                        <span>LOWERING<br>THE<br>SCORE</span>
                        <div class="d-flex justify-content-center align-items-center mt-4">
                            <button class="btn upHoverBtn" onclick="gamePage(301)" >301</button>
                            <button class="btn upHoverBtn" onclick="gamePage(401)" >401</button>
                            <button class="btn upHoverBtn" onclick="gamePage(501)" >501</button>
                        </div>
                    </div>
                </div>
                <div class="btn funcBtn1 d-flex align-items-center justify-content-center" style="height: 10vh !important;" onclick="gradePage('down')">
                    <span>LOWERING<br>RANKING</span>
                </div>
            </div>

        </div>
        <footer class="footer d-flex justify-content-center align-items-center">
            <span>Copyright 2023. ELLA. All rights reserved.</span>
        </footer>
    </section>
</div>
</body>
<script>
    function gamePage(score) {
        if (score == 0) {
            location.href = '${pageContext.request.contextPath}/ella/darts/raise';
        } else {
            location.href = '${pageContext.request.contextPath}/ella/darts/lowering?score=' + score;
        }
    }
    function gradePage(game) {
        location.href = '${pageContext.request.contextPath}/ella/rank?game=' + game;
    }

    $("#loweringBtn").on('mouseover', function(){
        $(".upHoverBtn").css('display', 'block');
    });


    $("#loweringBtn").on('mouseout', function(){
        $(".upHoverBtn").css('display', 'none');
    });


</script>
</html>