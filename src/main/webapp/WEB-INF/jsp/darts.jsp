<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="/webjars/bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
        <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

        <style>
            .table td,tr {
                text-align: center !important;
                vertical-align : middle !important;
            }

            .funcBtn1 {
                background-color: aquamarine;
                width: 120px;
            }

            .funcBtn1:hover {
                background-color: #FFD700; /* 원하는 배경색으로 변경 */
                color: #FFF; /* 텍스트 색 변경 (예: 흰색) */
                border-color: #FFD700; /* 테두리 색 변경 */
            }

            .funcBtn2 {
                background-color: transparent;
                margin: 4px;
            }

            .funcBtn2:hover {
                background-color: dimgrey; /* 원하는 배경색으로 변경 */
                /*color: #FFF; !* 텍스트 색 변경 (예: 흰색) *!*/
                border-color: dimgrey; /* 테두리 색 변경 */
            }

            input[type="number"].form-control{
                /*width: 50% !important;*/
                margin-bottom: 10px !important;
                padding: 0 !important;
            }

            .inningTotal, .fullTotal {
                border-color: transparent;
                background-color: transparent;
                outline: none; /* 테두리 제거 */
                max-width: 100%;
            }
        </style>
    </head>

    <body>
        <div class="col-12" style="height: 900px;">
            <section class="col-12 d-flex justify-content-center align-items-center">
                <div class="col-6 p-2" style="height: 90%; background-color: lightgrey">
                    <div class="d-flex mb-2 align-items-center justify-content-between">
                        <h4 class="">점수 올리기</h4>
                        <div>
                            <button class="btn funcBtn1" onclick="reload()">CLEAR</button>
                            <button class="btn funcBtn1" onclick="addPlayer()">PLAYER +</button>
                        </div>
                    </div>
                    <table id="dartsTable" class="table table-bordered table-hover" style="table-layout: fixed !important;">
                        <thead>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div class="col-6 p-2" style="height: 90%; background-color: lightgrey">
                    <div class="d-flex justify-content-center align-items-center">

                    </div>

                </div>
            </section>
        </div>
    </body>
    <script>
        let dartsTable;
        let playerName = 'PLAYER ';

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
                        , "render": function(data, type, row) {
                            return "<input type='number' class='form-control'><input type='number' class='form-control'>" +
                                "<input type='number' class='form-control'><input type='number' class='inningTotal' readonly>";
                        }
                    }
                    , {
                        "class": "inning"
                        , "title": "2"
                        , "width": ""
                        , "data": null
                        , "render": function(data, type, row) {
                            return "<input type='number' class='form-control'><input type='number' class='form-control'>" +
                                "<input type='number' class='form-control'><input type='number' class='inningTotal' readonly>";
                        }
                    }
                    , {
                        "class": "inning"
                        , "title": "3"
                        , "width": ""
                        , "data": null
                        , "render": function(data, type, row) {
                            return "<input type='number' class='form-control'><input type='number' class='form-control'>" +
                                "<input type='number' class='form-control'><input type='number' class='inningTotal' readonly>";
                        }
                    }
                    , {
                        "class": "inning"
                        , "title": "4"
                        , "width": ""
                        , "data": null
                        , "render": function(data, type, row) {
                            return "<input type='number' class='form-control'><input type='number' class='form-control'>" +
                                "<input type='number' class='form-control'><input type='number' class='inningTotal' readonly>";
                        }
                    }
                    , {
                        "class": "inning"
                        , "title": "5"
                        , "width": ""
                        , "data": null
                        , "render": function(data, type, row) {
                            return "<input type='number' class='form-control'><input type='number' class='form-control'>" +
                                "<input type='number' class='form-control'><input type='number' class='inningTotal' readonly>";
                        }
                    }
                    , {
                        "class": "inning"
                        , "title": "6"
                        , "width": ""
                        , "data": null
                        , "render": function(data, type, row) {
                            return "<input type='number' class='form-control'><input type='number' class='form-control'>" +
                                "<input type='number' class='form-control'><input type='number' class='inningTotal' readonly>";
                        }
                    }
                    , {
                        "class": "inning"
                        , "title": "7"
                        , "width": ""
                        , "data": null
                        , "render": function(data, type, row) {
                            return "<input type='number' class='form-control'><input type='number' class='form-control'>" +
                                "<input type='number' class='form-control'><input type='number' class='inningTotal' readonly>";
                        }
                    }
                    , {
                        "class": "inning"
                        , "title": "8"
                        , "width": ""
                        , "data": null
                        , "render": function(data, type, row) {
                            return "<input type='number' class='form-control'><input type='number' class='form-control'>" +
                                "<input type='number' class='form-control'><input type='number' class='inningTotal' readonly>";
                        }
                    }
                    , {
                        "class": ""
                        , "title": "TOTAL"
                        , "width": ""
                        , "data": null
                        , "render": function(data, type, row) {
                            return "<input type='number' class='fullTotal' readonly>";
                        }
                    }
                ]
            });

            // dartsTable.clear();
            for (let i = 0; i < 2; i++) {
                dartsTable.row.add({});
            }
            dartsTable.draw();
        });

        function addPlayer() {
            dartsTable.row.add({});
            dartsTable.draw();
        }

        function reload() {
            location.reload();
        }


    </script>
</html>