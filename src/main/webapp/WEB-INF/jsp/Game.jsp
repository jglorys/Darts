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

        #body-wrapper {
            max-height: 100vh;
            height: 100vh;
            position: relative;
        }
        body, button, input, button:hover {
            cursor: url('data:image/x-icon;base64,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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAT0xP/1xUXP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFxUXP9cVFz/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABhXlz/T0xP/wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGFeXP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA////////gP///wAH//kAA//4AAP/8AAB/+AAAP/gAAD/4AAB/8AAAf/AAAD/gAAA/4AAAP+AAAD/gAAA/wAAAf8gAAH+AAAD/AAAA/wAAAf4AAAP+AAAP/gAAP/wAE//8AH///AH///wH///4H///8////+f////P////3////8='), default;
        }
        .table {
            border-color: transparent !important;
        }
        .table td,tr {
            text-align: center !important;
            vertical-align : middle !important;
        }
        .table th {
            border-color: transparent !important;
            background-color: #FFF9C9 !important;
        }
        .table tbody {
            overflow-y: scroll;
            overflow-x: hidden;
            border-color: #B5C99A;
            /*width: 80vh !important;*/
        }
        .funcBtn1 {
            background-color: #862B0D;
            color: #ffffff;
            width: 120px;
            border-radius: 0px !important;
        }

        .funcBtn1:hover {
            background-color: transparent; /* 원하는 배경색으로 변경 */
            color: #862B0D;
            border-color: transparent; /* 테두리 색 변경 */
        }

        .inputGrade {
            /*width: 50% !important;*/
            margin-bottom: 10px !important;
            /*font-size: small;*/
            text-align: center;
            border-radius: 0px !important;
            border-color: transparent !important;
            background-color: transparent !important;
        }
        /*number 우측 증감소 버튼*/
        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .inningTotal, .fullTotal {
            border-color: transparent;
            background-color: transparent;
            outline: none; /* 테두리 제거 */
            max-width: 100%;
            font-size: large;
            text-align: center;
            font-weight: bold;
            color: #862B0D;
        }
        .grade {
            border-color: transparent;
            background-color: transparent;
            outline: none; /* 테두리 제거 */
            max-width: 100%;
            font-size: xx-large;
            text-align: center;
            font-weight: bold;
            color: #862B0D;
        }
        .blink {
            background-color: initial; /* 기존 배경색 설정 제거 */
            animation: background-blink 2s ease-in-out infinite alternate;
        }

        @keyframes background-blink {
            0%, 100% {
                background-color: transparent; /* 배경색 없음 - 클래스 안의 요소에는 투명으로 적용하지 X */
            }
            50% {
                background-color: #B5C99A; /* 원하는 배경색 */
            }
        }

        .inputGrade:disabled {
            background: transparent;
            border: 0px !important;
        }

        .inputGrade:focus {
            outline: none !important;
            /*border-color: var(--bs-border-color) !important;*/
            box-shadow: 0 0 10px transparent;
            border-color: transparent !important;
            caret-color: transparent;
        }
        footer {
            width: 100%;
            height: 10vh; /* footer의 높이 */
            position: absolute;
            bottom: 0;
            left: 0;
        }

        /* 수직 스크롤바 스타일 */
        ::-webkit-scrollbar {
            width: 3px; /* 스크롤바의 너비 */
        }

        ::-webkit-scrollbar-thumb {
            background-color: #862B0D; /* 스크롤바의 색상 */
            border-radius: 5px; /* 스크롤바의 모서리를 둥글게 */
        }

        ::-webkit-scrollbar-thumb:hover {
            background-color: #B5C99A; /* 스크롤바에 마우스 호버 시 색상 변경 */
        }

    </style>
    <link rel="icon" href="img/logo/favicon.png"/>
    <title>Darts</title>
</head>

<body>
<div class="col-12 p-3" id="body-wrapper">
    <section class="col-12 d-flex justify-content-center align-items-center">
        <div class="col-8"  style="height: 90vh;">
            <div class="col-12 mb-2 d-flex justify-content-between align-items-center">
                <c:if test="${game == 'up'}">
                    <h4>Raise the score</h4>
                </c:if>
                <c:if test="${game == 'down'}">
                    <h4>Lowering the score (${score})</h4>
                </c:if>
                <div>
                    <button class="btn funcBtn1" onclick="reload()">RESET</button>
                    <button class="btn funcBtn1" onclick="addPlayer()">PLAYER +</button>
                    <button class="btn funcBtn1" onclick="initializePrevScore()">DEL ⌫</button>
                </div>
            </div>
            <div style="overflow-y: auto; max-height: 82vh;">
                <table id="dartsTable" class="table" style="table-layout: fixed !important;">
                </table>
            </div>
        </div>
        <div class="col-4 d-flex justify-content-center align-items-center" id="svg" style="height: 90vh;">
            <svg width="455px" height="455px" viewBox="0 0 455 455" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" style="">
                    <g id="dartboard">
                        <g id="Board" transform="translate(0.500000, 0.500000)">
                            <g id="BaseBoard" fill="#000000">
                                <path d="M453.5,227 C453.5,352.092496 352.092496,453.5 227,453.5 C101.907504,453.5 0.5,352.092496 0.5,227 C0.5,101.907504 101.907504,0.5 227,0.5 C352.092496,0.5 453.5,101.907504 453.5,227 L453.5,227 Z" id="path1307"></path>
                            </g>
                            <g id="Inside-Spider" transform="translate(50.000000, 51.000000)" stroke="#D0EDFD">
                                <path d="M347.55,176 C347.55,270.192164 271.192164,346.55 177,346.55 C82.8078359,346.55 6.45,270.192164 6.45,176 C6.45,81.8078359 82.8078359,5.45 177,5.45 C271.192164,5.45 347.55,81.8078359 347.55,176 L347.55,176 Z" id="DoubleRed" stroke-width="1.10000002" fill="#FF0000"></path>
                                <path d="M338.45,176 C338.45,265.166373 266.166373,337.45 177,337.45 C87.8336271,337.45 15.55,265.166373 15.55,176 C15.55,86.8336271 87.8336271,14.55 177,14.55 C266.166373,14.55 338.45,86.8336271 338.45,176 L338.45,176 Z" id="path2195" stroke-width="1.10000002" fill="#000000"></path>
                                <path d="M284.55,176 C284.55,235.398225 236.398225,283.55 177,283.55 C117.601775,283.55 69.45,235.398225 69.45,176 C69.45,116.601775 117.601775,68.45 177,68.45 C236.398225,68.45 284.55,116.601775 284.55,176 L284.55,176 Z" id="TrebleRed" stroke-width="1.10000002" fill="#FF0000"></path>
                                <path d="M275.449997,176 C275.449998,211.172797 256.685534,243.673801 226.224999,261.2602 C195.764464,278.846598 158.235536,278.846598 127.775001,261.2602 C97.3144658,243.673801 78.5500025,211.172797 78.550003,176 C78.5500023,140.827203 97.3144655,108.326198 127.775001,90.7397999 C158.235536,73.1534013 195.764464,73.1534013 226.224999,90.7397999 C256.685534,108.326198 275.449998,140.827203 275.449997,176 L275.449997,176 Z" id="path2197" stroke-width="1.10000002" fill="#000000"></path>
                                <g id="GreenDoubleSpiders" fill="#00A000">
                                    <path d="M247.040324,61.7046644 C247.040324,79.6014366 244.223418,97.3866829 238.693012,114.407525 L76.4902901,61.7046644 L247.040324,61.7046644 Z" id="path4826" stroke-width="1.10000024" transform="translate(161.765307, 88.056095) rotate(-116.999962) translate(-161.765307, -88.056095) "></path>
                                    <path d="M198.257753,87.455221 C198.257753,105.351985 195.440849,123.137224 189.910445,140.158058 L27.7077936,87.455221 L198.257753,87.455221 Z" id="path4830" stroke-width="1.09999976" transform="translate(112.982773, 113.806640) rotate(-152.999961) translate(-112.982773, -113.806640) "></path>
                                    <path d="M173.927612,136.961509 C173.927613,154.85827 171.110709,172.643506 165.580306,189.664337 L3.37768187,136.961509 L173.927612,136.961509 Z" id="path4832" stroke-width="1.09999957" transform="translate(88.652647, 163.312923) rotate(171.000023) translate(-88.652647, -163.312923) "></path>
                                    <path d="M183.343166,191.313773 C183.343166,209.210534 180.526262,226.99577 174.995859,244.016602 L12.7932338,191.313773 L183.343166,191.313773 Z" id="path4834" stroke-width="1.09999958" transform="translate(98.068200, 217.665187) rotate(135.000041) translate(-98.068200, -217.665187) "></path>
                                    <path d="M222.907998,229.751391 C222.907998,247.648155 220.091094,265.433393 214.56069,282.454227 L52.3580407,229.751391 L222.907998,229.751391 Z" id="path4836" stroke-width="1.09999974" transform="translate(137.633019, 256.102809) rotate(99.000033) translate(-137.633019, -256.102809) "></path>
                                    <path d="M277.50971,237.592475 C277.50971,255.489247 274.692805,273.274494 269.162398,290.295336 L106.959676,237.592475 L277.50971,237.592475 Z" id="path4838" stroke-width="1.10000024" transform="translate(192.234693, 263.943905) rotate(63.000038) translate(-192.234693, -263.943905) "></path>
                                    <path d="M326.292206,211.841942 C326.292207,229.738706 323.475302,247.523945 317.944898,264.544779 L155.742247,211.841942 L326.292206,211.841942 Z" id="path4840" stroke-width="1.09999976" transform="translate(241.017227, 238.193360) rotate(27.000039) translate(-241.017227, -238.193360) "></path>
                                    <path d="M350.622318,162.335663 C350.622319,180.232424 347.805415,198.01766 342.275012,215.038491 L180.072388,162.335663 L350.622318,162.335663 Z" id="path4842" stroke-width="1.09999957" transform="translate(265.347353, 188.687077) rotate(-8.999977) translate(-265.347353, -188.687077) "></path>
                                    <path d="M341.206766,107.983398 C341.206767,125.88016 338.389863,143.665396 332.85946,160.686227 L170.656834,107.983398 L341.206766,107.983398 Z" id="path4844" stroke-width="1.09999958" transform="translate(255.931800, 134.334813) rotate(-44.999959) translate(-255.931800, -134.334813) "></path>
                                    <path d="M301.641959,69.5457726 C301.64196,87.4425367 298.825055,105.227775 293.294651,122.248609 L131.092002,69.5457726 L301.641959,69.5457726 Z" id="path4846" stroke-width="1.09999974" transform="translate(216.366981, 95.897191) rotate(-80.999967) translate(-216.366981, -95.897191) "></path>
                                </g>
                                <g id="g4876" transform="translate(10.000000, 9.000000)" fill="#E7E4C7">
                                    <path d="M234.303197,58.8030972 C234.303195,75.744955 231.636588,92.5812373 226.401265,108.693901 L72.8531647,58.8030972 L234.303197,58.8030972 Z" id="path4878" stroke-width="1.10000024" transform="translate(153.578181, 83.748499) rotate(-116.999962) translate(-153.578181, -83.748499) "></path>
                                    <path d="M188.123507,83.1796871 C188.123506,100.121537 185.4569,116.957812 180.221579,133.070469 L26.6735457,83.1796871 L188.123507,83.1796871 Z" id="path4880" stroke-width="1.09999976" transform="translate(107.398526, 108.125078) rotate(-152.999961) translate(-107.398526, -108.125078) "></path>
                                    <path d="M165.091545,130.044479 C165.091543,146.986326 162.424938,163.822598 157.189618,179.935252 L3.64161099,130.044479 L165.091545,130.044479 Z" id="path4882" stroke-width="1.09999957" transform="translate(84.366578, 154.989865) rotate(171.000023) translate(-84.366578, -154.989865) "></path>
                                    <path d="M174.004715,181.49668 C174.004714,198.438528 171.338109,215.2748 166.102789,231.387454 L12.5547796,181.49668 L174.004715,181.49668 Z" id="path4884" stroke-width="1.09999958" transform="translate(93.279748, 206.442067) rotate(135.000041) translate(-93.279748, -206.442067) "></path>
                                    <path d="M211.458495,217.88339 C211.458494,234.82524 208.791888,251.661515 203.556567,267.774171 L50.0085358,217.88339 L211.458495,217.88339 Z" id="path4886" stroke-width="1.09999974" transform="translate(130.733515, 242.828781) rotate(99.000033) translate(-130.733515, -242.828781) "></path>
                                    <path d="M263.146835,225.306099 C263.146834,242.247957 260.480227,259.084239 255.244904,275.196903 L101.696803,225.306099 L263.146835,225.306099 Z" id="path4888" stroke-width="1.10000024" transform="translate(182.421819, 250.251501) rotate(63.000038) translate(-182.421819, -250.251501) "></path>
                                    <path d="M309.326454,200.929531 C309.326453,217.871381 306.659847,234.707656 301.424526,250.820313 L147.876493,200.929531 L309.326454,200.929531 Z" id="path4890" stroke-width="1.09999976" transform="translate(228.601474, 225.874922) rotate(27.000039) translate(-228.601474, -225.874922) "></path>
                                    <path d="M332.358389,154.064748 C332.358388,171.006595 329.691782,187.842867 324.456462,203.955521 L170.908455,154.064748 L332.358389,154.064748 Z" id="path4892" stroke-width="1.09999957" transform="translate(251.633422, 179.010135) rotate(-8.999977) translate(-251.633422, -179.010135) "></path>
                                    <path d="M323.44522,102.612546 C323.445219,119.554394 320.778614,136.390666 315.543294,152.50332 L161.995285,102.612546 L323.44522,102.612546 Z" id="outer-4" stroke-width="1.09999958" transform="translate(242.720252, 127.557933) rotate(-44.999959) translate(-242.720252, -127.557933) "></path>
                                    <path d="M285.991464,66.2258287 C285.991463,83.1676788 283.324857,100.003954 278.089536,116.11661 L124.541505,66.2258287 L285.991464,66.2258287 Z" id="outer-1" stroke-width="1.09999974" transform="translate(205.266485, 91.171219) rotate(-80.999967) translate(-205.266485, -91.171219) "></path>
                                </g>
                                <g id="GreenTrebleSpiders" transform="translate(64.000000, 66.000000)" fill="#00A000">
                                    <path d="M156.167909,38.9245771 C156.167909,50.2104045 154.39155,61.4259029 150.904038,72.1593627 L48.6178875,38.9245771 L156.167909,38.9245771 Z" id="path4856" stroke-width="1.10000024" transform="translate(102.392898, 55.541970) rotate(-116.999962) translate(-102.392898, -55.541970) "></path>
                                    <path d="M125.405285,55.1630547 C125.405285,66.4488771 123.628926,77.6643706 120.141416,88.3978257 L17.8553105,55.1630547 L125.405285,55.1630547 Z" id="path4858" stroke-width="1.09999976" transform="translate(71.630298, 71.780440) rotate(-152.999961) translate(-71.630298, -71.780440) "></path>
                                    <path d="M110.062531,86.3820594 C110.062532,97.6678799 108.286173,108.883372 104.798663,119.616825 L2.51257509,86.3820594 L110.062531,86.3820594 Z" id="path4860" stroke-width="1.09999957" transform="translate(56.287553, 102.999442) rotate(171.000023) translate(-56.287553, -102.999442) "></path>
                                    <path d="M116.000044,120.65697 C116.000045,131.94279 114.223686,143.158282 110.736176,153.891736 L8.45008664,120.65697 L116.000044,120.65697 Z" id="path4862" stroke-width="1.09999958" transform="translate(62.225065, 137.274353) rotate(135.000041) translate(-62.225065, -137.274353) "></path>
                                    <path d="M140.949898,144.895996 C140.949899,156.181818 139.17354,167.397311 135.686029,178.130766 L33.3999253,144.895996 L140.949898,144.895996 Z" id="path4864" stroke-width="1.09999974" transform="translate(87.174912, 161.513381) rotate(99.000033) translate(-87.174912, -161.513381) "></path>
                                    <path d="M175.382112,149.840637 C175.382113,161.126465 173.605753,172.341963 170.118241,183.075423 L67.8320913,149.840637 L175.382112,149.840637 Z" id="path4866" stroke-width="1.10000024" transform="translate(121.607102, 166.458030) rotate(63.000038) translate(-121.607102, -166.458030) "></path>
                                    <path d="M206.144689,133.602174 C206.14469,144.887997 204.368331,156.10349 200.880821,166.836945 L98.5947153,133.602174 L206.144689,133.602174 Z" id="path4868" stroke-width="1.09999976" transform="translate(152.369702, 150.219560) rotate(27.000039) translate(-152.369702, -150.219560) "></path>
                                    <path d="M221.487425,102.383175 C221.487426,113.668996 219.711067,124.884487 216.223557,135.617941 L113.937469,102.383175 L221.487425,102.383175 Z" id="path4870" stroke-width="1.09999957" transform="translate(167.712447, 119.000558) rotate(-8.999977) translate(-167.712447, -119.000558) "></path>
                                    <path d="M215.549913,68.1082644 C215.549914,79.394085 213.773555,90.6095768 210.286045,101.34303 L107.999956,68.1082644 L215.549913,68.1082644 Z" id="path4872" stroke-width="1.09999958" transform="translate(161.774935, 84.725647) rotate(-44.999959) translate(-161.774935, -84.725647) "></path>
                                    <path d="M190.600075,43.8692338 C190.600075,55.1550561 188.823716,66.3705495 185.336206,77.1040044 L83.0501019,43.8692338 L190.600075,43.8692338 Z" id="path4874" stroke-width="1.09999974" transform="translate(136.825088, 60.486619) rotate(-80.999967) translate(-136.825088, -60.486619) "></path>
                                </g>
                                <g id="GreenInner" transform="translate(74.000000, 75.000000)" fill="#E7E4C7">
                                    <path d="M142.430781,36.0230113 C142.430781,46.353924 140.804721,56.6204584 137.612294,66.4457403 L43.9807643,36.0230113 L142.430781,36.0230113 Z" id="path5773" stroke-width="1.10000024" transform="translate(93.205773, 51.234376) rotate(-116.999962) translate(-93.205773, -51.234376) "></path>
                                    <path d="M114.271039,50.8875215 C114.271039,61.2184297 112.64498,71.4849596 109.452554,81.3102372 L15.8210655,50.8875215 L114.271039,50.8875215 Z" id="path5775" stroke-width="1.09999976" transform="translate(65.046052, 66.098879) rotate(-152.999961) translate(-65.046052, -66.098879) "></path>
                                    <path d="M100.226464,79.4650289 C100.226464,89.7959354 98.6004056,100.062464 95.4079799,109.887739 L1.7765072,79.4650289 L100.226464,79.4650289 Z" id="path5777" stroke-width="1.09999957" transform="translate(51.001486, 94.676384) rotate(171.000023) translate(-51.001486, -94.676384) "></path>
                                    <path d="M105.661593,110.839876 C105.661593,121.170783 104.035535,131.437311 100.843109,141.262587 L7.21163508,110.839876 L105.661593,110.839876 Z" id="path5779" stroke-width="1.09999958" transform="translate(56.436614, 126.051232) rotate(135.000041) translate(-56.436614, -126.051232) "></path>
                                    <path d="M128.500394,133.027993 C128.500394,143.358901 126.874336,153.625431 123.681909,163.450709 L30.0504221,133.027993 L128.500394,133.027993 Z" id="path5781" stroke-width="1.09999974" transform="translate(79.275408, 148.239351) rotate(99.000033) translate(-79.275408, -148.239351) "></path>
                                    <path d="M160.019236,137.55426 C160.019236,147.885172 158.393176,158.151707 155.200749,167.976989 L61.5692193,137.55426 L160.019236,137.55426 Z" id="path5783" stroke-width="1.10000024" transform="translate(110.794227, 152.765624) rotate(63.000038) translate(-110.794227, -152.765624) "></path>
                                    <path d="M188.178934,122.689763 C188.178935,133.020671 186.552876,143.287201 183.36045,153.112479 L89.7289611,122.689763 L188.178934,122.689763 Z" id="path5785" stroke-width="1.09999976" transform="translate(138.953948, 137.901121) rotate(27.000039) translate(-138.953948, -137.901121) "></path>
                                    <path d="M202.223493,94.1122605 C202.223493,104.443167 200.597434,114.709695 197.405009,124.534971 L103.773536,94.1122605 L202.223493,94.1122605 Z" id="path5787" stroke-width="1.09999957" transform="translate(152.998514, 109.323616) rotate(-8.999977) translate(-152.998514, -109.323616) "></path>
                                    <path d="M196.788365,62.737413 C196.788365,73.0683195 195.162307,83.3348479 191.969881,93.1601239 L98.3384071,62.737413 L196.788365,62.737413 Z" id="path5789" stroke-width="1.09999958" transform="translate(147.563386, 77.948768) rotate(-44.999959) translate(-147.563386, -77.948768) "></path>
                                    <path d="M173.949578,43.5492914 C173.949578,53.8801994 172.323519,64.1467292 169.131093,73.9720067 L75.4996058,43.5492914 L173.949578,43.5492914 Z" id="path5791" stroke-width="1.09999974" transform="translate(124.724592, 58.760649) rotate(-80.999967) translate(-124.724592, -58.760649) "></path>
                                </g>
                                <path d="M193.450001,176 C193.450001,185.085085 186.085085,192.450001 177,192.450001 C167.914915,192.450001 160.549999,185.085085 160.549999,176 C160.549999,166.914915 167.914915,159.549999 177,159.549999 C186.085085,159.549999 193.450001,166.914915 193.450001,176 L193.450001,176 Z" id="InnerGreen" stroke-width="1.10000002" fill="#00A000"></path>
                                <path d="M183.9,177 C183.9,180.810765 180.810765,183.9 177,183.9 C173.189235,183.9 170.1,180.810765 170.1,177 C170.1,173.189235 173.189235,170.1 177,170.1 C180.810765,170.1 183.9,173.189235 183.9,177 L183.9,177 Z" id="InnerRed" stroke-width="1.10000002" fill="#FF0000"></path>
                            </g>
                            <g id="BoardNumbers" transform="translate(13.000000, 11.000000)" font-size="28" font-family="Helvetica" fill="#FFFFFF" font-weight="normal">
                                <text id="tspan6009">
                                    <tspan x="198.04829" y="28.17502">20</tspan>
                                </text>
                                <text id="tspan6897">
                                    <tspan x="266.872234" y="35.63376">1</tspan>
                                </text>
                                <text id="tspan6907">
                                    <tspan x="315.0151" y="65.46878">18</tspan>
                                </text>
                                <text id="tspan6913">
                                    <tspan x="368.24347" y="112.25551">4</tspan>
                                </text>
                                <text id="tspan6917">
                                    <tspan x="388.92455" y="170.230358">13</tspan>
                                </text>
                                <text id="tspan6968">
                                    <tspan x="402.14688" y="225.153896">6</tspan>
                                </text>
                                <text id="tspan6925">
                                    <tspan x="386.5513" y="283.467781">10</tspan>
                                </text>
                                <text id="tspan6929">
                                    <tspan x="357.7334" y="343.13781">15</tspan>
                                </text>
                                <text id="tspan6933">
                                    <tspan x="321.11771" y="385.85611">2</tspan>
                                </text>
                                <text id="tspan6977">
                                    <tspan x="257.718311" y="412.63982">17</tspan>
                                </text>
                                <text id="tspan6981">
                                    <tspan x="208.897384" y="424.16699">3</tspan>
                                </text>
                                <text id="tspan6985">
                                    <tspan x="140.751503" y="415.01306">19</tspan>
                                </text>
                                <text id="tspan6989">
                                    <tspan x="91.25252" y="389.24644">7</tspan>
                                </text>
                                <text id="tspan6993">
                                    <tspan x="40.05835" y="343.13781">16</tspan>
                                </text>
                                <text id="tspan6997">
                                    <tspan x="21.41145" y="288.892326">8</tspan>
                                </text>
                                <text id="tspan7013">
                                    <tspan x="0.39133" y="224.814864">11</tspan>
                                </text>
                                <text id="tspan7017">
                                    <tspan x="6.49394" y="167.179047">14</tspan>
                                </text>
                                <text id="tspan7021">
                                    <tspan x="49.89035" y="106.49191">9</tspan>
                                </text>
                                <text id="tspan7025">
                                    <tspan x="80.74245" y="63.77361">12</tspan>
                                </text>
                                <text id="tspan7029">
                                    <tspan x="147.532188" y="37.32893">5</tspan>
                                </text>
                            </g>
                        </g>
                    </g>
                </g>
            </svg>
        </div>
        <footer class="footer d-flex justify-content-center align-items-center">
            <span>Copyright 2023. ELLA. All rights reserved.</span>
        </footer>
    </section>
</div>
</body>
<script>
    let dartsTable;
    let playerName = 'PLAYER ';
    const inningBoxHtml = "<input type='number' class='form-control inputGrade' onkeyup='codeEnterkey()' box-detail='1' disabled>" +
        "<input type='number' class='form-control inputGrade' onkeyup='codeEnterkey()' box-detail='2' disabled>" +
        "<input type='number' class='form-control inputGrade' onkeyup='codeEnterkey()' box-detail='3' disabled>" +
        "<input type='text' class='inningTotal' readonly>";
    const initialMemberCnt = 3;

    // 다트 원점
    let mX = null;
    let mY = null;

    // 게임 차례
    let nextTurn = {
        "row" : 1
        , "col" : 1
        , "detail" : 1
    };

    // down mark
    let downMark = "😜";

    $(document).ready(function(e) {
        dartsTable = $('#dartsTable').DataTable({
            "dom": "t",
            "lengthChange": false,
            "bDestroy": true,
            "processing": true,
            "info": false,
            "language": {
                "search": "<span data-lang='searchButton'></span>" <%--검색--%>
            },
            "ordering": false,
            "responsive": true,
            "autoWidth": false,
            "data": [],
            "columns": [
                {
                    "name" : "userNo"
                    , "title": "PLAYER NO"
                    , "width": ""
                    , "data": null
                    , "render": function(data, type, row, meta) {
                        // if (meta.row == 0) {
                        data =  playerName + (meta.row + 1);
                        // } else {
                        //     data = playerName + (meta.row + 1) + "<br><button class='btn funcBtn2' onclick='removeRow()'>X</button>";
                        // }
                        return data;
                    }
                }
                , {
                    "class": "inning"
                    , "title": "1"
                    , "width": ""
                    , "data": null
                    , "render": function(data, type, row, meta) {
                        return inningBoxHtml;
                    }
                    ,"createdCell": function(td, cellData, rowData, row, col) {
                        $(td).attr("box-row", (row+1));
                        $(td).attr("box-col", col);
                    }
                }
                , {
                    "class": "inning"
                    , "title": "2"
                    , "width": ""
                    , "data": null
                    , "render": function(data, type, row, meta) {
                        return inningBoxHtml;
                    }
                    ,"createdCell": function(td, cellData, rowData, row, col) {
                        $(td).attr("box-row", (row+1));
                        $(td).attr("box-col", col);
                    }
                }
                , {
                    "class": "inning"
                    , "title": "3"
                    , "width": ""
                    , "data": null
                    , "render": function(data, type, row) {
                        return inningBoxHtml;
                    }
                    ,"createdCell": function(td, cellData, rowData, row, col) {
                        $(td).attr("box-row", (row+1));
                        $(td).attr("box-col", col);
                    }
                }
                , {
                    "class": "inning"
                    , "title": "4"
                    , "width": ""
                    , "data": null
                    , "render": function(data, type, row) {
                        return inningBoxHtml;
                    }
                    ,"createdCell": function(td, cellData, rowData, row, col) {
                        $(td).attr("box-row", (row+1));
                        $(td).attr("box-col", col);
                    }
                }
                , {
                    "class": "inning"
                    , "title": "5"
                    , "width": ""
                    , "data": null
                    , "render": function(data, type, row) {
                        return inningBoxHtml;
                    }
                    ,"createdCell": function(td, cellData, rowData, row, col) {
                        $(td).attr("box-row", (row+1));
                        $(td).attr("box-col", col);
                    }
                }
                , {
                    "class": "inning"
                    , "title": "6"
                    , "width": ""
                    , "data": null
                    , "render": function(data, type, row) {
                        return inningBoxHtml;
                    }
                    ,"createdCell": function(td, cellData, rowData, row, col) {
                        $(td).attr("box-row", (row+1));
                        $(td).attr("box-col", col);
                    }
                }
                , {
                    "class": "inning"
                    , "title": "7"
                    , "width": ""
                    , "data": null
                    , "render": function(data, type, row) {
                        return inningBoxHtml;
                    }
                    ,"createdCell": function(td, cellData, rowData, row, col) {
                        $(td).attr("box-row", (row+1));
                        $(td).attr("box-col", col);
                    }
                }
                , {
                    "class": "inning"
                    , "title": "8"
                    , "width": ""
                    , "data": null
                    , "render": function(data, type, row) {
                        return inningBoxHtml;
                    }
                    ,"createdCell": function(td, cellData, rowData, row, col) {
                        $(td).attr("box-row", (row+1));
                        $(td).attr("box-col", col);
                    }
                }
                <c:if test="${game == 'down'}">
                    , {
                        "class": "inning"
                        , "title": "9"
                        , "width": ""
                        , "data": null
                        , "render": function(data, type, row) {
                            return inningBoxHtml;
                        }
                        ,"createdCell": function(td, cellData, rowData, row, col) {
                            $(td).attr("box-row", (row+1));
                            $(td).attr("box-col", col);
                        }
                    }
                    , {
                        "class": "inning"
                        , "title": "10"
                        , "width": ""
                        , "data": null
                        , "render": function(data, type, row) {
                            return inningBoxHtml;
                        }
                        ,"createdCell": function(td, cellData, rowData, row, col) {
                            $(td).attr("box-row", (row+1));
                            $(td).attr("box-col", col);
                        }
                    }
                </c:if>
                , {
                    "class": "userTotal"
                    , "title": "TOTAL"
                    , "width": ""
                    , "data": null
                    , "render": function(data, type, row) {
                        <c:if test="${game == 'up'}">
                            return "<input type='text' class='grade' readonly>" +
                                "<input type='text' class='fullTotal' readonly>";
                        </c:if>
                        <c:if test="${game == 'down'}">
                            return "<input type='text' class='grade' readonly>" +
                                "<input type='text' class='fullTotal' value='${score}' readonly>";
                        </c:if>
                    }
                }
            ]
        });

        // dartsTable.clear();
        for (let i = 0 ; i < initialMemberCnt ; i++) {
            dartsTable.row.add({});
        }
        dartsTable.draw();

        getCenterCoordinates("InnerRed");
        // $("[box-row='1'][box-col='1']").find("[box-detail='1']").focus();
        $("[box-row='1'][box-col='1']").addClass("blink");
    });

    function addPlayer() {
        // 게임 진행중인 경우 추가 불가능
        if (nextTurn.row != 1 || nextTurn.col != 1 || nextTurn.detail != 1) {
            alert("Player cannot be added while the game is in progress!");
            return false;
        }

        dartsTable.row.add({});
        dartsTable.draw();

        getCenterCoordinates("InnerRed");
    }

    function reload() {
        if (confirm("Do you want to reset?") == false) return false;
        location.reload();
    }

    function getTurnNext(nowRow, nowCol, nowDetail) {
        let nextRow = nowRow;
        let nextCol = nowCol;
        let nextDetail = parseInt(nowDetail) + 1;
        if (nowDetail == '3') {
            // 다음 칸으로 넘어감
            if (nowRow == $('#dartsTable').DataTable().data().count()) {
                // 다음 이닝으로 넘어감 -> player1
                nextRow = 1;
                nextCol = parseInt(nowCol) + 1;
                nextDetail = 1;
            } else {
                nextRow = parseInt(nowRow) + 1;
                nextDetail = 1;
            }
        }
        return {
            "row" : nextRow
            , "col" : nextCol
            , "detail" : nextDetail
        };
    }
    function getTurnPrev(nowRow, nowCol, nowDetail) {
        let prevRow = nowRow;
        let prevCol = nowCol;
        let prevDetail = parseInt(nowDetail) - 1;
        if (nowDetail == '1') {
            // 이전 순서 사람으로 넘어감
            if (nowRow == 1) {
                if (nowCol == 1) {
                    return false;
                }
                // 다음 이닝으로 넘어간 상황
                prevRow = $('#dartsTable').DataTable().data().count();
                prevCol = prevCol - 1;
                prevDetail = 3;
            } else {
                prevRow = nowRow - 1;
                prevDetail = 3;
            }
        }

        return {
            "row" : prevRow
            , "col" : prevCol
            , "detail" : prevDetail
        };
    }

    function getInningTotalBox(boxRow, boxCol) {
        let sum = 0;
        for (let i = 1 ; i <= 3 ; i++) {
            if ($("[box-row='"+boxRow+"'][box-col='"+boxCol+"']").find("[box-detail='" + i + "']").val() != "") {
                sum += parseInt($("[box-row='"+boxRow+"'][box-col='"+boxCol+"']").find("[box-detail='" + i + "']").val());
            }
        }
        return sum;
    }

    function getFullTotal(boxRow) {
        let total = 0;
        $("[box-row='" + boxRow + "']").find(".inningTotal").each(function() {
            var value = parseInt($(this).val()); // input의 값을 숫자로 변환
            if (!isNaN(value)) { // 숫자인 경우에만 합산
                total += value;
            }
        });
        return total;
    }

    function updateGradeBox() {
        // 🥇 🥈 🥉
        let valueList = [];
        document.querySelectorAll(".fullTotal").forEach((input, index) => {
            valueList[index] = input.value;
        });
        let sortedIndices;
        let zeroValue;
        // console.log(">>" + valueList);
        <c:if test="${game == 'up'}">
        sortedIndices = valueList
            .map((_, index) => index) // 인덱스 배열 생성
            .sort((a, b) => valueList[b] - valueList[a]); // 값을 기준으로 내림차순 정렬된 인덱스 배열
        zeroValue = "";
        </c:if>
        <c:if test="${game == 'down'}">
        sortedIndices = valueList
            .map((_, index) => index) // 인덱스 배열 생성
            .sort((a, b) => valueList[a] - valueList[b]); // 값을 기준으로 오름차순 정렬된 인덱스 배열
        zeroValue = '${score}';
        </c:if>
        $(".grade").val("");

        let medalList = ["🥇", "🥈", "🥉"];
        for (let i = 0 ; i < 3 ; i++) {
            if ($('#dartsTable').DataTable().data().count() > i) {
                if ($("[box-row='"+(sortedIndices[i]+1)+"']").parent().find(".userTotal").find(".fullTotal").val() != zeroValue) {
                    $("[box-row='"+(sortedIndices[i]+1)+"']").parent().find(".userTotal").find(".grade").val(medalList[i]);
                }
            }
        }
    }

    function getScoreFromXY(x, y, multiple) {
        let value = (y/x).toFixed(2);
        let absVal = (Math.abs(y)/Math.abs(x)).toFixed(2);
        let key = null;
        if (x > 0 && y > 0) {
            key = "pp";
        }
        if (x > 0 && y < 0) {
            key = "pm";
        }
        if (x < 0 && y > 0) {
            key = "mp";
        }
        if (x < 0 && y < 0) {
            key = "mm";
        }
        const valMap = {
            "area1" : {
                "pp" : 6
                , "pm" : 6
                , "mp" : 11
                , "mm" : 11
            }
            , "area2" : {
                "pp" : 13
                , "pm" : 10
                , "mp" : 14
                , "mm" : 8
            }
            , "area3" : {
                "pp" : 4
                , "pm" : 15
                , "mp" : 9
                , "mm" : 16
            }
            , "area4" : {
                "pp" : 18
                , "pm" : 2
                , "mp" : 12
                , "mm" : 7
            }
            , "area5" : {
                "pp" : 1
                , "pm" : 17
                , "mp" : 5
                , "mm" : 19
            }
            , "area6" : {
                "pp" : 20
                , "pm" : 3
                , "mp" : 20
                , "mm" : 3
            }
        }
        // console.log("#### " + value + "// absVal = " + absVal);
        let result = null;
        if (absVal < 0.16) {
            result = valMap["area1"][key];
        } else if (absVal < 0.5) {
            result = valMap["area2"][key];
        } else if (absVal < 1) {
            result = valMap["area3"][key];
        } else if (absVal < 1.9) {
            result = valMap["area4"][key];
        } else if (absVal < 6) {
            result = valMap["area5"][key];
        } else {
            result = valMap["area6"][key];
        }
        result = result * multiple;

        return result;
    }

    // Main
    $("#svg").on('click', onHandleClick);
    function onHandleClick(event) {
        // 1. 점수 구하기
        let target = $(event.target);

        let x = event.clientX - mX;
        let y = -(event.clientY - mY);

        let id = target.attr('id');
        let pId = target.parent().attr("id");
        // get multiple
        let multiple = null;
        let result = null;
        if (id == 'InnerGreen' || id == 'InnerRed') {
            result = 50;
        } else if (pId == 'BaseBoard' || pId == 'svg' || pId.startsWith('tspan')) {
            result = 0;
        } else {
            if (id == 'TrebleRed') {
                multiple = 3;
            } else if (id == 'DoubleRed') {
                multiple = 2;
            } else {
                if (pId == 'GreenTrebleSpiders') {
                    multiple = 3;
                } else if (pId == 'GreenDoubleSpiders') {
                    multiple = 2;
                } else {
                    multiple = 1;
                }
            }
            result = getScoreFromXY(x, y, multiple);
        }
        if (result == NaN) {
            alert("ERROR!\nPlease contact ELLA~,,~");
            return false;
        }
        // 2. 해당 detail에 값 넣기
        $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").find("[box-detail='" +nextTurn.detail+ "']").val(result);

        // 3. row col에 해당하는 이닝 total box update
        let inningTotal = getInningTotalBox(nextTurn.row, nextTurn.col);
        inningTotal == 0
            ? $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").find(".inningTotal").val("")
            : $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").find(".inningTotal").val(inningTotal);

        // 4. row에 해당하는 전체 total box 업데이트
        let fullTotal = getFullTotal(nextTurn.row);
        if (${game == 'up'}) {
            fullTotal == 0
                ? $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").parent().find(".userTotal").find(".fullTotal").val("")
                : $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").parent().find(".userTotal").find(".fullTotal").val(fullTotal);
        }
        if (${game == 'down'}) {
            if (fullTotal == parseInt('${score}')) {
                alert("🎉GAME OVER🎉");
            } else if (fullTotal > parseInt('${score}')) {
                alert(downMark);
                $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").find(".inningTotal").val(downMark+inningTotal);
                $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").parent().find(".userTotal").find(".fullTotal").val(parseInt('${score}') - getFullTotal(nextTurn.row));
                let next = getTurnNext(nextTurn.row, nextTurn.col, 3);
                $(".inning").removeClass("blink");
                $("[box-row='"+next.row+"'][box-col='"+next.col+"']").addClass("blink");
                nextTurn.row = next.row;
                nextTurn.col = next.col;
                nextTurn.detail = next.detail;
                updateGradeBox();
                return false;
            }
            fullTotal == 0
                ? $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").parent().find(".userTotal").find(".fullTotal").val(parseInt('${score}'))
                : $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").parent().find(".userTotal").find(".fullTotal").val(parseInt('${score}') - fullTotal);

        }

        // 5. 다음 순서 row,col,detail 가져오기
        let next = getTurnNext(nextTurn.row, nextTurn.col, nextTurn.detail);

        $(".inning").removeClass("blink");
        $("[box-row='"+next.row+"'][box-col='"+next.col+"']").addClass("blink");
        // $("[box-row='"+next.row+"'][box-col='"+next.col+"']").find("[box-detail='"+next.detail+"']").focus();
        nextTurn.row = next.row;
        nextTurn.col = next.col;
        nextTurn.detail = next.detail;

        // 6. 전체 순위 매기기
        updateGradeBox();
    }

    function getCenterCoordinates(elementId) {
        const targetDiv = document.getElementById(elementId);
        const rect = targetDiv.getBoundingClientRect();

        mX = rect.left + rect.width / 2;
        mY = rect.top + rect.height / 2;
    }

    // DEL 버튼 클릭시 이전 순서 초기화
    function initializePrevScore() {
        // 1. 이전 순서 칸 구하기
        let prev = getTurnPrev(nextTurn.row, nextTurn.col, nextTurn.detail);
        if (!prev) {
            alert("Unable to delete!");
            return false;
        }
        $(".inning").removeClass("blink");
        $("[box-row='"+prev.row+"'][box-col='"+prev.col+"']").addClass("blink");
        nextTurn.row = prev.row;
        nextTurn.col = prev.col;
        nextTurn.detail = prev.detail;
        if ($("[box-row='"+prev.row+"'][box-col='"+prev.col+"']").find(".inningTotal").val().indexOf(downMark) == 0) {
            $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").find("[box-detail='" +1+ "']").val("");
            $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").find("[box-detail='" +2+ "']").val("");
            $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").find("[box-detail='" +3+ "']").val("");
            nextTurn.detail = 1;
        }

        // 2. 해당 detail에 값 초기화
        $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").find("[box-detail='" +nextTurn.detail+ "']").val("");

        // 3. row col에 해당하는 이닝 total box update
        let inningTotal = getInningTotalBox(nextTurn.row, nextTurn.col);
        inningTotal == 0
            ? $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").find(".inningTotal").val("")
            : $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").find(".inningTotal").val(inningTotal);

        // 4. row에 해당하는 전체 total box 업데이트
        let fullTotal = getFullTotal(nextTurn.row);
        if (${game == 'up'}) {
            fullTotal == 0
                ? $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").parent().find(".userTotal").find(".fullTotal").val("")
                : $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").parent().find(".userTotal").find(".fullTotal").val(fullTotal);
        }
        if (${game == 'down'}) {
            fullTotal == 0
                ? $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").parent().find(".userTotal").find(".fullTotal").val(${score})
                : $("[box-row='"+nextTurn.row+"'][box-col='"+nextTurn.col+"']").parent().find(".userTotal").find(".fullTotal").val(${score} - fullTotal);
        }

        // 5. 전체 순위 매기기
        updateGradeBox();
    }

    // 화면 크기 변경됨
    window.addEventListener('resize', function() {
        getCenterCoordinates("InnerRed");
    });
</script>
</html>