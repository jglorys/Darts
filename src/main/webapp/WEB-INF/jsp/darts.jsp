<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="/webjars/bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
        <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

        <style>
        </style>
    </head>

    <body>
        <div class="bg-dark col-12" style="height: 900px;">
            <section class="bg-black col-12 d-flex justify-content-center" style="height: 50%">
                <div class="m-4 col-11" style="height: 70%; background-color: antiquewhite">
                    <table id="dartsTable">
                    </table>
                </div>
            </section>

            <section class="bg-primary col-12 d-flex justify-content-center" style="height: 50%">
                <div class="bg-danger m-4 col-10" style="height: 50%">

                </div>
            </section>
        </div>
    </body>
    <script>
        let dartsTable;
        $(document).ready(function(e) {
            dartsTable = $('#dartsTable').DataTable({
                "dom": "<'row'<'col-sm-12'f>>t<'row'<'col-sm-12'p>>", //Bfrtip
                "lengthChange": false,
                "pageLength": 3,
                "paging": true,
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
                        "name" : "blackno" ,
                        "title": "<span>No</span>",
                        "width": "100px",
                        "data": "blackno"
                    },
                    {
                        "name" : "name" ,
                        "title": "<span data-lang='objectAddress'></span>", //객체주소
                        "width": "200px",
                        "data": "name"
                    },
                    {
                        "name" : "context" ,
                        "title": "<span data-lang='objectName'></span>", //객체명
                        "width": "200px",
                        "data": "context"
                    },
                    {
                        "name" : "useYn" ,
                        "title": "<span data-lang='usageStatus'></span>", //사용여부
                        "width": "100px",
                        "data": "useYn"
                    },
                    {
                        "name" : "contents" ,
                        "title": "<span data-lang='notetable'></span>", //비고
                        "width": "60px",
                        "data": "contents",
                        "render": function(data, type, row) {
                            if (row.contents.trim() == "") {
                                data = "";
                            } else {
                                data = "<input type='button' class='btn btn-info-css' data-toggle='tooltip' data-lang='notetable' title='"+ row.contents +"'>";
                            }
                            return data;
                        }
                    }
                ]
            });
        });
    </script>
</html>